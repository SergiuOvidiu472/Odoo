#!/bin/bash

args_postgres=$(cat args/postgres.args)
args_odoo=$(cat args/odoo.args)

sudo docker volume ls | grep 'odoo_dockerimg'

if [ $? != 0 ]
then
	echo "Creating odoo volumes"
	sudo docker volume create odoo_dockerimg-data
	sudo docker volume create odoo_dockerimg-db
fi

sudo docker run --volume odoo_dockerimg-db:/var/lib/postgres/data/ $args_postgres postgres:latest
sudo docker run --volume odoo_dockerimg-data:/var/lib/odoo/ $args_odoo odoo:latest
