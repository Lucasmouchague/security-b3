import hashlib
import itertools
import time
import sys

def md5hash(char_sequence):
    string = ''.join(char_sequence)
    hash_object = hashlib.md5(string.encode())
    return hash_object.hexdigest()


# on définit l'alphabet
ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789&-_@=)"
# on choisi la longueur du mot de passe 
LENGTH = 6
start_time=time.time()
# on parse le fichier shadow
with open("shadow", "r") as ins:
    data = dict()  
    for line in ins:
        username, password, *rest = line.split(":")
        if password not in ('*', '!'):
            data[password[3:]] = username  # remove $1$

# bruteforce
for word in itertools.product(ALPHABET, repeat=LENGTH):
    generated_hash = md5hash(word)
    if generated_hash in data:
        with open('out3.txt', 'w') as f:
            print('le mot de passe pour le user', data[generated_hash], 'est:', word,file=f) 
            print("--- %s seconds ---" % (time.time() - start_time),file=f)
            


