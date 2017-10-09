<%@page import="enitities.CategorieProduit"%>
<%@page import="enitities.Ingredient"%>
<%@page import="services.C"%>
<%@page import="enitities.Produit"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Produit> listeProduit = (ArrayList<Produit>) request.getAttribute(C.listeProduits);
	Produit unProduitAModfier = (Produit) request.getAttribute(C.produit);
	ArrayList<Ingredient> listeIngredient = (ArrayList<Ingredient>) request.getAttribute(C.listeIngredients);
	ArrayList<CategorieProduit> listeCategorie = (ArrayList<CategorieProduit>) request
			.getAttribute(C.listeCategorieProduit);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Khula"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion produit</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="../views/header.jsp"%>
	<!--MAIN -->
	<%
		if (listeProduit != null) {
	%>

	<img src="images/gestion-produit.jpeg" alt="Mamie clafoutis">
	<h2 id="titre-gestion">Liste des produits presents</h2>

	<h2 id="lien-ajoutProd">
		<a href="ajoutNouveauDonnees?ajoutProduit=true">Ajouter un produit</a>
	</h2>
	<table id="table-gestion">
		<tbody>
			<tr>
				<th>nom</th>
				<th>image</th>
				<th>prix</th>
				<th>categorie</th>
				<th></th>
			</tr>
			<%
				for (Produit produit : listeProduit) {
			%>
			<tr>

				<td><a href="afficherProduit?idProduit=<%=produit.getId()%>"><%=produit.getNom()%></a></td>
				<td><a href="afficherProduit?idProduit=<%=produit.getId()%>"><img
						id="img-gestion" alt="<%=produit.getNom()%>"
						src="<%=produit.getImgUrl()%>"></a></td>
				<td><%=produit.getPrix()%>$</td>
				<td><%=produit.getCategorieProduit().getNomCategorie()%></td>
				<td><a
					href="gestionProduit?IDProduitModifie=<%=produit.getId()%>">modifier
						produit</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<%
		} else if (unProduitAModfier != null) {
	%>
	<form action="gestionProduit" method="post">
		<div id="nom-produit">
			<label>nom de produit :</label> <input type="text" name="nomProduit"
				value="<%=unProduitAModfier.getNom()%>">
		</div>

		<div>
			<img id="img-gestion-produit" alt="<%=unProduitAModfier.getNom()%>"
				src="<%=unProduitAModfier.getImgUrl()%>">
			<div id="section-recette">

				<label>Categorie : </label> <select>
					<option><%=unProduitAModfier.getCategorieProduit().getNomCategorie()%></option>
					<%
						if (listeCategorie != null) {
								for (CategorieProduit categorie : listeCategorie) {
									if (!unProduitAModfier.getCategorieProduit().getNomCategorie()
											.equals(categorie.getNomCategorie())) {
					%>
					<option>
						<%
							out.print(categorie.getNomCategorie());
						%>
					</option>
					<%
						}
								}
							}
					%>

				</select>
				<textarea id="gestion-textarea" rows="2" cols="20"><%=unProduitAModfier.getDesc()%></textarea>
				<h2>la Recette </h2>
				<table>
					<tbody>
						<tr>
							<th>Ingredients</th>
							<th>Quantité en grammes (g)</th>
						</tr>
						<%
							ArrayList<Ingredient> lesIngredients = unProduitAModfier.getSaRecette().getLesIngredient();
						%>
						<%
							if (lesIngredients != null) {
									for (Ingredient ing : lesIngredients) {
						%>
						<tr>
							<td><select>
									<option><%=ing.getNomIngredient()%></option>
									<%
										if (listeIngredient != null) {
														for (Ingredient nomIng : listeIngredient) {
															if (!ing.getNomIngredient().equals(nomIng.getNomIngredient())) {
									%>
									<option>
										<%
											out.print(nomIng.getNomIngredient());
										%>
									</option>
									<%
										}
														}
													}
									%>
							</select></td>
							<td><input type="text" name="qtyIngredient"
								value="<%=ing.getQuantite()%>"></td>
						</tr>
						<%
							}
								}
						%>
					</tbody>
				</table>
				<ul id="boutons-gestion-produits">
					<li><input class="bouton-gestion" type="submit"
						name="retirerProduit" value="Retirer ce produit"></li>
					<li><input class="bouton-gestion" type="submit"
						name="enregistrerProduit" value="Enregister les modifications"></li>
				</ul>

			</div>

		</div>

	</form>
	<%
		}
	%>

	<!--FOOTER-->
	<%@ include file="../views/footer.jsp"%>
</body>
</html>