#!/bin/bash

#
if [ "$EUID" -ne 0 ]
  then echo "\e[1m" "\e[31m[*] Script must be run as root"
  exit
fi
#
cat << "EOF"

                                                _                
                                    _ __  _   _| |__   ___ _ __  
                                   | '_ \| | | | '_ \ / _ \ '_ \ 
                                   | | | | |_| | |_) |  __/ | | |
                                   |_| |_|\__, |_.__/ \___|_| |_|
                                          |___/                  


                                       -Script by pentest.01-
EOF

echo

# Do not use this script for assisting in illegal activity, I take no responsibility in your actions.
echo -e "\e[1m" "\e[31m[*] Do not use this script for assisting in illegal activity, I take no responsibility in your actions."
echo

# Updating OS
echo -e "\e[1m" "\e[31m[*] Updating OS."
hwclock --hctosys 
apt update ; apt-get -y upgrade ; apt-get -y dist-upgrade ; apt-get -y autoremove ; apt-get -y autoclean ; echo

echo

# Checking/Installing tor
tor=$(which tor)
if [[ $tor ]];
  then
  echo -e "\e[1m" "\e[32m[+] Tor already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing/Starting Tor.....\e[0m"
  apt install tor -y && /etc/init.d/tor start
fi

echo

# Checking/Installing nmap
nmap=$(which nmap)
if [[ $nmap ]];
  then
  echo -e "\e[1m" "\e[32m[+] Nmap already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing Nmap.....\e[0m"
  apt install nmap -y
fi

echo

# Checking/Installing jq
jq=$(which jq)
if [[ $jq ]];
  then
  echo -e "\e[1m" "\e[32m[+] Jq already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing Jq.....\e[0m"
  apt install jq -y
fi
   
echo

# Checking/Installing parallel
parallel=$(which parallel)
if [[ $parallel ]];
  then
  echo -e "\e[1m" "\e[32m[+] Parallel already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing Parallel.....\e[0m"
  apt install parallel -y
fi

echo

# Checking/Installing pip
pip=$(which pip)
if [[ $pip ]];
  then
  echo -e "\e[1m" "\e[32m[+] Pip already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing Pip.....\e[0m"
  apt install python3-pip -y
fi

echo

# Checking/Installing ruby
ruby=$(which ruby)
if [[ $ruby ]];
  then
  echo -e "\e[1m" "\e[32m[+] Ruby already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing Ruby.....\e[0m"
  apt install -y ruby ruby-dev
fi

echo

# Checking/Installing go
gocheck=$(which go)
if [[ $gocheck ]];
  then
  echo -e "\e[1m" "\e[32m[+] Golang already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing Golang.....\e[0m"
  apt install golang-go -y
fi
   
echo

# Checking/Installing pipenv
#pipenv=$(which pipenv)
#if [[ $pipenv ]];
#  then
#  echo -e "\e[1m" "\e[32m[+] Pipenv already installed.....\e[0m"
#else
#  echo -e "\e[1m" "\e[31m[*] Installing Pipenv.....\e[0m"
#  apt install pipenv -y
#fi

#echo

# Checking/Installing npm
npmcheck=$(which npm)
if [[ $npmcheck ]];
  then
  echo -e "\e[1m" "\e[32m[+] Npm already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing Npm.....\e[0m"
  apt install npm -y
fi

echo

# Checking/Installing build-essential
gcc=$(which gcc)
if [[ $gcc ]];
  then
  echo -e "\e[1m" "\e[32m[+] Build-essential already installed.....\e[0m"
else
  echo -e "\e[1m" "\e[31m[*] Installing Build-essential.....\e[0m"
  apt install build-essential -y
fi

echo

# Making Directories
mkdir -p /opt/RedTeam-Toolkit/{Reconnaissance/{Active,Passive},Delivery/{,Mailers},"Command and Control"/{,Staging}}

echo

# Active Intelligence Gathering
echo -e "\e[1m" "\e[33m[*] Checking Active Intelligence Gathering...\e[0m"

echo

