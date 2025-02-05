#!/bin/bash

<<comment
This is the User Management Script
comment

read -p "Enter Username: " user


function createUser(){

        if grep -q ${user} /etc/passwd ; then
                echo "$user is already exists"
                return 1
        fi

        sudo useradd -m "$user"
        sudo passwd $user

        if [ $? -eq 0 ]; then
                echo "User Created Successfully"
        else
                echo "Some exception error"
        fi
}

function resetPassword(){

        if grep -q ${user} /etc/passwd ; then
                sudo passwd ${user}
        fi

        if [ $? -eq 0 ]; then
                echo "password reset successfully"
        else
                echo "User doesn't exists. please create user first"
        fi

}

function deleteUser(){

        if grep -q ${user} /etc/passwd ; then
                echo "Enter password for deletion user: "

                su - "$user" -c "exit"

                if [ $? -eq 0 ]; then
                        sudo pkill -u "$user"

                        sleep 5

                        sudo userdel -r "$user"
                        echo "User deleted successfully"
                fi
        else
                echo "User doesn't exists. can't perform the delete operation"
        fi

}

read -p "Enter Choice(1.User_Creation, 2.User_PasswordUpdation, 3.User_deletion): " choice


case "$choice" in
        1)
                createUser
                ;;
        2)
                resetPassword
                ;;
        3)
                deleteUser
                ;;
        *)
                echo "Invalid choice. please enter 1, 2 or 3"
                ;;

esac
