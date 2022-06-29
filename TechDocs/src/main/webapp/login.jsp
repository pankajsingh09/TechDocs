<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login:myCart</title>
<%@include file="Components/common_css_js.jsp"%>
</head>
<body
	style="max-height:
	100%; max-width: 
	100%; background-image: url('img/org.jpg'); 
	background-repeat: no-repeat; 
	background-size: cover;">

	<%@include file="Components/navbar.jsp"%>


	<div class="container">


		<div class="row ">
			<div class="col-md-6 offset-md-3">

				<div class="card mt-5 mb-5 text-white" style="background-color: #ffffff26;">

					<div class="card-header blue text-center">
						<h3>Login Here</h3>
					</div>

					<div class="card-body">
						<%@include file="Components/message.jsp"%>
						<form action="Login_Servlet" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input name="email" type="email" class="form-control"
									id="exampleInputEmail1">
								<!-- aria-describedby="emailHelp" pattern=".{5,10}" required title="5 to 10 characters" > -->
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input name="password" type="password" class="form-control"
									id="exampleInputPassword1">
								<!--pattern=".{5,10}" required title="5 to 10 characters">  -->
							</div>
							<a href="register.jsp" class="text-center d-block mb-3 text-white" style="color: black">If
								not Register click here</a>
							<div class="container text-center border-0">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-primary">Reset</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>