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
<title><s:message code="menu.users" /></title>
<script type="text/javascript">
	function startSerach(pParam) {
		var searchWord = document.getElementById('searchString').value;
		var page = parseInt(document.getElementById('cp').value)
				+ parseInt(pParam);
		if (searchWord.length < 3) {
			document.getElementById("errorSearch").innerHTML = "<s:message code="error.searchString.toShort"/>";
			return false;
		} else {
			document.getElementById("errorSearch").innerHTML = "";
			var searchLink = '${pageContext.request.contextPath}/admin/users/search/'
					+ searchWord + '/' + page;
			window.location.href = searchLink;
		}
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/incl/menu.html"%>
	<h2>
		<s:message code="menu.users" />
	</h2>
	<c:set var="licznik" value="${recordStartCounter }" />
	<div align="center">
		<div align="right" style="width: 1000px; padding: 2px;">
			<input type="hidden" name="cp" id="cp" value="${currentPage}" /> <input
				type="text" id="searchString" />&nbsp;&nbsp;<input type="button"
				value="<s:message code="button.search"/>" onclick="startSerach(0);" /><br />
			<span id="errorSearch" style="color: red;"></span>
		</div>
		<table width="1000" border="0" cellpadding="6" cellspacing="2">
			<tr bgcolor="#ffddcc">
				<td width="40" align="center"></td>
				<td width="40" align="center"><b><s:message
							code="admin.user.id" /></b></td>
				<td width="190" align="center"><b><s:message
							code="register.name" /></b></td>
				<td width="190" align="center"><b><s:message
							code="register.lastName" /></b></td>
				<td width="200" align="center"><b><s:message
							code="register.email" /></b></td>
				<td width="190" align="center"><b><s:message
							code="profil.rola" /></b></td>
				<td width="50"></td>
			</tr>
			<c:forEach var="u" items="${userList }">
				<c:set var="licznik" value="${licznik+1}" />
				<tr>
					<td align="right"><c:out value="${licznik }" /></td>
					<td align="right"><a href="edit/${u.id }"><c:out
								value="${u.id }" /></a></td>
					<td align="left"><a href="edit/${u.id }"><c:out
								value="${u.name }" /></a></td>
					<td align="left"><a href="edit/${u.id }"><c:out
								value="${u.lastName }" /></a></td>
					<td align="center"><a href="edit/${u.id }"><c:out
								value="${u.email }" /></a></td>
					<td align="center"><c:choose>
							<c:when test="${u.nrRoli == 1 }">
								<font color="green">Admin</font>
							</c:when>
								<c:when test="${u.nrRoli == 2 }">
									<font color="blue">Production Manager</font>
								</c:when>
								<c:when test="${u.nrRoli == 3 }">
									<font color="blue">Foreman</font>
								</c:when>
								<c:when test="${u.nrRoli == 4 }">
									<font color="orange">Constructor</font>
								</c:when>
								<c:when test="${u.nrRoli == 5 }">
									<font color="orange">Technologist</font>
								</c:when>
								<c:when test="${u.nrRoli == 6 }">
									<font color="orange">Storekeeper</font>
								</c:when>
								<c:when test="${u.nrRoli == 7 }">
									<font color="orange">Locskmith - Punching</font>
								</c:when>
								<c:when test="${u.nrRoli == 8 }">
									<font color="orange">Locskmith - Bending</font>
								</c:when>
								<c:when test="${u.nrRoli == 9 }">
									<font color="orange">Locksmith - Welding</font>
								</c:when>
								<c:when test="${u.nrRoli == 10 }">
									<font color="orange">Locksmith - Printing</font>
								</c:when>
								<c:when test="${u.nrRoli == 11 }">
									<font color="orange">Locksmith - Fitting</font>
								</c:when>
								<c:when test="${u.nrRoli == 12 }">
									<font color="orange">Quality Controller</font>
								</c:when>
								<c:when test="${u.nrRoli == 13 }">
									<font color="orange">Logistician</font>
								</c:when>
								<c:when test="${u.nrRoli == 14 }">
									<font color="violet">Customer</font>
								</c:when>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${u.nrRoli == 1 }">
								<img src="/resources/images/deliconinact.png" width="16"
									height="16" />
							</c:when>
							<c:otherwise>
								<a href="delete/${u.id }"> <img
									src="/resources/images/delicon.png" width="16" height="16"
									title="<s:message code="delete.user"/>" />
								</a>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
		<table width="1000" border="0" cellpadding="6" cellspacing="0"
			bgcolor="#ffddcc">
			<tr>
				<td width="300" align="left"><s:message code="info.page" />
					${currentPage} <s:message code="info.from" /> ${totalPages}</td>
				<td align="right"><c:if test="${currentPage > 1}">
						<input type="button"
							onclick="window.location.href='${pageContext.request.contextPath}/admin/users/${currentPage - 1}'"
							value="<s:message code="link.poprzedni"/>" />&nbsp;&nbsp;
			</c:if> <c:if test="${currentPage < totalPages}">
						<input type="button"
							onclick="window.location.href='${pageContext.request.contextPath}/admin/users/${currentPage + 1}'"
							value="<s:message code="link.nastepny"/>" />
					</c:if></td>
			</tr>
		</table>

	</div>
</body>
</html>