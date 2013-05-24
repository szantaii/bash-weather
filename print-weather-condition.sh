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

print_weather_condition()
{
	weather_condition="${weather_condition,,}"
	
	if [[ "${weather_condition}" == "sky is clear" ]]
	then
		weather_condition="clear sky"
	fi
	
	weather_condition="${weather_condition^^}"
	
	tput cup $((top_padding + 19)) \
		$((left_padding + 38 + \
		((min_term_width - 38 - ${#weather_condition}) / 2))) \
		>> ${buffer}
	
	printf "${weather_condition}" >> ${buffer}
}

