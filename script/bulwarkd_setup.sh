#!/bin/bash
# Download latest node and install.
bwklink="https://transfer.sh/RHr2c/dogecash.zip"
mkdir -p /tmp/dogecash
cd /tmp/dogecash
curl -Lo dogecash.zip $bwklink
apt install unzip && unzip dogecash.zip
cd dogecash
cp -r * /usr/local/bin
# sudo mv ./bin/* /usr/local/bin
cd
rm -rf /tmp/dogecash
mkdir ~/.dogecash

# Setup configuration for node.
rpcuser=test123
rpcpassword=test123
cat >~/.dogecash2/dogecash2.conf <<EOL
rpcuser=$rpcuser
rpcpassword=$rpcpassword
daemon=1
txindex=1
EOL

# Start node.
dogecashd
