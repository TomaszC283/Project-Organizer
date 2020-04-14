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
	<div>
		<%@include file="/WEB-INF/incl/menu.html"%>
	</div>
	<div align="center">
		<div class="container-div">
			<table width="1000" border="0" cellpadding="6" cellspacing="2">
				<c:forEach var="u" items="${productList }">
					<tr class="staff-order-value">
						<td align="right"><c:out value="${u.id }" /></td>
						<td align="left"><c:out value="${u.description }" /></td>
						<td align="left"><c:out value="${u.amount }" /></td>
						<sf:form
							action="${pageContext.request.contextPath}/storage/subamount/${u.id}"
							method="post" modelAttribute="Product">
							<td align="center"><sf:input type="text" name="sub_${u.id}"
									path="amount_sub" id="sub_${u.id}"></sf:input></td>
							<td align="center"><input type="submit"
								value="Substract the value" /></td>
						</sf:form>

						<td>
							<form
								action="${pageContext.request.contextPath}/storage/delete/${u.id }"
								method="post">
								<input type="submit" value="Delete Product" />
							</form>
						</td>

					</tr>
				</c:forEach>

			</table>
			<h2 class="error"><%=request.getAttribute("subError")%></h2>
			<sf:form action="${pageContext.request.contextPath}/addproduct"
				method="post" modelAttribute="Product">
				<sf:input type="text" name="desc" path="description" id="desc" />
				<sf:input type="text" name="amount" path="amount" id="amount" />
				<input type="submit" value="Add Product" />
				<div>
					<h2 class="error"><%=request.getAttribute("addError")%></h2>
				</div>
			</sf:form>
			<input type="button" value="BACK TO MAIN MENU"
				onclick="window.location.href='${pageContext.request.contextPath}/'" />
		</div>
	</div>
</body>
</html>