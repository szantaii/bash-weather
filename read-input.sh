#!/bin/bash

read__input()
{
    local _input
    local _timeout=0

    read -sn1 -t 57 _input

    if (($? > 128))
    then
        _timeout=1
    fi

    while ((_timeout != 1)) && [[ "${_input}" != "q" && "${_input}" != "c" ]]
    do
        read -sn1 -t 57 _input

        if (($? > 128))
        then
            _timeout=1
        fi
    done

    if ((_timeout == 1))
    then
        clear_help
        print_refresh_message
        refresh_screen
    else
        case ${_input} in
        'q')
            break
            ;;
        'c')
            clear_help
            print_refresh_message
            refresh_screen
            change_unit_type
            ;;
        esac
    fi
}
