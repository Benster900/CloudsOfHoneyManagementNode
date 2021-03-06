#!/bin/bash

set -x
set -e


########################### Install/Setup Elastalert ###########################
cd /opt
git clone https://github.com/Yelp/elastalert.git
cd /opt/elastalert

# Install elastalert and requirements
pip install --upgrade pip
pip install setuptools --upgrade
python setup.py install
pip install -r requirements.txt
pip install "elasticsearch>=5.0.0"
#pip install virtualenv
#virtualenv env
#. env/bin/activate
#python setup.py install
#pip install -r requirements.txt

# Create index
elastalert-create-index

# Setup config
cp config.yaml.example config.yaml
mkdir -p rules
sed -i 's/rules_folder: example_rules/rules_folder: rules/g' config.yaml
sed -i 's/es_host: elasticsearch.example.com/es_host: localhost/g' config.yaml

# Elastalert systemd service
cat > /etc/systemd/system/elastalert.service << EOF
[Unit]
Description=elastalert
After=multi-user.target

[Service]
Type=simple
WorkingDirectory=/opt/elastalert
ExecStart=/opt/elastalert/env/bin/python /opt/elastalert/elastalert/elastalert.py

[Install]
WantedBy=multi-user.target
EOF

systemctl enable elastalert
systemctl start elastalert
