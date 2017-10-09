<%@page import="enitities.CategorieProduit"%>
<%@page import="enitities.Ingredient"%>
<%@page import="services.C"%>
<%@page import="enitities.Produit"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Produit> listeProduit = (ArrayList<Produit>) request.getAttribute(C.listeProduits);
	Produit unProduitAModfier = (Produit) request.getAttribute(C.produit);
	ArrayList<Ingredient> listeIngredient = (ArrayList<Ingredient>) request.getAttribute(C.listeIngredients);
	ArrayList<CategorieProduit> listeCategorie = (ArrayList<CategorieProduit>) request.getAttribute(C.listeCategorieProduit);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion produit</title>
</head>
<body>
	<h2>Liste des produits presents :</h2>
	<%
		if (listeProduit != null) {
	%>
	
	<h2><a href="ajoutNouveauDonnees?ajoutProduit=true">Ajouter un produit</a></h2>
	<table>
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
				<td><%=produit.getNom()%></td>
				<td><img alt="<%=produit.getNom()%>"
					src="<%=produit.getImgUrl()%>"></td>
				<td><%=produit.getPrix()%></td>
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
		<label>nom de produit :</label> <input type="text" name="nomProduit"
			value="<%=unProduitAModfier.getNom()%>">
			<div><img alt="<%=unProduitAModfier.getNom()%>" src="<%=unProduitAModfier.getImgUrl()%>"></div>
			 <label>Categorie
			: </label> 
			<select>
			<option><%=unProduitAModfier.getCategorieProduit().getNomCategorie()%></option>
			<%
				if (listeCategorie != null) {
						for (CategorieProduit categorie : listeCategorie) {
							if (!unProduitAModfier.getCategorieProduit().getNomCategorie().equals(categorie.getNomCategorie())) {
			%>
			<option><%out.print(categorie.getNomCategorie());%></option>
			<%
				}
						}
					}
			%>

		</select>
		<textarea rows="5" cols="5"><%=unProduitAModfier.getDesc()%></textarea>
		<h2>la Recette :</h2>
		<table>
			<tbody>
				<tr>
					<th>Ingredint</th>
					<th>Qunatité en grammes (g)</th>
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
							<option><%out.print(nomIng.getNomIngredient());%></option>
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
		<input type="submit" name="retirerProduit" value="Retirer ce produit">
		<input type="submit" name="enregistrerProduit"
			value="Enregister les modifications">
	</form>
	<%
		}
	%>

</body>
</html>