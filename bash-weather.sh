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
state_name=""
city_name=""
latitude=""
longitude=""

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

manual_setting=0

declare -a day1
declare -a day2
declare -a day3

declare -a ascii_font_0
declare -a ascii_font_1
declare -a ascii_font_2
declare -a ascii_font_3
declare -a ascii_font_4
declare -a ascii_font_5
declare -a ascii_font_6
declare -a ascii_font_7
declare -a ascii_font_8
declare -a ascii_font_9
declare -a ascii_font_min
declare -a ascii_font_o
declare -a ascii_font_C
declare -a ascii_font_F


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

source "${script_directory}/check-prerequisites.sh"
source "${script_directory}/create-buffer.sh"
source "${script_directory}/print-status-messages.sh"
source "${script_directory}/init.sh"
source "${script_directory}/get-ip.sh"
source "${script_directory}/get-geolocation-data.sh"
source "${script_directory}/get-day-of-week.sh"
source "${script_directory}/get-weather-data.sh"
source "${script_directory}/refresh-screen.sh"
source "${script_directory}/print-title.sh"
source "${script_directory}/print-location.sh"
source "${script_directory}/print-current-temperature.sh"
source "${script_directory}/print-wind.sh"
source "${script_directory}/print-ascii-icon.sh"
source "${script_directory}/print-weather-condition.sh"
source "${script_directory}/print-forecast.sh"
source "${script_directory}/print-help.sh"
source "${script_directory}/clear-help.sh"
source "${script_directory}/change-unit-type.sh"
source "${script_directory}/read-input.sh"
source "${script_directory}/main-loop.sh"
source "${script_directory}/quit.sh"

check_prerequisites

# Parse option flags and their arguments
while getopts ":t:c:h" option
do
	case ${option} in
		h)
			tput rmcup
			printf "bash-weather Copyright (C) Istvan Szantai \
\x3c\x73\x7a\x61\x6e\x74\x61\x69\x69\x40\x73\x69\x64\x65\x6e\x6f\
\x74\x65\x2e\x68\x75\x3e 2013\n\
For more detailed help please see the file 'README.md'.\n"
			exit 0
			;;
		t)
			city_name="${OPTARG}"
			;;
		c)
			country_code=${OPTARG}
			;;
		:)
			tput rmcup
			
			if [[ "${OPTARG}" == "t" ]]
			then
				printf "Missing argument for option: -${OPTARG}. \
Please specity a town or city name.\n"
			elif [[ "${OPTARG}" == "c" ]]
			then
				printf "Missing argument for option: -${OPTARG}. \
Please specify a country code.\n"
			fi
			
			exit 1
			;;
		\?)
			tput rmcup
			printf "Invalid option: -${OPTARG}.\n"
			exit 1
			;;
	esac
done

if [[ "${city_name}" != "" && "${country_code}" != "" ]]
then
	manual_setting=1
	country_name="${country_code}"
fi

main_loop

