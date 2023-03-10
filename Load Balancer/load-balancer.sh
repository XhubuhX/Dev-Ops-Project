sudo apt update -y

sudo apt install unzip -y

sudo apt install nginx -y

sudo apt install curl -y

sudo curl -L  https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_amd64.zip -o /opt/consul-template.zip

sudo unzip /opt/consul-template.zip -d  /usr/local/bin/

consul-template --version

cat load-balancer > /etc/nginx/conf.d/load-balancer.conf.ctmpl

cat consul-template > /etc/nginx/conf.d/consul-template.hcl

sudo rm /etc/nginx/sites-enabled/default

sudo systemctl restart nginx

sudo nohup consul-template -config=/etc/nginx/conf.d/consul-template.hcl &

reset
