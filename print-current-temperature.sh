#!/bin/bash

print_current_temperature()
{
	local temperature_text=()
	
	for ((i=0; i < ${#temperature_value}; i++))
	do
		case ${temperature_value:$i:1} in
			"-")
				for ((j=0; j < ${#ascii_font_min[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_min[${j}]}"
				done
				;;
			0)
				for ((j=0; j < ${#ascii_font_0[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_0[${j}]}"
				done
				;;
			1)
				for ((j=0; j < ${#ascii_font_1[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_1[${j}]}"
				done
				;;
			2)
				for ((j=0; j < ${#ascii_font_2[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_2[${j}]}"
				done
				;;
			3)
				for ((j=0; j < ${#ascii_font_3[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_3[${j}]}"
				done
				;;
			4)
				for ((j=0; j < ${#ascii_font_4[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_4[${j}]}"
				done
				;;
			5)
				for ((j=0; j < ${#ascii_font_5[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_5[${j}]}"
				done
				;;
			6)
				for ((j=0; j < ${#ascii_font_6[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_6[${j}]}"
				done
				;;
			7)
				for ((j=0; j < ${#ascii_font_7[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_7[${j}]}"
				done
				;;
			8)
				for ((j=0; j < ${#ascii_font_8[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_8[${j}]}"
				done
				;;
			9)
				for ((j=0; j < ${#ascii_font_9[@]}; j++))
				do
					temperature_text[${j}]="${temperature_text[${j}]}${ascii_font_9[${j}]}"
				done
				;;
		esac
	done
	
	for ((i=0; i < ${#ascii_font_o[@]}; i++))
	do
		temperature_text[${i}]="${temperature_text[${i}]}${ascii_font_o[${i}]}"
	done
	
	if [[ "${unit_type}" == "metric" ]]
	then
		for ((i=0; i < ${#ascii_font_C[@]}; i++))
		do
			temperature_text[${i}]="${temperature_text[${i}]}${ascii_font_C[${i}]}"
		done
	else
		for ((i=0; i < ${#ascii_font_F[@]}; i++))
		do
			temperature_text[${i}]="${temperature_text[${i}]}${ascii_font_F[${i}]}"
		done
	fi
	
	for ((i=0; i < ${#temperature_text[@]}; i++))
	do
		tput cup $((3 + top_padding + ${i})) \
			$((1 + left_padding)) >> ${buffer}
		
		printf "%s${temperature_text[${i}]}" >> ${buffer}
	done
}

