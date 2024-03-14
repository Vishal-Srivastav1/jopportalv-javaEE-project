
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- jstl jar -->
   <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Admin: View jobs</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
body {
	background-color: #081b29;
	overflow-x :hidden;
	margin-top:20px;
}
.sm{
 margin-left:40%;
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
  color: blue;
 
}

</style>
</head>
<body>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row ">
			<div class="col-md-11 mx-4">
				<h5 class="text-center text-primary">All Jobs</h5>
			<%
				int id=Integer.parseInt(request.getParameter("id"));
				JobDAO dao = new JobDAO(DBConnect.getConn());
				Jobs j=dao.getJobById(id);
			%>
				
				<div class="card mt-2 main1">
					<div class="card-body m-2">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
							<hr class="featurette-divider">
						</div>

						<h6><%=j.getTitle() %></h6>
						<p><%=j.getDescription()%></p>
						<br>
						<div class="form-row d-flex">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							&nbsp;
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
							&nbsp;
							
						</div>
						<br>
						
						<h6>Publish Date:<%=j.getPdate() %></h6>
						<br>
						<a href="jobApply.jsp?id=${userobj.id}"
								class="btn btn-sm bg-primary text-white w-25 sm" >Apply</a> <br>
							
					
					</div>
					
				</div>
				
			</div>
		</div>
	</div>

</body>
</html>