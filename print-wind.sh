#!/bin/bash

print_wind()
{
    local conversion_unit="3.6"

    if [[ "${unit_type}" == "metric" ]]
    then
        wind_value=$(echo "scale=1; ${wind_value} * ${conversion_unit}" | bc)
    fi

    echo ${wind_value} | grep -o [\.] > /dev/null

    if (($? == 0))
    then
        wind_value=$(echo ${wind_value} | grep -o -i [0-9]\..)

        echo ${wind_value:-2} | grep \.0 > /dev/null

        if (($? == 0))
        then
            wind_value=${wind_value%%??}
        fi

        if [ "${wind_value: -1}" == "." ]
        then
            wind_value="${wind_value::-1}"
        fi
    fi

    tput cup $((top_padding + 10)) $((left_padding + 1)) >> ${buffer}

    printf "wind: ${wind_value} ${wind_unit}, ${wind_direction}" >> ${buffer}
}
