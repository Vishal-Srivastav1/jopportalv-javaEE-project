
<%@page import="java.util.ArrayList"%>
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
	background: cyan;
	overflow-x :hidden;
	margin-top:20px;
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

</style>
</head>
<body>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container ">
		<div class="row ">
			<div class="col-md-12 m-4">
				<h5 class="text-center text-primary">All Jobs</h5>
				
      			<%
      			
      			String cat=request.getParameter("cat");
      			String loc=request.getParameter("loc");
      			String msg = "";
     	
				
				JobDAO dao = new JobDAO(DBConnect.getConn());
				List<Jobs> list = null;
				
				 
				  if("lo".equals(loc) && "ca".equals(cat)){
					  list= new ArrayList<Jobs>(); 
				        msg="Job Not Founds.."; 
				   }
				  
				  else if("lo".equals(loc) || ("ca".equals(cat))){				 
					  
					  list=dao.getJobLocORCate(cat,loc);
					   
			   
				   }else{
					   
					   list=dao.getJobLocANDCate(cat, loc);
					  
				   }
					  
					  
					  
					  if(list.isEmpty()){
					   %>
					   <h4 class="text-center text-denger">Job Not Available..</h4>
					  
					   <%
					  
				   }
				  
				   
					   
				  
				   if(list!=null){
				
				for (Jobs j : list) {
				%>
				<div class="card mt-2 main">
					<div class="card-body m-2">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle() %></h6>
						<p><%=j.getDescription() %></p>
						<br>
						<div class="form-row d-flex">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Location:<%=j.getLocation() %>" readonly>
							</div>
							&nbsp;
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm "
									value="Category:<%=j.getCategory() %>" readonly>
							</div>
							&nbsp;
							
						</div>
						<br>
						
						<h6>Publish Date:<%=j.getPdate() %></h6>
						<div class="text-center ">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">View More</a> <br>
							<br>
						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</div>
	</div>


</body>
</html>