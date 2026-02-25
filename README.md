# 🛡️ Lab Cyber : Segmentation, Filtrage et EDR

Ce dépôt contient l'infrastructure complète d'un lab de sécurité que j'ai conçu pour simuler un environnement d'entreprise réaliste. L'idée était de ne pas juste "installer des outils", mais de monter une vraie architecture réseau segmentée avec une gestion par conteneurs.

## 🏗️ Ce qu'il y a sous le capot
Le lab s'appuie sur Docker Compose pour orchestrer 5 machines distinctes :
* **ubuntu_router** : Le point d'entrée. Il gère tout le NAT et le filtrage via un script Iptables maison (Politique Drop par défaut).
* **web_server** : Un serveur Apache durci, sous surveillance constante.
* **wazuh_manager** : Le cerveau de la détection. Il centralise les logs et surveille l'intégrité des fichiers critiques (FIM).
* **snort_sensor** : Ma sonde réseau qui sniff le trafic du LAN pour lever des alertes sur des comportements suspects.
* **kali_attaquante** : Une machine équipée pour tester la résistance de l'infra (Nmap, NC, etc.).

## 🛠️ Scénarios testés
J'ai utilisé ce lab pour valider plusieurs points clés de la défense en profondeur :
1.  **Reconnaissance** : On voit clairement Snort réagir aux scans Nmap, tandis qu'Iptables rend le serveur invisible.
2.  **Intégrité (FIM)** : Toute modification de la page `index.html` (type defacement) lève une alerte critique (Rule 550) sur Wazuh.
3.  **Contrôle des flux** : Test de Reverse Shell bloqué ou détecté selon les règles de filtrage appliquées.

## 🚀 Pourquoi cette structure ?
Le projet est organisé de façon modulaire :
* Chaque machine a son propre `Dockerfile` pour une installation propre et automatisée.
* Les fichiers de config (`ossec.conf`, `rules`, `iptables`) sont montés en volumes pour être modifiables à la volée sans reconstruire les images.
* Zéro installation manuelle requise : un `docker compose up --build` et le lab est prêt.

## 🔩 Architecture

<img width="791" height="753" alt="archi_cyberdef drawio" src="https://github.com/user-attachments/assets/356cb28d-93a3-473c-b9d0-c4d25f609c7b" />


