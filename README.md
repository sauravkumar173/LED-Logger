# LED Logger IOT Project
This repository contains all the files for the LED Logger IOT project. The specifics of which can
be viewed here: https://medium.com/@sauravkumar173/making-an-iot-using-esp8266-with-ruby-on-rails-server-side-edc5140cecf8


##Installation

This project uses Ruby on Rails and an Wemos D1 Mini board with ESP8266. This means that a Linux machine of WSL environment will be needed to host the server, and an Arduino IDE is necessary to flash the board.

1. Flash INO file in "LED-Logger/Arduino Code/ESP8266\_LED\_Logger/ESP8266\_LED\_Logger.ino"
2. Open the Rails project from "LED-Logger/Ruby Rails/blog/"
3. Run the server with "rails -s -b 0.0.0.0"
4. If the ESP8266 cannot connect to the Rails server, ensure the IP address, SSID and Password is correct to your setup

##Usage
On the local host IP, a HTML view will appear. The LED can be turned on or off from the control panel on the website and a log will be created with the time the LED state was changed.

##Authors
Saurav Kumar

