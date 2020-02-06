#!/bin/bash

main_loop()
{
    init

    if ! manual_setting
    then
        get_ip
        get_geolocation_data
    fi

    while true
    do
        get_weather_data

        clear >> "${buffer}"

        print_title
        print_location
        print_current_temperature
        print_wind
        print_ascii_icon
        print_weather_condition
        print_forecast
        print_help

        refresh_screen

        read_input
    done

    quit
}
