
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
<title>photos</title>
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
   .kk{
        
            justify-content: center;
            align-items: center;
           
       
   }
  .img1{
     width:90vh;
     height:55vh;
          
       overflow-x: hidden;
       box-shadow: 5px 5px 5px rgba( 255,255,255,0.2),
	    			-10px -10px 10px rgba(15, 14, 15, 0.1),
	                 inset -5px 5px 5px rgba( 255,255,255,0.2),       
		               inset -8px 8px 8px rgba(15, 14, 15, 0.1),
		               inset 8px 8px 8px rgba(15, 14, 15, 0.1),
		                inset -8px -8px 8px rgba(15, 14, 15, 0.1);
           border-radius: 10px;
		     background-repeat: no-repeat;
			  background-size: cover;
			  margin-left:18%;
			   justify-content: center;
            align-items: center;
           
     
   }
   
   @media screen and (min-width: 993px) {
	.naviteme2.dropdown-menu.show {
		display: none !important;
	}
	.naviteme2:hover .dropdown-menu {
		display: block !important;
	}
	.naviteme2:focus .dropdown-menu {
		display: none !important;
	}
   
   .vishu{
       margin-bottom:4px;
   }
  
   .dpdn{
            display: flex;
           
            align-items: center;
           justify-content: space-between;
           
           padding:2px;
           margin-right:6rem;
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

	<div class="continer-fluid ">
		<div class="row kk">
			<div class="col-md-7 m-2 ">
				<h6 class="text-center text-primary"><i class="fa-solid fa-image">&nbsp;photos</i></h6>
				
      			
					<c:if test="${not empty succMsg }">  <!--Jstl jar codes  -->     
					        <div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg"/>
						</c:if>

				<%
				int id=Integer.parseInt(request.getParameter("id"));
				PhotosDao dao = new PhotosDao(DBConnect.getConn());
				List<User> list = dao.getAllPhotos(id);
				for (User j : list) {
				%>
				<div class="card mt-2 main">
					<div class="card-body ">
						<div class="text-primary dpdn">
				 
						<h5><i class="fa-solid fa-user-tie"></i>  ${userobj.name}</h5>	
						 
					<li class="nav-item dropdown naviteme2">
					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown"> </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                
							<li><a class="dropdown-item" href="Edit_photos.jsp?id=<%=j.getImageId() %>"><i class="fa-solid fa-pen-to-square"></i>&nbsp;Edit Post</a></li>
						
							<li><a class="dropdown-item" href="deletepost?id=<%=j.getImageId() %>"><i class="fa-solid fa-trash"></i>&nbsp;Delete</a></li>
						</ul>
					</li>
					
						</div>
						 
						<div class="container vishu">
                        <h6 class="text-muted">Publish Date:&nbsp;<%=j.getPdate() %></h6>
                        
							 <h6 class="text-success">Description:
						
						     <p class="text-muted mx-4"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=j.getDescription() %></p>
						     </h6>
                        <hr class="featurette-divider">
                  
						</div>
						
							<div class="form-group col-md-3 vks">
								<img alt="" class="img1" src="userimg\<%=j.getImage() %>">
							</div>
							
					
			
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