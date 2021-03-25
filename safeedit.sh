#If the parameter "1" is empty.
if [ -z $1 ]
then
   	#The interativity mode, showing the user all the txt files, giving a choice to choose
	echo "WELCOME TO SAFEEDIT
	ls *.*

	#The "read -p allows to ask the user a input.
	read -p "Which file do you wish to edit?" input
	
	#If the input matches with an existence file, it will copy to a "BAK" file and open in vim
	#...before editing.	
	if [ -e $input ]
	then
		cp $input $input.bak
		vim $input
		echo "File copied"

		#The "exit" will leave the program,otherwise, the command would continue until...
		#... the end of the command, copying and open the file twice.
		exit

	#If it does not exist, it will give a message, and then leaves the command.
	else
		echo "File not found"
		exit #The "exit", will leave the program.
	fi
#End of file
fi

#When the parameter "2" is empty
if [ -z $2 ]
then	

	#If the parameter "1" matches with an existance file, it will make a BAK copy.
	#If the file exists, it will copy to a BAK file, before editing.
	if [ -e "$1"]
	then

		#Copying the parameter 1 into a BAK file, if exists before editing.
		cp $1 $1.bak 
		vim $1
		#Informing the user that the file was copied and exiting.
		echo "File copied"
		exit
	#If the parameter 1 does not match with any existence file, it will give the following message
	else
		echo "file not found"
		#Exiting and end of file
		exit
	fi
#If any more parameter is typed,it will give an error message and leave the program.
else
	echo "too many parameters entered"
	exit
fi
