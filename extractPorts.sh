#!/bin/bash
#====================================================
#   SCRIPT:                   EXTRACT PORTS
#   DESARROLLADO POR:         JENN VALENTINE 
#   FECHA DE ACTUALIZACIÓN:   01-04-2024
#   CONTACTO POR TELEGRAMA:   https://t.me/JennValentine
#   GITHUB OFICIAL:           https://github.com/JennValentine/extractPorts
#====================================================

# Paleta de colores
reset="\033[0m"       # Restablecer todos los estilos y colores
bold="\033[1m"        # Texto en negrita
italic="\033[3m"      # Texto en cursiva
underline="\033[4m"   # Texto subrayado
blink="\033[5m"       # Texto parpadeante
reverse="\033[7m"     # Invertir colores de fondo y texto
hidden="\033[8m"      # Texto oculto (generalmente invisible)

# Colores de texto
black="\033[0;30m"     # Negro
red="\033[0;31m"       # Rojo
green="\033[0;32m"     # Verde
yellow="\033[0;33m"    # Amarillo
blue="\033[0;34m"      # Azul
magenta="\033[0;35m"   # Magenta
cyan="\033[0;36m"      # Cian
white="\033[0;37m"     # Blanco

# Colores de fondo
bg_black="\033[0;40m"     # Fondo Negro
bg_red="\033[0;41m"       # Fondo Rojo
bg_green="\033[0;42m"     # Fondo Verde
bg_yellow="\033[0;43m"    # Fondo Amarillo
bg_blue="\033[0;44m"      # Fondo Azul
bg_magenta="\033[0;45m"   # Fondo Magenta
bg_cyan="\033[0;46m"      # Fondo Cian
bg_white="\033[0;47m"     # Fondo Blanco

# Iconos v3
checkmark="${white}[${green}++${white}]${green}"
error="${white}[${red}--${white}]${reset}"
info="${white}[${yellow}**${white}]${white}"
unknown="${white}[${blue}!!${white}]${reset}"
process="${white}[${magenta}>>${white}]${magenta}"
indicator="${red}==>${reset}"

# Barra de separación
barra="${blue}|--------------------------------------------|${reset}"
bar="${yellow}--------------------------------------------${reset}"

#=============================================================================
# Para implementar en la zsh
#
# which xclip || sudo apt-get install -y xclip
#
# sudo nano ~/.zshrc
# source ~/.zshrc
# sudo reboot
#=============================================================================

function extractPorts () {
    # Verifica que se ha proporcionado un archivo como argumento
    if [ -z "$1" ]; then
        echo -e "\n${green}EXTRACT PORTS"
        echo -e "\n${green}Uso:${reset}\n"
        echo -e "${white}  Ejemplo de uso:${reset}\t\t${green}extractPorts allPorts.gnmap"
        echo -e "\n${info} ${white}GITHUB OFICIAL: ${green}https://github.com/JennValentine/extractPorts\n"
        echo -e "$barra"
        exit 1
    fi

    # Verifica que el archivo proporcionado existe
    if [ ! -f "$1" ]; then
        echo -e "\n${error} ${red}ERROR: El archivo proporcionado no existe.${reset}"
        exit 1
    fi

    # Extrae los nÃºmeros de puerto de la forma "xxxx/open" del archivo proporcionado
    ports=$(grep -oP '\d{1,5}/open' "$1" | awk '{print $1}' FS='/' | xargs | tr ' ' ',')
    # Identifica la dirección IP Ãºnica del archivo
    ip_address=$(grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' "$1" | sort -u | head -n 1)

    # Verifica si se encontraron puertos abiertos
    if [ -z "$ports" ]; then
        echo -e "\n${error} ${red}ERROR: No se encontraron puertos abiertos en el archivo.${reset}"
        exit 1
    fi

    # Imprime la información en un formato legible
    echo -e "\n${info} ${green}Extrayendo información...\n"
    echo -e "\t${indicator} ${green}Dirección IP: \033[1;37m$ip_address"
    echo -e "\t${indicator} ${green}Puertos abiertos: \033[1;37m$ports"

    # Verifica si xclip estÃ¡ instalado, si no, intenta instalarlo
    if ! which xclip > /dev/null 2>&1; then
        echo -e "\n${info} ${yellow}Instalando xclip...${reset}"
        sudo apt-get install -y xclip
    fi

    # Copia los puertos al portapapeles utilizando xclip
    echo -n "$ports" | xclip -sel clip

    echo -e "\n${checkmark} ${green}Puertos copiados al portapapeles${reset}"

    echo -e "\n${yellow}${info} ${white}GITHUB OFICIAL: ${green}https://github.com/JennValentine/extractPorts\n"
    echo -e "$barra"
}

# Llamada a la función extractPorts con el primer argumento pasado al script
extractPorts "$1"

# Fin del script
