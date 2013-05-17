#!/bin/bash

read_input()
{
	local input
	
	read -sn1 -t 57 input
	
	case ${input} in
		'q')
			break
			;;
		'c')
			change_unit_type
			;;
	esac
}

