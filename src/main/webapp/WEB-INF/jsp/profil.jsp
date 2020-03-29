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
<title><s:message code="profil.userDane" /></title>
</head>
<body>
	<%@include file="/WEB-INF/incl/menu.html"%>
	<div class="container">
		<table width="500" border="0" cellpadding="4" cellspacing="1"
			align="center">

			<tr>
				<td width="130" align="right"><s:message code="register.email" />
				</td>
				<td width="270" align="left"><c:out value="${user.email }" /></td>
			</tr>

			<tr>
				<td width="130" align="right"><s:message code="register.name" />
				</td>
				<td width="270" align="left"><c:out value="${user.name }" /></td>
			</tr>

			<tr>
				<td width="130" align="right"><s:message
						code="register.lastName" /></td>
				<td width="270" align="left"><c:out value="${user.lastName }" />
				</td>
			</tr>

			<tr>
				<td width="130" align="right"><s:message code="profil.rola" />
				</td>
				<td width="270" align="left"><c:choose>
						<c:when test="${user.nrRoli == 1 }">
							<font color="green">Admin</font>
						</c:when>
						<c:when test="${user.nrRoli == 2 }">
							<font color="blue">Production Manager</font>
						</c:when>
						<c:when test="${user.nrRoli == 3 }">
							<font color="blue">Foreman</font>
						</c:when>
						<c:when test="${user.nrRoli == 4 }">
							<font color="orange">Constructor</font>
						</c:when>
						<c:when test="${user.nrRoli == 5 }">
							<font color="orange">Technologist</font>
						</c:when>
						<c:when test="${user.nrRoli == 6 }">
							<font color="orange">Storekeeper</font>
						</c:when>
						<c:when test="${user.nrRoli == 7 }">
							<font color="orange">Locskmith - Punching</font>
						</c:when>
						<c:when test="${user.nrRoli == 8 }">
							<font color="orange">Locskmith - Bending</font>
						</c:when>
						<c:when test="${user.nrRoli == 9 }">
							<font color="orange">Locksmith - Welding</font>
						</c:when>
						<c:when test="${user.nrRoli == 10 }">
							<font color="orange">Locksmith - Printing</font>
						</c:when>
						<c:when test="${user.nrRoli == 11 }">
							<font color="orange">Locksmith - Fitting</font>
						</c:when>
						<c:when test="${user.nrRoli == 12 }">
							<font color="orange">Quality Controller</font>
						</c:when>
						<c:when test="${user.nrRoli == 13 }">
							<font color="orange">Logistician</font>
						</c:when>
						<c:when test="${user.nrRoli == 14 }">
							<font color="violet">Customer</font>
						</c:when>
					</c:choose></td>
			</tr>

		</table>

		<table width="500" border="0" cellpadding="4" cellspacing="1"
			align="center">

			<tr>
				<td align="center"><input type="button"
					value="<s:message code="button.edycjaProfilu"/>"
					onclick="window.location.href='${pageContext.request.contextPath}/editprofil'" />
				</td>
				<td align="center"><input type="button"
					value="<s:message code="button.zmianaHasla"/>"
					onclick="window.location.href='${pageContext.request.contextPath}/editpassword'" />
				</td>
			</tr>
		</table>

	</div>
</body>
</html>