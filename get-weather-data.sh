#!/bin/bash

get_weather_data()
{
	local conversion_unit=""
	
	local day1_date
	local day2_date
	local day3_date
	
	local day1_forecast_data
	local day2_forecast_data
	local day3_forecast_data
	
	current_weather_data=$(curl -s "http://api.openweathermap.org/\
data/2.5/weather?q=${city_name},${country_code}&mode=xml&units=${unit_type}")
	
	weather_forecast_data=$(curl -s "http://api.openweathermap.org/\
data/2.5/forecast/daily?q=${city_name},${country_code}&mode=xml&\
units=${unit_type}&cnt=4")
	
	temperature_value=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<temperature value=\")[^\.]*")
	
	wind_value=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<speed value=\")[^\"]*")
	
	if [[ "${unit_type}" == "metric" ]]
	then
		conversion_unit="3.6"
	else
		conversion_unit="2.2369"
	fi
	
	wind_value=$(echo "scale=1; ${wind_value} * ${conversion_unit}" | bc -l)
	
	wind_direction=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<direction value=\")[^/]*" | \
		grep -o -P -i "(?<=code=\")[^\"]*")
	
	weather_condition=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<weather number=\"...\" value=\")[^\"]*")
	
	weather_condition="${weather_condition,,}"
	
	if [[ "${weather_condition}" == "sky is clear" ]]
	then
		weather_condition="clear sky"
	fi
	
	weather_condition="${weather_condition^^}"
	
	weather_condition_icon=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<weather)[^/]*" | \
		grep -o -P -i "(?<=icon=\")[^\"]*")
	
	# day1 name
	day1[0]=$(date --date="1 day" +%a)
	
	day1_date=$(date --date="1 day" +%Y-%m-%d)
	
	day1_forecast_data=$(echo ${weather_forecast_data} | \
		grep -o -P -i -m 1 "(?<=<time day=\"${day1_date}\">).*?(?=</time>)")
	
	# day1 weather condition
	day1[1]=$(echo ${day1_forecast_data} | \
		grep -o -P -i "(?<=<clouds value=\")[^\"]*")
	
	# day1 min temperature
	day1[2]=$(echo ${day1_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=min=\")[^\.]*")
	
	# day1 max temperature
	day1[3]=$(echo ${day1_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=max=\")[^\.]*")
	
	# day2 name
	day2[0]=$(date --date="2 days" +%a)
	
	day2_date=$(date --date="2 days" +%Y-%m-%d)
	
	day2_forecast_data=$(echo ${weather_forecast_data} | \
		grep -o -P -i -m 1 "(?<=<time day=\"${day2_date}\">).*?(?=</time>)")
	
	# day2 weather condition
	day2[1]=$(echo ${day2_forecast_data} | \
		grep -o -P -i "(?<=<clouds value=\")[^\"]*")
	
	# day2 min temperature
	day2[2]=$(echo ${day2_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=min=\")[^\.]*")
	
	# day2 max temperature
	day2[3]=$(echo ${day2_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=max=\")[^\.]*")
	
	# day3 name
	day3[0]=$(date --date="3 days" +%a)
	
	day3_date=$(date --date="3 days" +%Y-%m-%d)
	
	day3_forecast_data=$(echo ${weather_forecast_data} | \
		grep -o -P -i -m 1 "(?<=<time day=\"${day3_date}\">).*?(?=</time>)")
	
	# day3 weather condition
	day3[1]=$(echo ${day3_forecast_data} | \
		grep -o -P -i "(?<=<clouds value=\")[^\"]*")
	
	# day3 min temperature
	day3[2]=$(echo ${day3_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=min=\")[^\.]*")
	
	# day3 max temperature
	day3[3]=$(echo ${day3_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=max=\")[^\.]*")
}

