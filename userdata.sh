#Install Packages
sudo apt update && apt -y upgrade
sudo apt install -y apache2 #With auto approve
sudo apt install -y curl #With auto approve
#Enable firewall
sudo ufw allow 'Apache'
sudo ufw enable #Add the automatic -y option