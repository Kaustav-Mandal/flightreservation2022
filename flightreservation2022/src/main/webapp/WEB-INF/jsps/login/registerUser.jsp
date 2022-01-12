<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Register User</title>
	</head>
	body {
		  background-image: url('image4.jpg');
		  background-repeat: no-repeat;
		  background-attachment: fixed;  
		  background-size: cover;
		}	
	
	<body>
    <h3>Register Yourself</h3>
    <form action="registerUser" method="post">
        <table>
            <tr>
                <td>First Name: </td>
                <td><input type="text" name="firstName" required></td>
            </tr>
            <tr>
                <td>Last Name: </td>
                <td><input type="text" name="firstName" required></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><input type="email" name="email" required></td>
            </tr>
            <tr>
             <td>Password</td>
             <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td><input type="password" name="confirmPassword" required></td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" value="Register"></td>
            </tr>
            
        </table>
     </form>
	</body>
</html>