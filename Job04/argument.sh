# We take the first input and put it in the newfilename variable
newfilename="$1"

# We take the second input and put it in the filetocopy variable
filetocopy="$2"

# We create the new file in which we will copy the origin file's content
touch $newfilename

# We get the origin file's content and redirect it in the newly created file
cat $filetocopy > $newfilename
