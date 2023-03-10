sudo apt update -y

sudo apt install nginx -y

cd /var/www/html
cat index.txt > /var/www/html/index.nginx-debian.html

sudo apt install wget gpg

sudo apt install lsb-release

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install consul

consul -version

sudo cp /etc/consul.d/consul.hcl /etc/consul.d/consul.backup

sudo chmod 777 -R /etc/consul.d/

cat conf.txt >> /etc/consul.d/consul.hcl

sudo cat backend.txt > /etc/consul.d/backend.hcl

consul validate /etc/consul.d

sudo nohup consul agent -config-dir /etc/consul.d/ &

consul members

reset
