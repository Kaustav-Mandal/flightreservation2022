## Flight Reservation Application
Flight Reservation Application using Spring Boot, Java, JSTL, CSS, JS, MySQL. 

## Project Description
1. This project is a POC of how to use Spring Boot to build an end to end web application. 
2. This application lets user Register and login to the system to book a flight reservation.
3. It also has Role based Access Management which lets Admin user to access some secured resources of the application. 
4. This application exposes REST APIs which can be used by other application. For example check in to a Flight. Refer to this "https://github.com/Kaustav-Mandal/flightrCheckin.git" application which uses the REST API calls to complete checkin process. 
 

## Technologies Used:
1. Spring Boot 2.6.2
2. MySql server and Workbench
3. Java, HTML, CSS, JS, JSP, JSTL
4. Postman
5. Maven
6. Spring Tool Suite IDE. 

## How to use the Project:
1. Download the code base and import it to STS. 
2. Make following changes in the application.properties file. 
      a) update database url and password and log file location. 
      b) update email id and password which will be used to send login credentials and itinerary to user's email. 
      c) If you are using your gmail account then turn on the less secure app acess option under the security tab "Manage Your Google account". 
      d) You can also customize the email subject, body and check in application based on where it is running. 
      e) check in application is a seperate aplication which uses flight reservation application's REST APIs to complete check in process.
3. Do a maven update in case there is some Jar related issues. 
4. create the tables in database using queryies.sql file. 
5. That's all and it's ready to run on embedded tomcat in Spring Boot. The default url to run the application is : http://localhost:8080/flightreservation/

## Future Scope:
1. Since Springboot comes with tons of interesting features, the first thing which will be most useful is using actuator from Spring Boot which will allow to minitor
all the beans.
2. This application 


