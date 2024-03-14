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
<c:if test="${ empty userobj }"> 
   <c:redirect url="login.jsp"></c:redirect>
  </c:if>
     <c:if test="${userobj.role eq 'admin' }"> 
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
							
							<i class="fa-solid fa-camera">&nbsp;Post Photos</i>
							
						<c:if test="${not empty succMsg }">  <!--Jstl jar codes  -->     
					        <div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg"/>
							
    					</c:if>
    					
    						 
							
							<hr class="featurette-divider w-90 mx-4">
						</div>
						
						<form action="uploadphotos"  method="post" enctype="multipart/form-data">
							    <input type="hidden" name="userid" value="${userobj.id}">
							<div class="form-group">
								<label for="Frmgrp" class="form-label">Enter Description</label>
								<textarea class="form-control" name="remark" id="Frmgrp" rows="3"
									cols=""  placeholder="Enter Description here "  required></textarea>
							</div>
							
							<div class="form-group">
								<label for="title1" class="form-label">chose photos</label> <input
									type="file" name="files" class="form-control" id="title1"
									 required class="form-control">
							</div>
							
							

							<button class="btn btn-primary w-50 ">Upload</button>					   
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	


</body>
</html>
