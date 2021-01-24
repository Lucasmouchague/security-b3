# TP Attaques sur les mots de passe

## Introduction

Dans le cadre du cours de Sécurité de systemes, nous devons réaliser un TP sur les attaques sur les mots de passe.

Il y'a 1 fichier shadow à casser et 1 dictionnaire à utiliser,

Les contraintes imposés aux utilisateurs pour générer leur mot de passe sont : 

- Le mot de passe doit avoir une longueur de 6 à 12 caractères.
- Le mot de passe peut contenir des caractères de chacune des listes suivantes :
    - alphabet français minuscule,
    - alphabet français majuscule,
    - chiffre entre 0 et 9,
    - caractère ; @ _ ou #

## Objectif du Lab

- Tout d'abord il est une bonne illustration du cours théorique sur la sécurité relative aux mots de
passe.
- Manipuler de façon concrète les grands principes liés au cassage de mots de passe en nous permettant de réaliser un scipt mettant en œuvre les attaques par force brute et par dictionnaire.
- Découvrir le langage Python, très souvent utilisé en sécurité.

## Etudes du contenu du fichier shadow

### Rappels Théoriques :

Le fichier ``/etc/shadow'' contient les mots de passe et l'information sur l'expiration des comptes pour les utilisateurs et ressemble à cela:


```bash
smithj:Ep6mckrOLChF.:10063:0:99999:7:::
```

Dans un fichier shadow, chaque champ est séparé par ":"  et on trouve les champs suivants :

- Nom d'utilisateur, jusqu'à 8 caractères. Case-sensitive, habituellement uniquement des minuscules. Exactement la même entrée que dans le fichier /etc/passwd.
- Mot de passe, 13 caractères codés. Une entrée nulle (eg. ::) indique qu'un mot de passe n'est pas demandé pour entrer dans le système (une mauvaise idée en général), et une entrée ``*'' (eg. :*:) indique que le compte a été désactivé
- Le nombre de jours (depuis le 1er Janvier 1970) depuis le dernier changement du mot de passe.
- Le nombre de jours avant que le mot de passe ne puisse être changé (un 0 indique qu'il peut être changé à n'importe quel moment).
- Le nombre de jours après lesquels le mot de passe doit être changé (99999 indique que l'utilisateur peut garder son mot de passe inchangé pendant beaucoup, beaucoup d'années)
- Le nombre de jours pour avertir l'utilisateur qu'un mot de passe ne va plus être valable (7 pour une semaine entière)
- Le nombre de jours avant de désactiver le compte après expiration du mot de passe
- Le nombre de jours depuis le 1er Janvier 1970 pendant lesquels un compte a été désactivé
- Un champ réservé pour une utilisation future possible

Documentation utilisés pour expliquer la structure d'un fichier shadow → [ici](http://www.linux-france.org/article/sys/lame/html/x829.html#:~:text=Le%20fichier%20%2Fetc%2Fshadow%20file,moins%20grand%20pour%20la%20s%C3%A9curit%C3%A9.&text=Chaque%20champ%20dans%20une%20entr%C3%A9e,sensitive%2C%20habituellement%20tout%20en%20minuscules) 

L'algorithme utilisé pour générer les empreintes des mots de passe qui se trouvent dans ce fichier est MD5

## Mise en œuvre du script d'attaque par bruteforce

### Rappels théoriques :

Une attaque par force brute ou recherche exhaustive consiste à tester toutes les combinaisons possible une par une, plus le mot de passe est complexe et plus de temps il faudra pour le casser. 

### Mise en œuvre du script :

Nous avons écris un script qui réalise une attaque par bruteforce en python, ce script réalise les actions suivantes : 

- Lire le contenu du fichier ligne par ligne
- Tentez de retrouver le mot de passe dissimulé en utilisant une attaque par force brute
- stocker les mots de passe découverts dans un fichier de sortie en précisant pour chaque mot de passe le temps nécessaire à la découverte.

Voici la liste de caractère utilisé : 

Lorsque l'on a lancé le script on a plus qu'a aller chercher un bon café et a attendre le résultat de celui ci, 

il va écrire dans le fichier out.txt les résultats qu'il aura trouvé. 

### Tous les mots des passe ont-ils été trouvés ?

Le premier mot de passe à été trouvé en 11 seconde avec la liste de caractere:

```bash
abcdefghijklmnopqrstuvwxyz
```

Avec la liste de tous les caractere alphanumérique et symbole que l'on a sur un clavier Azerty on met environ 1038 secondes 

![TP%20Attaques%20sur%20les%20mots%20de%20passe/Untitled.png](TP%20Attaques%20sur%20les%20mots%20de%20passe/Untitled.png)

On estime que l'on aurait trouvé le deuxieme mot de passe en moins de 3 jours avec la puissance de notre serveur chez AFN.

## Mise en oeuvre d'un script d'attaque par dictionnaire

### Rappels théorique :

Une attaque par dictionnaire consiste à tester une série de mot de passe provenant d'un dictionnaire, plus la liste est longue et plus il va falloir de temps pour la tester. 

### Mise en oeuvre du script

Nous avons écris un script qui est en mesure de : 

- Lire le contenu du fichier ligne par ligne.
- Tenter de retrouver le mot de passe dissimulé en testant chaque occurrence de mot contenu
dans le dictionnaire
- Stocker les mots de passe découverts dans un fichier de sortie, en précisant pour chaque mot
de passe le temps nécessaire à la découverte.

Le script à effectivement trouver tous les mots de passe dissimulés dans le fichier shadow.

sauf celui de fred

![TP%20Attaques%20sur%20les%20mots%20de%20passe/Untitled%201.png](TP%20Attaques%20sur%20les%20mots%20de%20passe/Untitled%201.png)

Cela a duré moins d'une seconde.

L'avantage de la méthode bruteforce c'est qu'elle va trouver tous les mots de passe en revanche plus le mot de passe est complexe plus il est difficile de le casser donc il faudra plus de ressource et de moyen pour trouver un mot de passe complexe ou du temps.

La méthode d'attaque par dictionnaire est très efficace mais encore une fois si le mot de passe n'est pas dans le dictionnaire et bien on n'aura aucun résultat 

Cela étant il faut bien choisir son mode d'attaque, Soit en utilisant un CPU soit un GPU, Hashcat et John sont de très bon outils pour casser des mots de passe et notre script ne rivalise pas du tout avec ce genre d'outils

John permet d'utiliser la puissance CPU alors qu'avec hashcat on va utiliser celle du GPU.

 Le plus simple de nos jours c'est aussi de faire de l'OSINT et avec les informations de cette OSINT créer un dictionnaire personnaliser en fonction du mot de passe que l'on veut casser. Nous trouvons que c'est une méthode relativement efficace et rapide.