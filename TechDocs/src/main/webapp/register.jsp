<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Registration</title>
<%@include file="Components/common_css_js.jsp"%>

</head>
<body style="max-height: 100%; max-width: 100%; 
		background-image: url('img/rg_bg.jpg');
		background-position: center; 
		background-repeat: no-repeat;
		background-size: cover;">
	<%@include file="Components/navbar.jsp"%>
	<div class="container-fluid "
		>


		<div class="row mt-0">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-4" style="background-color: #ffffff26;">

					<%@ include file="Components/message.jsp"%>
					<div class="card-body px-5">
						<img style="height: 70px; width: 180px; margin-left: 90px;"
							src="img/signup.png">
						<h3 class="text-center my-3">Sign up here !!</h3>

						<form action="Register_Servlet" method="post">
							<div class="mb-2">
								<label for="name" class="form-label">User Name</label> <input
									name="user_name" type="text" class="form-control" id="name"
									placeholder="Enter your Name" aria-describedby="emailHelp" required="required">
							</div>
							<div class="mb-2">
								<label for="email" class="form-label">User email</label> <input
									name="user_email" type="text" class="form-control" id="email"
									placeholder="Enter your Email" aria-describedby="emailHelp"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required="required">
							</div>
							<div class="mb-2">
								<label for="password" class="form-label">User password</label> <input
									name="user_password" type="password" class="form-control"
									id="password" placeholder="Enter your Password"
									aria-describedby="emailHelp" required="required">
							</div>
							<div class="mb-2">
								<label for="number" class="form-label">User phone</label> <input
									name="user_number" type="number" class="form-control"
									id="number" placeholder="Enter number without country code"
									aria-describedby="emailHelp" required="required">
							</div>
							<div class="mb-2">
								<label for="address" class="form-label">User Address</label>
								<textarea name="user_address" style="height: 150px;"
									class="form-control" placeholder="Enter your Address" required="required"></textarea>
							</div>

							<div class="input-group mb-2">
								<div class="input-group-prepend">
									<label for="gender" class="form-control">Gender</label>
								</div>
								<select name="user_Gender" class="form-control" id="gender">
									<option selected>Your Gender</option>
									<option value="Male" selected="selected">Male</option>
									<option value="Female">Female</option>

								</select>
							</div>

							<a href="login.jsp" class="text-center d-block mb-3">If
								Already Register click here</a>
							<div class="container text-center">

								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning">Reset</button>

							</div>


						</form>
					</div>
				</div>

			</div>

		</div>
	</div>

</body>
</html>
