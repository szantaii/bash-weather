#!/bin/bash

print__location()
{
    local _location="${city_name^^}, ${country_name^^} "

    {
        tput cup $((top_padding + 2)) $((left_padding + 1))

        printf "%s" "${_location}"
    } >> "${buffer}"

    for ((i=0; i < (35 - ${#_location}); i++))
    do
        printf "%s" "_" >> "${buffer}"
    done
}
