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
			<div>
				<table width="1000" border="0" cellpadding="6" cellspacing="2">
					<c:forEach var="u" items="${storeList }">
						<tr>
							<td align="right"><c:out value="${u.id }" /></td>
							<td align="left"><c:out value="${u.description }" /></td>
							<sf:form
								action="${pageContext.request.contextPath}/store/${u.id}"
								method="post" modelAttribute="Store">
								<td align="center"></td>
								<td align="center"><input type="submit"
									value="Choose that Service" /></td>
							</sf:form>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>