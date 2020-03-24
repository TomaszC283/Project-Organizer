<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/index_style.css" />
<title>Login Page</title>
</head>
<body>
	<div class="container">
		<h1>Project Organizer Software</h1>
		<div class="signin">
    	 <form method="POST" action="${contextPath}/login" class="form-signin">
				<input type="text" class="user" value="Login"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'admin@projectorganizer.pl';}" />
				<input type="password" class="pass" value="Password"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'TomaszC283';}" /> <label>
					<input type="checkbox" value="Remember-Me" /> Remember Me?
				</label>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
			</form>
		</div>
	</div>
	<div class="footer">
		<p>Copyright &copy; 2020 Project Organizer | Design by Tomasz
			Czopur</p>
	</div>
</body>
</html>