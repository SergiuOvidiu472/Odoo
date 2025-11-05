#!/bin/bash

SCRIPT_CONF=$1
args=()

PSQL_ARGS=0
ODOO_ARGS=1

PSQL_VOL=2
ODOO_VOL=3

PSQL_MOUNT=4
ODOO_MOUNT=5

loadArgs()
{
	IFS='=' read -r -a path <<< $(cat $1 | grep PSQL_ARGS)
	args[$PSQL_ARGS]=$(cat ${path[1]})

	IFS='=' read -r -a path <<< $(cat $1 | grep ODOO_ARGS)
	args[$ODOO_ARGS]=$(cat ${path[1]})
}

loadVolumes()
{
	IFS='=' read -r -a vol <<< $(cat $1 | grep PSQL_VOL)
	args[$PSQL_VOL]=${vol[1]}

	IFS='=' read -r -a vol <<< $(cat $1 | grep ODOO_VOL)
	args[$ODOO_VOL]=${vol[1]}
}

loadMountPoints()
{
	IFS='=' read -r -a mnt <<< $(cat $1 | grep PSQL_MOUNT)
	args[$PSQL_MOUNT]=${mnt[1]}

	IFS='=' read -r -a mnt <<< $(cat $1 | grep ODOO_MOUNT)
	args[$ODOO_MOUNT]=${mnt[1]}
}

setVolumes()
{
	sudo docker volume ls | grep ${args[$PSQL_VOL]} >/dev/null 2>/dev/null
	PSQL_ST=$?
	sudo docker volume ls | grep ${args[$ODOO_VOL]} >/dev/null 2>/dev/null
	ODOO_ST=$?

	if [ $PSQL_ST != 0 ]
	then
		echo "Creating postgres volume"
		sudo docker volume create ${args[$PSQL_VOL]}
	fi

	if [ $ODOO_ST != 0 ]
	then
		echo "Creating odoo volume"
		sudo docker volume create ${args[$ODOO_VOL]}
	fi
}

loadArgs $SCRIPT_CONF
loadVolumes $SCRIPT_CONF
loadMountPoints $SCRIPT_CONF
setVolumes

sudo docker run --volume "${args[$PSQL_VOL]}:${args[$PSQL_MOUNT]}" ${args[PSQL_ARGS]} postgres:latest
sudo docker run --volume "${args[$ODOO_VOL]}:${args[$ODOO_MOUNT]}" ${args[ODOO_ARGS]} odoo:latest
