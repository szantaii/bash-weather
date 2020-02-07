#!/bin/bash

print_current_temperature()
{
    local _temperature_text=()

    for ((i=0; i < ${#temperature_value}; i++))
    do
        case ${temperature_value:$i:1} in
            "-")
                for ((j=0; j < ${#ascii_font_min[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_min[${j}]}"
                done
                ;;
            0)
                for ((j=0; j < ${#ascii_font_0[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_0[${j}]}"
                done
                ;;
            1)
                for ((j=0; j < ${#ascii_font_1[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_1[${j}]}"
                done
                ;;
            2)
                for ((j=0; j < ${#ascii_font_2[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_2[${j}]}"
                done
                ;;
            3)
                for ((j=0; j < ${#ascii_font_3[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_3[${j}]}"
                done
                ;;
            4)
                for ((j=0; j < ${#ascii_font_4[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_4[${j}]}"
                done
                ;;
            5)
                for ((j=0; j < ${#ascii_font_5[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_5[${j}]}"
                done
                ;;
            6)
                for ((j=0; j < ${#ascii_font_6[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_6[${j}]}"
                done
                ;;
            7)
                for ((j=0; j < ${#ascii_font_7[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_7[${j}]}"
                done
                ;;
            8)
                for ((j=0; j < ${#ascii_font_8[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_8[${j}]}"
                done
                ;;
            9)
                for ((j=0; j < ${#ascii_font_9[@]}; j++))
                do
                    _temperature_text[${j}]="${_temperature_text[${j}]}${ascii_font_9[${j}]}"
                done
                ;;
        esac
    done

    for ((i=0; i < ${#ascii_font_o[@]}; i++))
    do
        _temperature_text[${i}]="${_temperature_text[${i}]}${ascii_font_o[${i}]}"
    done

    if [[ "${unit_type}" == "metric" ]]
    then
        for ((i=0; i < ${#ascii_font_C[@]}; i++))
        do
            _temperature_text[${i}]="${_temperature_text[${i}]}${ascii_font_C[${i}]}"
        done
    else
        for ((i=0; i < ${#ascii_font_F[@]}; i++))
        do
            _temperature_text[${i}]="${_temperature_text[${i}]}${ascii_font_F[${i}]}"
        done
    fi

    if ${colored_output}
    then
        if [[ "${unit_type}" == "metric" ]]
        then
            if ((temperature_value >= 30))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((temperature_value < 30 && temperature_value > 0))
            then
                printf "%s" "${foreground_color_green}" >> "${buffer}"
            else
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        else
            if ((temperature_value >= 86))
            then
                printf "%s" "${foreground_color_red}" >> "${buffer}"
            elif ((temperature_value < 86 && temperature_value > 32))
            then
                printf "%s" "${foreground_color_green}" >> "${buffer}"
            else
                printf "%s" "${foreground_color_blue}" >> "${buffer}"
            fi
        fi
    fi

    for ((i=0; i < ${#_temperature_text[@]}; i++))
    do
        {
            tput cup $((3 + top_padding + i)) $((1 + left_padding))

            printf "%s" "${_temperature_text[${i}]}"
        } >> "${buffer}"
    done

    if ${colored_output}
    then
        printf "%s" "${foreground_color_white}" >> "${buffer}"
    fi
}
