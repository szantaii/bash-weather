#!/bin/bash

main_loop()
{
	init
	
	get_ip
	get_geolocation_data
	get_weather_data
	
	print_ascii_icon
	
	refresh_screen
	
#	echo ${temperature_value} ${temperature_unit}
#	echo ${wind_value} ${wind_unit} ${wind_direction}
#	echo ${weather_condition}
#	
#	for ((i=0; i < 4; i++))
#	do
#		echo ${day1[${i}]}
#		echo ${day2[${i}]}
#		echo ${day3[${i}]}
#	done
	
	read -sn1
	
	quit
}
