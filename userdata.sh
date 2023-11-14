#Install Packages
apt update && apt -y upgrade
apt install -y apache2 #With auto approve
apt install -y curl #With auto approve
#Enable firewall
ufw allow 'Apache'
ufw enable #Add the automatic -y option