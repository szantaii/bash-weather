#!/bin/bash

print_wind()
{
    if [[ "${unit_type}" == "metric" ]]
    then
        wind_value="$(echo "scale=1; ${wind_value} * 3.6" | bc)"
    fi

    echo "${wind_value} "| grep -o [\.] > /dev/null 2>&1

    if (($? == 0))
    then
        wind_value="$(echo "${wind_value}" | grep -o -i [0-9]\..)"

        echo "${wind_value:-2}" | grep \.0 > /dev/null 2>&1

        if (($? == 0))
        then
            wind_value="${wind_value%%??}"
        fi

        if [ "${wind_value: -1}" == "." ]
        then
            wind_value="${wind_value::-1}"
        fi
    fi

    {
        tput cup $((top_padding + 10)) $((left_padding + 1))

        printf "%s" "wind: ${wind_value} ${wind_unit}, ${wind_direction}"
    } >> "${buffer}"
}
