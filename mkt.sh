#!/bin/bash
#====================================================
#   SCRIPT:                   DIRECTORIO MKT
#   DESARROLLADO POR:         JENN VALENTINE 
#   FECHA DE ACTUALIZACIÓN:   01-04-2024 
#   CONTACTO POR TELEGRAMA:   https://t.me/JennValentine
#   GITHUB OFICIAL:           https://github.com/JennValentine/Directorio-mkt
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

# Definición de la función "mkt"
function mkt () {
    # Define los directorios que deseas crear
    local folders=("content" "exploits" "nmap" "notes" "screenshot" "scripts")

    # Muestra un mensaje indicando que se están creando los directorios
    echo -e "\n${info} ${green}Creando directorios...\n"
    
    for folder in "${folders[@]}"; do
        mkdir -p "$folder" 2>/dev/null
        if [ -d "$folder" ]; then
            echo -e "\t${indicator} ${green}Directorio creado: ${white}$folder"
        else
            echo -e "\t${indicator} ${red}Error al crear el directorio : ${white}$folder"
        fi
    done

    # Muestra un mensaje de finalización
    echo -e "\n${checkmark} ${green}Proceso de creación de directorios completado"

    echo -e "\n${yellow}${info} ${white}GITHUB OFICIAL: ${green}https://github.com/JennValentine/Directorio-mkt\n"
    echo -e "$barra"
}

# Llamada a la función "mkt"
mkt

# Fin del script
