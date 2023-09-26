#!/bin/bash

# Here we put the first parameter in lowercase and compare it to hello
if [ $(echo $1 | tr '[:upper:]' '[:lower:]') = "hello" ]
then
	echo "Bonjour, je suis un script !"

# We do the same here for bye
elif [ $(echo $1 | tr '[:upper:]' '[:lower:]') = "bye" ]
then
	echo "Au revoir et bonne journée !"
else
	echo "Il faut savoir ce que tu veux !"
fi
