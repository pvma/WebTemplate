<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/fragments/header.jsp"%>
<link href="${pageContext.request.contextPath}/resources/core/css/fullcalendar.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/core/css/fullcalendar.print.css" rel="stylesheet" media="print" />
<script	src="${pageContext.request.contextPath}/resources/core/js/fullcalendar.min.js"></script>
<script>
	jQuery(document).ready(function($) {
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,basicWeek,basicDay'
			},
			defaultDate: '2015-02-12',
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2015-02-01'
				},
				{
					title: 'Long Event',
					start: '2015-02-07',
					end: '2015-02-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2015-02-11',
					end: '2015-02-13'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T10:30:00',
					end: '2015-02-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2015-02-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2015-02-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2015-02-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2015-02-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2015-02-28'
				}
			]
		});
	});
</script>
<style>
@media (max-width: 767px) { 
	.nav-tabs > li, .nav-pills > li {
	    float:none;
	    display:inline-block;
	}
	.nav-tabs {
	    text-align:center;
	}
}
</style>
<div class="container">
	<h2>Personal Information</h2>
</div>
<div class="container">
	<div class="col-sm-10">
		<div class="row">
			<div class="pull-right">
				<div class="btn-group">
					<a href="${pageContext.request.contextPath}/patient/secured/update-account" class="btn btn-default" id="doctor-view-write-feedback"><div class="visible-xs"><span class="glyphicon glyphicon-pencil"></span></div><div class="hidden-xs"><span class="glyphicon glyphicon-pencil"></span>Update Account</div></a>
					<a href="${pageContext.request.contextPath}/patient/secured/update-settings" class="btn btn-default" id="doctor-view-recommend"><div class="visible-xs"><span class="glyphicon glyphicon-cog"></span></div><div class="hidden-xs"><span class="glyphicon glyphicon-cog"></span>Update Settings</div></a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-2" style="padding-top: 1.0em">
				<img src="${pageContext.request.contextPath}/resources/images/no-image.png" class="img-responsive" id="show-original-image" style="width: 100%;"/>
			</div>
			<div class="col-sm-10" style="padding-top: 1.0em">
				<h3>Hello there ${patientEntity.firstName} ${patientEntity.lastName}!</h3>
				<div class="row">
					<div class="col-xs-6 col-sm-6">
						<div class="col-xs-6 col-sm-6"><label>Date of Birth:</label></div>
						<div class="col-xs-6 col-sm-6">March 17, 1983</div>
					</div>
					<div class="col-xs-6 col-sm-6">
						<div class="col-xs-6 col-sm-6">32 Years of Age</div>
						<div class="col-xs-6 col-sm-6"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6">
						<div class="col-xs-6 col-sm-6"><label>Current Weight:</label></div>
						<div class="col-xs-6 col-sm-6">76 lbs.</div>
					</div>
					<div class="col-xs-6 col-sm-6">
						<div class="col-xs-6 col-sm-6"><label>Height</label></div>
						<div class="col-xs-6 col-sm-6">5'5</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6">
						<div class="col-xs-6 col-sm-6"><label>Nationality</label></div>
						<div class="col-xs-6 col-sm-6">Filipino</div>
					</div>
					<div class="col-xs-6 col-sm-6">
						<div class="col-xs-6 col-sm-6"><label>Place of Birth</label></div>
						<div class="col-xs-6 col-sm-6">Philippines</div>
					</div>
				</div>
			</div>
			<ul class="nav nav-tabs" id="doctor-data-tabs">
				<li class="active" title="Appointments"><a data-toggle="tab" href="#tab-appointments"><div class="visible-xs"><span class="glyphicon glyphicon-calendar"></span></div><div class="hidden-xs">Appointments</div></a></li>
				<li title="Medical History"><a data-toggle="tab" href="#tab-attended"><div class="visible-xs"><span class="glyphicon glyphicon-heart"></span></div><div class="hidden-xs">Medical History</div></a></li>
			  	<li title="Reviews & Recommendations"><a data-toggle="tab" href="#tab-reviews"><div class="visible-xs"><span class="glyphicon glyphicon-star"></span></div><div class="hidden-xs">Reviews & Recommendations Made</div></a></li>
			</ul>
			<div class="tab-content" style="padding-left: 15px;">
				<div id="tab-appointments" class="tab-pane fade in active">
					<div class="row">
						<h3>Alerts</h3>
					</div>
					<hr>
					<div class="row">
						<h3>Calendar Appointments</h3>
					</div>
					<div class="row">
						<div id="calendar"></div>
					</div>
				</div>
				<div id="tab-attended" class="tab-pane fade">
					<div class="row">
						<h3>Doctor Consulted</h3>
					</div>
					<hr>
					<div class="row">
						<h3>Specialization Tried</h3>
					</div>
					<hr>
					<div class="row">
						<h3>Current Medications</h3>
					</div>
				</div>
				<div id="tab-reviews" class="tab-pane fade">
					<div class="row">
						<h3>Reviews Written</h3>
					</div>
					<hr>
					<div class="row">
						<h3>Recommended Doctors</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-2">
		<table class="table table-bordered" style="height: 100%; min-height: 100%;">
			<tbody>
				<tr>
					<td>
						Put Banner Here...
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="container">
	<%@include file="/WEB-INF/fragments/footer.jsp"%>
</div>
</body>
</html>
