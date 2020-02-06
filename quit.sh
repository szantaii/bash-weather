#!/bin/bash

quit()
{
    # Delete screen buffer file
    rm ${buffer}

    # Restore cursor
    tput cnorm

    # Restore terminal screen
    tput rmcup

    # Exit with status '0'
    exit 0
}
