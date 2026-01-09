# configuracion_ctf

#!/bin/bash

## :computer: Instalación Findips arp-scan
```bash
cd /opt
sudo rm -rf findips_arp-scan && sudo mkdir findips_arp-scan
sudo wget https://raw.githubusercontent.com/dzh0ni/configuracion_ctf/refs/heads/main/findips_arp-scan
sudo cp /usr/share/arp-scan/ieee-oui.txt /opt/findips_arp-scan
sudo cp /etc/arp-scan/mac-vendor.txt /opt/findips_arp-scan
sudo chmod +x findips_arp-scan/*
cd 
sudo echo "cd /opt/findips_arp-scan && sudo ./findips_arp-scan" > farpscan
sudo chmod +x farpscan
sudo rm -rf /usr/local/bin/farpscan
sudo mv farpscan /usr/local/bin/
cd
```

## :computer: Instalación MKT
```bash
cd
sudo wget https://raw.githubusercontent.com/dzh0ni/configuracion_ctf/refs/heads/main/mkt.sh
sudo chmod +x mkt.sh
sudo mv mkt.sh mkt
sudo rm -rf /usr/local/bin/mkt
sudo mv mkt /usr/local/bin/
cd
```

## :computer: Instalación extractPorts
```bash
cd
sudo wget https://raw.githubusercontent.com/dzh0ni/configuracion_ctf/refs/heads/main/extractPorts.sh 
sudo chmod +x extractPorts.sh
sudo mv extractPorts.sh extractPorts
sudo rm -rf /usr/local/bin/extractPorts
sudo mv extractPorts /usr/local/bin/
sudo apt-get install -y xclip
cd
```

## :computer: Instalación Ping-TTL
```bash
sudo wget https://raw.githubusercontent.com/dzh0ni/configuracion_ctf/refs/heads/main/pttl.sh
sudo chmod +x pttl.sh
sudo mv pttl.sh pttl
sudo rm -rf /usr/local/bin/pttl
sudo mv pttl /usr/local/bin/
ls -lthas
cd
```
