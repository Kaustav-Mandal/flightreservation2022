<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link href="css/custom.css" rel="stylesheet">
</head>
<body>
<div>    
    <h2>Login</h2><br>    
    <div class="login">    
    <form id="login" method="post" action="login">    
        <label>User Name    
        </label>    
         <input type="email" placeholder="username" name="email"/>  
        <br><br>    
        <label>Password    
        </label>    
       <input type="password" placeholder="password" name="password"/> 
        <br><br>    
        <button type="submit">Login</button>              
    </form>     
</div>    

${msg}

</body>
</html>