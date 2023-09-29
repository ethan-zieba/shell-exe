# To execute this script every 30 minutes, edit the /etc/crontab file and add the line:
# 30 * * * * root /home/merkava/Documents/Git/shell-exe/Job08/get_logs.sh merkava (of course operating 
# necessary changes considering your computer's directories

# Checks if exactly one parameter has been passed
if [ $# -ne 1 ]
then
	echo "You have to pass exactly one parameter, the name of the user to count the logs of"
	exit 1
fi

# Here we put the current time to the needed format
timenow="$(date +'%d-%m-%Y_%H:%M')"

# Here we create two file paths, one for the raw output, another for the .tar archive
output_file="number_connection_$timenow"

# We get the last connections of the specified user, pass it through grep to get only the desired lines
# Then we use a wc (wordcount) with the line parameter, and output it to the output file path
last $1 | grep $1 | wc -l > $output_file

tar --force-local -cf $output_file.tar $output_file && rm $output_file
mv $output_file.tar /home/merkava/Documents/Git/shell-exe/Job08/logs
