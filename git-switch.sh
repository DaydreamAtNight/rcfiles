#!/bin/bash

# Set account variables
ACCOUNT1=~/.ssh/id_rsa_lishoushou
ACCOUNT2=~/.ssh/id_rsa_lsongrui
ACCOUNT3=~/.ssh/id_rsa_childhoodprogramming


# Function to switch GitHub account based on selection
function switch_account() {
    case $1 in
        1)
            git config --global user.name "lishoushou_mac"
            git config --global user.email "lishoushou2019@gmail.com"
            ssh-add -D
            ssh-add $ACCOUNT1
            echo "Switched to GitHub account: lishoushou"
            ;;
        2)
            git config --global user.name "lsongrui_mac"
            git config --global user.email "songrui.li@vanderbilt.edu"
            ssh-add -D
            ssh-add $ACCOUNT2
            echo "Switched to GitHub account: lsongrui"
            ;;
        3)
            git config --global user.name "childhoodprogramming_mac"
            git config --global user.email "childhood.programming@outlook.com"
            ssh-add -D
            ssh-add $ACCOUNT3
            echo "Switched to GitHub account: childhoodprogramming"
            ;;
        *)
            echo "Invalid choice. Exiting."
            exit 1
            ;;
    esac
}

# Check if an argument was passed
if [ $# -eq 1 ]; then
    switch_account $1  # Pass the argument to the function
else
    # Function to display options if no argument is passed
    echo "Select a GitHub account:"
    echo "1) Lishoushou"
    echo "2) Lsongrui"
    echo "3) childhoodprogramming"
    read -p "Enter the number of your choice: " choice
    switch_account $choice  # Pass the choice to the function
fi

ssh -T git@github.com