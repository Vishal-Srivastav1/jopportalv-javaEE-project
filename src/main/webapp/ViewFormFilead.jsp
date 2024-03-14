
<%@page import="com.entity.Applyjobuser"%>

<%@page import="com.dao.ApplyDao"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.PhotosDao"%>
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
<title>Form Details</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
body  {
	background-color: #081b29;
	overflow-x :hidden;
		margin-top:20px;
}
.sm{
 width:80%;
 margin-left:10%;
 

}
 .main{
 
 box-shadow: 5px 0px 10px gray,
           -5px 0px 10px gray,
           
           5px 0px 10px gray,
           -5px 0px 10px gray;
          
                border-radius: 10px;
                overflow-x :hidden;
}

.main:hover {
  background-color:cyan;
  color: blue;
 
}
.rk{
  background-color:yellow;
  color:blue;
  
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

	<div class="container ">
		<div class="row ">
			<div class="col-md-10 sm">
				<h5 class="text-center text-primary">Filled Form Details</h5>
				       <div class="text-white">
				       <h6>Profile: ${userobj.name}</h6>
				       </div>
      			
					<c:if test="${not empty succMsg }">  <!--Jstl jar codes  -->     
					        <div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg"/>
						</c:if>

				<%
				   int count=0;
					int id=Integer.parseInt(request.getParameter("id"));
				 //int id=Integer.parseInt(request.getParameter("userobj"));	
				ApplyDao dao = new ApplyDao(DBConnect.getConn());
				List <Applyjobuser> list=dao.applygetUserformDetails(id);
				for (Applyjobuser j : list)
				{
					count++;
				%>
				<div class="card mt-2 main">
					<div class="card-body ">
					<div class="text-center w-25">
					<h6 class="rk">Form Details: <%=count %></h6>
					</div>
							<hr class="featurette-divider">
					 
                   <table class="table">
					<tbody>
								<tr>
									<th scope="row">Date:</th>
									<th><%=j.getPdate() %></th>
								</tr>

								<tr>
									<th scope="row">Name:</th>
									<th><%=j.getName() %></th>
								</tr>
								<tr>
									<th scope="row">Qualification</th>
									<th><%=j.getQua() %></th>
								</tr>

								<tr>
									<th scope="row">Email</th>
									<th>
									 <a href="gmail.com" ><%=j.getEmail() %></a>
									</th>
								</tr>
								
								<tr>
									<th scope="row">State:</th>
									<th><%=j.getState() %></th>
								</tr>
								
								<tr>
									<th scope="row">Dist/City :</th>
									<th><%=j.getDist() %></th>
								</tr>
								
								<tr>
									<th scope="row">photo: </th>
									<th><%=j.getPhoto() %></th>
								</tr>
								
								<tr>
									<th scope="row">Resume:</th>
									<th><%=j.getResume() %></th>
								</tr>

							</tbody>
						</table>
					
						
						</div>
					</div>
				

				<%
				}
				%>
			</div>
		</div>
	</div>
 <br>

</body>
</html>