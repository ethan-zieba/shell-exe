#!/bin/bash
# To check if .csv file changes and to execute this script again, first install entr package
# Then execute sudo ls Shell_Userlist.csv | sudo entr -r ./accessright.sh in the working directory
# This will check automatically if .csv file changes and execute ./accessright.sh if so


# Check if .csv file exists
if [ ! -f Shell_Userlist.csv ]; then
	echo "Shell_Userlist.csv file doesn't exist"
	exit 1
fi

echo "" >> Shell_Userlist.csv

{
read
# Reads .csv file by separating each element with a ,
while IFS=, read -r Id Prenom Nom Mdp Role; do
	# Checks if there is a blank after the Prenom
	if [ "${Prenom: -1}" == " " ]; then
		Prenom="${Prenom:0:-1}"
	fi

    	# Creates the user with specified names and id
	sudo useradd "$Prenom$Nom" -m -u "$Id" -p "$Mdp"

    	# Check if Rôle element is equal to "admin" and if so, adds him to super user group
	if [ "$Role" == "admin" ]; then
        	sudo usermod -aG sudo "$Id"
		sudo echo "$Prenom$Nom ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
        	echo "Super user permissions added to $Prenom $Nom, id $Id"
    	fi

    	echo "User $Prenom $Nom, with id $Id, created successfully"
done 
} < Shell_Userlist.csv

echo "All users have been created"
