<%@page import="com.entity.Jobs"%>
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
<title>Edit_Jobs</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
   body{
	   background:cyan;
	   width:100%;
	   height:70vh;
	   background-repeat: no-repeat;
	   background-size: cover;
	   overflow-x :hidden;
	   margin-top:20px;
   }
   button{
       margin-left:23%;
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
   <c:if test="${userobj.role ne 'admin' }"> 
    <c:redirect url="login.jsp"></c:redirect>
   </c:if>
   <%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
	<%@include file="all_component/navbar.jsp"%>

     <br>
     <br>
     
       <div class="continer-fluid">
          <div class="row g-3 ">
             <div class="col-md-6 offset-md-3">
                 <div class="card main">
					<div class="card-body">
						<div class="text-center text-success">
							<i class="fa fa-user-friends fa-3x"></i>
									
				<%
				int id=Integer.parseInt(request.getParameter("id"));
				JobDAO dao=new JobDAO(DBConnect.getConn()); 
				Jobs j=dao.getJobById(id);
				%>				
		    					
    		 				 
							<h5>Edit Jobs</h5>
							<hr class="featurette-divider w-90 mx-4">
						</div>
						<br>
						
						<form action="update" method="post">
						<input type="hidden" value="<%=j.getId() %>" name="id">
						
						
							<div class="form-group">
								<label for="title1" class="form-label">Enter Title</label> <input
									type="text" name="title" class="form-control" id="title1"
									placeholder="Enter Title here " required class="form-control" value="<%=j.getTitle() %>">
							</div>
                                 
							<div class="d-flex">
								<div class="form-group col-md-4">
									<label for="selecter1" class="form-label">Location</label> <select
										class="form-select" name="Location" id="selecter1" required>               
										<option value="<%=j.getLocation() %>"><%=j.getLocation() %></option>
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
									<label for="selecter2" class="form-label">Category</label> <select
										class="form-select" name="category" id="selecter2" required>
										<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>										
										<option value="Front-End Developer">Front-End Developer</option>											
										<option value=".Net Developer">.Net Developer</option>
										<option value="PHP Developer">PHP Developer</option>											
										<option value="C++ Developer">C++ Developer</option>										
										<option value="Back-End Developer">Back-End Developer</option>
										<option value="C Devloper">C Devloper</option>
										<option value="Angular Developer">Angular Developer</option>
										<option value="React Developer">React Developer</option>
										<option value="Full-Stack Developer">Full-Stack Developer</option>
										<option value="JavaScript Developer">JavaScript Developer</option>									
										<option value="Angular Developer">Angular Developer</option>
										<option value="DevOps Developer">DevOps Developer</option>
									</select>
								</div>
								  &nbsp;
								<div class="form-group col-md-4">
									<label for="selecter3" class="form-label">Status</label> <select
										class="form-select" name="status" id="selecter3" required>
										<option  value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
										<option class="Active" value="Active">Active</option>
										<option class="Inactive" value="Inactive">Inactive</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="Frmgrp" class="form-label">Enter Description</label>
								<textarea class="form-control" name="desc" id="Frmgrp" rows="3"  
									cols="" required ><%=j.getDescription()%>								
								</textarea>
							</div>
							<br>
							
							<button class="btn btn-primary w-50">Update Job</button>
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	


</body>
</html>
