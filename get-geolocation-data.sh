#!/bin/bash

get_geolocation_data()
{
	geolocation_data=$(curl -s http://freegeoip.net/xml/${current_ip})
	
	country_code=$(echo ${geolocation_data} | \
		grep -o -P -i "(?<=<CountryCode>).*(?=</CountryCode>)")
	
	country_name=$(echo ${geolocation_data} | \
		grep -o -P -i "(?<=<CountryName>).*(?=</CountryName>)")
	
	city_name=$(echo ${geolocation_data} | \
		grep -o -P -i "(?<=<City>).*(?=</City>)")
}

