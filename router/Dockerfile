FROM ubuntu:22.04

# Installation d'Iptables et utilitaires réseau
RUN apt-get update && apt-get install -y \
    iptables \
    iproute2 \
    iputils-ping \
    vim \
    && apt-get clean

# On copie ton script de règles dans le conteneur
COPY setup-iptables.sh /usr/local/bin/setup-iptables.sh
RUN chmod +x /usr/local/bin/setup-iptables.sh

# Le script sera lancé manuellement ou via le compose
CMD ["bash"]