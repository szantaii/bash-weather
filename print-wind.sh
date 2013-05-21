#!/bin/bash

print_wind()
{
	local conversion_unit="3.6"
	
	if [[ "${unit_type}" == "metric" ]]
	then
		wind_value=$(echo "scale=1; ${wind_value} * ${conversion_unit}" | bc -l)
	fi
	
	tput cup $((top_padding + 10)) $((left_padding + 1)) >> ${buffer}
	
	printf "wind: ${wind_value} ${wind_unit}, ${wind_direction}" >> ${buffer}
}

