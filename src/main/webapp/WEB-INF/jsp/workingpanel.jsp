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
<title>Working Panel</title>
</head>
<body>
	<%@include file="/WEB-INF/incl/menu.html"%>
	<div class="container">
		<h1>Project organizer - Working Panel</h1>

		<sec:authorize
			access="hasAnyRole('ADMIN','FOREMAN','LOGISTICIAN','PRODUCTION_MANAGER')">
			<div>
				<h2>List of Client orders</h2>
				<c:forEach var="c" items="${clientOrderList }">
					<table>
						<tr>
							<td><c:out value="${c.id }" /></td>
							<td><c:out value="${c.message }" /></td>
							<td><c:out value="${c.amount }" /></td>
							<td><c:choose>
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
									<td><sf:form
											action="${pageContext.request.contextPath}/workingpanel/apply/${c.id }"
											method="POST" modelAttribute="clientOrder">
											<input type="submit" value="Apply an order" />
										</sf:form></td>
								</c:when>
							</c:choose>
						</tr>
					</table>
				</c:forEach>
			</div>
		</sec:authorize>

		<c:forEach var="s" items="${staffOrderList }">
			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-adopted"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'CONSTRUCTOR')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-design"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-implementation"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'TECHNOLOGIST')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-queue"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'STOREKEEPER')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-warehouse"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_PUNCHING')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-punching"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_BENDING')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-bending"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_WELDER')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-welding"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_PRINTER')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-printing"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'LOCKSMITH_FITTER')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-fitting"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER', 'QUALITY_CONTROL')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-quality"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>

			<sec:authorize
				access="hasAnyRole('ADMIN','FOREMAN', 'LOGISTICIAN', 'PRODUCTION_MANAGER')">
				<div>
					<h2 class="progress-bar">Progress bar :</h2>
					<div class="bar">
						<div class="green-ready"></div>
						<div class="orange-process"></div>
					</div>
				</div>
			</sec:authorize>
		</c:forEach>
	</div>
</body>
</html>