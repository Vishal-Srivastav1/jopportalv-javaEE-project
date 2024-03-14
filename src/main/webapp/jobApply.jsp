<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl jar -->
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jobs-Apl</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>

<style type="text/css">
body {
	background: white;
	width: 100%;
	height: 70vh;
	background-repeat: no-repeat;
	background-size: cover;
	overflow-x :hidden;
	margin-top:20px;
}

.main1{
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
 
 <c:if test="${ empty userobj }"> 
   <c:redirect url="login.jsp"></c:redirect>
  </c:if>
  <%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
	<%@include file="all_component/navbar.jsp"%>

	<div class="continer-fluid">
		<div class="row p-2">
			<div class="col-md-4 offset-md-4">
				<div class="card main1">
					<div class="card-body">
						<div class="text-center">
							<h6>Form Details</h6>
						
						<c:if test="${not empty succMsg }">     <!--Jstl jar codes  -->	
							<div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" />
						</c:if>
                       </div>

						<form class=" needs-validation" action="applyjob" method="post" enctype="multipart/form-data" novalidate >
						<input type="hidden" name="userid" value="${userobj.id}">

							<label for="name1" class="form-label">Enter Full Name</label>
							<div class="input-group has-validation">
								<input type="text" name="name" class="form-control" id="name1"
									aria-describedby="inputGroupPrepend"
									placeholder="Enter Your Full Name " autofocus required>
								<div class="invalid-feedback">Please Enter Full Name...</div>
							
							</div>

							<label for="qualification" class="form-label">Enter
								Qualification</label>
							<div class="input-group has-validation">
								<input type="text" name="qua" class="form-control"
									id="qualification" aria-describedby="inputGroupPrepend"
									placeholder="Enter Your Qualification " required>
								<div class="invalid-feedback">Enter Qualification...</div>
								
							</div>

							<label for="gmail" class="form-label">Enter Email</label>
							<div class="input-group has-validation">
								<input type="email" name="email" class="form-control" id="gmail"
									aria-describedby="inputGroupPrepend"
									placeholder="Enter Your Email" required>
								<div class="invalid-feedback">Enter valid email...</div>
								
							</div>
							
							<label for="state" class="form-label">Enter State</label>
							<div class="input-group has-validation">
								<input type="text" name="state" class="form-control" id="state"
									aria-describedby="inputGroupPrepend"
									placeholder="Enter Your State" required>
								<div class="invalid-feedback">state can't be empty</div>
								
							</div>
							
							<label for="dist" class="form-label">Enter Dist./City</label>
							<div class="input-group has-validation">
								<input type="text" name="dist" class="form-control" id="dist"
									aria-describedby="inputGroupPrepend"
									placeholder="Enter Your dist/city" required>
								<div class="invalid-feedback">Dist./city can't be empty</div>
								
							</div>

							<label for="file" class="form-label">select photo</label>
							<div class="input-group has-validation">

								<input type="file" name="photo" class="form-control"
									id="file" aria-describedby="inputGroupPrepend"
									required>
								<div class="invalid-feedback">select jpg/png/pdf...</div>
								
							</div>
							
							<label for="file1" class="form-label">select Resume</label>
							<div class="input-group has-validation">

								<input type="file" name="resume" class="form-control"
									id="file1" aria-describedby="inputGroupPrepend"
									 required>
								<div class="invalid-feedback">select pdf/xml...</div>
								
							</div>


							<div class="col-12">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="invalidCheck" required> <label
										class="form-check-label" for="invalidCheck"> Agree to
										terms and conditions </label>
									<div class="invalid-feedback">You must agree before
										submitting...</div>
								</div>
							</div>

							<div class="col-12">
								<button class="btn btn-primary w-100" type="submit">Submit</button>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})()
	</script>

</body>
</html>