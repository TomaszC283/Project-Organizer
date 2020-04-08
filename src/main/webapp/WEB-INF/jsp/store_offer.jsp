<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<title><s:message code="menu.mainPage" /></title>
</head>
<body>
	<div class="container">
		<div>
			<%@include file="/WEB-INF/incl/menu.html"%>
		</div>
		<div align="center">
			<h2>
				You want to make order for :
				<c:out value="${store.description }" />
			</h2>
		</div>
		<div>
			<h3>Input message to describe your order :</h3>
		</div>
		<sf:form modelAttribute="ClientOrder" method="post" action="${pageContext.request.contextPath}/store/sendoffer">
			<div>
				<sf:input class="store-message" type="text" path="message" value="I Want to order ${store.description }."></sf:input>
			</div>
			<div>
				<h3>in what quantity</h3>
				<sf:input type="text" path="amount"></sf:input>
			</div>
			<div>
				<input type="submit" value="Send an offer"/>
			</div>
		</sf:form>
	</div>
</body>
</html>