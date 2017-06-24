<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>DSAMS | ${pageTitle}</title>
<sec:csrfMetaTags />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, target-densitydpi=medium-dpi, user-scalable=0" />
<link href="${pageContext.request.contextPath}/resources/core/css/app.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/core/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/core/css/bootstrap.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/core/css/jquery-ui.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/core/css/bootstrap.icon-large.min.css" rel="stylesheet" />
<!-- Full calendar needs this to be here -->
<script	src="${pageContext.request.contextPath}/resources/core/js/moment.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/core/js/jquery-2.1.4.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/core/js/jquery-ui.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/core/js/jquery.tablesorter.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/core/js/jquery.validate.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/core/js/dsams-common.js"></script>
<script	src="${pageContext.request.contextPath}/resources/core/js/bootstrap.js"></script>
<script	src="${pageContext.request.contextPath}/resources/core/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">DSAMS</a>
        </div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-left">
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Patient <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		          	<li><a href="${pageContext.request.contextPath}/patient/register">Register</a></li>
		            <li><a href="${pageContext.request.contextPath}/patient/generalinfo">General Information</a></li>
		            <li><a href="${pageContext.request.contextPath}/patient/doctor/specialization/info">Doctor Specialization Information</a></li>
		            <li class="divider"></li>
		            <li><a href="${pageContext.request.contextPath}/patient/faq">FAQ</a></li>
		            <li><a href="#">Help</a></li>
		          </ul>
		        </li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Doctor <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="${pageContext.request.contextPath}/doctor/search">Search</a></li>
		            <li class="divider"></li>
		            <li><a href="${pageContext.request.contextPath}/doctor/faqs">FAQs</a></li>
		            <li><a href="${pageContext.request.contextPath}/doctor/help">Help</a></li>
		          </ul>
		        </li>
		        <sec:authorize access="hasRole('ROLE_ADMIN')">
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Admin <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="${pageContext.request.contextPath}/admin/reports">Reports</a></li>
		            <li><a href="${pageContext.request.contextPath}/admin/masterdata">Master Data</a></li>
		            <li class="divider"></li>
		            <li><a href="#">Help</a></li>
		          </ul>
		        </li>
		        </sec:authorize>
		    </ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name != null}">
					<li><div class="hidden-xs" style="padding-top: 10px;"><span class="glyphicon glyphicon-user white"></div></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Welcome ${pageContext.request.userPrincipal.name}!<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
			            <li><a href="${pageContext.request.contextPath}/patient/secured/account">View Account</a></li>
			            <li><a href="${pageContext.request.contextPath}/patient/secured/schedules">View Schedules</a></li>
			            <li class="divider"></li>
			            <li>
			            	<c:url value="/logout" var="logoutUrl" />
							<form id="logout" action="<c:url value="/logout" />" method="post" >
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
							<a href="javascript:document.getElementById('logout').submit()">Logout</a>
						</li>
		            </ul>
					</li>
					</c:when>	
					<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/patient/register">Sign Up</a></li>
					<li><a href="${pageContext.request.contextPath}/login">Log In</a></li>
					</c:otherwise>
					</c:choose>
					<!-- 
		        	<span class="glyphicon glyphicon-bell white"></span>
		        	<span class="glyphicon glyphicon-user white"></span>
		        	-->
				</li>
		    </ul>
		</div>
	</div>
</nav>
<!-- This is the grey lining of the header - purely aesthetics only. May need to check how in the future-->
<div class="jumbotron" style="padding-bottom: 10px !important;">
	<div class="container">
	</div>
</div>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}" ${breadcrumbFlag == null ? 'class="active"' : ''}>Home</a></li>
		<c:if test="${breadcrumbFlagFirst != null}">
		<li><a href="" ${breadcrumbFlag == null ? 'class="active"' : ''}>${breadcrumbFlagFirst}</a></li>
		</c:if>
		<c:if test="${breadcrumbFlag != null}">
		<li><a href="" class="active">${breadcrumbFlag}</a></li>
		</c:if>
	</ol>
</div>