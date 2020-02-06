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

get_geolocation_data()
{
    geolocation_data=$(curl -s http://freegeoip.net/xml/${current_ip})

    country_code=$(echo ${geolocation_data} | \
        grep -o -P -i "(?<=<CountryCode>).*(?=</CountryCode>)")

    country_name=$(echo ${geolocation_data} | \
            grep -o -P -i "(?<=<CountryName>).*(?=</CountryName>)")

    if [[ "${country_code}" == "US" || "${country_code}" == "us" ]]
    then
        country_name="$(echo ${geolocation_data} | \
            grep -o -P -i "(?<=<RegionCode>).*(?=</RegionCode>)"), \
${country_name}"
    fi

    city_name=$(echo ${geolocation_data} | \
        grep -o -P -i "(?<=<City>).*(?=</City>)")

    latitude=$(echo ${geolocation_data} | \
        grep -o -P -i "(?<=<Latitude>).*(?=</Latitude>)")

    longitude=$(echo ${geolocation_data} | \
        grep -o -P -i "(?<=<Longitude>).*(?=</Longitude>)")
}
