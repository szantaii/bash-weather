# bash-weather

***

## Contents
 1. About
 2. License
 3. Prerequisites
 4. Exit status
 5. How to use
  * Get bash-weather
  * Start bash-weather
 6. Further development

***

## 1. About

Weather report written in Bash.

bash-weather gets the computer's public IP address through [DynDNS](http://checkip.dyndns.org/) and uses geolocation ([http://freegeoip.net/](http://freegeoip.net/)) to acquire its current location which is used to get weather condition and forecast from [OpenWeatherMap](http://openweathermap.org/).

## 2. License

This project is licensed under GNU General Public License Version 3+. For the full license, see `LICENSE`.

## 3. Prerequisites

 * Bash shell ≥ 4.2.
 * A terminal with a size of at least 80×22 (80 columns, 22 rows).
 * `bc` basic calculator for floating point arithmetic. Can be found in the `bc` package on major Linux distributions.
 * `curl` command-line tool for getting data using HTTP protocol. cURL can be found in the `curl` package on major Linux distributions.
 * `tput` for terminal handling. Can be found in different `ncurses` packages on Linux distributions (see the table below for major distros).

| Distrbution | Package name    |
| ----------- | --------------- |
| Arch Linux  | `ncurses`       |
| Debian      | `ncurses-bin`   |
| Fedora      | `ncurses`       |
| openSUSE    | `ncurses-utils` |
| Ubuntu      | `ncurses-bin`   |

## 4. Exit status

 * `0` bash-weather exited successfully.
 * `1` Missing necessary programs to run bash-weather.
 * `2` Too small terminal size (< 80×22).

## 5. How to use

### Get bash-weather

First you have to acquire bash-weather:

```bash
git clone https://github.com/szantaii/bash-weather.git
```

Enter bash-weather's directory:

```bash
cd bash-weather
```
### Start bash-weather

Use the Bash interpreter to start the script:

```bash
bash bash-weather.sh
```

`TODO:` Keyboard commands' description

```text
                                  bash-weather                                  
                                                                                
 BUDAPEST, HUNGARY _________________                     oo                     
  ___   __  _   _____                       .            **            .        
 |__ \ /_ |(_) / ____|                       *'.         **         .'*         
    ) | | |   | |                             '*o.       **       .o*'          
   / /  | |   | |                               '*'     .''.     '*'            
  / /_  | |   | |____                               .'********'.                
 |____| |_|    \_____|                             o************o               
                                                  o**************'              
 wind: 27.7 km/h, SW                     'oooooo' **************** 'oooooo'     
                                                  '**************'              
 3 Day Forecast ____________________               '************'               
                                                     ,o******o,                 
     Wed         Thu         Fri               .o*'      **      '*o.           
 ___________ ___________ ___________         ,o*'        **        '*o,         
                                           ,o            **            o,       
  Clear Sky   Cloudy      Clear Sky                      oo                     
                                                                                
 min:  13 C        14 C        11 C                   CLEAR SKY                 
 max:  20 C        17 C        18 C                                             
                                                     Change unit: 'c', Quit: 'q'
```

## 6. Further development

 * Add licensing information to each file.
 * Add code comments.

