<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Flights</title>
<link href="css/custom.css" rel="stylesheet">
</head>
<body>
<body>
<style>
<link href="css/findflights.css" rel="stylesheet">
</style>
<h2>Find Flights:</h2>
<form action="findFlights" method="post">
    
    Departure:
    <select name="from">
        <c:forEach items="${flights}" var="flight">
            <option value="${flight.departureCity}">${flight.departureCity}</option>
        </c:forEach>
    </select>
    <br><br>
    Arrival:
     <select name="to">
        <c:forEach items="${flights}" var="flight">
            <option value="${flight.arrivalCity}">${flight.arrivalCity}</option>
        </c:forEach>
     </select>
     <br><br>        
     Departure Date:<input type="text" name="departureDate"/>   

<input type="submit" value="search"/>

</form>
</body>
</html>