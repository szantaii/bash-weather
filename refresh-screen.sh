#!/bin/bash

# Function that prints the buffer onto
# the screen then empties the buffer
refresh_screen()
{
	cat "${buffer}"
	printf "" > ${buffer}
}

