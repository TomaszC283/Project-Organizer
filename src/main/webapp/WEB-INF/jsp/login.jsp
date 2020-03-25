<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/index_style.css" />
<title><s:message code="logowanie.pageName" /></title>
</head>
<div class="container">
	<h1>Project Organizer Software</h1>
	<div class="signin">

		<form id="loginForm" action="/login" method="POST" class="form-signin">
			<div class="error">
				<c:if test="${not empty param.error}">
					<font>Incorect Email or Password !</font>
				</c:if>
			</div>
			<input type="text" class="user" id="email" value="email@projectorganizer.pl"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'email';}" />
				<input type="password" id="password" class="pass" value="Password"
				onfocus="this.value = '';"
				onblur="if (this.value == '') {this.value = 'Password';}" />
				<input type="submit" value="LOGIN" />
				 <input type="button" value="BACK TO MAIN PAGE"
				onclick="window.location.href='${pageContext.request.contextPath}/'" />

		</form>
	</div>
</div>
<div class="footer">
	<p>Copyright &copy; 2020 Project Organizer | Design by Tomasz Czopur</p>
</div>
</body>
</html>