<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <%@ page isELIgnored="false" %>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JobPortal - Jobs-Recruitment - Job Search</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>

<style type="text/css">
.back-img {
	
	width: 100%;
	
	 background-repeat: no-repeat;
	 background-size: cover;
}
.homepage{
   width: 100%;
}

.vxy{
  margin-bottom:37%;
}

body{

	margin: 18px;

	overflow-x: hidden;
	
    box-shadow: 10px 25px 20px gray,
           -10px -5px 20px gray,
           
           10px -5px 20px gray,
           -10px 25px 20px gray;
          
                border-radius: 10px;
}

.mimg{
  width:90%;
    margin-left:6px;
}
.mainvk{
       overflow-x: hidden;
       display:flex;
       padding:6px;
       overflow:auto;
      
 
 }
     .vk{
			width: 180px;
            height: 80px;
           
             margin-left:16%;
             border-radius: 25px;
             margin-top:5px;
         }
    .rk{
	      text-align:center;
	      margin-top:15px;
	      margin-bottom:10px;
     }
     .m{
	       margin-left: 5%;
	        text-align:center;
	       padding:10px;
	       color:blue;
	       background-color:cyan;
	       
	       margin-top:10px;
	       border:none;
	      
	       border-radius: 25px;
       
     }
     .hk{
	       height:330px;
	       width:260px;
	       padding:4px;
	        border-radius: 25px;
	        box-shadow: 5px 0px 7px gray,
	           -5px 0px 7px gray,
	           
	             5px 0px 7px gray,
	           -5px 0px 7px gray;
       
     }
     .hkm{
      	 margin-left:10px;
    
     }
    .spid{
         color:yellow;
     }


 .hk:hover{
     
        
	       box-shadow: inset -5px 5px 5px rgba( 255,255,255,0.2),       
		               inset -8px 8px 8px rgba(15, 14, 15, 0.1),
		               inset 8px 8px 8px rgba(15, 14, 15, 0.1),
		                inset 8px -8px 8px rgba(15, 14, 15, 0.1);
           border-radius: 25px;
 
       }
       
       .ch{
	           width:50px;
	          height:50px;
	          padding:0px;
          
       }
       .rmk{
	        display: flex;
            justify-content:center;
            align-items: center;
          border-radius: 50%;
          margin:auto;
          margin-top:10px;
          
           margin-bottom:10px;
        
       }
       
       .rmk:hover{
         
          box-shadow: 5px 0px 7px gray,
           -5px 0px 7px gray,
           
              5px 0px 7px gray,
           -5px 0px 7px gray;
           
       }
       .al{
            overflow-x: hidden;
             justify-content:center;
            
       }

       
