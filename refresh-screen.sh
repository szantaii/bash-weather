#!/bin/bash

# Print the buffer onto the screen then clear it
refresh_screen()
{
    tput cup "${term_height}" "${term_width}" >> "${buffer}"

    cat "${buffer}"

    printf "" > "${buffer}"
}
