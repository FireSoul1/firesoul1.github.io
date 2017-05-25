#/bin/bash
#Created by Guna Kondapaneni

echo "This is a setup script for Kali. "
#Install Vim
apt-get install vim
#Install SSH Server
apt-get install openssh-server
#install curl
apt-get install curl

#Set-up SSH Keys
##Reset the ssh service
update-rc.d -f ssh remove
update-rc.d -f ssh defaults
cd /etc/ssh
##Store the default Keys
mkdir bad_old
mv ssh_host* bad_old/
##make new Keys
dpkg-reconfigure openssh-server
##check if the service is inactive
tester=`service ssh status | grep "inactive "``
if [ "$tester" = "" ]; then
    echo "SSH is inactive. Starting up!"
    service ssh start
fi
echo "SHH is ready!"

#get the public IP address, and save to a file
##Saved to a shared file
curl ipinfo.io/ip > /usr/share/IPAddress

#Now you want to create another user
##NOTE: Have the students change the password
useradd -m student -s /bin/bash --password "ThisIsSecure"

#Have the message of the day be the current date
echo "Welcome to Kali Linux" >> /etc/motd
echo "echo "Today is \`date +"%m/%d/%y"\`"" >> /etc/profile



#TODO: Add a MOTD that is a security article or fact
echo "DONE! Enjoy Kali on your RasPi!"
