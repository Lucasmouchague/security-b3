# Pour les ACL nous avons commencé par le haut du tableau pour descendre vers le bas nous trouvons cela plus logique
# Donc nous commencons par la direction


ACL_start() {

	# ACL - D1 Direction (Droit pour la catégorie Direction)

	setfacl -m u:Edouard-Franck_Wagner:rwx,g:Direction:rwx /partage/D1-Direction/

	# ACL - D1-1 Strategie (Droit dans la catégorie Direction pour la stratégie)

	setfacl -m u:Edouard-Franck_Wagner:rwx,g:Direction:rwx /partage/D1-Direction/D1-1-Strategie/ 
	setfacl -m u:Alexandra_Met:rx,g:Pilotage:rx /partage/D1-Direction/D1-1-Strategie/ 
	setfacl -m g:Service_Comptable:rx /partage/D1-Direction/D1-1-Strategie/
	# ACL - D1-2-Achats  (ACL dans la catégorie Direction pour les Achats)

	setfacl -m u:Edouard-Franck_Wagner:rwx,g:Direction:rwx /partage/D1-Direction/D1-2-Achats/ 

	# ACL - C1 Comptabilite (ACL pour la catégorie Compatibilité)

	setfacl -m u:Edouard-Franck_Wagner:rx,u:Alexandra_Met:rwx,g:Direction:rx,g:Service_Comptable:rx /partage/C1-Comptabilite/ 

	# ACL - C1-1 Comptabilite (ACL pour la comptabibilité dans la catégorie comptabilité)

	setfacl -m u:Edouard-Franck_Wagner:rx,u:Alexandra_Met:rwx,u:Alfred_Laroche:rwx,g:Direction:rx,g:Service_Comptable:rx /partage/C1-Comptabilite/C1-1-Comptabilite/

	# ACL - C1-2 TVA (ACL pour la TVA dans la catégorie comptabilité)

	setfacl -m u:Edouard-Franck_Wagner:rx,u:Alexandra_Met:rwx,u:Alfred_Laroche:rwx,u:Tristan_Maurice:rwx,g:Direction:rx,g:Service_Comptable:rx /partage/C1-Comptabilite/C1-2-TVA/

	# ACL - C1-3 Facturation (ACL pour la Facturation dans la catégorie comptabilité)

	setfacl -m u:Edouard-Franck_Wagner:rx,u:Alexandra_Met:rwx,u:Tristan_Maurice:rwx,g:Direction:rx,g:Service_Comptable:rx /partage/C1-Comptabilite/C1-3-Facturation/

	# ACL - A1 Administratif (ACL pour la catégorie Administratif)

	setfacl -m u:Edouard-Franck_Wagner:rx,g:Direction:rx /partage/A1-Administratif/

	# ACL - A1-1 Gestion des conges (ACL pour la Gestion des congés  dans la catégorie Administratif)

	setfacl -m u:Edouard-Franck_Wagner:rwx,g:Direction:rwx /partage/A1-Administratif/A1-1-Gestion_des_conges/

	# ACL - A1-2 Gestion des formations internes (ACL pour la Gestion des formations internes  dans la catégorie Administratif)

	setfacl -m g:Direction:rwx,g:Pilotage:rx,u:Edouard-Franck_Wagner:rwx /partage/A1-Administratif/A1-2-Gestion-des-formations-internes/

	# ACL - A1-3 Qualite (ACL pour la Qualite  dans la catégorie Administratif)

	setfacl -m g:Direction:rwx,g:Pilotage:rx,u:Edouard-Franck_Wagner:rwx /partage/A1-Administratif/A1-3-Qualite/

	# ACL - A1-4 Achats (ACL pour les Achats  dans la catégorie Administratif)

	setfacl -m g:Direction:rwx,g:Pilotage:rx,g:Service_Comptable:rx,u:Edouard-Franck_Wagner:rwx,u:Alexandra_Met:rx /partage/A1-Administratif/A1-4-Achats/

	# ACL - D2 DSI (ACL pour la catégorie DSI)

	setfacl -m g:Direction:rx,g:Service_Informatique:rwx,u:Edouard-Franck_Wagner:rx /partage/D2-DSI/

	# ACL - D2-1 Procédures (ACL pour les Procédures  dans la catégorie DSI)

	setfacl -m g:Direction:rx,g:Service_Informatique:rwx,u:Edouard-Franck_Wagner:rx /partage/D2-DSI/D2-1-Procedures/

	# ACL - D2-2-Divers scripts (ACL pour les Divers scripts  dans la catégorie DSI)

	setfacl -m g:Direction:rx,g:Service_Informatique:rwx,u:Edouard-Franck_Wagner:rx /partage/D2-DSI/D2-2-Divers_scripts/

	# ACL - D2-3 Documentation du SI (ACL pour la documentation du SI  dans la catégorie DSI)

	setfacl -m g:Direction:rx,g:Service_Informatique:rwx,u:Edouard-Franck_Wagner:rx /partage/D2-DSI/D2-3-Documentation_du_SI/

	# ACL - D3 Depot (ACL pour le Dépot  dans la catégorie DSI)

	setfacl -m g:Direction:rx,g:Service_Logistique:rwx,u:Edouard-Franck_Wagner:rx /partage/D3-Depot/

	# ACL - C2 Commun (ACL pour la catégorie Commun)

	setfacl -m g:Direction:rx,u:Edouard-Franck_Wagner:rx /partage/C2-Commun/

	# ACL - C2-1 Direction (ACL pour la direction dans la catégorie Commun)

	setfacl -m g:Direction:rwx,g:Service_Comptable:rx,g:Service_Informatique:rx,g:Service_Logistique:rx,u:Edouard-Franck_Wagner:rwx,u:Alexandra_Met:rx,u:Claude_Muller:rx,u:Gabriel_Benard:rx /partage/C2-Commun/C2-1-Direction/

	# ACL - C2-2 Administratif (ACL pour l'administratif  dans la catégorie Commun)

	setfacl -m g:Direction:rx,g:Service_Comptable:rx,g:Service_Informatique:rx,g:Service_Logistique:rx,u:Edouard-Franck_Wagner:rx,u:Alexandra_Met:rwx,u:Claude_Muller:rx,u:Gabriel_Benard:rx /partage/C2-Commun/C2-2-Administratif/

	# ACL - C2-3 Informatique (ACL pour l'informatique  dans la catégorie Commun)

	setfacl -m g:Direction:rx,g:Service_Comptable:rx,g:Service_Informatique:rx,g:Service_Logistique:rx,u:Edouard-Franck_Wagner:rx,u:Alexandra_Met:rx,u:Claude_Muller:rwx,u:Gabriel_Benard:rx /partage/C2-Commun/C2-3-Informatique/

	# ACL - C2-4 Production (ACL pour la production dans la catégorie Commun)

	setfacl -m g:Direction:rx,g:Service_Comptable:rx,g:Service_Informatique:rx,g:Service_Logistique:rx,u:Edouard-Franck_Wagner:rx,u:Alexandra_Met:rx,u:Claude_Muller:rx,u:Gabriel_Benard:rwx /partage/C2-Commun/C2-4-Production/
	echo -e "ACL applied"
}


ACL_check() {
	getfacl -R /partage/
}

ACL_delete() {

	setfacl -b -R /partage/
	chmod g=rwx /partage/
	echo -e "ACL Deleted"

}

case "$1" in 

'start')
ACL_start
;;

'check')
ACL_check
;;

'delete')
ACL_delete
;;

*)
echo "Usage: check {start|check|delete}"
;;
esac
