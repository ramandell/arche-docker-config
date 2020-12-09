#!/bin/bash
if [ ! -d /home/www-data/docroot/fcs ]; then
    su -l www-data -c 'mkdir /home/www-data/docroot/fcs'
    su -l www-data -c 'ln -s /home/www-data/vendor /home/www-data/docroot/fcs/vendor'
fi
su -l www-data -c 'cp /home/www-data/vendor/acdh-oeaw/arche-fcs/index.php /home/www-data/docroot/fcs/index.php'

CMD=/home/www-data/vendor/zozlak/yaml-merge/bin/yaml-edit.php
CFGD=/home/www-data/config/yaml
rm -f /home/www-data/docroot/fcs/config.yaml $CFGD/config-fcs.yaml
su -l www-data -c "$CMD --src $CFGD/fcs.yaml $CFGD/config-fcs.yaml"
su -l www-data -c "ln -s $CFGD/config-fcs.yaml /home/www-data/docroot/fcs/config.yaml"

