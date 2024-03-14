
<%@page import="com.entity.Applyjobuser"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.PhotosDao"%>
<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Edit post</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
body {
	background: cyan;
	overflow-x :hidden;
	margin-top:20px;
}
.main{

         align-item:center;
           overflow-x: hidden;
   }
 
    button{
       margin-left:23%;
   }
   .kk{
        
            justify-content: center;
            align-items: center;
           
       
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

	<div class="continer-fluid">
		<div class="row kk">
			<div class="col-md-9 m-2 ">
				<h5 class="text-center text-primary">Edit Post</h5>
				
      			
					<c:if test="${not empty succMsg }">  <!--Jstl jar codes  -->     
					        <div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg"/>
						</c:if>

				
				
				<%
				int id=Integer.parseInt(request.getParameter("id"));
				PhotosDao dao = new PhotosDao(DBConnect.getConn());
				User j=dao.getphotoId(id);
				%>		
				
				<div class="card mt-2 main">
					<div class="card-body ">
						<div class="text-primary">
							 <h5>Profile: ${userobj.name}</h5>	 					
						</div>
						
						
						<form action="upphotos" method="post" enctype="multipart/form-data">
						   <input type="hidden" name="imageid" value="<%=j.getImageId() %>">
						
						
							<div class="form-group">
								<label for="Frmgrp" class="form-label">Enter Description</label>
								<textarea class="form-control" name="remark" id="Frmgrp" rows="3"
									cols=""  required ><%=j.getDescription()%>
									</textarea>
							</div>
							
							<div class="form-group">
								<label for="title1" class="form-label">chose photos</label>
								 <input	type="file" name="files" class="form-control" id="title1"
								 class="form-control" required >
							</div>
							
							 <br>
							<button type="submit" class="btn btn-primary w-50">Update </button>
						
						</form>
							
						
						</div>
					</div>
				

			</div>
		</div>
	</div>
   <br>

</body>
</html>