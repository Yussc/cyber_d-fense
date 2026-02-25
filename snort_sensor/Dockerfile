FROM ubuntu:22.04

# Configuration automatique pour Snort (évite le blocage debconf)
RUN echo "snort snort/address_range string 192.168.100.0/24" | debconf-set-selections && \
    echo "snort snort/interface string eth0" | debconf-set-selections

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    snort \
    iproute2 \
    tcpdump \
    && apt-get clean

# Création du dossier pour tes règles perso si besoin
RUN mkdir -p /etc/snort/rules

CMD ["snort", "-v", "-i", "eth0"]