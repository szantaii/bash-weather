#!/bin/bash

# Create a 'screen buffer' file
create_buffer()
{
    local _buffer_name="bashweather-buffer"

    # Try to use /dev/shm if available else use /tmp as the location of the
    # screen buffer file
    if [ -d "/dev/shm" ]
    then
        local _buffer_directory="/dev/shm"
    else
        local _buffer_directory="/tmp"
    fi

    # Try to use mktemp before using the unsafe method
    if command -v mktemp
    then
        # If 'mktemp' is available for use, then create the buffer file using it
        buffer=$(mktemp --tmpdir=${_buffer_directory} ${_buffer_name}-XXXXXXXXXX)
    else
        # If 'mktemp' was not available for use, then create the buffer file
        # using $RANDOM
        #
        # Note this is an unsafe method to create the screen buffer file!
        # TODO: check if buffer file already exists, if unsafe method is used
        buffer="${_buffer_directory}/${_buffer_name}-${RANDOM}"

        # Create the buffer file
        printf "" > "${buffer}"
    fi
}
