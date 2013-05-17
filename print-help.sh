#!/bin/bash

print_help()
{
	local help_text="Change unit: 'c', Quit: 'q'"
	
	tput cup $((top_padding + min_term_height - 1)) \
		$((left_padding + min_term_width - ${#help_text})) >> ${buffer}
	
	printf "%s${help_text}" >> ${buffer}
}

