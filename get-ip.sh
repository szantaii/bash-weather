#!/bin/bash

get_ip()
{
	current_ip=$(curl -s "http://checkip.dyndns.org/" | grep -o -E "[0-9\.]+")
}

