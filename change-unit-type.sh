#!/bin/bash

change_unit_type()
{
	if [[ "${unit_type}" == "metric" ]]
	then
		unit_type="imperial"
		printf "${unit_type}" > "${script_directory}/unit_type"
		
	else
		unit_type="metric"
		printf "${unit_type}" > "${script_directory}/unit_type"
	fi
}

