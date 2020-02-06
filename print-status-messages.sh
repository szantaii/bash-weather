#!/bin/bash

print_init_message()
{
    local message_text="Initializing bash-weather..."

    tput cup ${top_padding} ${left_padding} >> ${buffer}

    printf "%s${message_text}" >> ${buffer}
}

print_refresh_message()
{
    local message_text="Refreshing..."

    tput cup $((top_padding + min_term_height - 1)) \
        $((left_padding + min_term_width - ${#message_text})) >> ${buffer}

    printf "%s${message_text}" >> ${buffer}
}
