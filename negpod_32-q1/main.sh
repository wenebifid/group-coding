#!/bin/bash

create_student() {
    echo "Enter student email:"
    read email

    echo "Enter student age:"
    read age

    echo "Enter student ID:"
    read student_id

    echo "$email,$age,$student_id" >> students-list_1023.txt
    echo "Student record created successfully!"
}

view_students() {
    echo "List of all students:"
    cat students-list_1023.txt
}

delete_student() {
    echo "Enter student ID to delete:"
    read student_id

    # Check if the student ID exists in the file
    if grep -q "$student_id" students-list_1023.txt; then
        # Delete the student record
        sed -i "/$student_id/d" students-list_1023.txt
        echo "Student with ID $student_id deleted successfully!"
    else
        echo "Error: Student with ID $student_id does not exist."
    fi
}

update_student() {
    echo "Enter the student ID to update:"
    read update_id

    # Check if the student ID exists in the file
    if grep -q "$update_id" students-list_1023.txt; then
        # Get the existing student details
        existing_details=$(grep "$update_id" students-list_1023.txt)

        # Extract existing email and age
        existing_email=$(echo $existing_details | cut -d',' -f1)
        existing_age=$(echo $existing_details | cut -d',' -f2)

        # Prompt user for updated email and age
        read -p "Update email (current: $existing_email): " updated_email
        read -p "Update age (current: $existing_age): " updated_age

        # Update the student record
        sed -i "s/$existing_details/$(echo "$updated_email,$updated_age,$update_id")/" students-list_1023.txt

        echo "Student record updated successfully!"
    else
        echo "Error: Student with ID $update_id does not exist."
    fi
}

select_student_emails() {
    cat student-emails.txt
}

exit_application() {
    echo "Exiting the application.Bye!"
    exit 0
}

# Menu for the application
while true; do
    echo "------------------"
    echo "ALU Registration System"
    echo "------------------"
    echo "1. Create Student Record"
    echo "2. View Students"
    echo "3. Delete Student"
    echo "4. Update Student Record"
    echo "5. Select Student Emails"
    echo "6. Exit"
    read choice

    case $choice in
        1) create_student;;
        2) view_students;;
        3) delete_student;;
        4) update_student;;
	5) select_student_emails;;
        6) exit_application;;
        *) echo "Invalid choice. Please choose a valid option.";;
    esac
done
