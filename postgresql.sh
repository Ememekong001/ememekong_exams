#!/usr/bin/bash
#enable oackage repository
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

wget -qO- https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo tee /etc/apt/trusted.gpg.d/pgdg.asc &>/dev/null
#install postgresql

sudo apt update

sudo apt install postgresql postgresql-client -y

#enable postgresql

sudo systemctl start postgresql.service
#setup postgress

P_ACCESS=/etc/postgresql/15/main/pg_hba.conf
P_CONFIG=/etc/postgresql/15/main/postgresql.conf

#Edit the config file to accept all addresses

echo $'listen_addresses = \'*\' '  >>  $P_CONFIG

# edit the PostgreSQL access policy configuration file

echo "host all all 0.0.0.0/0 md5" | tee -a  $P_ACCESS

systemctl restart postgresql

sudo ufw allow 5432/tcp
