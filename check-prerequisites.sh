#!/bin/bash

check_prerequisites()
{
    if [ ! -f "${script_directory}/unit_type" ]
    then
        printf "metric" > "${script_directory}/unit_type"
    fi

    # Check if 'tput' command is available
    which tput > /dev/null

    # If 'tput' is not available, then print
    # error message and exit with status code '1'
    if (($? != 0))
    then
        # Restore cursor
        tput cnorm

        # Restore terminal screen
        tput rmcup

        printf "Your system is missing the program 'tput' which is necessary \
for bash-weather\nto run. 'tput' can be found in the following packages on \
the following distributions:\n    Distribution        Package name\n\
    ---------------------------------\n    Arch Linux          ncurses\n    \
Debian              ncurses-bin\n    Fedora              ncurses\n    \
openSUSE            ncurses-utils\n    Ubuntu              ncurses-bin\n"

        exit 1
    fi

    # Check if 'curl' command is available
    which curl > /dev/null

    # If 'curl' is not available, then print
    # error message and exit with status code '1'
    if (($? != 0))
    then
        # Restore cursor
        tput cnorm

        # Restore terminal screen
        tput rmcup

        printf "Your system is missing the program 'curl' which is necessary \
for bash-weather\nto run. 'curl' can be found in the 'curl' package on most \
Linux distributions.\n"

        exit 1
    fi

    # Check if 'grep' command is available
    which grep > /dev/null

    # If 'grep' is not available, then print
    # error message and exit with status code '1'
    if (($? != 0))
    then
        # Restore cursor
        tput cnorm

        # Restore terminal screen
        tput rmcup

        printf "Your system is missing the program 'grep' which is necessary \
for bash-weather\nto run. 'grep' can be found in the 'grep' package on most \
Linux distributions.\n"

        exit 1
    fi

    # Check if 'bc' command is available
    which bc > /dev/null

    # If 'bc' is not available, then print
    # error message and exit with status code '1'
    if (($? != 0))
    then
        # Restore cursor
        tput cnorm

        # Restore terminal screen
        tput rmcup

        printf "Your system is missing the program 'bc' which is necessary \
for bash-weather\nto run. 'bc' can be found in the 'bc' package on most Linux \
distributions.\n"

        exit 1
    fi

    # Check if terminal has at least $min_term_width columns and
    # $min_term_height lines
    #
    # If either terminal width or height is less than
    # $min_term_width and $min_term_height print error message
    # and exit with status code '2'
    if ((term_width < min_term_width || term_height < min_term_height))
    then
        # Restore cursor
        tput cnorm

        # Restore terminal screen
        tput rmcup

        printf "bash-weather needs a terminal with size of at least \
${min_term_width}x${min_term_height} (${min_term_width} columns, \
${min_term_height} lines).\n"

        exit 2
    fi

    # Check if OpenWeatherMap API key is specified in the command-line
    # or in the openweathermap.key file
    #
    # If no API key is specified then exit with status code '3'
    if [[ "${api_key}" == "" ]] && (($(grep -c "^[0-9A-Za-z]\+$" \
"${script_directory}/openweathermap.key") != 1))
    then
        # Restore cursor
        tput cnorm

        # Restore terminal screen
        tput rmcup

        printf "bash-weather needs an API key to be able to get weather data \
from OpenWeatherMap. \
See 'README.md' for further details about the OpenWeatherMap API key.\n"

        exit 3
    fi
}
