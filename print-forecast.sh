#!/bin/bash

print_forecast()
{
    local _forecast_title="3 Day Forecast ____________________"
    local _forecast_days="    ${day1[0]}         ${day2[0]}         ${day3[0]}"
    local _forecast_line="___________ ___________ ___________"
    local _forecast_weather_condition=()
    local _day1_min_temperature="${day1[2]} ${temperature_unit}"
    local _day1_max_temperature="${day1[3]} ${temperature_unit}"
    local _day2_min_temperature="${day2[2]} ${temperature_unit}"
    local _day2_max_temperature="${day2[3]} ${temperature_unit}"
    local _day3_min_temperature="${day3[2]} ${temperature_unit}"
    local _day3_max_temperature="${day3[3]} ${temperature_unit}"

    _forecast_weather_condition[0]="${day1[1],,}"
    _forecast_weather_condition[1]="${day2[1],,}"
    _forecast_weather_condition[2]="${day3[1],,}"

    {
        tput cup $((top_padding + 12)) $((left_padding + 1))

        printf "%s" "${_forecast_title}"

        tput cup $((top_padding + 14)) $((left_padding + 1))

        printf "%s" "${_forecast_days}"

        tput cup $((top_padding + 15)) $((left_padding + 1))

        printf "%s" "${_forecast_line}"

        tput cup $((top_padding + 19)) $((left_padding + 1))

        printf "min:"

        tput cup $((top_padding + 20)) $((left_padding + 1))

        printf "max:"
    } >> "${buffer}"

    for ((i=0; i < ${#_forecast_weather_condition[@]}; i++))
    do
        case "${_forecast_weather_condition[${i}]}" in
            "sky is clear")
                _forecast_weather_condition[${i}]="Clear Sky"
                ;;
            "few clouds"|"scattered clouds"|"broken clouds")
                _forecast_weather_condition[${i}]="Few Clouds"
                ;;
            "overcast clouds")
                _forecast_weather_condition[${i}]="Cloudy"
                ;;
            "shower rain"|"rain"|"light intensity drizzle"|"drizzle"|"heavy intensity drizzle"|"light intensity drizzle rain"|"drizzle rain"|"heavy intensity drizzle rain"|"shower drizzle"|"light rain"|"moderate rain"|"heavy intensity rain"|"very heavy rain"|"extreme rain"|"freezing rain"|"light intensity shower rain"|"heavy intensity shower rain")
                _forecast_weather_condition[${i}]="Rain"
                ;;
            "thunderstorm with light rain"|"thunderstorm with rain"|"thunderstorm with heavy rain"|"light thunderstorm"|"thunderstorm"|"heavy thunderstorm"|"ragged thunderstorm"|"thunderstorm with light drizzle"|"thunderstorm with drizzle"|"thunderstorm with heavy drizzle")
                _forecast_weather_condition[${i}]="Storm"
                ;;
            "light snow"|"snow"|"heavy snow"|"sleet"|"shower snow")
                _forecast_weather_condition[${i}]="Snow"
                ;;
            "mist"|"smoke"|"haze"|"sand/dust whirls"|"fog")
                _forecast_weather_condition[${i}]="Mist"
                ;;
            *)
                _forecast_weather_condition[${i}]="N/A"
                ;;
        esac
    done

    {
        tput cup $((top_padding + 17)) $((left_padding + 2))

        printf "%s" "${_forecast_weather_condition[0]}"

        tput cup $((top_padding + 17)) $((left_padding + 14))

        printf "%s" "${_forecast_weather_condition[1]}"

        tput cup $((top_padding + 17)) $((left_padding + 26))

        printf "%s" "${_forecast_weather_condition[2]}"

        tput cup $((top_padding + 19)) $((left_padding + 11 - ${#_day1_min_temperature}))
    } >> "${buffer}"

    if ${colored_output}
    then
        if [[ "${unit_type}" == "metric" ]]
        then
            if ((day1[2] >= 30))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day1[2] <= 0))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        else
            if ((day1[2] >= 86))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day1[2] <= 32))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        fi
    fi

    printf "%s" "${_day1_min_temperature}" >> "${buffer}"

    if ${colored_output}
    then
        printf "%s" "${foreground_color_white}" >> "${buffer}"
    fi

    tput cup $((top_padding + 20)) \
        $((left_padding + 11 - ${#_day1_max_temperature})) \
        >> "${buffer}"

    if ${colored_output}
    then
        if [[ "${unit_type}" == "metric" ]]
        then
            if ((day1[3] >= 30))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day1[3] <= 0))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        else
            if ((day1[3] >= 86))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day1[3] <= 32))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        fi
    fi

    printf "%s" "${_day1_max_temperature}" >> "${buffer}"

    if ${colored_output}
    then
        printf "%s" "${foreground_color_white}" >> "${buffer}"
    fi

    tput cup $((top_padding + 19)) \
        $((left_padding + 23 - ${#_day2_min_temperature})) \
        >> "${buffer}"

    if ${colored_output}
    then
        if [[ "${unit_type}" == "metric" ]]
        then
            if ((day2[2] >= 30))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day2[2] <= 0))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        else
            if ((day2[2] >= 86))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day2[2] <= 32))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        fi
    fi

    printf "%s" "${_day2_min_temperature}" >> "${buffer}"

    if ${colored_output}
    then
        printf "%s" "${foreground_color_white}" >> "${buffer}"
    fi

    tput cup $((top_padding + 20)) \
        $((left_padding + 23 - ${#_day2_max_temperature})) \
        >> "${buffer}"

    if ${colored_output}
    then
        if [[ "${unit_type}" == "metric" ]]
        then
            if ((day2[3] >= 30))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day2[3] <= 0))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        else
            if ((day2[3] >= 86))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day2[3] <= 32))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        fi
    fi

    printf "%s" "${_day2_max_temperature}" >> "${buffer}"

    if ${colored_output}
    then
        printf "%s" "${foreground_color_white}" >> "${buffer}"
    fi

    tput cup $((top_padding + 19)) \
        $((left_padding + 35 - ${#_day3_min_temperature})) \
        >> "${buffer}"

    if ${colored_output}
    then
        if [[ "${unit_type}" == "metric" ]]
        then
            if ((day3[2] >= 30))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day3[2] <= 0))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        else
            if ((day3[2] >= 86))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day3[2] <= 32))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        fi
    fi

    printf "%s" "${_day3_min_temperature}" >> "${buffer}"

    if ${colored_output}
    then
        printf "%s" "${foreground_color_white}" >> "${buffer}"
    fi

    tput cup $((top_padding + 20)) \
        $((left_padding + 35 - ${#_day3_max_temperature})) \
        >> "${buffer}"

    if ${colored_output}
    then
        if [[ "${unit_type}" == "metric" ]]
        then
            if ((day3[3] >= 30))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day3[3] <= 0))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        else
            if ((day3[3] >= 86))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((day3[3] <= 32))
            then
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        fi
    fi

    printf "%s" "${_day3_max_temperature}" >> "${buffer}"

    if ${colored_output}
    then
        printf "%s" "${foreground_color_white}" >> "${buffer}"
    fi
}
