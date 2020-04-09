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
			<table>
				<tr>
					<td><c:out value="${order.id }"/></td>
					<td><c:out value="${order.message }" /></td>
					<td><c:out value="${order.amount }" /></td>
				</tr>
			</table>
		</div>
		<div>
			<table width="1200" border="0" cellpadding="6" cellspacing="2">
				<tr>
					<td>Complete the technical form</td>
				</tr>

				<sf:form
					action="${pageContext.request.contextPath}/workingpanel/apply"
					method="POST" modelAttribute="staffOrder">
					<tr>
						<td>Description</td>
						<td>Responsible</td>
						<td>Product</td>
						<td>Amount</td>
						<td>Price</td>
					</tr>
					<tr>
						<td><sf:input type="text" path="description"></sf:input></td>
						<td><sf:select path="responsible">
							<c:forEach var="u" items="${userList }">
								<option value="${u.id}"><c:out value="${u.name}"/> <c:out value="${u.lastName}"/></option>							
							</c:forEach>
						</sf:select></td>
						<td>
							<sf:select path="product_id">
							<c:forEach var="p" items="${productList }">
								<option value="${p.id}"><c:out value="${p.description}"/></option>							
							</c:forEach>
						</sf:select>
						</td>
						<td><sf:input type="text" path="amount"></sf:input></td>
						<td><sf:input type="text" path="price"></sf:input></td>
					</tr>
					<tr><td><input type="submit" value="Send order to Production"/></td></tr>
					<sf:input path="client_id" value="${order.id }"/>
				</sf:form>
			</table>
		</div>
	</div>
</body>
</html>