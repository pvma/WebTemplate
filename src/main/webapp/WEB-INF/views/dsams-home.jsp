<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/fragments/header.jsp"%>
<style>
body {
    background: url("..${pageContext.request.contextPath}/resources/images/background.jpg") no-repeat fixed center;
} 
</style>
<div class="container">
	<span class="help-block small"><a href="${pageContext.request.contextPath}/doctor/secured/register">Doctor? Click Here</a></span>
	<div class="row">
		<div class="col-sm-6">
			<div class="well">
				<form id="loginForm" method="POST" action="/patient/register" novalidate="novalidate">
					<div class="form-group form-inline">
							<input type="text" class="form-control" id="first-name"	name="userEntity.firstName" title="First Name" placeholder="First Name"/>
							<input type="text" class="form-control" id="last-name" name="userEntity.lastName" title="Last Name"	placeholder="Last Name"/>
					</div>
					<div class="form-group form-inline">
							<input type="text" class="form-control" id="user-email"	name="userEntity.email" title="User Email" placeholder="Email"/>
					</div>
					<div class="form-group form-inline">
							<input type="text" class="form-control" id="user-mobile-number"	name="userEntity.mobileNUmber" title="User Mobile Number" placeholder="Mobile No."/>
							<span class="help-block small">Mobile number will send you appointment notifications and reminders</span>
					</div>
					<div class="form-group form-inline">
							<input type="password" class="form-control" id="user-password" name="userEntity.password" title="Password" placeholder="Password"/>
							<input type="password" class="form-control" id="user-password-retry" name="userEntity.passwordRetry" title="Retry Password" placeholder="Retry Password"/>
					</div>
					<div class="form-group form-inline">
							<input id="datepicker_start_date" id="user-birthday" name="userEntity.birthdate" class="form-control datepicker" type="text" placeholder="dd-mm-yyyy"/>
							<span class="help-block small"></span>
					</div>
					<div class="form-group form-inline">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-default">
								<input type="radio" id="gender-male" name="userEntity.gender" value="GENDER_MALE" /> Male
							</label> 
							<label class="btn btn-default">
								<input type="radio" id="gender-female" name="userEntity.gender" value="GENDER_MALE" /> Female
							</label> 
						</div>
						<span class="help-block small"></span>
					</div>
					<div class="form-group form-inline">
						<a href="${pageContext.request.contextPath }/patient/register/help"><u>Register Help</u></a>
					</div>
					<div class="form-actions form-inline">
						<button type="submit" class="btn btn-success btn-block">Register</button>
					</div>
				</form>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="well">
				<p class="lead">Load from Social</p>
				<button type="button" class="btn" style="width: 80% !Important; background-color: rgb(16, 135, 221);"><i class="icon-large icon-dropbox" style="height: 25px !Important;"></i> <span style="color: white;">| Sign in with Dropbox</span></button><br/><br/>
				<button type="button" class="btn" style="width: 80% !Important; background-color: rgb(59, 89, 152);"><i class="icon-large icon-facebook" style="height: 25px !Important;"></i> <span style="color: white;">| Sign in with Facebook</span></button><br/><br/>
				<button type="button" class="btn" style="width: 80% !Important; background-color: rgb(68, 68, 68);"><i class="icon-large icon-github" style="height: 25px !Important;"></i> <span style="color: white;">| Sign in with GitHub</span></button><br/><br/>
				<button type="button" class="btn" style="width: 80% !Important; background-color: rgb(221, 75, 57);"><i class="icon-large icon-google-plus" style="height: 25px !Important;"></i> <span style="color: white;">| Sign in with Google</span></button><br/><br/>
				<button type="button" class="btn" style="width: 80% !Important; background-color: rgb(44, 71, 98);"><i class="icon-large icon-tumblr" style="height: 25px !Important;"></i> <span style="color: white;">| Sign in with Tumblr</span></button><br/><br/>
				<button type="button" class="btn" style="width: 80% !Important; background-color: rgb(85, 172, 238);"><i class="icon-large icon-twitter" style="height: 25px !Important;"></i> <span style="color: white;">| Sign in with Twitter</span></button><br/><br/>
				</p>
			</div>
		</div>
	</div>
</div>
</div>
<div class="container">
	<%@include file="/WEB-INF/fragments/footer.jsp"%>
</div>

<script type="text/javascript">
</script>
</body>
</html>