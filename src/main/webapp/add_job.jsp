<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- jstl jar -->
   <%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add_job</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
   body{
	   background-color:white;
	    overflow-x :hidden;
	   width:100%;
	   height:70vh;
	   background-repeat: no-repeat;
	   background-size: cover;
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
  button{
  margin-left:23%;
 
  
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
     
       <div class="continer-fluid ">
          <div class="row g-3 ">
             <div class="col-md-6 offset-md-3">
                 <div class="card main">
					<div class="card-body">
						<div class="text-center text-success">
							<i class="fa fa-user-friends fa-3x"></i>
							
							
						<c:if test="${not empty succMsg }">  <!--Jstl jar codes  -->     
					        <div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg"/>
							
    					</c:if>
    					
    						 
							<h5>Add Jobs</h5>
							<hr class="featurette-divider w-90 mx-4">
						</div>
						
						<form action="add_job" method="post">
							<div class="form-group">
								<label for="title1" class="form-label">Enter Title</label> <input
									type="text" name="title" class="form-control" id="title1"
									placeholder="Enter Title here " required class="form-control" autofocus>
							</div>
                                 
							<div class="d-flex">
								<div class="form-group col-md-4">
									<label for="selecter1" class="form-label">Location</label> <select
										class="form-select" name="Location" id="selecter1" required>               
										<option selected disabled value="">Choose...</option>
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
										<option selected disabled value="">Choose...</option>										
										<option value="Java Developer">Java Developer</option>											
										<option value=".Net Developer">.Net Developer</option>
										<option value="PHP Developer">PHP Developer</option>											
										<option value="C++ Developer">C++ Developer</option>										
										<option value="Back-End Developer">Back-End Developer</option>
										<option value="C Developer">C Developer</option>
										<option value="Angular Developer">Angular Developer</option>
										<option value="React Developer">React Developer</option>
										<option value="Full-Stack Developer">Full-Stack Java Developer</option>
										<option value="JavaScript Developer">JavaScript Developer</option>									
										<option value="Angular Developer">Angular Developer</option>
										<option value="DevOps Developer">DevOps Developer</option>
									</select>
								</div>
								  &nbsp;
								<div class="form-group col-md-4">
									<label for="selecter3" class="form-label">Status</label> <select
										class="form-select" name="status" id="selecter3" required>
										<option selected disabled value="">Choose..</option>
										<option class="Active" value="Active">Active</option>
										<option class="Inactive" value="Inactive">Inactive</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="Frmgrp" class="form-label">Enter Description</label>
								<textarea class="form-control" name="desc" id="Frmgrp" rows="3"
									cols="" required placeholder="Enter Description here "></textarea>
							</div>
							<br>

							<button class="btn btn-primary w-50 ">Publish Job</button>					   
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	


</body>
</html>
