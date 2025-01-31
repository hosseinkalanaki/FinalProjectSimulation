#!/bin/bash

# Define ANSI escape codes for colors
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
Magenta='\u001b[35m'
reset='\033[0m' # Reset color

clear
echo -e "${Magenta}********************************************************************************************${reset}"
echo -e "${Magenta}********************************  Start Sensor Simulation  *********************************${reset}"
echo -e "${Magenta}********************************************************************************************${reset}"

echo -e "${blue}-------------Clear Last Version Container-------------${reset}"

for i in {1..10}; do
    echo -e "${green}docker stop sensor-simulation$i;docker rm sensor-simulation$i;${reset}"
    docker stop sensor-simulation$i;docker rm sensor-simulation$i; || (echo -e "${red}We have an error.${reset}" && exit 1)
    sleep 1
done



echo -e "${blue}-------------Clear Last Version Images-------------${reset}"

echo -e "${green}docker rmi sensor-simulation:1.0.1;${reset}"
docker rmi sensor-simulation:1.0.1; || (echo -e "${red}We have an error.${reset}" && exit 1)
sleep 1



echo -e "${blue}-------------Load New Version-------------${reset}"

echo -e "${green}docker image load -i sensor-client2.0.0.tar;${reset}"
docker image load -i sensor-client2.0.0.tar; || (echo -e "${red}We have an error.${reset}" && exit 1)
sleep 1



echo -e "${blue}-------------Run Containers-------------${reset}"

for i in {0..9}; do
    port=$((1100 + i))
    echo -e "${green}docker run -d --restart always -p $port:8080 --name sensor-simulation$i sensor-simulation:2.0.0;${reset}"
    docker run -d --restart always -p $port:8080 --name sensor-simulation$i sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)
    sleep 1
done

echo -e "${Magenta}********************************************************************************************${reset}"
echo -e "${Magenta}***********************************       The End       ************************************${reset}"
echo -e "${Magenta}********************************************************************************************${reset}"
