#!/bin/bash

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
