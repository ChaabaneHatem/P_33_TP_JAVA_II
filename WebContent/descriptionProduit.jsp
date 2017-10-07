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
<link rel="stylesheet" type="text/css" href="css/main.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>une description d'un produit</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="views/header.jsp"%>
	
	<div id="wrapper_description_item">
	<div>
	<img alt="image_<%=produit.getNom()%>" src="<%=produit.getImgUrl()%>">
	</div>
	<h2><%=produit.getNom()%></h2>
	<h3><%=produit.getDesc()%></h3>
	<h4><%=produit.getPrix()%></h4>
	</div>



	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>