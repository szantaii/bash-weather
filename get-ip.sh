#!/bin/bash

get_ip()
{
    current_ip="$(ip -o route get 8.8.8.8 | sed -n 's/.*src \([0-9\.]\+\) uid.*/\1/p')"
}
