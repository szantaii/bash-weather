#!/bin/bash

get_day_of_week()
{
	case $1 in
		0)
			printf "Sun"
			;;
		1)
			printf "Mon"
			;;
		2)
			printf "Tue"
			;;
		3)
			printf "Wed"
			;;
		4)
			printf "Thu"
			;;
		5)
			printf "Fri"
			;;
		6)
			printf "Sat"
			;;
	esac
}

