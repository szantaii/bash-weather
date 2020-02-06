#!/bin/bash

print_title()
{
    local _title_text="bash-weather"

    {
        tput cup "${top_padding}" $((left_padding + ((min_term_width - ${#_title_text}) / 2)))

        printf "%s" "${_title_text}"
    } >> "${buffer}"
}
