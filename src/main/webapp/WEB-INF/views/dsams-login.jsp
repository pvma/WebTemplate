<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/fragments/header.jsp"%>
<style type="text/css">
.form-signin {
  max-width: 400px; 
  display:block;
  background-color: #f7f7f7;
  -moz-box-shadow: 0 0 3px 3px #888;
    -webkit-box-shadow: 0 0 3px 3px #888;
	box-shadow: 0 0 3px 3px #888;
  border-radius:2px;
  margin-left: auto ;
  margin-right: auto ;
}
.main{
	padding: 38px;
}
.social-box{
  margin: 0 auto;
  padding: 38px;
  border-bottom:1px #ccc solid;
}
.social-box a{
  font-weight:bold;
  font-size:18px;
  padding:8px;
}
.social-box a i{
  font-weight:bold;
  font-size:20px;
}
.heading-desc{
	font-size:20px;
	font-weight:bold;
	padding:38px 38px 0px 38px;
	
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  font-size: 16px;
  height: 20px;
  padding: 20px;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: 0px;
  border-radius: 5px;
}
.form-signin input[type="password"] {
  margin-bottom: 0px;
  border-radius: 5px;
}
.input-group {
    margin-bottom: 15px;
}
.login-footer{
	background:#f0f0f0;
	margin: 0 auto;
	border-top: 1px solid #dadada;
	padding:20px;
}
.login-footer .left-section a{
	font-weight:bold;
	line-height:19px;
}
.mg-btm{
	margin-bottom:20px;
}
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}
.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}
</style>
<div class="container">
	<div class="row">
		<form class="form-signin mg-btm" name="login" action="<c:url value='/login' />" method="POST">
    	<h3 class="heading-desc">Login</h3>
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		<div class="main">	
            <label>Email</label>    
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            	<input type="text" name="username" id="username" class="form-control" placeholder="" autofocus>
            </div>
            <label>Password <a href="${pageContext.request.contextPath}/forgotpassword" tabindex="-1">(forgot password)</a></label>
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input type="password" name="password" id="password" class="form-control" placeholder="Password">
            </div>
        	<div class="row">
                <div class="col-xs-6 col-md-6">
                     
                </div>
                <div class="col-xs-6 col-md-6 pull-right">
                    <button type="submit" class="btn btn-large btn-success pull-right">Login</button>
                </div>
            </div>
		</div>
        
		<span class="clearfix"></span>	

		<div class="login-footer">
    		<div class="row">
                <div class="col-xs-6 col-md-6">
                    <div class="left-section">
                        <a href="${pageContext.request.contextPath}/patient/register">Create an account</a>
    				</div>
                </div>
                <div class="col-xs-6 col-md-6 pull-right">
                </div>
            </div>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      </form>
	</div>
</div>
<div class="container">
	<%@include file="/WEB-INF/fragments/footer.jsp"%>
</div>
<script type="text/javascript">
</script>
</body>
</html>