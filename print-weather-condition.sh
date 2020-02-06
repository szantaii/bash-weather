#!/bin/bash

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
