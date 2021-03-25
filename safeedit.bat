@echo off
REM If the first paramenter is empty it calls the label 1. 
if [%~1]==[] (
	goto label1
)

REM If the second parameter is empty, it calls the label 2. If a second parameter is typed, it gives an error message
if [%~2]==[] (
	goto label2
) else (
	goto message
)

REM The Label 1, starts the interactivity with the user, showing existed files. Propmts the user which file he wants to edit.
goto label1
:label1
	REM Giving a welcome message and showing the user all files
	echo WELCOME TO SAFEEDIT
	dir *.*
	
	REM Prompts the user which file he wishes to edit, by setting up a "CVAR". The CVAR "grabs" the users input and will match with any existence file.
	set /p cvar=Which file do you wish to edit?
	
	REM If the users types the an existence file, the file will copy into a .bak file and it will open afterwards
	if exist %cvar% (
		copy %cvar% %cvar%.bak
		notepad %cvar%
		
	REM if the file does not exist it will give the following message "file not found".
	) else (
	echo File not found
	)

REM The "exit /b" leaves the label1, after the process.
exit /b

REM The label 2 allows opening the file, when the user types the file's name.
goto label2
:label2

	REM The "%1" is the name of the file typed by the user. If there is an existence file, it will copy into a bak file and open afterwards.
	if exist %1 (
		copy %1 %1.bak
		notepad %1
	) else (
	echo File not found.
	)

REM The "exit /b" leaves the command after the process.
exit /b

REM The goto message is an error message given when the number of parameters is exceeded.Leaves the command line, afterwards.
goto message
:message
	echo Too many parameters entered
:eof