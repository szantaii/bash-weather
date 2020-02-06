#!/bin/bash

change_unit_type()
{
    if [[ "${unit_type}" == "metric" ]]
    then
        unit_type="imperial"
        printf "${unit_type}" > "${script_directory}/unit_type"
        temperature_unit="F"
        wind_unit="mph"

    else
        unit_type="metric"
        printf "${unit_type}" > "${script_directory}/unit_type"
        temperature_unit="C"
        wind_unit="km/h"
    fi
}
