#!/bin/bash

# 1. On vide les règles existantes
iptables -F
iptables -t nat -F

# 2. Politique par défaut : On bloque tout (Zero Trust)
iptables -P INPUT DROP
iptables -P FORWARD DROP

# 3. Autoriser le trafic déjà établi (pour ne pas couper les connexions en cours)
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# 4. Autoriser le HTTP (80) et HTTPS (443) vers le serveur Web
iptables -A FORWARD -p tcp -d 192.168.100.10 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.100.10 --dport 443 -j ACCEPT

# 5. Autoriser Wazuh (1514, 1515) dans le LAN
iptables -A FORWARD -p tcp -d 192.168.100.30 --dport 1514:1515 -j ACCEPT

# 6. Masquerading (NAT) pour que le LAN puisse sortir via le WAN
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE