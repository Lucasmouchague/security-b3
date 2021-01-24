#!/bin/bash
users=(
    "Edouard-Franck_Wagner"
    "Alexandra_Met"
    "Alfred_Laroche"
    "Tristan_Maurice"
    "Claude_Muller"
    "Henriette_Julien"
    "Jeanne_Pasquier"
    "Monique_Pires"
    "Gabriel_Benard"
    "Cerise_Lapresse"
    "Richard_Pirouet"
    "Jacques_Bonnet"
    "Louis_Lamoureux"
    "Honore_Adler"
)

direction_users=(
    "Edouard-Franck_Wagner"   
)
pilotage_users=(
    "Edouard-Franck_Wagner"
    "Alexandra_Met"
    "Claude_Muller"
    "Gabriel_Benard"
)
service_comptable_users=(
    "Alexandra_Met"
    "Tristan_Maurice"
    "Alfred_Laroche"

)
service_informatique_users=(
    "Claude_Muller"
    "Henriette_Julien"
    "Jeanne_Pasquier"
    "Monique_Pires"
)
service_logistique_users=(
    "Gabriel_Benard"
    "Cerise_Lapresse"
    "Richard_Pirouet"
    "Jacques_Bonnet"
    "Louis_Lamoureux"
    "Honore_Adler"
)
groups=(
    Direction
    Pilotage
    "Service_Comptable"
    "Service_Informatique"
    "Service_Logistique"
)
rm /etc/subgid.lock
rm /etc/subgid
for group in "${groups[@]}"; do
    echo "[!] Creating group $group"
    sudo groupadd "$group"
done

for user in "${users[@]}"; do
    password=$(cat /dev/urandom | tr -cd 'a-zA-Z0-9!#&' | head -c 22; echo)
    sudo useradd -m "$user"
    echo -e "$password\n$password" | sudo passwd $user >& /dev/null
    echo -e "[!] Creating user $user with password : $password"
    mkdir /home/$user/.ssh
    passphrase=$(cat /dev/urandom | tr -cd 'a-zA-Z0-9!#&' | head -c 35; echo)
    ssh-keygen -b 2048 -t rsa -f /home/$user/.ssh/sshkey -q -P "$passphrase" >& /dev/null
    echo -e "[!] Generated ssh key for $user with passphrase : $passphrase \n\n"
done

for direction_user in "${direction_users[@]}"; do
    echo "[!] Set user $direction_user to direction group"
    sudo usermod -aG Direction "$direction_user"
done

for pilotage_user in "${pilotage_users[@]}"; do
    echo "[!] Set user $pilotage_user to pilotage group"
    sudo usermod -aG Pilotage "$pilotage_user"
done

for service_comptable_user in "${service_comptable_users[@]}"; do
    echo "[!] Set user $service_comptable_user to service comptable group"
    sudo usermod -aG Service_Comptable "$service_comptable_user"
done

for service_informatique_user in "${service_informatique_users[@]}"; do
    echo "[!] Set user $service_informatique_user to service informatique group"
    sudo usermod -aG Service_Informatique "$service_informatique_user"
done

for service_logistique_user in "${service_logistique_users[@]}"; do
    echo "[!] Set user $service_logistique_user to service logistique group"
    sudo usermod -aG Service_Logistique "$service_logistique_user"
done
sudo mkdir /partage/D1-Direction
sudo mkdir /partage/D1-Direction/D1-1-Strategie
sudo mkdir /partage/D1-Direction/D1-2-Achats
sudo mkdir /partage/C1-Comptabilite/
sudo mkdir /partage/C1-Comptabilite/C1-1-Comptabilite
sudo mkdir /partage/C1-Comptabilite/C1-2-TVA
sudo mkdir /partage/C1-Comptabilite/C1-3-Facturation
sudo mkdir /partage/A1-Administratif
sudo mkdir /partage/A1-Administratif/A1-1-Gestion_des_conges
sudo mkdir /partage/A1-Administratif/A1-2-Gestion-des-formations-internes
sudo mkdir /partage/A1-Administratif/A1-3-Qualite
sudo mkdir /partage/A1-Administratif/A1-4-Achats
sudo mkdir /partage/D2-DSI
sudo mkdir /partage/D2-DSI/D2-1-Procedures
sudo mkdir /partage/D2-DSI/D2-2-Divers_scripts
sudo mkdir /partage/D2-DSI/D2-3-Documentation_du_SI
sudo mkdir /partage/D3-Depot
sudo mkdir /partage/C2-Commun
sudo mkdir /partage/C2-Commun/C2-1-Direction
sudo mkdir /partage/C2-Commun/C2-2-Administratif
sudo mkdir /partage/C2-Commun/C2-3-Informatique
sudo mkdir /partage/C2-Commun/C2-4-Production
echo -e "\n\n [!] All folder created"