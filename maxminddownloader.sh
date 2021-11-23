#!/bin/sh
####################################################################
# Script Name   : maxminddownloader.sh
# Description   : Script to download Maxmind CVS and .mmdb Datafiles
# Args          : Use the .conf file to specify the licence
# Author        : Gerardo Gonzalez
# Email         : gerardoj.gonzalezg@bigg.blog
####################################################################

#
# Defining the colors sequences
# you can update this to tput
#
GREEN="\e[38;5;46m"
BLUE="\e[38;5;39m"
RED="\e[38;5;196m"
STOP="\e[0m"

#
# Printing the script name (while I think what to do next :)
#
printf "${GREEN}Maxmind GeoIP2 Downloader${STOP} by BigG\n\n"

#
# Config File
#
CONFIG_FILE="maxminddownloader.conf"
printf "${BLUE}Loading the config from $CONFIG_FILE ...${STOP}\n"
if [ -e $CONFIG_FILE ]
then
    LICENSE_KEY=`cat $CONFIG_FILE | grep -Po 'LICENSE_KEY="?\K[^"?]*'`
else
    printf "${RED}Config File $CONFIG_FILE not found.${STOP}\n"
    exit 1
fi

#
# Prep a new dir
#
DDIR="download_"`date +"%Y%m%d%H%M%S"`
printf "${BLUE}Preparing a new Directory: ${STOP}$DDIR\n\n"
mkdir $DDIR
cd $DDIR

#
# Downloading Country CSV database
#
OFSHA="GeoLite2-Country-CSV.sha256"
printf "${BLUE}Downloading Country CSV Database${STOP} ...\n"
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&license_key=$LICENSE_KEY&suffix=zip.sha256" -O $OFSHA
OFDB=`head -1 $OFSHA | cut -d' ' -f3`
DDATE=`echo $OFDB|cut -d_ -f2|cut -d. -f1`
OFSHAD=`echo $OFSHA|cut -d. -f1`_$DDATE.`echo $OFSHA|cut -d. -f2`
#printf "Updating: $OFSHA to $OFSHAD\n"
mv $OFSHA $OFSHAD
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&license_key=$LICENSE_KEY&suffix=zip" -O $OFDB
printf "\n"

#
# Downloading Country MMDB database
#
OFSHA="GeoLite2-Country.sha256"
printf "${BLUE}Downloading Country MMDB Database${STOP} ...\n"
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country&license_key=$LICENSE_KEY&suffix=tar.gz.sha256" -O $OFSHA
OFDB=`head -1 $OFSHA | cut -d' ' -f3`
DDATE=`echo $OFDB|cut -d_ -f2|cut -d. -f1`
OFSHAD=`echo $OFSHA|cut -d. -f1`_$DDATE.`echo $OFSHA|cut -d. -f2`
#printf "Updating: $OFSHA to $OFSHAD\n"
mv $OFSHA $OFSHAD
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country&license_key=$LICENSE_KEY&suffix=tar.gz" -O $OFDB
printf "\n"

#
# Downloading City CSV database
#
OFSHA="GeoLite2-City-CSV.sha256"
printf "${BLUE}Downloading City CSV database${STOP} ...\n"
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City-CSV&license_key=$LICENSE_KEY&suffix=zip.sha256" -O $OFSHA
OFDB=`head -1 $OFSHA | cut -d' ' -f3`
DDATE=`echo $OFDB|cut -d_ -f2|cut -d. -f1`
OFSHAD=`echo $OFSHA|cut -d. -f1`_$DDATE.`echo $OFSHA|cut -d. -f2`
#printf "Updating: $OFSHA to $OFSHAD\n"
mv $OFSHA $OFSHAD
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City-CSV&license_key=$LICENSE_KEY&suffix=zip" -O $OFDB
printf "\n"

#
# Downloading City MMDB database
#
OFSHA="GeoLite2-City.sha256"
printf "${BLUE}Downloading City MMDB database${STOP} ...\n"
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=$LICENSE_KEY&suffix=tar.gz.sha256" -O $OFSHA
OFDB=`head -1 $OFSHA | cut -d' ' -f3`
DDATE=`echo $OFDB|cut -d_ -f2|cut -d. -f1`
OFSHAD=`echo $OFSHA|cut -d. -f1`_$DDATE.`echo $OFSHA|cut -d. -f2`
#printf "Updating: $OFSHA to $OFSHAD\n"
mv $OFSHA $OFSHAD
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=$LICENSE_KEY&suffix=tar.gz" -O $OFDB
printf "\n"

#
# Downloading ASN (Autonomous System Number [ORG]) CSV database
#
OFSHA="GeoLite2-ASN-CSV.sha256"
printf "${BLUE}Downloading ANS/ORG CSV database${STOP} ...\n"
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN-CSV&license_key=$LICENSE_KEY&suffix=zip.sha256" -O $OFSHA
OFDB=`head -1 $OFSHA | cut -d' ' -f3`
DDATE=`echo $OFDB|cut -d_ -f2|cut -d. -f1`
OFSHAD=`echo $OFSHA|cut -d. -f1`_$DDATE.`echo $OFSHA|cut -d. -f2`
#printf "Updating: $OFSHA to $OFSHAD\n"
mv $OFSHA $OFSHAD
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN-CSV&license_key=$LICENSE_KEY&suffix=zip" -O $OFDB
printf "\n"

#
# Downloading ASN (Autonomous System Number [ORG]) MMDB database
#
OFSHA="GeoLite2-ASN.sha256"
printf "${BLUE}Downloading ANS/ORG MMDB database${STOP} ...\n"
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN&license_key=$LICENSE_KEY&suffix=tar.gz.sha256" -O $OFSHA
OFDB=`head -1 $OFSHA | cut -d' ' -f3`
DDATE=`echo $OFDB|cut -d_ -f2|cut -d. -f1`
OFSHAD=`echo $OFSHA|cut -d. -f1`_$DDATE.`echo $OFSHA|cut -d. -f2`
#printf "Updating: $OFSHA to $OFSHAD\n"
mv $OFSHA $OFSHAD
wget -q --show-progress "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN&license_key=$LICENSE_KEY&suffix=tar.gz" -O $OFDB
printf "\n"

# Checking ....
printf "${BLUE}Verifying with sha256sum ...${STOP}\n"
sha256sum -c *.sha256
printf "\n"
