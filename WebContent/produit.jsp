<%@page import="enitities.Produit"%>
<%@page import="services.C"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Produit> listeProduits = (ArrayList<Produit>) request.getAttribute(C.listeProduits);
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>les produits</title>
</head>
<body>

	<!--HEADER-->
	<%@ include file="views/header.jsp"%>
	<main>
	<div id="wrapper_produit">
		<%
			for (Produit produit : listeProduits) {
		%>
		<div class="produit_unit">
			<h3><%=produit.getIdCategorie()%></h3>
			<a href="descriptionProduit.jsp?idProduit=<%=produit.getId()%>"><img
				src="<%=produit.getImgUrl()%>" /></a>
			<h3><%=produit.getNom()%></h3>
			<h4><%=produit.getPrix()%></h4>
		</div>
		<%
			}
		%>

	</div>




	</main>
	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>