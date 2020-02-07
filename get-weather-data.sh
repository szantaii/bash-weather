#!/bin/bash

get_weather_data()
{
    if ! ${manual_setting}
    then
        current_weather_data=$(curl -s "https://api.openweathermap.org/\
data/2.5/weather?lat=${latitude}&lon=${longitude}&units=${unit_type}\
&APPID=${api_key}")

        weather_forecast_data=$(curl -s "https://api.openweathermap.org/\
data/2.5/forecast?lat=${latitude}&lon=${longitude}&units=${unit_type}\
&APPID=${api_key}")
    else
        current_weather_data=$(curl -s "https://api.openweathermap.org/\
data/2.5/weather?q=${city_name// /%20},${country_code}&units=${unit_type}\
&APPID=${api_key}")

        weather_forecast_data=$(curl -s "https://api.openweathermap.org/\
data/2.5/forecast?q=${city_name// /%20},${country_code}&units=${unit_type}\
&APPID=${api_key}")
    fi

    temperature_value="$(printf "%s" "${current_weather_data}" | jq -r '.main.temp')"
    temperature_value="$(printf "%.0f" "${temperature_value}")"

    wind_value="$(printf "%s" "${current_weather_data}" | jq -r '.wind.speed')"

    wind_direction="$(printf "%s" "${current_weather_data}" | jq -r '.wind.deg')"
    wind_direction="$(get-wind-direction "${wind_direction}")"

    weather_condition="$(printf "%s" "${current_weather_data}" | jq -r '.weather[0].description')"

    weather_condition_icon="$(printf "%s" "${current_weather_data}" | jq -r '.weather[0].icon')"

    # day1 name
    day1[0]="$(get_day_of_week "$(date --date="1 day" +%w)")"

    local _day1_date="$(date --date="1 day" +%Y-%m-%d)"

    # day1 weather condition
    day1[1]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day1_date} 12:00:00\") | .weather[0].description")"

    # day1 min temperature
    day1[2]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day1_date} 06:00:00\") | .main.temp_min")"
    day1[2]="$(printf "%.0f" "${day1[2]}")"

    # day1 max temperature
    day1[3]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day1_date} 12:00:00\") | .main.temp_max")"
    day1[3]="$(printf "%.0f" "${day1[3]}")"

    # day2 name
    day2[0]="$(get_day_of_week "$(date --date="2 days" +%w)")"

    local _day2_date="$(date --date="2 days" +%Y-%m-%d)"

    # day2 weather condition
    day2[1]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day2_date} 12:00:00\") | .weather[0].description")"

    # day2 min temperature
    day2[2]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day2_date} 06:00:00\") | .main.temp_min")"
    day2[2]="$(printf "%.0f" "${day2[2]}")"

    # day2 max temperature
    day2[3]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day2_date} 12:00:00\") | .main.temp_max")"
    day2[3]="$(printf "%.0f" "${day2[3]}")"

    # day3 name
    day3[0]="$(get_day_of_week "$(date --date="3 days" +%w)")"

    local _day3_date="$(date --date="3 days" +%Y-%m-%d)"

    # day3 weather condition
    day3[1]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day3_date} 12:00:00\") | .weather[0].description")"

    # day3 min temperature
    day3[2]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day3_date} 06:00:00\") | .main.temp_min")"
    day3[2]="$(printf "%.0f" "${day3[2]}")"

    # day3 max temperature
    day3[3]="$(printf "%s" "${weather_forecast_data}" | \
        jq -r ".list[] | select(.dt_txt==\"${_day3_date} 12:00:00\") | .main.temp_max")"
    day3[3]="$(printf "%.0f" "${day3[3]}")"
}
