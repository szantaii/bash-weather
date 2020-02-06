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

print_location()
{
    local location="${city_name^^}, ${country_name^^} "

    tput cup $((top_padding + 2)) $((left_padding + 1)) >> ${buffer}

    printf "%s${location}" >> ${buffer}

    # tput cup $((top_padding + 3)) $((left_padding + 1)) >> ${buffer}

    for ((i=0; i < (35 - ${#location}); i++))
    do
        printf "%s_" >> ${buffer}
    done
}
