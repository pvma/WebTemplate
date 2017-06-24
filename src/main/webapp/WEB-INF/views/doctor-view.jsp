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
		// As per http://stackoverflow.com/questions/19803926/fullcalendar-within-twitter-bootstrap-tabs
		$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	        $('#calendar').fullCalendar('render');
	    });
		$('#doctor-data-tabs a:first').tab('show');
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
	<div class="col-sm-10">
		<div class="row">
			<div class="pull-right">
				<div class="btn-group">
					<a href="${pageContext.request.contextPath}/patient/secured/doctor/feedback" class="btn btn-default" id="doctor-view-write-feedback"><div class="visible-xs"><span class="glyphicon glyphicon-pencil"></span></div><div class="hidden-xs"><span class="glyphicon glyphicon-pencil"></span>Write Feedback</div></a>
					<a href="${pageContext.request.contextPath}/patient/secured/doctor/recommend" class="btn btn-default" id="doctor-view-recommend"><div class="visible-xs"><span class="glyphicon glyphicon-thumbs-up"></span></div><div class="hidden-xs"><span class="glyphicon glyphicon-thumbs-up"></span>Recommend to a friend</div></a>
				</div>
			</div>
		</div>		
		<div class="row">
			<div class="col-sm-2" style="padding-top: 1.0em">
				<img src="${pageContext.request.contextPath}/resources/images/no-image.png" id="show-original-image" style="width: 100%;"/>
			</div>
			<div class="col-sm-10" style="padding-top: 1.0em">
				<h3>Dr. ${doctor.firstName} ${doctor.lastName}
				<div class="rating-select">
					<span class="glyphicon glyphicon-star" style="color: rgb(192, 192, 192); border: 1;"></span>
					<span class="glyphicon glyphicon-star" style="color: rgb(192, 192, 192);"></span>
					<span class="glyphicon glyphicon-star" style="color: rgb(192, 192, 192);"></span>
					<span class="glyphicon glyphicon-star-empty" style="color: rgb(192, 192, 192);"></span>
					<span class="glyphicon glyphicon-star-empty" style="color: rgb(192, 192, 192);"></span>
				</div>
				</h3>
				<h4>${doctor.specializatons[0].specialization} </h4>
				<h5>${doctor.totalYears} total years experience</h5>
				<p>${doctor.clinics[0].address}</p>
				<br/>
				<p>${doctor.selfDescription}</p>
			</div>
			<ul class="nav nav-tabs" id="doctor-data-tabs">
				<li class="active"><a data-toggle="tab" href="#tab-general-information"><div class="visible-xs"><span class="glyphicon glyphicon-user"></span></div><div class="hidden-xs">General Information</div></a></li>
				<li><a data-toggle="tab" href="#tab-schedule"><div class="visible-xs"><span class="glyphicon glyphicon-calendar"></span></div><div class="hidden-xs">Schedule</div></a></li>
			 	<li><a data-toggle="tab" href="#tab-reviews"><div class="visible-xs"><span class="glyphicon glyphicon-star"></span></div><div class="hidden-xs">Reviews</div></a></li>
			</ul>
			<div class="tab-content" style="padding-left: 15px;">
				<div id="tab-general-information" class="tab-pane fade in active">
					<h3>${doctor.clinics[0].hospital}</h3>
					<div class="col-sm-6">
						<p><span class="glyphicon glyphicon-map-marker"></span>${doctor.clinics[0].address}</p>
						<p><span class="glyphicon glyphicon-earphone"></span>${doctor.clinics[0].contact}</p>
					</div>
					<div class="col-sm-6">
						<c:forEach items="${doctor.clinics[0].schedules}" var="item">
							${item.day} : ${item.timeStart} - ${item.timeEnd} <br/>   
						</c:forEach>
					</div>
				</div>
				<div id="tab-schedule" class="tab-pane fade">
					<div class="row">
						<h3>${doctor.clinics[0].hospital}</h3>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<p><span class="glyphicon glyphicon-map-marker"></span>${doctor.clinics[0].address}</p>
							<p><span class="glyphicon glyphicon-earphone"></span>${doctor.clinics[0].contact}</p>
						</div>
						<div class="col-sm-6">
							<c:forEach items="${doctor.clinics[0].schedules}" var="item">
								${item.day} : ${item.timeStart} - ${item.timeEnd} <br/>   
							</c:forEach>
						</div>
					</div>
					<hr>
					<div class="row">
						<h3>Calendar Schedule</h3>
					</div>
					<div class="row">
						<div id="calendar"></div>
					</div>
				</div>
				<div id="tab-reviews" class="tab-pane fade">
					<h3>${doctor.clinics[0].hospital}</h3>
					<div class="col-sm-6">
						<p><span class="glyphicon glyphicon-map-marker"></span>${doctor.clinics[0].address}</p>
						<p><span class="glyphicon glyphicon-earphone"></span>${doctor.clinics[0].contact}</p>
					</div>
					<div class="col-sm-6">
						<c:forEach items="${doctor.clinics[0].schedules}" var="item">
							${item.day} : ${item.timeStart} - ${item.timeEnd} <br/>   
						</c:forEach>
					</div>
					<p>Some reviews here</p>
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