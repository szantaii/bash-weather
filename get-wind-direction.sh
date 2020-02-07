#!/bin/bash

get-wind-direction()
{
    local _wind_dir_in_deg="$1"

    if (($(printf "%b" "(348.75 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} <= 360) || \
        (0 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 11.25)\n" | bc -l) == 1))
    then
        printf "N"
    elif (($(printf "%b" "11.25 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 33.75\n" | bc -l) == 1))
    then
        printf "NNE"
    elif (($(printf "%b" "33.75 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 56.25\n" | bc -l) == 1))
    then
        printf "NE"
    elif (($(printf "%b" "56.25 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 78.75\n" | bc -l) == 1))
    then
        printf "ENE"
    elif (($(printf "%b" "78.75 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 101.25\n" | bc -l) == 1))
    then
        printf "E"
    elif (($(printf "%b" "101.25 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 123.75\n" | bc -l) == 1))
    then
        printf "ESE"
    elif (($(printf "%b" "123.75 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 146.25\n" | bc -l) == 1))
    then
        printf "SE"
    elif (($(printf "%b" "146.25 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 168.75\n" | bc -l) == 1))
    then
        printf "SSE"
    elif (($(printf "%b" "168.75 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 191.25\n" | bc -l) == 1))
    then
        printf "S"
    elif (($(printf "%b" "191.25 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 213.75\n" | bc -l) == 1))
    then
        printf "SSW"
    elif (($(printf "%b" "213.75 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 236.25\n" | bc -l) == 1))
    then
        printf "SW"
    elif (($(printf "%b" "236.25 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 258.75\n" | bc -l) == 1))
    then
        printf "WSW"
    elif (($(printf "%b" "258.75 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 281.25\n" | bc -l) == 1))
    then
        printf "W"
    elif (($(printf "%b" "281.25 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 303.75\n" | bc -l) == 1))
    then
        printf "WNW"
    elif (($(printf "%b" "303.75 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 326.25\n" | bc -l) == 1))
    then
        printf "NW"
    elif (($(printf "%b" "326.25 <= ${_wind_dir_in_deg} && ${_wind_dir_in_deg} < 348.75\n" | bc -l) == 1))
    then
        printf "NNW"
    else
        printf "N/A"
    fi
}
