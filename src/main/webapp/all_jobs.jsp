<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="ISO-8859-1">
<title>Active-Jobs</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
body {
	background: cyan;
	overflow-x :hidden;
	margin-top:20px;
}
button{
  margin-left:5%;
  margin-right:5%;
  
}
    .main{
	    box-shadow: 5px 5px 5px rgba( 255,255,255,0.2),
	    			-10px -10px 10px rgba(15, 14, 15, 0.1),
	                 inset -5px 5px 5px rgba( 255,255,255,0.2),       
		               inset -8px 8px 8px rgba(15, 14, 15, 0.1),
		               inset 8px 8px 8px rgba(15, 14, 15, 0.1),
		                inset -8px -8px 8px rgba(15, 14, 15, 0.1);
           border-radius: 10px;
   }
	

.main1{

    box-shadow: 5px 0px 10px gray,
           -5px 0px 10px gray,
           
           5px 0px 10px gray,
           -5px 0px 10px gray;
          
                border-radius: 10px;
}
.main1:hover {
  background-color:cyan;
  color:gray;
}


</style>
</head>
<body>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
	<%@include file="all_component/navbar.jsp"%>
	<br>

	<div class="container">
		<div class="row ">
			<div class="col-md-12 ">
				<h5 class="text-center text-primary">All Active Jobs</h5>

				<div class="card main">
					<div class="card-body">

						<form class="form-inline" action="more_view.jsp" method="post">

							<div class=" row g-2 ">
								<div class="form-group col-md-5 mt-1">
									<h5>Location</h5>
								</div>

								<div class="form-group col-md-4 mt-1">
									<h5>Category</h5>
								</div>
							</div>
							<div class="d-flex">
								<div class="form-group col-md-5">

									<select name="loc" class="form-select" >
										<option selected value="lo">Choose...</option>
										<option value="Hydrabad">Hydrabad</option>
										<option value="Banglore">Banglore</option>
										<option value="Chennai">Chennai</option>
										<option value="Delhi">Delhi</option>
										<option value="Gorakhpur">Gorakhpur</option>
										<option value="Lucknow">Lucknow</option>
										<option value="Bhopal">Bhopal</option>
										<option value="Gujrat">Gujrat</option>
										<option value="Noida">Noida</option>
										<option value="Jharkhand">Jharkhand</option>
										<option value="Odisha">Odisha</option>

									</select>
								</div>
								&nbsp;

								<div class="form-group col-md-4">
									<select name="cat" class="form-select" >
										<option selected value="ca">Choose...</option>
										<option value="Java Developer">Java Developer</option>
										<option value=".Net Developer">.Net Developer</option>
										<option value="PHP Developer">PHP Developer</option>
										<option value="C++ Developer">C++ Developer</option>
										<option value="Back-End Developer">Back-End Developer</option>
										<option value="C Developer">C Developer</option>
										<option value="Angular Developer">Angular Developer</option>
										<option value="React Developer">React Developer</option>
										<option value="Full-Stack Developer">Full-Stack Java
											Developer</option>
										<option value="JavaScript Developer">JavaScript
											Developer</option>
										<option value="Angular Developer">Angular Developer</option>
										<option value="DevOps Developer">DevOps Developer</option>
									</select>
									
								</div>
								&nbsp;												
								<button class="btn btn-primary w-25" >Search</button>
			
							</div>
							<br>
						</form>

					</div>
				</div>
             <br>
				<%
				JobDAO dao = new JobDAO(DBConnect.getConn());
				List<Jobs> list = dao.getAllJobsForUser();
				for (Jobs j : list) {
				%>
				<div class="card mt-2 main1">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
							<hr class="featurette-divider">
						</div>

						<h6><%=j.getTitle()%></h6>

						<%
						if (j.getDescription().length() > 0 && j.getDescription().length() < 120) {
						%>
						<p><%=j.getDescription()%></p>
						<%
						} else {
						%>
						<p><%=j.getDescription().substring(0, 120)%>...
						</p>
						<%
						}
						%>

						<br>
						<div class="form-row d-flex">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Location:<%=j.getLocation()%>" readonly>
							</div>
							&nbsp;
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Category:<%=j.getCategory()%>" readonly>
							</div>
							&nbsp;
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Status:<%=j.getStatus()%>" readonly>
							</div>
						</div>
						<br>

						<h6>
							Publish Date:<%=j.getPdate()%></h6>
						<div class="text-center ">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View More</a> <br>
							<br>
						</div>
					</div>
				</div>
     <br>
				<%
				}
				%>
				<br>
			</div>
		</div>
	</div>



</body>
</html>