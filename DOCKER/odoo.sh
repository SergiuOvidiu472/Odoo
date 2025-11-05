#!/bin/bash

SCRIPT_CONF=$1
args=()

POSTRES_ARGS=0
ODOO_ARGS=1
VOLUME=2
ODOO_DB=3
ODOO_DATA=4

loadArgs()
{

	IFS='=' read -r -a pair <<< $(cat $1 | grep postgres_args)
	args[0]=${pair[1]}

	IFS='=' read -r -a pair <<< $(cat $1 | grep odoo_args)
	args[1]=${pair[1]}

	IFS='=' read -r -a pair <<< $(cat $1 | grep volume)
	args[2]=${pair[1]}

	IFS='=' read -r -a pair <<< $(cat $1 | grep odoo-db)
	args[3]=${pair[1]}

	IFS='=' read -r -a pair <<< $(cat $1 | grep odoo-data)
	args[4]=${pair[1]}
}

loadArgs $SCRIPT_CONF
sudo docker volume ls | grep ${args[$VOLUME]}

if [ $? != 0 ]
then
	echo "Creating odoo volumes"
	sudo docker volume create "${args[$VOLUME]}-db"
	sudo docker volume create "${args[$VOLUME]}-data"
fi

postgres_params=$(cat ${args[POSTRES_ARGS]})
odoo_params=$(cat ${args[ODOO_ARGS]})

sudo docker run --volume "${args[$VOLUME]}-db:${args[$ODOO_DB]}" $postgres_params postgres:latest
sudo docker run --volume "${args[$VOLUME]}-data:${args[$ODOO_DATA]}" $odoo_params odoo:latest
