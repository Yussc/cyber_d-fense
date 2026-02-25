FROM httpd:latest

# Installation de Netcat (indispensable pour ton reverse shell) et outils
RUN apt-get update && apt-get install -y \
    netcat-traditional \
    curl \
    vim \
    && apt-get clean

# On copie ta page web "auditée"
COPY index.html /usr/local/apache2/htdocs/index.html

# Si tu as des certificats SSL (pour le TLS A.8.24)
# COPY ./ssl/ /usr/local/apache2/conf/ssl/