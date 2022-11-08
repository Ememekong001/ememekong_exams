sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.li>

#install postgresql

sudo apt update

sudo apt install postgresql postgresql-contrib

#enable postgresql

sudo systemctl postgresql enable

sudo systemctl postgresql status


#setup postgress


