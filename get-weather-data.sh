#!/bin/bash

get_weather_data()
{
    local _day1_date
    local _day2_date
    local _day3_date

    local _day1_forecast_data
    local _day2_forecast_data
    local _day3_forecast_data

    if ! ${manual_setting}
    then
        current_weather_data=$(curl -s "http://api.openweathermap.org/\
data/2.5/weather?lat=${latitude}&lon=${longitude}&mode=xml&\
units=${unit_type}&APPID=${api_key}" )

        weather_forecast_data=$(curl -s "http://api.openweathermap.org/\
data/2.5/forecast/daily?lat=${latitude}&lon=${longitude}&cnt=4&mode=xml\
&units=${unit_type}&APPID=${api_key}")
    else
        current_weather_data=$(curl -s "https://api.openweathermap.org/\
data/2.5/weather?q=${city_name// /%20},${country_code}&mode=xml\
&units=${unit_type}&APPID=${api_key}")

        weather_forecast_data=$(curl -s "https://api.openweathermap.org/\
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
    day1[0]="$(get_day_of_week "$(date --date="1 day" +%w)")"

    _day1_date="$(date --date="1 day" +%Y-%m-%d)"

    _day1_forecast_data=$(echo ${weather_forecast_data} | \
        grep -o -P -i -m 1 "(?<=<time day=\"${_day1_date}\">).*?(?=</time>)")

    # day1 weather condition
    day1[1]=$(echo ${_day1_forecast_data} | \
        grep -o -P -i "(?<=<symbol number=\"...\" name=\")[^\"]*")

    # day1 min temperature
    day1[2]=$(echo ${_day1_forecast_data} | \
        grep -o -P -i "(?<=<temperature)[^/]*" | \
        grep -o -P -i "(?<=min=\")[^(\.|\")]*")

    # day1 max temperature
    day1[3]=$(echo ${_day1_forecast_data} | \
        grep -o -P -i "(?<=<temperature)[^/]*" | \
        grep -o -P -i "(?<=max=\")[^(\.|\")]*")

    # day2 name
    day2[0]="$(get_day_of_week "$(date --date="2 days" +%w)")"

    _day2_date="$(date --date="2 days" +%Y-%m-%d)"

    _day2_forecast_data=$(echo ${weather_forecast_data} | \
        grep -o -P -i -m 1 "(?<=<time day=\"${_day2_date}\">).*?(?=</time>)")

    # day2 weather condition
    day2[1]=$(echo ${_day2_forecast_data} | \
        grep -o -P -i "(?<=<symbol number=\"...\" name=\")[^\"]*")

    # day2 min temperature
    day2[2]=$(echo ${_day2_forecast_data} | \
        grep -o -P -i "(?<=<temperature)[^/]*" | \
        grep -o -P -i "(?<=min=\")[^(\.|\")]*")

    # day2 max temperature
    day2[3]=$(echo ${_day2_forecast_data} | \
        grep -o -P -i "(?<=<temperature)[^/]*" | \
        grep -o -P -i "(?<=max=\")[^(\.|\")]*")

    # day3 name
    day3[0]="$(get_day_of_week "$(date --date="3 days" +%w)")"

    _day3_date="$(date --date="3 days" +%Y-%m-%d)"

    _day3_forecast_data=$(echo ${weather_forecast_data} | \
        grep -o -P -i -m 1 "(?<=<time day=\"${_day3_date}\">).*?(?=</time>)")

    # day3 weather condition
    day3[1]=$(echo ${_day3_forecast_data} | \
        grep -o -P -i "(?<=<symbol number=\"...\" name=\")[^\"]*")

    # day3 min temperature
    day3[2]=$(echo ${_day3_forecast_data} | \
        grep -o -P -i "(?<=<temperature)[^/]*" | \
        grep -o -P -i "(?<=min=\")[^(\.|\")]*")

    # day3 max temperature
    day3[3]=$(echo ${_day3_forecast_data} | \
        grep -o -P -i "(?<=<temperature)[^/]*" | \
        grep -o -P -i "(?<=max=\")[^(\.|\")]*")
}
