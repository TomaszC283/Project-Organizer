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
<title><s:message code="menu.adminPage" /></title>
</head>
<div class="container">
<%@include file="/WEB-INF/incl/menu.html"%>
	<h1>What do you want to do ?</h1>
	<div class="signin">
		<form id="loginForm" class="form-signin">
				<input type="button" value="DISPLAY ALL USERS" onclick="window.location.href='${pageContext.request.contextPath}/admin/users/1'" />
				<input type="button" value="ADD NEW EMPLOYEE" onclick="window.location.href='${pageContext.request.contextPath}/admin/addemployee'" />
				<input type="button" value="BACK TO MAIN PAGE" onclick="window.location.href='${pageContext.request.contextPath}/'" />
		</form>
	</div>
</div>
<div class="footer">
	<p>Copyright &copy; 2020 Project Organizer | Design by Tomasz Czopur</p>
</div>
</body>
</html>