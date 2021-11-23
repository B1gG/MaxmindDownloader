# MaxmindDownloader
### Description

This script is a tool to help with downloading the **.csv** and **.mmdb** data set from [MaxMind](https://www.maxmind.com/en/home) using your LIcense Key and the permalinks. For that you should [register in MaxMind](https://dev.maxmind.com/geoip/geolite2-free-geolocation-data) and get your License Key from the dashboard and include it in the **.conf** file of this script.

Once the files are downloaded the script will to verify them and check the checksum.

### Installation

To install this script follow the steps:

1. Download the script to your machine by cloning the repository with `git clone https://github.com/B1gG/MaxmindDownloader.git`

2. Log into your MaxMind account, go to your **Account Summary** and click in the section **Manage License Keys** in the left menu and then generate the License Key by clicking in **Generate new license key**. Make sure you copy the key and store in a safe place.

3. Edit the file `maxminddownloader.conf` file and add the license key as:

   ```bash
   LICENSE_KEY="HEREGOESYOURLICENSEKEY"
   ```

4. Make the script executable with `chmod +x maxminddownloader.sh`

### Run

Run the script with `./maxminddownloader.sh` it will create a folder called **download** with the date and time when the script was run, like `download_YYYYMMDDHHMMSS` where:

- YYYY, is the year in court digits
- MM, month 2 digits padded 
- DD, day 2 digits padded 
- HH, hour 2 digits padded 
- MM, minutes 2 digits padded 
- SS, seconds 2 digits padded 

### Extract the data files

To extract the data files you will need to use:

- `tar -xf <file_name>` for the **.tar.gz** (the .mmdb binary format)
- `unzip <file_name>` for the **.zip** (the .csv text format)

### Notes

- The **.mmdb** files can be used directly by the **ngx_http_geoip2_module**.
- The .csv files can be converted to the old mmdb format to be used with the old nginx module **ngx_http_geoip_module** using this tool [geolite2legacy](https://github.com/sherpya/geolite2legacy).
- `tar -xf GeoLite2-City_20211123.tar.gz --wildcards '*.mmdb'` will extra just the **GeoLite2-City.mmdb** file.

