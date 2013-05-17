#!/bin/bash

# Save terminal screen
tput smcup

term_width=$(tput cols)
term_height=$(tput lines)

min_term_width=80
min_term_height=22

buffer_name=""
buffer_directory=""
buffer=""

left_padding=""
top_padding=""

current_ip=""

geolocation_data=""
country_code=""
country_name=""
city_name=""

current_weather_data=""
unit_type=""
temperature_value=""
temperature_unit=""
wind_value=""
wind_unit=""
wind_direction=""
weather_condition=""
weather_condition_icon=""
weather_forecast_data=""

declare -a day1
declare -a day2
declare -a day3

declare -a ascii_icon_clear_sky_day
declare -a ascii_icon_clear_sky_night
declare -a ascii_icon_few_clouds_day
declare -a ascii_icon_few_clouds_night
declare -a ascii_icon_cloudy
declare -a ascii_icon_rain
declare -a ascii_icon_clear_rainy_day
declare -a ascii_icon_clear_rainy_night
declare -a ascii_icon_thunderstorm
declare -a ascii_icon_snow
declare -a ascii_icon_mist

script_directory=$(dirname "$0")

# source "${script_directory}/check-prerequisites.sh"
source "${script_directory}/init.sh"
source "${script_directory}/get-ip.sh"
source "${script_directory}/get-geolocation-data.sh"
source "${script_directory}/get-weather-data.sh"
source "${script_directory}/print-ascii-icon.sh"
source "${script_directory}/main-loop.sh"
source "${script_directory}/quit.sh"

# check_prerequisites

main_loop

