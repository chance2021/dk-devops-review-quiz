#!/bin/bash

docker pull nginx
docker pull redis
docker pull hello-world
docker pull ubuntu
docker run -d nginx &
docker run -d redis &
clear
echo "Please wait 30s for the environment setup..."
sleep 30s
clear
echo "The test environment is ready! Please go to the quiz to start your test! Good luck!"
