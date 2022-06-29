<%@page import="java.util.Map"%>
<%@page import="com.learn.myEcart.helper.Helper"%>
<%@page import="com.learn.myEcart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.myEcart.helper.FactoryProvider"%>
<%@page import="com.learn.myEcart.Dao.CategoryDao"%>
<%@page import="com.learn.myEcart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "you are not logged in !! Login First.");
	response.sendRedirect("login.jsp");
	return;
} 
%>

<% 
			CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
			List<Category> list =cdao.getCategories();
			
		Map<String,Long> m=Helper.getCount(FactoryProvider.getFactory());
			
			
			%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Admin Panel</title>
<meta charset="ISO-8859-1">
<%@include file="Components/common_css_js.jsp"%>

</head>
<body  style="max-height: 100%; max-width: 100%; 
		background-image: url('https://images.unsplash.com/photo-1464618663641-bbdd760ae84a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80');
		background-position: center; 
		background-repeat: no-repeat;
		background-size: cover; padding-bottom: 5%; ">

	<%@include file="Components/navbar.jsp"%>


	<div class="container admin mt-5">


		<div class="container-fluid mt-3">
			<%@include file="Components/message.jsp"%>
		</div>


		


		<!-- Second row -->
		<div class="row mt-3">

			<!-- Row2 col1 -->

			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal" style="background-color: #ffffff00;">

					<div class="card-body  text-center">
						<div class="container">
							<img style="max-width: 100px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/add-file.png">
						</div>
						<p>Click here to add category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>

				</div>

			</div>

			<!-- Row2 col2 -->

			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-product-modal" style="background-color: #ffffff00;">

					<div class="card-body  text-center">
						<div class="container">
							<img style="max-width: 100px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/article.jpg">
						</div>
						<p>Click here to add Article</p>
						<h1 class="text-uppercase text-muted">Add Article</h1>
					</div>

				</div>

			</div>


		</div>

	</div>


	<!-- Add Category Model Start-->

	<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="background-color: #b6dce9;">
				<div class="modal-header blue text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperation_Servlet" method="post">
						<input type="hidden" name="operation" value="AddCategory">
						<input type="hidden" name="userType" value="<%=user1.getUserType()%>">
						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category title" required />
						</div>
						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								name="catDescription" placeholder="Enter Category Description"
								required></textarea>
						</div>
						
						<!-- Product file -->
			
			<div class="form-group">
			<label>Select Picture</label>
			<br>
			<input type="file" id="pPic" name="pPic" required />
			
			</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- Add Category Model Ends-->
	
	<!-- ----------------------------------------------------------------------------- -->

	<!--  Add Product Model Starts-->

	

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content" style="background-color: #b6dce9;">
				<div class="modal-header blue text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Article </h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
		<!-- form -->
				
				<form action="ProductOperation_Servlet" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="operation" value="Add Article"/>
				<input type="hidden" name="userType" value="<%=user1.getUserType()%>">
				
		<!-- Product Title -->
				
				<div class="form-group">
				
				<input type="text" class="form-control" placeholder="Enter Article Title" name="pTitle" required />
				
				</div>
		<!-- Product description -->
				
				<div class="form-group">
				
				<textarea style="height:150px " class="form-control" placeholder="Enter Article Description " name="pDesc"></textarea>
				
				</div>
				
		
				
		<!-- Product Category -->
			
			
			
				
				<div class="form-group">
				<select name="catId" class="form-control" id="">
				<%
				for(Category c:list){
				%>
				
				<option value="<%=c.getCategoryId() %>"><%= c.getCategoryTitle() %> </option>
				
				<% } %>
				</select>				
				
				</div>		
				
			<!-- Product file -->
			
			<div class="form-group">
			<label>Select Picture of Article</label>
			<br>
			<input type="file" id="pPic" name="pPic" required />
			
			</div>
			
			<!-- Submit Button -->
				<div class="container text-center">
					
					<button class="btn btn-outline-success">Add Article</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				
				</div>
				
				</form>
						
				
				<!-- End form -->
				
			
		</div>
	</div>
	</div>
	</div>

	<!--  Add Product Model Ends-->

<%@ include file="Components/common_modals.jsp" %>


</body>
</html>