#!/bin/bash

# Function that prints the buffer onto
# the screen then empties the buffer
refresh_screen()
{
	tput cup ${term_height} ${term_width} >> ${buffer}
	
	cat "${buffer}"
	
	printf "" > ${buffer}
}

