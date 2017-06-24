<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="/WEB-INF/fragments/header.jsp"%>
<style>
.glyphicon.glyphicon-star {
	font-size: 25px;
}
.glyphicon.glyphicon-star-empty {
	font-size: 25px;
}
.nav-tabs > li, .nav-pills > li {
    float:none;
    display:inline-block;
}
.nav-tabs {
    text-align:center;
}
</style>
<div class="container">
	<div class="header">Find a doctor</div>
	<form action="${pageContext.request.contextPath}/doctor/dosearch"
		class="form-horizontal" id="search-doctors-form">
		<div class="well">
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label class="control-label col-sm-2" for="doctor-location">Location</label>
					<div class="col-sm-10">
						<input type="text" id="doctor-location"
							name="doctorEntity.location"
							placeholder="Doctor office location..." class="form-control" "/>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="doctor-location">Doctor's Name</label>
					<div class="col-sm-10">
						<input type="text" id="doctor-name"
							name="doctorEntity.name"
							placeholder="Doctor's name..." class="form-control" "/>
					</div>
				</div>
			</div>
			<div class="right-column col-sm-6">
				<div class="form-group" id="employee-number-control-group">
					<label class="control-label col-sm-2" for="doctor-specialty">Specialty</label>
					<div class="controls col-sm-10">
						<input type="text" id="doctor-specialty"
							name="doctorEntity.specialty"
							placeholder="Doctor specialization..." class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="doctor-location">Hospital</label>
					<div class="col-sm-10">
						<input type="text" id="hospital"
							name="doctorEntity.hospital"
							placeholder="Hospital..." class="form-control" "/>
					</div>
				</div>
				<br />
				<div class="form-group form-inline">					
					<div class="controls col-sm-offset-2 col-sm-2">
						<button type="submit" name="doSearch" class="btn btn-primary"id="search-button">
							<span class="glyphicon glyphicon-search"></span>
							Search
						</button>
					</div>
					<div id="search-button-spinner" class="col-sm-2 spinner-search" style="display: none;">
						<img src="${pageContext.request.contextPath}/resources/images/spinner.gif" />
					</div>
					
				</div>
			</div>
		</div>
		</div>
	</form>
	<div class="table-wrap graph-table col-sm-12">
		<table id="doctor-table" class="tablesorter" style="width: 100%">
			<tbody id="doctor-table-list"></tbody>
		</table>
		<div id="pagination-bottom" class="pull-right">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="container">
	<%@include file="/WEB-INF/fragments/footer.jsp"%>
</div>
<script>
	jQuery(document).ready(function($) {
		$("#search-doctors-form").submit(function(event) {
			event.preventDefault();
			doSearch();
		});
	});

	function doSearch() {

		var search = {}
		search["doctorLocation"] = $("#doctor-location").val();
		search["doctorSpecialization"] = $("#doctor-specialty").val();
		var tableBody = $('#doctor-table-list');

	    var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${pageContext.request.contextPath}/doctor/dosearch",
			data : JSON.stringify(search),
			dataType : 'json',
			timeout : 100000,
			beforeSend : function(xhr, settings) {
				var csrfParameter = $("meta[name='_csrf_parameter']").attr("content");
				var csrfHeader = $("meta[name='_csrf_header']").attr("content");
				var csrfToken = $("meta[name='_csrf']").attr("content");
				xhr.setRequestHeader(csrfHeader, csrfToken);  
				var tableBody = $('#doctor-table-list');
				tableBody.find('tr').remove();
				$('#search-button-spinner').show();
				$('#search-button').attr('disabled', true);
			},
			success : function(data) {
				$(data).each(function(index, item) {
					var tr = $(document.createElement('tr'));
					tr.data("values",
					{
						id : item.id,
						firstName : item.firstName,
						lastName : item.lastName,
						description : item.selfDescription
					});

					var panelStart = '<div class="panel panel-default">';
					var panelHeading = '<div class="panel-heading">';
					var panelBody = '<div class="panel-body">';
					var panelEnd = '</div>';

					var doctorImage = '<div class="col-sm-2" style="padding-top: 1.0em">';
					doctorImage += '<img src="${pageContext.request.contextPath}/resources/images/no-image.png" id="show-original-image" style="width: 80%;" class="img-thumbnail center-block"/><br/>';
					doctorImage += '</div>';

					var doctorView = '<div class="col-sm-3 col-md-4" style="padding-top: 1em">';
					doctorView += '<a href="${pageContext.request.contextPath}/doctor/view/'+item.id+'"> Dr. '
							+ item.firstName
							+ ' '
							+ item.lastName + '</a>';
					doctorView += '<div class="strong">'
							+ item.specializatons[0].specialization
							+ '</div>';
					doctorView += '<div class="info">'
							+ item.totalYears
							+ ' total years experience</div>';
					doctorView += '<br/>';
					doctorView += '<div class="info">'
							+ item.clinics[0].address
							+ '</div>';
					doctorView += '</div>';

					var doctorRating = '<div class="col-sm-4 col-md-3" style="padding-top: 1em">';
					doctorRating += '<div class="rating-select">';
					doctorRating += '<span class="glyphicon glyphicon-star" style="color: rgb(192, 192, 192); border: 1;"></span>';
					doctorRating += '<span class="glyphicon glyphicon-star" style="color: rgb(192, 192, 192);"></span>';
					doctorRating += '<span class="glyphicon glyphicon-star" style="color: rgb(192, 192, 192);"></span>';
					doctorRating += '<span class="glyphicon glyphicon-star-empty" style="color: rgb(192, 192, 192);"></span>';
					doctorRating += '<span class="glyphicon glyphicon-star-empty" style="color: rgb(192, 192, 192);"></span>';
					doctorRating += '</div>';
					doctorRating += '</div>';

					var doctorOptions = '<div class="col-sm-3 col-md-3" style="padding-top: 1em">';
					doctorOptions += '<div class="btn-group-vertical center-block">';
					doctorOptions += '<a href="${pageContext.request.contextPath}/doctor/view/'+item.id+'" class="btn btn-default" id="doctor-quick-link-view">View Profile</a>';
					doctorOptions += '<a href="${pageContext.request.contextPath}/patient/secured/doctor/book" class="btn btn-default" id="doctor-quick-link-book">Book Appointment</a>';
					doctorOptions += '<a href="${pageContext.request.contextPath}/patient/secured/doctor/recommend" class="btn btn-default" id="doctor-quick-link-recommend">Recommend</a>';
					doctorOptions += '</div>';
					doctorOptions += '</div>';

					var doctorRow = panelStart
							+ doctorImage + doctorView
							+ panelBody + doctorRating
							+ doctorOptions + panelEnd
							+ panelEnd;

					$('<td>').html(doctorRow).appendTo(
							tr);
					tableBody.append(tr);
				});
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log("ERROR: ", textStatus);
			},
			complete : function(data) {
				$('#search-button-spinner').hide();
				$('#search-button').attr('disabled', false);
			}
		});

	}
</script>
</body>
</html>
