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

echo -e "${green}docker stop sensor-simulation1;docker rm sensor-simulation1;${reset}"
docker stop sensor-simulation1;docker rm sensor-simulation1; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation2;docker rm sensor-simulation2;${reset}"
docker stop sensor-simulation2;docker rm sensor-simulation2; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation3;docker rm sensor-simulation3;${reset}"
docker stop sensor-simulation3;docker rm sensor-simulation3; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation4;docker rm sensor-simulation4;${reset}"
docker stop sensor-simulation4;docker rm sensor-simulation4; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation5;docker rm sensor-simulation5;${reset}"
docker stop sensor-simulation5;docker rm sensor-simulation5; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation6;docker rm sensor-simulation6;${reset}"
docker stop sensor-simulation6;docker rm sensor-simulation6; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation7;docker rm sensor-simulation7;${reset}"
docker stop sensor-simulation7;docker rm sensor-simulation7; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation8;docker rm sensor-simulation8;${reset}"
docker stop sensor-simulation8;docker rm sensor-simulation8; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation9;docker rm sensor-simulation9;${reset}"
docker stop sensor-simulation9;docker rm sensor-simulation9; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker stop sensor-simulation10;docker rm sensor-simulation10;${reset}"
docker stop sensor-simulation10;docker rm sensor-simulation10; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${blue}-------------Clear Last Version Images-------------${reset}"

echo -e "${green}docker rmi sensor-simulation:1.0.1;${reset}"
docker rmi sensor-simulation:1.0.1; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${blue}-------------Load New Version-------------${reset}"

echo -e "${green}docker image load -i sensor-client2.0.0.tar;${reset}"
docker image load -i sensor-client2.0.0.tar; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${blue}-------------Run Containers-------------${reset}"

echo -e "${green}docker run -d --restart always -p 1100:8080 --name sensor-simulation0 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1100:8080 --name sensor-simulation0 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1110:8080 --name sensor-simulation1 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1110:8080 --name sensor-simulation1 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1120:8080 --name sensor-simulation2 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1120:8080 --name sensor-simulation2 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1130:8080 --name sensor-simulation3 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1130:8080 --name sensor-simulation3 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1140:8080 --name sensor-simulation4 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1140:8080 --name sensor-simulation4 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1150:8080 --name sensor-simulation5 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1150:8080 --name sensor-simulation5 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1160:8080 --name sensor-simulation6 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1160:8080 --name sensor-simulation6 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1170:8080 --name sensor-simulation7 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1170:8080 --name sensor-simulation7 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1180:8080 --name sensor-simulation8 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1180:8080 --name sensor-simulation8 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${green}docker run -d --restart always -p 1190:8080 --name sensor-simulation9 sensor-simulation:2.0.0;${reset}"
docker run -d --restart always -p 1190:8080 --name sensor-simulation9 sensor-simulation:2.0.0; || (echo -e "${red}We have an error.${reset}" && exit 1)

echo -e "${Magenta}********************************************************************************************${reset}"
echo -e "${Magenta}***********************************       The End       ************************************${reset}"
echo -e "${Magenta}********************************************************************************************${reset}"
