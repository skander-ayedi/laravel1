
#add-apt-repository ppa:deadsnakes/ppa
apt-get update -y
#apt install python3.11 -y
#update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10
#update-alternatives --set python3 /usr/bin/python3.11

sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
apt-get install ansible -y
apt-get install install epel-release -y 
ssh-keygen -q -t rsa -N '' <<< $'\ny' >/dev/null 2>&1
if [ $(id -u) -eq 0 ]; then
	read -p "Enter username : " ansible_controller
	read -s -p "Enter password : " 123
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p "$pass" "$username"
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system."
	exit 2
fi


