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

main_loop()
{
	init
	
	while true
	do
		if ((manual_setting == 0))
		then
			get_ip
			get_geolocation_data
		fi
		get_weather_data
		
		clear >> ${buffer}
		
		print_title
		print_location
		print_current_temperature
		print_wind
		print_ascii_icon
		print_weather_condition
		print_forecast
		print_help
		
		refresh_screen
		
		read_input
	done
	
	quit
}
