#! /bin/bash
### Connect to WIFI ###
echo "Joining DingleBatCumberBun"
nmcli device wifi connect DingleBatCumberBun password Yuuuge2017!
### Update System ###
#



### Start essential services
echo "Turning on services"
services=("sshd" "bluetooth")
for id in ${services[@]}; do
	systemctl enable ${id}
       	systemctl restart ${id}	
done

users=("bear" "msnyder")
### Create User(s) ###
echo "Creating steam group and adding users to group"
useradd bear
groupadd steam
for u in ${users[@]}; do
	useradd -G steam ${u}
done

### Turn off Sleep/Hibernate/Suspend ###
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
### Install Steam ###
mkdir /steam-library/
chown root:steam /steam-library/
setfacl -d -m g:steam:rwx /steam-library/

getfacl -d /steam-library | setfacl -R --set-file=- /steam-library/
#
#
