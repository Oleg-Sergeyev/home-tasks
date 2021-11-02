clear
users_array=(sidorov_aa petrov_bb ivanova_tt luyzerov_uu orehov_on balalaykina_em)
groups_array=(managers backenders admins testers)
# Creating users
for user in ${users_array[*]}
  do  if [ $(getent group $user) ]; then 
        echo "User: '$user' exists, and will not be created"
      else
        sudo useradd -m $user
        printf "User: '$user' ... created\n" 
      fi
  done
printf "\n"
# Creating groups
for group in ${groups_array[*]}
  do  if [ $(getent group $group) ]; then
        echo "Group: '$group' exists, and will not be created"
      else
        sudo groupadd $group
        printf "Group: '$group' ... created\n"
      fi
  done
# Adding users into ggroups
sudo usermod -aG ${groups_array[0]},${groups_array[1]} ${users_array[0]}
sudo usermod -aG ${groups_array[0]},${groups_array[1]} ${users_array[1]}
sudo usermod -aG ${groups_array[2]},${groups_array[3]} ${users_array[2]}
sudo usermod -aG ${groups_array[2]},${groups_array[3]} ${users_array[3]}
sudo usermod -aG ${groups_array[3]} ${users_array[4]}
sudo usermod -aG ${groups_array[2]} ${users_array[5]}
printf "\n"
# View users group
for user in ${users_array[*]}
  do  
    #grep -i ${users_array[0]} /etc/passwd
    printf "User: '$user' in groups: "
    id -Gn $user
  done
printf "\n"
printf "Removing users from some groups\n"
# Removing users from some groups
sudo gpasswd -d ${users_array[0]} ${groups_array[1]}
sudo gpasswd -d ${users_array[1]} ${groups_array[1]} 
sudo gpasswd -d ${users_array[2]} ${groups_array[2]} 
sudo gpasswd -d ${users_array[3]} ${groups_array[2]} 
sudo gpasswd -d ${users_array[4]} ${groups_array[3]} 
sudo gpasswd -d ${users_array[5]} ${groups_array[2]} 
printf "\n"
printf "After removing.\n"
# View users group
for user in ${users_array[*]}
  do  
    #grep -i ${users_array[0]} /etc/passwd
    printf "User: '$user' in groups: "
    id -Gn $user
  done

# Removing users group
printf "\n"
for user in ${users_array[*]}
  do  
    printf "User: '$user' removed from all groups\n"
    sudo usermod -G "" $user
  done

# Creating user with administrator rights
printf "\n"
sudo userdel -r adm_db
sudo useradd -m -s /bin/bash -p $(perl -e 'print crypt($ARGV[0], "password")' 'qwerty') adm_db
sudo usermod -aG sudo adm_db
printf "User: 'adm_db' created with roots rights\n"
printf "'adm_db' groups: "
id -Gn adm_db

# Deleting users
printf "\n"
for user in ${users_array[*]}
  do
     sudo userdel -r $user
     printf "User: '$user' ... removed\n"
  done
sudo userdel -r adm_db

printf "\n"
# Deleting all groups
for group in ${groups_array[*]}
  do  if [ $(getent group $group) ]; then
        sudo groupdel $group
        echo "Group: '$group' removed"
      else
        printf "Group: '$group' ... does not exist\n"
      fi
  done