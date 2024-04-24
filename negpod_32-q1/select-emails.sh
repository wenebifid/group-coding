#!/bin/bash
#a command to select just the emails of the student and save it in a shell script file “select-emails.sh
#save the output in a file “student-emails.txt”

cut -d ',' -f 1 students-list_1023.txt > student-emails.txt
echo "Emails of students saved in student-emails.txt"
