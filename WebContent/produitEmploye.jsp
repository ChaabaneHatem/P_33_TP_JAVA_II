<%@page import="enitities.Produit"%>
<%@page import="enitities.Vente"%>
<%@page import="services.C"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Produit> listeProduits = (ArrayList<Produit>) request.getAttribute(C.listeProduits);
	Vente ajoutProd = (Vente) request.getAttribute("ajoutProd");
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
<title>les produits</title>
</head>
<body>

	<!--HEADER-->
	<%@ include file="views/header.jsp"%>
	<main> <img src="images/petits-gateaux.jpeg"
		alt="Mamie clafoutis">
	<div id="wrapper_produit">
		<h1 id="titre-produit">Nos produits</h1>
		<div>
			<label for="prix">Par prix :</label> <input type="radio"
				name="filtre" id="prix"> <label for="lettre">Par nom
				:</label> <input type="radio" name="filtre" id="lettre">
		</div>
		<%
			for (Produit produit : listeProduits) {
		%>
		<div class="produit_unit">
			<h3><%=produit.getIdCategorie()%></h3>
			<a href="afficherProduit?idProduit=<%=produit.getId()%>"><img
				src="<%=produit.getImgUrl()%>" /></a>
			<h3><%=produit.getNom()%></h3>
			<h4><%=produit.getPrix()%></h4>
		</div>

		<form action="modifierEtudiant" method="post">
			<ul>
				<li><label for="qtyTotale">Quantite totale :</label> <input
					type="text" value="<%=ajoutProd.getQuantiteTotal()%> name="qtyTotale"></li>
				<li><label for="qtyRestante">Quantite restante :</label> <input
					type="text" value="<%=ajoutProd.getQuantiteRestante()%> name="qtyRestante"></li>
				<!-- 				<li><label for="Date">Date :</label> <input type="text"
					name="Date"></li> -->
			</ul>
			<div>
				<label for="avantmidi">Avant-midi :</label> <input type="radio"
					value="<%=ajoutProd.getScience()%>
					name="
					science" id="avantmidi"> <label for="avantmidi">Après-midi
					:</label> <input type="radio" value="<%=ajoutProd.getScience()%> name="science" >
			</div>
			<input type="submit" value="OK" />
		</form>
		<%
			}
		%>


	</div>
	</main>
	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>