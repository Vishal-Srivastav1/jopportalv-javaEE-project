<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loging page</title>
<link rel="icon" href="img/logo.png" type="image/x-icon">
<%@include file="all_component/all_css.jsp"%>

<style type="text/css">
body {
	background: white;
	width: 100%;
	height: 70vh;
	background-repeat: no-repeat;
	background-size: cover;
	overflow-x: hidden; 
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

	<div class="continer-fluid ">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card main1">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login Page</h5>
						</div>
                      <div class="text-center">
						<c:if test="${not empty succMsg }">
							<!--Jstl jar codes  -->
							<div class="alert alert-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" />
						</c:if>
						</div>

						<form class=" needs-validation" novalidate action="login"
							method="post">


							<label for="gmail" class="form-label">Enter Email</label>
							<div class="input-group has-validation">
								<input type="email" class="form-control" name="email" id="gmail"
									aria-describedby="inputGroupPrepend"
									placeholder="Enter Your Email" Autofocus required >
								<div class="invalid-feedback">Please Enter valid Email.</div>

							</div>
							

							<label for="password" class="form-label">Enter Password</label>
							<div class="input-group has-validation">
								<input type="password" class="form-control" id="password"
									name="passwd" aria-describedby="inputGroupPrepend"
									placeholder="Enter Your Password" required>
								<div class="invalid-feedback">Please Enter Unique
									Password.</div>

							</div>


							<div class="col-12">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value=""
										id="invalidCheck" required> <label
										class="form-check-label" for="invalidCheck"> Agree to
										terms and conditions </label>
									<div class="invalid-feedback">You must agree before
										submitting.</div>
								</div>
							</div>

							<div class="col-12">
								<button class="btn btn-primary w-100" type="submit">Login</button>
							</div>
							
					
						</form>
						<hr class="featurette-divider">
						
						<p class="text-center">
							<span >
								Don't have an account?<a href="signup.jsp">Sign up</a>
								<br><a href="forgotPassword.jsp">Forgot Password?</a>
							</span>
							
							
					    </p>
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