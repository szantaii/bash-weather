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

print_forecast()
{
	local forecast_title="3 Day Forecast ____________________"
	local forecast_days="    ${day1[0]}         ${day2[0]}         ${day3[0]}"
	local forecast_line="___________ ___________ ___________"
	# local forecast_weather_condition=("${day1[1],,}", "${day2[1],,}", "${day3[1],,}")
	local forecast_weather_condition=()
	local day1_min_temperature="${day1[2]} ${temperature_unit}"
	local day1_max_temperature="${day1[3]} ${temperature_unit}"
	local day2_min_temperature="${day2[2]} ${temperature_unit}"
	local day2_max_temperature="${day2[3]} ${temperature_unit}"
	local day3_min_temperature="${day3[2]} ${temperature_unit}"
	local day3_max_temperature="${day3[3]} ${temperature_unit}"
	
	forecast_weather_condition[0]="${day1[1],,}"
	forecast_weather_condition[1]="${day2[1],,}"
	forecast_weather_condition[2]="${day3[1],,}"
	
	tput cup $((top_padding + 12)) $((left_padding + 1)) >> ${buffer}
	
	printf "%s${forecast_title}" >> ${buffer}
	
	tput cup $((top_padding + 14)) $((left_padding + 1)) >> ${buffer}
	
	printf "%s${forecast_days}" >> ${buffer}
	
	tput cup $((top_padding + 15)) $((left_padding + 1)) >> ${buffer}
	
	printf "%s${forecast_line}" >> ${buffer}
	
	tput cup $((top_padding + 19)) $((left_padding + 1)) >> ${buffer}
	
	printf "min:" >> ${buffer}
	
	tput cup $((top_padding + 20)) $((left_padding + 1)) >> ${buffer}
	
	printf "max:" >> ${buffer}
	
	for ((i=0; i < ${#forecast_weather_condition[@]}; i++))
	do
		case "${forecast_weather_condition[${i}]}" in
			"sky is clear")
				forecast_weather_condition[${i}]="Clear Sky"
				;;
			"few clouds"|"scattered clouds"|"broken clouds")
				forecast_weather_condition[${i}]="Few Clouds"
				;;
			"overcast clouds")
				forecast_weather_condition[${i}]="Cloudy"
				;;
			"shower rain"|"rain"|"light intensity drizzle"|"drizzle"|"heavy intensity drizzle"|"light intensity drizzle rain"|"drizzle rain"|"heavy intensity drizzle rain"|"shower drizzle"|"light rain"|"moderate rain"|"heavy intensity rain"|"very heavy rain"|"extreme rain"|"freezing rain"|"light intensity shower rain"|"shower rain"|"heavy intensity shower rain")
				forecast_weather_condition[${i}]="Rain"
				;;
			"thunderstorm with light rain"|"thunderstorm with rain"|"thunderstorm with heavy rain"|"light thunderstorm"|"thunderstorm"|"heavy thunderstorm"|"ragged thunderstorm"|"thunderstorm with light drizzle"|"thunderstorm with drizzle"|"thunderstorm with heavy drizzle")
				forecast_weather_condition[${i}]="Storm"
				;;
			"light snow"|"snow"|"heavy snow"|"sleet"|"shower snow")
				forecast_weather_condition[${i}]="Snow"
				;;
			"mist"|"smoke"|"haze"|"sand/dust whirls"|"fog")
				forecast_weather_condition[${i}]="Mist"
				;;
			*)
				forecast_weather_condition[${i}]="N/A"
				;;
		esac
	done
	
	tput cup $((top_padding + 17)) $((left_padding + 2)) >> ${buffer}
	
	printf "${forecast_weather_condition[0]}" >> ${buffer}
	
	tput cup $((top_padding + 17)) $((left_padding + 14)) >> ${buffer}
	
	printf "${forecast_weather_condition[1]}" >> ${buffer}
	
	tput cup $((top_padding + 17)) $((left_padding + 26)) >> ${buffer}
	
	printf "${forecast_weather_condition[2]}" >> ${buffer}
	
	tput cup $((top_padding + 19)) \
		$((left_padding + 11 - ${#day1_min_temperature})) \
		>> ${buffer}
	
	printf "%s${day1_min_temperature}" >> ${buffer}
	
	tput cup $((top_padding + 20)) \
		$((left_padding + 11 - ${#day1_max_temperature})) \
		>> ${buffer}
	
	printf "%s${day1_max_temperature}" >> ${buffer}
	
	tput cup $((top_padding + 19)) \
		$((left_padding + 23 - ${#day2_min_temperature})) \
		>> ${buffer}
	
	printf "%s${day2_min_temperature}" >> ${buffer}
	
	tput cup $((top_padding + 20)) \
		$((left_padding + 23 - ${#day2_max_temperature})) \
		>> ${buffer}
	
	printf "%s${day2_max_temperature}" >> ${buffer}
	
	tput cup $((top_padding + 19)) \
		$((left_padding + 35 - ${#day3_min_temperature})) \
		>> ${buffer}
	
	printf "%s${day3_min_temperature}" >> ${buffer}
	
	tput cup $((top_padding + 20)) \
		$((left_padding + 35 - ${#day3_max_temperature})) \
		>> ${buffer}
	
	printf "%s${day3_max_temperature}" >> ${buffer}
}
