#!/bin/bash

# bash-weather is a weather report and forecast script written in Bash.
# Copyright (C) 2013 Istvan Szantai <szantaii at sidenote dot hu>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program (LICENSE).
# If not, see <http://www.gnu.org/licenses/>.

get_weather_data()
{
	local day1_date
	local day2_date
	local day3_date
	
	local day1_forecast_data
	local day2_forecast_data
	local day3_forecast_data
	
	if ((manual_setting == 0))
	then
		current_weather_data=$(curl -s "http://api.openweathermap.org/\
data/2.5/weather?lat=${latitude}&lon=${longitude}&mode=xml&\
units=${unit_type}&APPID=${api_key}" )
		
		weather_forecast_data=$(curl -s "http://api.openweathermap.org/\
data/2.5/forecast/daily?lat=${latitude}&lon=${longitude}&cnt=4&mode=xml\
&units=${unit_type}&APPID=${api_key}")
	else
		current_weather_data=$(curl -s "http://api.openweathermap.org/\
data/2.5/weather?q=${city_name// /%20},${country_code}&mode=xml\
&units=${unit_type}&APPID=${api_key}")
		
		weather_forecast_data=$(curl -s "http://api.openweathermap.org/\
data/2.5/forecast/daily?q=${city_name// /%20},${country_code}&cnt=4&mode=xml\
&units=${unit_type}&APPID=${api_key}")
	fi
	
	temperature_value=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<temperature value=\")[^(\"|\.)]*")
	
	wind_value=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<speed value=\")[^\"]*")
	
	wind_direction=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<direction value=\")[^/]*" | \
		grep -o -P -i "(?<=code=\")[^\"]*")
	
	weather_condition=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<weather number=\"...\" value=\")[^\"]*")
	
	weather_condition_icon=$(echo ${current_weather_data} | \
		grep -o -P -i "(?<=<weather)[^/]*" | \
		grep -o -P -i "(?<=icon=\")[^\"]*")
	
	# day1 name
	day1[0]=$(get_day_of_week $(date --date="1 day" +%w))
	
	day1_date=$(date --date="1 day" +%Y-%m-%d)
	
	day1_forecast_data=$(echo ${weather_forecast_data} | \
		grep -o -P -i -m 1 "(?<=<time day=\"${day1_date}\">).*?(?=</time>)")
	
	# day1 weather condition
	day1[1]=$(echo ${day1_forecast_data} | \
		grep -o -P -i "(?<=<symbol number=\"...\" name=\")[^\"]*")
	
	# day1 min temperature
	day1[2]=$(echo ${day1_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=min=\")[^(\.|\")]*")
	
	# day1 max temperature
	day1[3]=$(echo ${day1_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=max=\")[^(\.|\")]*")
	
	# day2 name
	day2[0]=$(get_day_of_week $(date --date="2 days" +%w))
	
	day2_date=$(date --date="2 days" +%Y-%m-%d)
	
	day2_forecast_data=$(echo ${weather_forecast_data} | \
		grep -o -P -i -m 1 "(?<=<time day=\"${day2_date}\">).*?(?=</time>)")
	
	# day2 weather condition
	day2[1]=$(echo ${day2_forecast_data} | \
		grep -o -P -i "(?<=<symbol number=\"...\" name=\")[^\"]*")
	
	# day2 min temperature
	day2[2]=$(echo ${day2_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=min=\")[^(\.|\")]*")
	
	# day2 max temperature
	day2[3]=$(echo ${day2_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=max=\")[^(\.|\")]*")
	
	# day3 name
	day3[0]=$(get_day_of_week $(date --date="3 days" +%w))
	
	day3_date=$(date --date="3 days" +%Y-%m-%d)
	
	day3_forecast_data=$(echo ${weather_forecast_data} | \
		grep -o -P -i -m 1 "(?<=<time day=\"${day3_date}\">).*?(?=</time>)")
	
	# day3 weather condition
	day3[1]=$(echo ${day3_forecast_data} | \
		grep -o -P -i "(?<=<symbol number=\"...\" name=\")[^\"]*")
	
	# day3 min temperature
	day3[2]=$(echo ${day3_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=min=\")[^(\.|\")]*")
	
	# day3 max temperature
	day3[3]=$(echo ${day3_forecast_data} | \
		grep -o -P -i "(?<=<temperature)[^/]*" | \
		grep -o -P -i "(?<=max=\")[^(\.|\")]*")
}
