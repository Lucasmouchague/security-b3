import re, itertools, hashlib, sys

sys.stdout = open('dic.txt', 'w')
def display(result):
    print(result)
# on parse le fichier shadow
with open('shadow', 'r') as f:
   lines = f.readlines()

passwdTable = {}
for line in lines:
   try:
      user, user_hash = re.findall('^([^:]+):\$1\$([^:]+):.+', line)[0]
   except IndexError:
      continue  
   else:
      passwdTable[user]=user_hash
 #on parse le fichier dico_mini_fr
with open('dico_mini_fr', 'r') as f:
   lines = f.readlines()
# on hash chaque ligne du dico pour comparer avec le hash du shadow
for line in lines:
    passwd=line.strip()
    current_hash = hashlib.md5(passwd.encode('utf')).hexdigest()
    for user, password in passwdTable.items():
        if current_hash == password:
            with open('dic.txt', 'w') as f:
                display("le mdp pour " +user+ " est " +passwd) 
