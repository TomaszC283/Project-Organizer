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
<script type="text/javascript">
	function changeTrBg(row) {
		row.style.backgroundColor = "#e6e6e6";
	}
	function defaultTrBg(row) {
		row.style.backgroundColor = "white";
	}
</script>
</head>
<body>
	<div>
		<%@include file="/WEB-INF/incl/menu.html"%>
	</div>
	<c:set var="licznik" value="${recordStartCounter }" />
	<div align="center">
		<table width="1000" border="0" cellpadding="6" cellspacing="2">
			<c:forEach var="u" items="${productList }">
				<c:set var="licznik" value="${licznik+1}" />
				<tr onmouseover="changeTrBg(this)" onmouseout="defaultTrBg(this)">
					<td align="right"><c:out value="${licznik }" /></td>
					<td align="left"><c:out value="${u.description }" /></td>
					<td align="left"><c:out value="${u.amount }" /></td>
					<td align="center"><input type="text" name="amount_sub_${licznik}" id="amount_sub_${licznik}"></td>
					<td align="center"><input type="button" value="Substract the value" onclick="window.location.href='${pageContext.request.contextPath}/storage/subamount/${licznik}'"/></td>
				</tr>
			</c:forEach>
		</table>
		<sf:form action="${pageContext.request.contextPath}/addproduct"
			method="post" modelAttribute="Product">
			<sf:input type="text" name="desc" path="description" id="desc" /> 
			<sf:input type="text" name="amount" path="amount" id="amount" /> 
			<input type="submit"	value="Add Product" />
		</sf:form>
		<input type="button" value="BACK TO MAIN MENU" onclick="window.location.href='${pageContext.request.contextPath}/'" />
	</div>
</body>
</html>