
<%@page import="com.learn.myEcart.helper.Helper"%>
<%@page import="com.learn.myEcart.entities.Category"%>
<%@page import="com.learn.myEcart.Dao.CategoryDao"%>
<%@page import="com.learn.myEcart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myEcart.Dao.ProductDao"%>
<%@page import="com.learn.myEcart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>

<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "you are not logged in !! Login First.");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "you are not Admin !! Do not access this page.");
		response.sendRedirect("login.jsp");
		return;
	}

}
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>

<%@include file="Components/common_css_js.jsp"%>

</head>
<body
	style="min-height: 300px; max-height: 100%; max-width: 100%; background-image: url('img/about_bg.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover;">

	<%@include file="Components/navbar.jsp"%>

	<div class="container-fluid">


		<div class="container mt-3 p-3">


			<%
			String cat = request.getParameter("category");

			CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategoriesNormalType();
			%>

			<!-- show Categories -->
			<div class="card">

				<div class="card-body text-center"
					style="background-color: #dce4ffb0; background-position: center; background-repeat: no-repeat; background-size: cover;">





					<h1>All Categories</h1>

					<form action="Contribute_Servlet" method="post">
						<table class="table table-hover mt-5"
							style="background-color: #ffffff7d; margin-top: 5px;">





							<tbody style="font-size: 20px;">

								<tr>
									<td>Sr. No.</td>
									<td>Category Title</td>
									<td>Category Description</td>
									<td>Valid</td>
									<td>Delete</td>


								</tr>

								<%
								int i = 1;
								for (Category c : clist) {
								%>

								<tr>
									<th scope="row"><%=i%></th>

									<td><a class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a></td>
									<td><a class="list-group-item list-group-item-action"><%=c.getCategoryDescription()%></a></td>

									<input type="hidden" name="catID" value="<%=c.getCategoryId()%>">
									<td><button type="submit" name="operation"
											value="validCat" class="btn btn-primary">Valid</button></td>

									<td><button type="submit" name="operation"
											value="deleteCat" class="btn btn-primary">delete</button></td>



								</tr>

								<%
								i++;
								}
								%>




							</tbody>
						</table>

					</form>

				</div>


			</div>




		</div>

	</div>

	<%@ include file="Components/common_modals.jsp"%>

</body>
</html>
