<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.beanclass.CenterCode" %>
<%@ page import="com.daoclass.DistinctYear" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.beanclass.StokeYear" %>
<%@ page import="com.daoclass.StrokeDao" %>
<%@ page import="com.beanclass.AllDataTable" %>
<%@ page import="com.daoclass.ToatalDataDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Grpahic Page</title>
</head>
<style>
.demoform {
	display: flex;
	justify-content: space-around;
}

.demoform div {
	margin: 1rem;
}

.selectinput {
	width: 100%;
	border-radius: 5px;
	height: 30px;
	font-size: 18px;
	font-weight: bold;
	border-radius: 10px;
}

#btn {
	background-color: red;
	color: white;
	cursor: pointer;
}

body {
	background-color: #e6f7f6;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 90%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 5px;
}

.canvad {
	display: grid;
	grid-template-columns: 6fr 6fr;
	justify-content: center;
	align-items: center;
	margin: 10px;
	margin-top: 10%;
}
.formlabel{
font-weight:bold;
}
</style>
<body>
	<%
		DistinctYear distinctYear = new DistinctYear();
		ArrayList<CenterCode> cc = distinctYear.showAllCenter();
		
		StrokeDao stroke=new StrokeDao();
		ArrayList<StokeYear>sty=stroke.showAllYear();
		
		ToatalDataDao totd=new ToatalDataDao();
		ArrayList<AllDataTable>alldt=totd.showAllCases();
		
	%>

	<div class="demoform">
		<form action="graphicdata" method="post">
			<div class="selectinput">
				Data Based On <input type="radio" name="checkradio"
					value="1">InPatients <input type="radio"
					name="checkradio" value="2">OutPatients
			</div>
		
	

	<div>
	<label class="formlabel">SELECT CENTER CODE</label>
		<select class="selectinput" name="centercode">
			<%
				for (int i = 0; i < cc.size(); i++) {
			%>
			<%
				CenterCode cd = (CenterCode) cc.get(i);
			%>
			<option value="<%=cd.getCentercode()%>"><%=cd.getCentercode()%></option>
			<%
				}
			%>

		</select>
	</div>


	<div>
	<label class="formlabel">SELECT YEAR</label>
		<select class="selectinput" name="year">

			<%
				for (int i = 0; i < sty.size(); i++) {
			%>
			<%
				StokeYear stokey = (StokeYear) sty.get(i);
			%>
			<option value="<%=stokey.getYear()%>"><%=stokey.getYear() %></option>
			<%
				}
			%>

		</select>
	</div>
	<div>
		<button type="submit" class="selectinput" id="btn">GO</button>
	</div>
</form>
	
</div>
	<div class="canvad">
		<div>
			<table>
			
				<tr>
					<th>YEAR</th>
					
					<th>Active Cases</th>
				</tr>
				<% for(int i=0;i<alldt.size();i++){
				%>
				<%
				AllDataTable alltable=(AllDataTable)alldt.get(i);
				
				%>
					<tr>
					<td><%=alltable.getYear() %></td>
					<td><%=alltable.getActivecase() %></td>
	               </tr>
	               <% 
				}%>
				
				
	<%--		<tr>
					<td>2018</td>
					<td>January</td>
					<td>10</td>
				</tr>
				<tr>
					<td>2019</td>
					<td>Febrauary</td>
					<td>1</td>
				</tr>
				<tr>
					<td>2020</td>
					<td>1200</td>
					<td>5</td>
				</tr>
				<tr>
					<td>2021</td>
					<td>600</td>
					<td>4</td>
				</tr>
				<tr>
					<td>2022</td>
					<td>800</td>
					<td>55</td>
				</tr> --%>	

			</table>
		</div>
		<div>
			<canvas id="myChart" style="width:100%;max-width:700px"></canvas>
		</div>
	</div>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js">
		
	</script>
	<script>
		var xValues = [ "2018", "2019", "2020", "2021", "2022" ];
		var yValues = [ 1000, 1500, 1200, 600, 800 ];
		var barColors = [ "red", "green", "blue", "orange", "brown" ];

		new Chart("myChart", {
			type : "bar",
			data : {
				labels : xValues,
				datasets : [ {
					backgroundColor : barColors,
					data : yValues
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : "STROKE REGISTRY 2016-2023"
				}
			}
		});
	</script>

</body>
</html>