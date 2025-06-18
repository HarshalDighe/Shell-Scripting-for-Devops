#!/bin/bash

# User Management and Backup Script

menu() {
  echo "========================="
  echo "  User Management Menu"
  echo "========================="
  echo "1. Add User"
  echo "2. Delete User"
  echo "3. Modify User"
  echo "4. Create Group"
  echo "5. Add User to Group"
  echo "6. Backup Directory"
  echo "7. Exit"
}

add_user() {
  read -p "Enter username: " username
  sudo useradd "$username" && echo "User $username added."
}

delete_user() {
  read -p "Enter username to delete: " username
  sudo userdel "$username" && echo "User $username deleted."
}

modify_user() {
  read -p "Enter username to modify: " username
  read -p "Enter new shell (/bin/bash, /bin/sh): " shell
  sudo usermod -s "$shell" "$username"
  echo "Shell changed for $username."
}

create_group() {
  read -p "Enter group name: " group
  sudo groupadd "$group" && echo "Group $group created."
}

add_user_to_group() {
  read -p "Enter username: " username
  read -p "Enter group name: " group
  sudo usermod -aG "$group" "$username" && echo "$username added to $group."
}

backup_directory() {
  read -p "Enter directory to backup: " dir
  backup_file="backup_$(date +%F).tar.gz"
  tar -czvf "$backup_file" "$dir"
  echo "Backup saved as $backup_file"
}

while true; do
  menu
  read -p "Choose an option [1-7]: " choice
  case $choice in
    1) add_user ;;
    2) delete_user ;;
    3) modify_user ;;
    4) create_group ;;
    5) add_user_to_group ;;
    6) backup_directory ;;
    7) exit ;;
    *) echo "Invalid choice." ;;
  esac
done

