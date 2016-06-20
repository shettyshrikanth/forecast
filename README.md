Weather Details
====================================

Application built with the following (main) technologies:

- Java 1.8
- Spring 4.0
- Maven 3.3
- JQuery 1.10.3

Introduction
------------
Create a website which will return current weather data from OpenWeatherMap.org, based on a city chosen by the user, which should support: 
London
Hong Kong

the user should be able to input their choice of city via a standard HTML <form> & receive results showing: 
today’s date
the city name
overall description of the weather (e.g. "Light rain", "Clear sky", etc.)
temperature in Fahrenheit and Celsius
sunrise and sunset times in 12 hour format (e.g. 9:35am; 11:47pm)

the styling / layout of the website itself is not a priority — please feel free to use plain HTML with no styling

Setup
-----

To get you going with this application, just follow along:

In a directory where you wish to clone this project from git:
> git clone https://github.com/shettyshrikanth/forecast.git

Go into the application's new project directory (with the "cd" shown in the command prompt) and complete the following:
> cd forecast

> mvn clean install

Copy the target/forecast.war to available application server

And access the application with URL:-
http://localhost:8080/forecast/home


