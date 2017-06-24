<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/fragments/header.jsp"%>
<div class="container">
	<h4>Welcome Patient!</h4>
	<div class='row'>
		<div class='col-sm-6'>
			<div class='row'>
				<div class="form-group">
					<label class="control-label col-sm-4" for="oldProductBrand">Location</label>
					<div class="col-sm-8">
						<input type="text" id="oldProductBrand" placeholder="Brand search" autocomplete="off" class="typeahead form-control gpi-fields"  name="filter.brand"/>
					</div>
				</div>
			</div>
		</div>
		<div class='right-column col-sm-6'>
			<div class='row'>
				<div class="form-group" id="employee-number-control-group">
					<label class="control-label col-sm-4">Specialty</label>
					<div class="controls col-sm-8">
						<input type="text" id="employeeNumber" placeholder="Employee no." name="filter.employeeNumber" class="form-control ect-only" />
					</div>
				</div>
			</div>
			<br/>
			<div class='row'>
				<div class="form-group">
					<div class="controls col-sm-offset-4 col-sm-8">
						<s:submit name="doSearch" class="btn btn-primary" id="search-button">Search</s:submit>&nbsp;<span id="search-spinner" style="display: inline-block;margin-left:5px"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<%@include file="/WEB-INF/fragments/footer.jsp"%>
</div>
</body>
</html>