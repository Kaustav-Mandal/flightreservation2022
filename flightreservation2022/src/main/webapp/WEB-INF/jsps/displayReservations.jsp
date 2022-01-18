<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
      table,
      table td {
        border: 1px solid #cccccc;
      }
      td {
        height: 80px;
        width: 160px;
        text-align: center;
        vertical-align: middle;
      }
    </style>
</head>
<body>

<h2>RESERVATIONS:</h2>
<table>
<tr>
<th>Id</th>
<th>Checked In</th>
<th>Passenger Id</th>
<th>Passenger Email</th>
<th>Fight Id</th>
<th>Flight Name</th>
<th>Cancel Reservation</th>
</tr>

<c:forEach items="${reservations}" var="reservation">
<tr>
<td>${reservation.id}</td>
<td>${reservation.checkedIn}</td>
<td>${reservation.passenger.id}</td>
<td>${reservation.passenger.email}</td>
<td>${reservation.flight.id}</td>
<td>${reservation.flight.flightNumber}</td>
<td><a href="cancelReservation?id=${reservation.id}">Cancel</a></td>
</tr>
</c:forEach>
</table>

<div>
<form action="logout" method="post">
<input type="submit" value="logout"/>
</div>

</body>
</html>