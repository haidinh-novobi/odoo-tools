#!/bin/sh

if [ $1 = "start" ]; then
    ./odoo/odoo-bin -c odoo.conf

elif [ $1 = "startwithport" ]; then
    ./odoo/odoo-bin -c odoo.conf --xmlrpc-port=$2

elif [ $1 = "upgradewithport" ]; then
    ./odoo/odoo-bin -c odoo.conf --xmlrpc-port=$2  -u $3 -d $4

elif [ $1 = "serverstart" ]; then
    ./odoo/odoo-bin -c server.conf

elif [ $1 = "--help" ]; then
    echo "=================================OPTIONS ============================"
    echo "      Run command line 'sh odoo.sh [option]' with options below:"
    echo "      [start]                                       Start Odoo with default port in file config."
    echo "      - Ex: sh odoo.sh start"
    echo "      [upgrade MODULE_NAME DB_NAME]                 Upgrade Odoo with module and database."
    echo "      - Ex: sh odoo.sh upgrade base db_demo"
    echo "      [upgrade-sa MODULE_NAME DB_NAME]                 Upgrade Odoo with module, database and option --stop-after-init"
    echo "      - Ex: sh odoo.sh upgrade-sa base db_demo"
    echo "      [startwithport PORT]                          Start Odoo with port define."
    echo "      - Ex: sh odoo.sh startwithport 8069"
    echo "      [upgradewithport PORT MODULE_NAME DB_NAME]    upgrade Odoo with port define."
    echo "      - Ex: sh odoo.sh upgradewithport 8069 base db_demo"
    echo "      [serverstart]    start Odoo on server."
    echo "      - Ex: sh odoo.sh serverstart"
    echo "      [--help]                                      Show more options."
    echo "================================ END ================================"

elif [ $1 = "upgrade" ]; then
    ./odoo/odoo-bin -c odoo.conf -u $2 -d $3

else [ $1 = "upgrade-sa" ]
    ./odoo/odoo-bin -c odoo.conf -u $2 -d $3 --stop-after-init
fi
