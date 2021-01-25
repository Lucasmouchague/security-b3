# TP droit linux
### Participant: Steven Dias, Lucas Mouchague
## Installation:
Le système d'exploitation est un centos 7 minimale une partition /partage/ est créée via l'outil de partitionnement a l'installation.
```
[nawak@Host-002 ~]$ lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                         8:0    0   32G  0 disk 
├─sda1                      8:1    0   25G  0 part /
├─sda2                      8:2    0  6.5G  0 part /partage
└─sda3                      8:3    0  256M  0 part 
  └─centos_host--001-swap 253:0    0  252M  0 lvm  [SWAP]
sr0                        11:0    1 1024M  0 rom 
```
Un mot de passe root comportant 35 caractère avec au moins une majuscule, une minuscule, un chiffre et un caractère spéciale fut générer via keepass. Un compte administrateur avec les même exigences de mot de passe est créée.
## Durcissement:
### Openssh
Le service Openssh est configurer via le fichier /etc/ssh/sshd_config que vous trouverez [ici](https://github.com/Lucasmouchague/security-b3/blob/main/TP_GIA_droit_linux/sshd_config).
On y retrouve certaines recommendation de L'ANSSI avec l'interdiction de se connecter avec un mot de passe, l'activation du "StrictModes" et la génération de biclef avec les paramètres données dans ce [document](https://www.ssi.gouv.fr/uploads/2014/01/NT_OpenSSH.pdf)
### IPtables:
Les rêgles suivantes on été appliquer:
```
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
```
Avec la première rêgle on active le suivi de connection
Avec la seconde on accepte le trafic sur l'adresse localhost
Avec la troisième on rejete par défaut tout le trafic entrant
Avec la dernière on accepte le traffic entrant sur le port 22
## Script:
Le script va se charger d'abord créer les groupes puis les utilisateur avec un mot de passe de 22 caractères et leur biclef avec une passphrase de 35 caractères puis il va assigner les utilisateurs a leurs groupes respectifs
```
[nawak@Host-002 ~]$ sudo bash script.sh 
[sudo] password for nawak: 
rm: cannot remove ‘/etc/subgid.lock’: No such file or directory
[!] Creating group Direction
[!] Creating group Pilotage
[!] Creating group Service_Comptable
[!] Creating group Service_Informatique
[!] Creating group Service_Logistique
-------------------------------------------------------------------------------
[!] Creating user Edouard-Franck_Wagner with password : ikKpXSoYGHKLvACMOUi4pM
[!] Generated ssh key for Edouard-Franck_Wagner with passphrase : !HhuA4aOArc8ls6564bVBsRQ&foP2R#HV&P 
-------------------------------------------------------------------------------
[!] Creating user Alexandra_Met with password : IKvLxXcs#VgOameGha9McH
[!] Generated ssh key for Alexandra_Met with passphrase : 9q1Y96nmjAs#ZCnt1uVvfH9N!4h8tF673Dq 
-------------------------------------------------------------------------------
[!] Creating user Alfred_Laroche with password : 4xkVG!jMUhG!7FKHnQN12g
[!] Generated ssh key for Alfred_Laroche with passphrase : gBk&j#wSpdirePvZkhytNe&M1s2Rchb9&ny 
-------------------------------------------------------------------------------
[!] Creating user Tristan_Maurice with password : wJBaGsmBszMts2kY94N#8p
[!] Generated ssh key for Tristan_Maurice with passphrase : j3Uzc9xmgDDAbBQASpLrEc4oLgT9DYTBjuB 
-------------------------------------------------------------------------------
[!] Creating user Claude_Muller with password : kO2ETWnQVIV!CK7abzBbZ4
[!] Generated ssh key for Claude_Muller with passphrase : 8JSQpBskKvqDgeZgex1AGIa9kpjab&HCIcO 
-------------------------------------------------------------------------------
[!] Creating user Henriette_Julien with password : ZbY1S#1xCaP4H8#Gp2sOpR
[!] Generated ssh key for Henriette_Julien with passphrase : ac#iEz7d69YfJjzPNwNAK9gp73OVe#97Sjq 
-------------------------------------------------------------------------------
[!] Creating user Jeanne_Pasquier with password : !Jn7unvjSK!RttcQDlaJ14
[!] Generated ssh key for Jeanne_Pasquier with passphrase : ZpAXoG4GcoUGsHCFflUHo&ZGPYLdmEm#eK1 
-------------------------------------------------------------------------------
[!] Creating user Monique_Pires with password : XRL3t1t7tZgemyPMHdesNI
[!] Generated ssh key for Monique_Pires with passphrase : 3DqWGrfTAyUgbZSgsO9BFTwy7#jO2P82J&E 
-------------------------------------------------------------------------------
[!] Creating user Gabriel_Benard with password : KVgExn&eVhtCyBTmThUETV
[!] Generated ssh key for Gabriel_Benard with passphrase : RQ9XPhf##Bfqcj1DsPUIsGyzkw4oDlHzQmS 
-------------------------------------------------------------------------------
[!] Creating user Cerise_Lapresse with password : bX5D4RwWW5M&Qt&tXgy&l!
[!] Generated ssh key for Cerise_Lapresse with passphrase : 03wm1J5bpvDGaPo#oeNdZC5v!IErT&YAAgQ 
-------------------------------------------------------------------------------
[!] Creating user Richard_Pirouet with password : nnTjGLWvVuviozWSlrjPzg
[!] Generated ssh key for Richard_Pirouet with passphrase : EWYt7pfAHG5LT&K6BoPvvGVXPNgNM2rCUB6 
-------------------------------------------------------------------------------
[!] Creating user Jacques_Bonnet with password : jL&uwA1CaoCDo6A29846Zn
[!] Generated ssh key for Jacques_Bonnet with passphrase : TH!aWsRTCoczeD2VUN4INECNddyQMWGTnIt 
-------------------------------------------------------------------------------
[!] Creating user Louis_Lamoureux with password : TWqKCBv77tl&Jm385d4Wlw
[!] Generated ssh key for Louis_Lamoureux with passphrase : FMcNLfIlWdXmT67SBFCoirraiepLYBaU&y0 
-------------------------------------------------------------------------------
[!] Creating user Honore_Adler with password : Ow8p3G2I!Ep89v&PzTydTq
[!] Generated ssh key for Honore_Adler with passphrase : CLD#p69kKxuPGUpYlUycMzHvM4V2Hcpsl2! 
-------------------------------------------------------------------------------
[!] Set user Edouard-Franck_Wagner to direction group
-------------------------------------------------------------------------------
[!] Set user Edouard-Franck_Wagner to pilotage group
-------------------------------------------------------------------------------
[!] Set user Alexandra_Met to pilotage group
-------------------------------------------------------------------------------
[!] Set user Claude_Muller to pilotage group
-------------------------------------------------------------------------------
[!] Set user Gabriel_Benard to pilotage group
-------------------------------------------------------------------------------
[!] Set user Alexandra_Met to service comptable group
-------------------------------------------------------------------------------
[!] Set user Tristan_Maurice to service comptable group
-------------------------------------------------------------------------------
[!] Set user Alfred_Laroche to service comptable group
-------------------------------------------------------------------------------
[!] Set user Claude_Muller to service informatique group
-------------------------------------------------------------------------------
[!] Set user Henriette_Julien to service informatique group
-------------------------------------------------------------------------------
[!] Set user Jeanne_Pasquier to service informatique group
-------------------------------------------------------------------------------
[!] Set user Monique_Pires to service informatique group
-------------------------------------------------------------------------------
[!] Set user Gabriel_Benard to service logistique group
-------------------------------------------------------------------------------
[!] Set user Cerise_Lapresse to service logistique group
-------------------------------------------------------------------------------
[!] Set user Richard_Pirouet to service logistique group
-------------------------------------------------------------------------------
[!] Set user Jacques_Bonnet to service logistique group
-------------------------------------------------------------------------------
[!] Set user Louis_Lamoureux to service logistique group
-------------------------------------------------------------------------------
[!] Set user Honore_Adler to service logistique group


[!] All folder created
```
On peut vérifier alors les groupes avec la commande: ```cat /etc/group```
On va vérifier la génération des biclef