<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl jar -->
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup page</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>

<style type="text/css">
body {
	background-color: #fff;
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
<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); %>
	<%@include file="all_component/navbar.jsp"%>

	<div class="continer-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card main1">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Registration</h5>
						
						<c:if test="${not empty succMsg }">     <!--Jstl jar codes  -->	
							<div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" />
						</c:if>
                     </div>

						<form class=" needs-validation" action="add_user" method="post" novalidate>

							<label for="name" class="form-label">Enter Name</label>
							<div class="input-group has-validation">
								<input type="text" name="name" class="form-control" id="name"
									aria-describedby="inputGroupPrepend"
									placeholder="Enter Your Full Name " autofocus required>
								<div class="invalid-feedback">Please Enter Name...</div>
								<!--  <div class="valid-feedback">Looks good!</div>  -->
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

							<label for="password" class="form-label">Enter Password</label>
							<div class="input-group has-validation">

								<input type="password" name="ps" class="form-control"
									id="password" aria-describedby="inputGroupPrepend"
									placeholder="Enter Your Password" required>
								<div class="invalid-feedback">Enter Unique password...</div>
								
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
								<button class="btn btn-primary w-100" type="submit">Signup</button>
							</div>
						</form>
						<hr class="featurette-divider">
						<div class="text-center">
							<p>
								Have an account?<a href="login.jsp">Log in</a>
							</p>
						</div>
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