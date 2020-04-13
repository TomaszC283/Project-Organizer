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
						<td width="120px">Applying Order</td>
					</tr>
					<c:forEach var="c" items="${clientOrderList }">
						<tr class="client-order-values">
							<c:choose>
								<c:when test="${c.offerStatus == 3 }">
								</c:when>
								<c:otherwise>
									<td width="100px"><c:out value="${c.id }" /></td>
									<td width="200px"><c:out value="${c.message }" /></td>
									<td width="120px"><c:out value="${c.amount }" /></td>
									<td width="400px"><c:choose>
											<c:when test="${c.offerStatus == 0 }">
											Confirmed - order to be processed
									</c:when>
											<c:when test="${c.offerStatus == 1 }">
											In progress on production
									</c:when>
											<c:when test="${c.offerStatus == 2 }">
											Order completed. It will be transferred to the history when it is sent to the customer
									</c:when>
										</c:choose></td>
									<c:choose>
										<c:when test="${c.offerStatus == 0 }">
											<td width="120px"><sf:form
													action="${pageContext.request.contextPath}/workingpanel/apply/${c.id }"
													method="POST" modelAttribute="clientOrder">
													<input type="submit"
														value="Apply an order" />
												</sf:form></td>
										</c:when>
										<c:otherwise>
											<td width="120">-</td>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
			</div>
		</sec:authorize>

		<c:forEach var="s" items="${staffOrderList }">
			<c:choose>
				<c:when test="${s.status == 2 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 2 of 14 - Adopting the Order</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-adopted"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 3 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'CONSTRUCTOR')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 3 of 14 - Designing a Project</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-design"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 4 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 4 of 14 - Implementing a Project</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-implementation"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 5 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'TECHNOLOGIST')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 5 of 14 - Making a Technology</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-queue"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 6 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'STOREKEEPER')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 6 of 14 - Picking materials from the warehouse</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-warehouse"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 7 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_PUNCHING')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 7 of 14 - Punching out elements for the project</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-punching"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 8 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_BENDING')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 8 of 14 - Bending out elements </td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-bending"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 9 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_WELDER')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 9 of 14 - Welding out elements</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-welding"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 10 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_PRINTER')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 10 of 13 - Printing out elements</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-printing"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 11 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_FITTER')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 11 of 13 - Fitting elements together</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-fitting"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 12 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'QUALITY_CONTROL')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 12 of 13 - QUality control</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-quality"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>

				<c:when test="${s.status == 13 }">
					<sec:authorize
						access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER')">
						<div class="container-div">
							<table>
								<tr class="staff-order-role">
									<td width="1000px">Process 13 of 13 - Packing and sending Elements</td>
								</tr>
							</table>
							<table>
								<tr class="staff-order-headers">
									<td width="100px">Order ID</td>
									<td width="150px">Leader</td>
									<td width="300px">Description</td>
									<td width="150px">Date of Start</td>
									<td width="150px">Destination Date</td>
									<td width="100px">Amount</td>
								</tr>
								<tr class="staff-order-value">
									<td width="100px"><c:out value="${s.id}" /></td>
									<c2:forEach var="u" items="${userList}">
										<c2:choose>
											<c2:when test="${u.id == s.responsible }">
												<td width="150px"><c2:out value="${u.name}" /> <c2:out
														value="${u.lastName}" /></td>
											</c2:when>
										</c2:choose>
									</c2:forEach>
									<td width="300px"><c:out value="${s.description}" /></td>
									<td width="150px"><c:out value="${s.dateOfOrder}" /></td>
									<td width="150px"><c:out value="${s.deadline}" /></td>
									<td width="100px"><c:out value="${s.amount}" /></td>
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
											<div class="green-ready"></div>
											<div class="orange-process"></div>
										</div>
									</td>
								</tr>
							</table>
							<sf:form method="POST" action="${pageContext.request.contextPath}/workingpanel/move/${s.id}">
								<table>
									<tr>
										<td><input type="submit" /></td>
									</tr>
								</table>
							</sf:form>
						</div>
					</sec:authorize>
				</c:when>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>