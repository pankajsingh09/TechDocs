<%@page import="com.learn.myEcart.helper.FactoryProvider"%>

<%@page import="com.learn.myEcart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "you are not logged in !! Login First.");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Page</title>
        <%@include file="Components/common_css_js.jsp"%>

    </head>
    <body style="max-height: 100%; max-width: 100%; 
		background-image: url('img/about_bg.jpg');
		background-position: center; 
		background-repeat: no-repeat;
		background-size: cover;">
        
     

	<%@include file="Components/navbar.jsp"%>
	
	<div class="container mt-3 p-3">
		<div class="card">
			<div class="card-body text-center" 
			style="background-image: url('img/about_bg.jpg');
			background-position: center; 
		background-repeat: no-repeat;
		background-size: cover;">

				<h1>Admin Details</h1>
				<table class="table table-hover" style="background-color: #ffffff7d;">

					<div class="container">
					
					
						<img style="max-width: 200px" class="img-fluid rounded-circle"
							alt="user_icon" src="img/admin.jpg">
							
							
					</div>


					<tbody style="font-size: 30px;">
						<tr>
							<th scope="row">1</th>
							<td>Name</td>
							<td>Pankaj Singh</td>


						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Email</td>
							<td>Pankajsinghghugtyal@gmail.com</td>

						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Mobile No</td>
							<td>+918076354069</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>Address</td>
							<td>New Delhi, India </td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>Gender</td>
							<td>Male</td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>LinkedIn</td>
							<td><a href ="https://www.linkedin.com/in/pankaj-singh-4060861a8/">linkedin</a></td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td>GitHub</td>
							<td><a href="https://github.com/pankajsingh09">github</a></td>
						</tr>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<%@ include file="Components/common_modals.jsp"%>
</body>
    
</html>