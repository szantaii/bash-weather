#!/bin/bash

# bash-weather is a weather report and forecast script written in Bash.
# Copyright (C) 2013 Istvan Szantai <szantaii at sidenote dot hu>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program (LICENSE).
# If not, see <http://www.gnu.org/licenses/>.

# Creates a 'screen buffer' file
create_buffer()
{
	local buffer_name="bashweather-buffer"
	
	# Try to use /dev/shm if available
	# else use /tmp as the location of
	# the screen buffer file
	if [ -d "/dev/shm" ]
	then
		local buffer_directory="/dev/shm"
	else
		local buffer_directory="/tmp"
	fi
	
	# Try to use mktemp before using the unsafe method
	if [ -x $(which mktemp) ]
	then
		# If 'mktemp' is available for use,
		# then create the buffer file using it
		buffer=$(mktemp --tmpdir=${buffer_directory} ${buffer_name}-XXXXXXXXXX)
	else
		# If 'mktemp' was not available for use,
		# then create the buffer file using $RANDOM
		#
		# Note this is an unsafe method to create the
		# screen buffer file!
		# TODO: check if buffer file already exists, if unsafe method is used
		buffer="${buffer_directory}/${buffer_name}-${RANDOM}"
		
		# Create the buffer file
		printf "" > $buffer
	fi
}
