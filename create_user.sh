#!/bin/bash

#Script pour creer dess utilisateurs associé a un groupe avec mots de passe aleatoires, mot de passe qui devra être changé lors de leur premier login
#Les identifiants sont stocké dans un fichier passé en argument ($1) et le groupe spécifié est passé en argument $2



car="a07bcdefgh@i1jk2lmnop6%qrst?u34v!wxyzAB5CDEFG8HIJKL#MNOPQR&ST*UVWXYZ9"

len=${#car}
mdp=""


if [ $EUID -ne 0 ]; then
	echo "Vous devez être en root pour executer ce script"
	exit 1
fi


if ! getent group $2 >/dev/null; then
	sudo groupadd $2
fi

for user in $(cat $1); do
	if ! id $user &>/dev/null; then
		for i in $(seq 1 12); do
			n=$((RANDOM % $len))
			mdp+=${car:n:1}
		done
		useradd -m -G $2 -s /bin/bash $user
		echo "$user:$mdp" | chpasswd
		passwd -e --quiet $user
		echo "$user : $mdp" >> user.txt
		mdp=""
	fi
done
