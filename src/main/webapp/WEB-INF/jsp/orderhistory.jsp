<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c2" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
<title>Working Panel</title>
</head>
<body>
	<%@include file="/WEB-INF/incl/menu.html"%>
	<div class="container">
		<h1 class="page-title">Project organizer - Working Panel</h1>

		<sec:authorize
			access="hasAnyRole('ADMIN','FOREMAN','LOGISTICIAN','PRODUCTION_MANAGER')">
			<div class="container-div">
				<h2 class="text-header">List of Client orders</h2>
				<table>
					<tr class="client-order-headers">
						<td width="100px">Order ID</td>
						<td width="200px">Message</td>
						<td width="120px">Amount</td>
						<td width="400px">Order status</td>
					</tr>
					<c:forEach var="c" items="${clientOrderList }">
						<c:choose>
							<c:when test="${c.offerStatus == 3 }">
								<tr class="client-order-values">
									<td width="100px"><c:out value="${c.id }" /></td>
									<td width="200px"><c:out value="${c.message }" /></td>
									<td width="120px"><c:out value="${c.amount }" /></td>
									<td width="600px">Order archivized and sent to : <c2:forEach
											var="u" items="${userList }">
											<c2:choose>
												<c2:when test="${u.id == c.client_id }">
													<c2:out value="${u.name}" />
													<c2:out value="${u.lastName }" />
												</c2:when>
											</c2:choose>
										</c2:forEach>
									</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</table>
			</div>
		</sec:authorize>

		<c:forEach var="s" items="${staffOrderList }">
			<c:choose>
				<c:when test="${s.status == 14 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Order archivized - done and sent to
										Client</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="80px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="260px">Description</td>
									<td width="140px">Date of Start</td>
									<td width="140px">Destination Date</td>
									<td width="80px">Amount</td>
									<td width="80px">Price</td>
								</tr>
								<tr class="staff-order-value">
									<td width="80px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="260px"><c:out value="${s.description}" /></td>
									<td width="140px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="140px"><c:out value="${s.deadline}" /></td>
									<td width="80px"><c:out value="${s.amount}" /></td>
									<td width="80px"><c:out value="${s.price}" /></td>
								</tr>
							</table>
							<table>
								<tr class="staff-progress-bar-header">
									<td width="1000px">Progress bar :</td>
								</tr>
							</table>
							<table>
								<tr class="staff-progress-bar">
									<td width="1000px">
										<div class="bar">
											<div class="green-archivized"></div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</sec:authorize>
				</c:when>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>