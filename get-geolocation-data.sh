#!/bin/bash

get_geolocation_data()
{
	geolocation_data=$(curl -s http://freegeoip.net/xml/${current_ip})
	
	country_code=$(echo ${geolocation_data} | \
		grep -o -P -i "(?<=<CountryCode>).*(?=</CountryCode>)")
	
	country_name=$(echo ${geolocation_data} | \
			grep -o -P -i "(?<=<CountryName>).*(?=</CountryName>)")
	
	if [[ "${country_code}" == "US" || "${country_code}" == "us" ]]
	then
		country_name="$(echo ${geolocation_data} | \
			grep -o -P -i "(?<=<RegionCode>).*(?=</RegionCode>)"), \
${country_name}"
	fi
	
	city_name=$(echo ${geolocation_data} | \
		grep -o -P -i "(?<=<City>).*(?=</City>)")
	
	latitude=$(echo ${geolocation_data} | \
		grep -o -P -i "(?<=<Latitude>).*(?=</Latitude>)")
	
	longitude=$(echo ${geolocation_data} | \
		grep -o -P -i "(?<=<Longitude>).*(?=</Longitude>)")
}

