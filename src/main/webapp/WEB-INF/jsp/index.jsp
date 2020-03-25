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
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<title><s:message code="menu.mainPage" /></title>
</head>
<body>
	<div class="container">
		<div class="menu">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/admin">Admin</a> &nbsp &nbsp &nbsp &nbsp;
            </sec:authorize>
			<sec:authorize access="hasRole('ANONYMOUS')">
				<a href="/login">Login</a> &nbsp &nbsp &nbsp &nbsp;
            <a href="/register">Register</a> &nbsp &nbsp &nbsp &nbsp;
            		</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="/profil">Profile</a> &nbsp &nbsp &nbsp &nbsp;
            <a href="/logout">Logout</a>
			</sec:authorize>
		</div>
		<div>Some test text !</div>
	</div>
</body>
</html>