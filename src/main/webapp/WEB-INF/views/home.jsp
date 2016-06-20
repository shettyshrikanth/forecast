<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>
<head>
<title>Weather Details Application</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/flick/jquery-ui.css" rel="stylesheet"/>	
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"	rel="stylesheet"/>

<style type="text/css">
.ui-menu .ui-menu-item a, .ui-menu .ui-menu-item a.ui-state-hover,
	.ui-menu .ui-menu-item a.ui-state-active {
	font-weight: normal;
	margin: -1px;
	text-align: left;
	font-size: 14px;
}

.ui-autocomplete-loading {
	background: white url("/images/ui-anim_basic_16x16.gif") right center no-repeat;
}
</style>

<script>
	$(document).ready(
			function() {
				$("#detail").hide();
				$("#error").hide();

				$("#search").click(
					function() {
						var city = $("#city").val();
						$("#detail").hide();
						$("#error").hide();

						$.getJSON(
								"http://localhost:8080/forecast/getByCity?&city="+ city, 
								function(data) {
									if(data.cod == 200) {
										populate(data);	
									} else {
										$("#error").text(data.message);
										$("#error").show();
									}										
								});
					});

				$("#city").autocomplete( {
					source : function(request, response) {
						$.getJSON(
								"http://gd.geobytes.com/AutoCompleteCity?callback=?&template=<geobytes%20city>,<geobytes%20internet>&q="+ request.term, 
								function(data) {
									response(data);	
						        });
					},
					minLength : 3,
					open : function() {
						$(this).removeClass("ui-corner-all")
								.addClass("ui-corner-top");
					},
					close : function() {
						$(this).removeClass("ui-corner-top")
								.addClass("ui-corner-all");
					}
				});
				
				$("#city").autocomplete("option", "delay", 100);

			});

	var options = {
		hour : 'numeric',
		minute : 'numeric',
		hour12 : true
	};

	function populate(weatherData) {
		var sunriseToday = new Date(weatherData.sys.sunrise * 1000);
		$("#today").text(sunriseToday.toLocaleDateString())
		$("#citylbl").text(weatherData.name);
		$("#decription").text(
				weatherData.weather[0].description.charAt(0).toUpperCase()
						+ weatherData.weather[0].description.slice(1));
		$("#fahrenheit").text(weatherData.main.temp);
		$("#celsius").text(Math.round((weatherData.main.temp - 32) * 5 / 9));
		$("#sunrise").text(sunriseToday.toLocaleTimeString('en-GB', options));
		$("#sunset").text(
				new Date(weatherData.sys.sunset * 1000).toLocaleTimeString(
						'en-GB', options));
		$("#detail").show();
	}
</script>
</head>

<body>
	<div class="container-1">
		<input type="text" id="city" placeholder="City..." />&nbsp;&nbsp; <span
			id="search" class="icon" style="cursor: pointer;"><i
			class="fa fa-search"></i></span>
	</div>
	<br>
	<label id="error" style="color: red; font-weight: bold;"></label>
	<div id="detail">
		<table>
			<tr>
				<td><label>Today’s Date</label></td>
				<td>:&nbsp;<label id="today"></label></td>
			</tr>
			<tr>
				<td><label>City Name</label></td>
				<td>:&nbsp;<label id="citylbl"></label></td>
			</tr>
			<tr>
				<td><label>Weather</label></td>
				<td>:&nbsp;<label id="decription"></label></td>
			</tr>
			<tr>
				<td><label>Temperature</label></td>
				<td>:&nbsp;<label id="fahrenheit"></label>(°F)&nbsp;<label
					id="celsius"></label>(°C)
				</td>
			</tr>
			<tr>
				<td><label>Sunrise</label></td>
				<td>:&nbsp;<label id="sunrise"></label></td>
			</tr>
			<tr>
				<td><label>Sunset</label></td>
				<td>:&nbsp;<label id="sunset"></label></td>
			</tr>
		</table>
	</div>
</body>
</html>
