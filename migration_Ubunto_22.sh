#!/bin/bash

RoseDeFeu()										# Easter egg
{
Orange=$(\033[33m)
Rouge=$(\033[31m)
clear
echo -e "\n\n"
echo -e "$Orange         .     ."
echo -e "$Orange    ...  :''..':"
echo -e "$Orange     : ''''.'   :''::'"
echo -e "$Orange   ..:..  :     .'' :"
echo -e "$Rouge''.    ':    .'     :"
echo -e "$Rouge    :    :   :        :"
echo -e "$Rouge     :   :   :         :"
echo -e "$Rouge     :    :   :        :"
echo -e "      :    :   :..\033[32m''''''::."
echo -e "       : ...:..'     .''"
echo -e "       .'   .'  .::::'"
echo -e "      :..''''':::::::"
echo -e "      '         '::::"
echo -e "                  '::."
echo -e "                   '::"
echo -e "                    :::."
echo -e "         ..:.:.::''. ::''.  . : : ."
echo -e "       ..'      ':.: ::   :'       .:"
echo -e "      .:        .:'':::  :       .: ::"
echo -e "      .:    ..''     :::.'    :':    :"
echo -e "       : .''         .:: : : '"
echo -e "        :          .''::"
echo -e "                      ::"
echo -e "                      ::"
echo -e "                      ::"
echo -e "                      ::"
echo -e "                      ::"
echo -e "                      ::\033[00m"
sleep 3
}

######################################################
AjoutInterfacGraphic()
{
sudo apt list --upgradable

if [ $? -eq 0 ];
then
	echo -e "[\033[32mOK\033[00m] upgradable"
else
	echo -e "[\033[31mERREUR\033[00m] upgradable"
fi

sudo apt update && sudo apt full-upgrade -y

if [ $? -eq 0 ];
then
	echo -e "[\033[32mOK\033[00m] update & full-upgrade"
else
	echo -e "[\033[31mERREUR\033[00m] update & full-upgrade"
	sudo apt update && sudo apt dis-upgrade -y
	if [ $? -eq 0 ];
	then
		echo -e "[\033[32mOK\033[00m] dis-upgrade"
	else
		echo -e "[\033[31mERREUR\033[00m] dis-upgrade"
		sudo apt update && sudo apt upgrade -y
		if [ $? -eq 0 ];
		then
			echo -e "[\033[32mOK\033[00m] upgrade"
		else
			echo -e "[\033[31mERREUR\033[00m] upgrade"
		fi
	fi
fi

sed -i "s/X11Forwarding no/X11Forwarding yes/" "/etc/ssh/sshd_config"



sudo update-manager -d

if [ $? -eq 0 ];
then
	echo -e "[\033[32mOK\033[00m] update-manager"
else
	echo -e "[\033[31mERREUR\033[00m] update-manager"
	sudo apt install update-manager -y
	
	if [ $? -eq 0 ];
	then
		echo -e "[\033[32mOK\033[00m] install update-manager"
		sudo update-manager -d
		if [ $? -eq 0 ];
		then
			echo -e "[\033[32mOK\033[00m] update-manager"
		else
			echo -e "[\033[31mERREUR\033[00m] update-manager"
		fi
	else
		echo -e "[\033[31mERREUR\033[00m] install update-manager"
	fi
	

fi



echo 
echo -e "\033[33mLe système va redémarer !\033[00m"
echo -e "\033[33mPour voire la modification de la vertion\033[00m"
echo -e "\033[33mEntrez \033[35m"lsb_release -a"\033[00m"
echo
echo
sleep 15

sudo reboot
}

######################################################
MigrationServerMod()
{

sudo ufw allow 1022/tcp

if [ $? -eq 0 ];
then
	echo
	echo -e "\033[35mAtention le port 1022/tcp a du etre ouvert pour la mise a jour !\033[00m"
	echo
	sleep 5
fi


sudo apt update && sudo apt full-upgrade -y

if [ $? -eq 0 ];
then
	echo -e "[\033[32mOK\033[00m] update & full-upgrade"
else
	echo -e "[\033[31mERREUR\033[00m] update & full-upgrade"
	sudo apt update && sudo apt dis-upgrade -y
	if [ $? -eq 0 ];
	then
		echo -e "[\033[32mOK\033[00m] dis-upgrade"
	else
		echo -e "[\033[31mERREUR\033[00m] dis-upgrade"
		sudo apt update && sudo apt upgrade -y
		if [ $? -eq 0 ];
		then
			echo -e "[\033[32mOK\033[00m] upgrade"
		else
			echo -e "[\033[31mERREUR\033[00m] upgrade"
		fi
	fi
fi



do-release-upgrade -c
if [ $? -eq 0 ];
then
	sudo do-release-upgrade -d
	if [ $? -eq 0 ];
	then
		echo -e "[\033[32mOK\033[00m] upgradable"
	else
		echo -e "[\033[31mERREUR\033[00m] upgradable"
	fi
fi


echo 
echo -e "\033[33mLe système va redémarer !\033[00m"
echo -e "\033[33mPour voire la modification de la vertion\033[00m"
echo -e "\033[33mEntrez \033[35m"lsb_release -a"\033[00m"
echo
echo
sleep 15

sudo reboot


}
######################################################

version=$(lsb_release -a | grep  "Ubuntu" | grep "0")
version=$(echo $version | awk '{print $2,$3,$4}')
cutt=1
min=20000000000

df -T > t.txt
sed -i "s/Filesystem//" "t.txt" 
sed -i "s/Type//" "t.txt" 
sed -i "s/1K-blocks//" "t.txt" 
sed -i "s/Used//" "t.txt" 
sed -i "s/Available//" "t.txt" 
sed -i "s/Use%//" "t.txt" 
sed -i "s/Mounted on//" "t.txt" 

while read line;
do
	cut=$(echo $line | awk '{print $5}')
	cutt=$(($cut+$cutt))
done < t.txt


clear



if [[ $cutt -gt $min ]];
then
	echo -e "\033[34m	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓\033[00m"
	echo
	echo -e "\033[31m	Not enof plac in Disk \033[33m!\033[00m"
	echo -e "\033[33m	Il vous faut minimum 20 GO libre\033[00m"
	echo -e "\033[34m	▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓\033[00m"
	echo
	exit
else
	echo -e "\033[32mEnof space for migration \033[33m!\033[00m"
fi

[ -f "t.txt" ] && rm -f "t.txt"


echo
echo
echo -e "\033[33m	Starting Migration from\033[00m"
echo -e "\033[36m  $version \033[35mto \033[32mUbuntu 22.XX\033[00m"
echo -e "\033[35m  N'oubliez pas de fair une sauvegard de secour \033[31m!\033[00m"
echo
echo -e "[\033[32my1\033[00m] pour continuer et ajouter une interphace graphique !"
echo -e "[\033[32my2\033[00m] pour continuer en mod Server !"
read -p ": " start

if [ "$start" == "y1" ];
then
	clear
	echo -e "\033[32m████████████████████████████████████████████████████████████\033[00m"
	echo
	echo -e "\033[31mN'annulez pas laction une foit démarée !\033[00m"
	echo
	echo
	AjoutInterfacGraphic


elif [ "$start" == "y2" ];
	then
	MigrationServerMod


elif [ "$start" == "rose" ];
	then
	RoseDeFeu
	
	
else
	exit
fi

############################
# démarage de la migration #
############################