</style>
</head>
<body>
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
	<%@include file="all_component/navbar.jsp"%>

	
	<div class="container-fluid  back-img">
	  
	     <div class="carousel-caption text-center vxy">
            <c:if test="${not empty succMsg }">
					
					<div class="alert alert-success" role="alert">${succMsg}</div>
					<c:remove var="succMsg" />
		  </c:if>
        </div>
        <img alt="" src="img/Home_page.png" class="homepage">
	</div>

    <br>
	

	<div class="text-center">
		<h1 class="text-black">
			<span class="text-muted">Naukri is India's No.1 Job Posting & Recruitment Platform </span>
		</h1>
		<br>
		<div class="text-center">
         <h4 class=""><b>Featured companies actively hiring</b></h4>
         </div>
         <br>

        
 <div class="container-fluid mainvk">
  <div class="col hkm">
    <div class="card hk">
      <img src="img/first.gif" class="card-img-top vk" alt="...">
      <div class="card-body ">
        <h5 class="card-title rk">Cognizant</h5>
        <div class="text-center">
        <span class="text-muted"><i class="fa-solid fa-star spid">&nbsp;</i>3.8&nbsp;|&nbsp;3.8k+reviews</span>
        </div>
        <p class="card-text rk">Leading ITes company with global presence.</p>
           <button class=" m"><b>View jobs</b></button>
      </div>
    </div>
  </div>
  <div class="col hkm">
    <div class="card hk">
      <img src="img/second.gif" class="card-img-top vk" alt="...">
      <div class="card-body">
        <h5 class="card-title rk">Coforge</h5>
        <div class="text-center">
        <span class="text-muted"><i class="fa-solid fa-star spid">&nbsp;</i>3.8&nbsp;|&nbsp;3.8k+reviews</span>
        </div>
        <p class="card-text rk">Global digital services and solutions provider.</p>
         <button class=" m"><b>View jobs</b></button>
      </div>
    </div>
  </div>
  <div class="col hkm">
    <div class="card hk">
      <img src="img/six.gif" class="card-img-top vk" alt="...">
      <div class="card-body">
        <h5 class="card-title rk">Wipro</h5>
        <div class="text-center">
        <span class="text-muted"><i class="fa-solid fa-star spid">&nbsp;</i>3.8&nbsp;|&nbsp;3.8k+reviews</span>
        </div>
        <p class="card-text rk">Technology Services & Consulnting Company.</p>
            <button class=" m"><b>View jobs</b></button>
      </div>
    </div>
  </div>
  <div class="col hkm">
    <div class="card hk">
      <img src="img/four.gif" class="card-img-top vk" alt="...">
      <div class="card-body">
        <h5 class="card-title rk">Firstsource</h5>
        <div class="text-center">
        <span class="text-muted"><i class="fa-solid fa-star spid">&nbsp;</i>3.8&nbsp;|&nbsp;3.8k+reviews</span>
        </div>
        <p class="card-text rk">Leading provider of transformation solutions.</p>
         <button class=" m"><b>View jobs</b></button>
      </div>
    </div>
  </div>
</div>
		
		
	</div>
	<br>
	<hr class="featurette-divider">

	<div class="row featurette">
		<div class="col-md-7">
			<h2 class="featurette-heading p-4">Recruiters Recommend Naukri</h2>
			<p class="lead p-4"> Naukri is used as the main tool for talent
				acquistion by lacs of recruiters across all kinds and sizes of
				industry. They appreciate Naukri's services and highly recommend it
				as the one-stop solution to all the hiring needs of a company.
			</p>
		</div>
		<div class="col-md-5">
			<img src="img//manager.png" class="rounded float-left mimg" alt="Img">

		</div>
	</div>
	<br>
	
         <br>
         
         
         
<br>
   <div class="text-center">
           <h4><b>Top companies hiring now</b></h4>
         </div>
<hr class="featurette-divider">
<br>
<div class="container d-flex al">
   <div class="card rmk">
      <div class=" card-body">
         <img src="img/amazon-ot.png" class="card-img-top ch" alt="Amazon">
      </div>
   </div>
    <div class="card rmk">
      <div class=" card-body">
         <img src="img/byjus-ot.png" class="card-img-top ch" alt="Byjus">
      </div>
   </div>
    <div class="card rmk">
      <div class=" card-body">
         <img src="img/cognizant-ot.png" class="card-img-top ch" alt="Cognizant">
      </div>
   </div>
    <div class="card rmk">
      <div class=" card-body">
         <img src="img/flipkart-ot.png" class="card-img-top ch" alt="Flipkart">
      </div>
   </div>
    <div class="card rmk">
      <div class=" card-body">
         <img src="img/tcs-ot.png" class="card-img-top ch" alt="TCS">
      </div>
   </div>
    <div class="card rmk">
      <div class=" card-body">
         <img src="img/relaince.png" class="card-img-top ch" alt="Relaince">
      </div>
   </div>
    <div class="card rmk">
      <div class=" card-body">
         <img src="img/hcl.png" class="card-img-top ch" alt="HCL">
      </div>
   </div>

</div>


<br><br>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>