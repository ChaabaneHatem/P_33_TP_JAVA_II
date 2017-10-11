<%@page import="manager.ManagerSession"%>
<%@page import="manager.ManagerPanier"%>
<%@page import="enitities.LigneDeCommande"%>
<%@page import="java.util.HashMap"%>
<%@page import="services.C"%>
<%@page import="enitities.Produit"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<Produit> listeProduitPanier = (ArrayList<Produit>) request.getAttribute(C.listeProduitPanier);
	HashMap<Integer, LigneDeCommande> panier = (HashMap<Integer, LigneDeCommande>) ManagerSession.get(request,
			"panier");
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
<title>Gestion de panier</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="../views/header.jsp"%>
	<main> <%
 	if (ManagerPanier.getNbArticle(request) == 0) {
 		out.print("<h2>Votre panier est vide ...</h2>");
 	}
 %> <%
 	double totalAchat = 0;
 	if (listeProduitPanier != null) {
 		for (Produit produitDansPanier : listeProduitPanier) {
 %>
	<div class="conteneur_item_panier">
		<div class="img_item">
			<a href="afficherProduit?idProduit=<%=produitDansPanier.getId()%>"><img
				src="<%=produitDansPanier.getImgUrl()%>"
				alt="<%=produitDansPanier.getNom()%>"></a>
		</div>
		<span> <%=produitDansPanier.getNom()%>
		</span>
		<div>
			<p>
				<%=produitDansPanier.getDesc()%>
			</p>
		</div>
		<span class="prix_item_panier"> Prix : <%
			double d = (double) Math.round(
							(1 * produitDansPanier.getPrix() * panier.get(produitDansPanier.getId()).getQtyProduit())
									* 100)
							/ 100;
					out.print(d);
					totalAchat += d;
		%>$
		</span>
		<form action="actionPanier" method="post">
			<input type="hidden" name="idProduit"
				value="<%=produitDansPanier.getId()%>"> <input type="submit"
				value="-" name="delete_one"> <input type="text"
				disabled="disabled"
				value="<%if (panier != null && panier.containsKey(produitDansPanier.getId())) {
						out.print(panier.get(produitDansPanier.getId()).getQtyProduit());
					}
					;%>"
				name="qty"> <input type="submit" value="+" name="add_one">
			<input type="submit" value="Remove product" name="delete_item">
		</form>
	</div>


	<%
		}
		}
	%> <%
 	if (ManagerPanier.getNbArticle(request) != 0) {
 %>
	<div class="total_achats_panier">
		Total du panier :
		<%=totalAchat%>$
	</div>

	<%
		}
	%> <buttom class="btn_1"> <a href="afficherProduit">Continuer
		shopping</a></buttom> <%
 	if (ManagerPanier.getNbArticle(request) != 0) {
 %> <buttom class="btn_2"> <a
		href="actionPanier?afficherPanier=true">Passez à la caisse</a></buttom> <%
 	}
 %> </main>
	<!--FOOTER-->
	<%@ include file="../views/footer.jsp"%>
</body>
</html>