FROM kalilinux/kali-rolling

# Évite les questions interactives pendant l'installation
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nmap \
    netcat-traditional \
    curl \
    hping3 \
    metasploit-framework \
    && apt-get clean

CMD ["bash"]