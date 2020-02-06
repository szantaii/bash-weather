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

print_ascii_icon()
{
    case ${weather_condition_icon} in
        01d)
            for ((i=0; i < ${#ascii_icon_clear_sky_day[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_clear_sky_day[${i}]}" >> ${buffer}
            done
            ;;
        01n)
            for ((i=0; i < ${#ascii_icon_clear_sky_night[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_clear_sky_night[${i}]}" >> ${buffer}
            done
            ;;
        02d)
            for ((i=0; i < ${#ascii_icon_few_clouds_day[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_few_clouds_day[${i}]}" >> ${buffer}
            done
            ;;
        02n)
            for ((i=0; i < ${#ascii_icon_few_clouds_night[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_few_clouds_night[${i}]}" >> ${buffer}
            done
            ;;
        03*|04*)
            for ((i=0; i < ${#ascii_icon_cloudy[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_cloudy[${i}]}" >> ${buffer}
            done
            ;;
        09*)
            for ((i=0; i < ${#ascii_icon_rain[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_rain[${i}]}" >> ${buffer}
            done
            ;;
        10d)
            for ((i=0; i < ${#ascii_icon_clear_rainy_day[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_clear_rainy_day[${i}]}" >> ${buffer}
            done
            ;;
        10n)
            for ((i=0; i < ${#ascii_icon_clear_rainy_night[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_clear_rainy_night[${i}]}" >> ${buffer}
            done
            ;;
        11*)
            for ((i=0; i < ${#ascii_icon_thunderstorm[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_thunderstorm[${i}]}" >> ${buffer}
            done
            ;;
        13*)
            for ((i=0; i < ${#ascii_icon_snow[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_snow[${i}]}" >> ${buffer}
            done
            ;;
        50*)
            for ((i=0; i < ${#ascii_icon_mist[@]}; i++))
            do
                tput cup $((2 + top_padding + ${i})) \
                    $((38 + left_padding)) >> ${buffer}

                printf "%s${ascii_icon_mist[${i}]}" >> ${buffer}
            done
            ;;
    esac
}
