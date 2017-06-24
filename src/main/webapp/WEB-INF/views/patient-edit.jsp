<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/fragments/header.jsp"%>
<div class="container">
	<h4>Sign Up</h4>
	<span class="help-block"><a href="#">Doctor? Click Here</a></span>
	<div class="row">
		<div class="col-xs-6">
			<div class="well">
				<form id="loginForm" method="POST" action="/login/" novalidate="novalidate">
					<div class="form-group form-inline">
							<input type="text" class="form-control" id="first-name"	name="userEntity.firstName" title="First Name" placeholder="First Name"/>
							<input type="text" class="form-control" id="last-name" name="userEntity.lastName" title="Last Name"	placeholder="Last Name"/>
					</div>
					<div class="form-group form-inline">
							<input type="text" class="form-control" id="user-email"	name="userEntity.email" title="User Email" placeholder="Email"/>
					</div>
					<div class="form-group form-inline">
							<input type="text" class="form-control" id="user-mobile-number"	name="userEntity.mobileNUmber" title="User Mobile Number" placeholder="Mobile No."/>
							<span class="help-block">Mobile number will send you appointment notifications and reminders</span>
					</div>
					<div class="form-group form-inline">
							<input type="password" class="form-control" id="user-password" name="userEntity.password" title="Password" placeholder="Password"/>
							<input type="password" class="form-control" id="user-password-retry" name="userEntity.passwordRetry" title="Retry Password" placeholder="Retry Password"/>
					</div>
					<div class="form-group form-inline">
							<input id="datepicker_start_date" id="user-birthday" name="userEntity.birthdate" class="form-control datepicker" type="text" placeholder="dd-mm-yyyy"/>
							<span class="help-block"></span>
					</div>
					<div class="form-group form-inline">
							<button type="submit" class="btn btn-success btn-block">Login</button>
							<a href="/forgot/" class="btn btn-default btn-block">Help to login</a>
					</div>
				</form>
			</div>
		</div>
		<div class="col-xs-6">
			<div class="well">
				<p class="lead">
					Load from Social <span class="text-success">FREE</span>
				</p>
				<ul class="list-unstyled" style="line-height: 2">
					<li><span class="fa fa-check text-success"></span> See all your orders</li>
					<li><span class="fa fa-check text-success"></span> Fast	re-order</li>
					<li><span class="fa fa-check text-success"></span> Save your favorites</li>
					<li><span class="fa fa-check text-success"></span> Fast	checkout</li>
					<li><span class="fa fa-check text-success"></span> Get a gift<small>(only new customers)</small></li>
					<li><a href="/read-more/"><u>Read more</u></a></li>
				</ul>
				<p>
					<a href="/new-customer/" class="btn btn-info btn-block">Yes
						please, register now!</a>
				</p>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<%@include file="/WEB-INF/fragments/footer.jsp"%>
</div>
</body>
</html>