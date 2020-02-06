#!/bin/bash

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
