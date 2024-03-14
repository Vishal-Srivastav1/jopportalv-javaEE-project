<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- jstl jar -->
   <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css">
.back-img {
  background: url("img/manager.png");
  width:100%;
  height:80vh;
  background-repeat: no-repeat;
  background-size: cover;
}
body{
 height:90vh;
 overflow-x :hidden;
}
</style>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }"> 
   <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="all_component/navbar.jsp"%>

<div class="container-fluid  back-img">
        
      </div>

</body>
</html>