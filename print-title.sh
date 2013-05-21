#!/bin/bash

print_title()
{
	local title_text="bash-weather"
	
	tput cup ${top_padding} \
		$((left_padding + ((min_term_width - ${#title_text}) / 2))) \
		>> ${buffer}
	
	printf ${title_text} >> ${buffer}
}

