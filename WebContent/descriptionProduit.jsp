<%@page import="enitities.Produit"%>
<%@page import="services.C"%>
<%@page import="java.util.ArrayList"%>
<%
	Produit produit = (Produit) request.getAttribute(C.produit);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="https://fonts.googleapis.com/css?family=Khula" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Description de nos produits</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="views/header.jsp"%>

	<div id="wrapper_description_item">
		<div>
			<img class="image-desc" alt="image_<%=produit.getNom()%>" src="<%=produit.getImgUrl()%>">
			<div class="descrip-produit">
				<h2><%=produit.getCategorieProduit().getNomCategorie()%></h2>
				<h2><%=produit.getNom()%></h2>
				<h3><%=produit.getDesc()%></h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
					pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
					culpa qui officia deserunt mollit anim id est laborum</p>
				<h4><%=produit.getPrix()%>$</h4>
			</div>
		</div>
	</div>



	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>