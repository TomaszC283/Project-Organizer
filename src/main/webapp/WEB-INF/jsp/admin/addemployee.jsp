<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/index_style.css" />
<title><s:message code="menu.mainPage" /></title>
</head>
<body>
	<div class="container">
		<div>
			<%@include file="/WEB-INF/incl/menu.html"%>
		</div>
			<div class="signin">
			<sf:form id="usersForm" action="saveemployee" modelAttribute="user"
			enctype="multipart/form-data" method="POST" class="form-signin">
			<sf:input path="name" size="28"/> 
			
			<sf:input path="lastName" size="28"/> 
				
			<sf:input path="email" size="28"/> 
				
			<sf:input path="password" size="28"/> 
				
			<input type="text" name="role_employee" id="role_employee" />
	
			<input	type="submit" value="REGISTER EMPLOYEE" /> 
			<input type="button" value="BACK TO MAIN PAGE"
				onclick="window.location.href='${pageContext.request.contextPath}/'" />
				
			</sf:form>
		</div>
	</div>
</body>
</html>