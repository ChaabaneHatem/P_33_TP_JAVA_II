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
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="https://fonts.googleapis.com/css?family=Khula"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nos produits</title>
</head>
<body>

	<!--HEADER-->
	<%@ include file="views/header.jsp"%>
	<main> <img src="images/petits-gateaux.jpeg"
		alt="Mamie clafoutis">
	<div id="wrapper_produit">
		<h1 id="titre-produit">Nos produits</h1>
		
		
		
		<form action="afficherProduit" method="post">
			 <input type="submit" value="All" name="allProduit"> 
			 <input type="submit" value="Trié par prix" name="TriePrix"> 
			 <input type="submit" value="Trié par nom" name="TrieNom">
			 <label>trier par categorie : </label>
			 <input type="submit" value="Pain" name="categorie"> 
			 <input type="submit" value="Viennoiserie" name="categorie">
			 <input type="submit" value="Patisserie" name="categorie">
		</form>
		
		
		
		
		<%
			for (Produit produit : listeProduits) {
				if (listeProduits != null) {
		%>
		<div class="produit_unit">
			<h3><%=produit.getCategorieProduit().getNomCategorie()%></h3>
			<a href="afficherProduit?idProduit=<%=produit.getId()%>"><img
				src="<%=produit.getImgUrl()%>" /></a>
			<h3><%=produit.getNom()%></h3>
			<h4><%=produit.getPrix()%>$
			</h4>

			<form action="actionPanier" method="post">
				<input type="hidden" name="idProduit" value="<%=produit.getId()%>">
				<select name="qtyProduit" class="quantite">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select> <input type="submit" name="add_item" value="ajouter au panier">
			</form>

		</div>
		<%
			}
			}
		%>
	</div>

	</main>
	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>