if [ -d /opt/RedTeam-Toolkit/Reconnaissance/Active/Sudomy/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating Sudomy...\e[0m"
  cd /opt/RedTeam-Toolkit/Reconnaissance/Active/Sudomy || exit ; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading Sudomy...\e[0m"
  git clone --recursive https://github.com/screetsec/Sudomy.git /opt/RedTeam-Toolkit/Reconnaissance/Active/Sudomy
  python3 -m pip install -r /opt/RedTeam-Toolkit/Reconnaissance/Active/Sudomy/requirements.txt
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/Reconnaissance/Active/o365spray/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating o365spray...\e[0m"
  cd /opt/RedTeam-Toolkit/Reconnaissance/Active/o365spray || exit ; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading o365spray...\e[0m"
  git clone https://github.com/0xZDH/o365spray.git /opt/RedTeam-Toolkit/Reconnaissance/Active/o365spray
  cd /opt/RedTeam-Toolkit/Reconnaissance/Active/o365spray && python3 setup.py build && python3 -m pip install -r requirements.txt && cd || exit
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/Reconnaissance/Active/spoofchecker/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating spoofchecker...\e[0m"
  cd /opt/RedTeam-Toolkit/Reconnaissance/Active/spoofchecker || exit ; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading spoofchecker...\e[0m"
  git clone https://github.com/masquerad3r/spoofchecker.git /opt/RedTeam-Toolkit/Reconnaissance/Active/spoofchecker
  echo
fi

echo

# Passive Intelligence Gathering
echo -e "\e[1m" "\e[33m[*] Checking Passive Intelligence Gathering...\e[0m"

echo

if [ -d /opt/RedTeam-Toolkit/Reconnaissance/Passive/sherlok/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating sherlok... \e[0m"
  cd /opt/RedTeam-Toolkit/Reconnaissance/Passive/sherlok || exit ; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading sherlok...\e[0m "
  git clone https://github.com/sherlock-project/sherlock.git /opt/RedTeam-Toolkit/Reconnaissance/Passive/sherlok
  cd /opt/RedTeam-Toolkit/Reconnaissance/Passive/sherlok && pip install -r requirements.txt && cd || exit
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/Reconnaissance/Passive/theHarvester/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating theHarvester...\e[0m"
  cd /opt/RedTeam-Toolkit/Reconnaissance/Passive/theHarvester || exit ; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading theHarvester...\e[0m"
  git clone https://github.com/laramies/theHarvester.git /opt/RedTeam-Toolkit/Reconnaissance/Passive/theHarvester
  cd /opt/RedTeam-Toolkit/Reconnaissance/Passive/theHarvester && python3 -m pip install -r requirements/base.txt && cd || exit
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/Reconnaissance/Passive/zoominfo_scraper/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating zoominfo_scraper...\e[0m "
  cd /opt/RedTeam-Toolkit/Reconnaissance/Passive/zoominfo_scraper || exit ; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading zoominfo_scraper...\e[0m "
  git clone https://github.com/ScrapingAnt/zoominfo_scraper.git /opt/RedTeam-Toolkit/Reconnaissance/Passive/zoominfo_scraper
  cd /opt/RedTeam-Toolkit/Reconnaissance/Passive/zoominfo_scraper && pip install -r requirements.txt && cd || exit
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/Reconnaissance/Passive/o365creeper/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating O365 creeper...\e[0m "
  cd /opt/RedTeam-Toolkit/Reconnaissance/Passive/o365creeper || exit ; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading O365 creeper...\e[0m"
  git clone https://github.com/er4z0r/o365creeper.git /opt/RedTeam-Toolkit/Reconnaissance/Passive/o365creeper
  pip install -r /opt/RedTeam-Toolkit/Reconnaissance/Passive/o365creeper/requirements.txt
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/Delivery/Mailers/espoofer/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating espoofer...\e[0m "
  cd /opt/RedTeam-Toolkit/Delivery/Mailers/espoofer/ || exit; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading espoofer...\e[0m "
  git clone https://github.com/chenjj/espoofer.git /opt/RedTeam-Toolkit/Delivery/Mailers/espoofer
  pip3 install -r /opt/RedTeam-Toolkit/Delivery/Mailers/espoofer/requirements.txt
  echo
 fi

# Command and Control
echo -e "\e[1m" "\e[33m[*] Checking Command and Control...\e[0m "

echo

if [ -d /opt/RedTeam-Toolkit/"Command and Control"/Staging/Chameleon/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating Chameleon...\e[0m "
  cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/Chameleon/ || exit; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading Chameleon...\e[0m "
  git clone https://github.com/mdsecactivebreach/Chameleon.git /opt/RedTeam-Toolkit/"Command and Control"/Staging/Chameleon/
  pip install -r /opt/RedTeam-Toolkit/"Command and Control"/Staging/Chameleon/requirements.txt
  echo
fi

echo

#if [ -d /opt/RedTeam-Toolkit/"Command and Control"/Staging/domainhunter/.git ]; then
#  echo -e "\e[1m" "\e[32m[*] Updating Domain Hunter...\e[0m "
#  cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/domainhunter/ || exit; git pull
#  echo
#else
#  echo -e "\e[1m" "\e[31m[*] Downloading Domain Hunter...\e[0m "
#  git clone https://github.com/threatexpress/domainhunter.git /opt/RedTeam-Toolkit/"Command and Control"/Staging/domainhunter/
#  echo
#  cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/domainhunter/ && pip3 install -r requirements.txt && pipenv install && cd || exit 
#fi

#echo

if [ -d /opt/RedTeam-Toolkit/"Command and Control"/Staging/decode-spam-headers/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating decode-spam-headers...\e[0m "
  cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/decode-spam-headers/ || exit; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading decode-spam-headers...\e[0m "
  git clone https://github.com/mgeeky/decode-spam-headers.git /opt/RedTeam-Toolkit/"Command and Control"/Staging/decode-spam-headers/
  pip3 install -r /opt/RedTeam-Toolkit/"Command and Control"/Staging/decode-spam-headers/requirements.txt 
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/"Command and Control"/Staging/EvilURL/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating EvilURL...\e[0m"
  cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/EvilURL/ || exit; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading EvilURL...\e[0m"
  git clone https://github.com/UndeadSec/EvilURL /opt/RedTeam-Toolkit/"Command and Control"/Staging/EvilURL/
  pip install python3-nmap python-whois
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/"Command and Control"/Staging/phishing-HTML-linter/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating phishing-HTML-linter...\e[0m"
  cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/phishing-HTML-linter/ || exit; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading phishing-HTML-linter...\e[0m"
  git clone https://github.com/pentest01/phishing-HTML-linter /opt/RedTeam-Toolkit/"Command and Control"/Staging/phishing-HTML-linter/
  echo
fi

echo

if [ -d /opt/RedTeam-Toolkit/"Command and Control"/Staging/urlcrazy/.git ]; then
  echo -e "\e[1m" "\e[32m[*] Updating UrlCrazy...\e[0m "
  cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/urlcrazy/ || exit; git pull
  echo
else
  echo -e "\e[1m" "\e[31m[*] Downloading UrlCrazy...\e[0m "
  git clone https://github.com/urbanadventurer/urlcrazy.git /opt/RedTeam-Toolkit/"Command and Control"/Staging/urlcrazy/
  cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/urlcrazy/
  gem install json colorize async async-dns async-http
  gem install bundler
  bundle install && cd || exit
  echo
fi

echo

#if [ -d /opt/RedTeam-Toolkit/"Command and Control"/Staging/redirect.rules/.git ]; then
# echo -e "[*] Updating redirect.rules."
# echo -e "\e[1m" "\e[32m[*] Updating redirect.rules. "
# cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/redirect.rules/; git pull
# echo
#else
# echo -e "[*] Downloading redirect.rules...\e[0m"
# echo -e "\e[1m" "\e[31m[*] Updating redirect.rules. "
# git clone https://github.com/0xZDH/redirect.rules.git /opt/RedTeam-Toolkit/"Command and Control"/Staging/redirect.rules/
# echo
# cd /opt/RedTeam-Toolkit/"Command and Control"/Staging/redirect.rules/ && sudo ./setup.sh 1>/dev/null 2>&1 && cd
#fi

# echo

echo -e "\e[1m" "\e[31m[*] DONE. :) \e[0m"

echo

echo -e "\e[1m" "\e[31m[*] gem install bundler and bundle install in urlrazy folder...\e[0m "

echo

# Final Update
echo -e "\e[1m" "\e[31m[*] Final Update...\e[0m "
apt update ; apt-get upgrade -y >/dev/null 2>&1

echo

echo -e "\e[1m" "\e[31m[*] Happy Hacking!!! :) \e[0m"

echo

# https://misc.flogisoft.com/bash/tip_colors_and_formatting
# https://connect.clearbit.com/

