#!/bin/bash

print_init_message()
{
    local _message_text="Initializing bash-weather..."

    {
    tput cup "${top_padding}" "${left_padding}"

    printf "%s" "${_message_text}"
    } >> ${buffer}
}

print_refresh_message()
{
    local _message_text="Refreshing..."

    {
        tput cup $((top_padding + min_term_height - 1)) \
            $((left_padding + min_term_width - ${#_message_text}))

        printf "%s${_message_text}"
    } >> "${buffer}"
}
