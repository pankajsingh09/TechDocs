<%@page import="java.util.List"%>
<%@page import="com.learn.myEcart.helper.FactoryProvider"%>
<%@page import="com.learn.myEcart.entities.Product"%>
<%@page import="com.learn.myEcart.Dao.ProductDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%
String id = (String) request.getParameter("pid");
int cid = Integer.parseInt(id.trim());

ProductDao dao = new ProductDao(FactoryProvider.getFactory());

Product p = dao.getProductByIdNormalType(cid);
%>

<title><%=p.getpTitle()%></title>

<%@include file="Components/common_css_js.jsp"%>
</head>
<body
	style="max-height: 100%; max-width: 100%; background-image: url('https://images.unsplash.com/photo-1564951434112-64d74cc2a2d7?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=387&amp;q=80'); background-position: center; background-repeat: no-repeat; background-size: cover;">
	<%@include file="Components/navbar.jsp"%>







	<!-- product card -->

	<div class="card-body ">

		<div class="container text-center">

			<img src="img/products/<%=p.getpPhoto()%>"
				style="max-height: 200px; max-width: 100%; width: auto;"
				class="card-img-top m-2" alt="...">

		</div>


		<div class="card-body">

			<h5 class="card-title text-center"><%=p.getpTitle()%></h5>
			<p class="card-text" style="margin-left: 10%; margin-right: 10%;">
				<%=p.getpDesc()%>
			</p>


		</div>

	</div>


	<form action="Contribute_Servlet" method="post">

		<div class="container text-center border-0">
			<input type="hidden" name="catID" value="<%=cid%>">
			<button type="submit" name="operation" value="valid"
				class="btn btn-primary">Valid</button>
			<button type="submit" name="operation" value="delete"
				class="btn btn-primary">delete</button>
		</div>
	</form>
	






</body>
</html>