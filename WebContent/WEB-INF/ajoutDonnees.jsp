
<%@page import="enitities.Ingredient"%>
<%@page import="enitities.Recette"%>
<%@page import="enitities.CategorieProduit"%>
<%@page import="services.C"%>
<%@page import="java.util.ArrayList"%>
<%
	String ajoutProduit = request.getParameter("ajoutProduit");
	String ajoutIngredient = request.getParameter("ajoutIngredient");
	String ajoutRecette = request.getParameter("ajoutRecette");
	ArrayList<CategorieProduit> listeCategorie = (ArrayList<CategorieProduit>) request
			.getAttribute(C.listeCategorieProduit);
	ArrayList<Recette> listeRecette = (ArrayList<Recette>) request.getAttribute(C.listeRecette);
	ArrayList<Ingredient> listeIngredient = (ArrayList<Ingredient>) request.getAttribute(C.listeIngredients);
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
<title>Ajout des données</title>
</head>
<body>
	<!--HEADER  -->
	<%@ include file="../views/header.jsp"%>
	<!--MAIN -->

	<%@ include file="../views/sous-menu.jsp"%>
	
	<%
		if (ajoutProduit != null) {
	%>
				<img src="images/ajout-produit.jpeg" alt="Mamie clafoutis" >
	
	<h1 id="titre-ajout">Ajoutez un nouveau produit</h1>
	<form id="form-ajout-produit" action="ajoutNouveauDonnees" method="post">

		<table border="0" width="35%" align="center">
			<tr>
				<td width="50%">Nom de produit</td>
				<td><input type="text" name="nomProduit"></td>
			</tr>
			<tr>
				<td>Nom de produit</td>
				<td><input type="text" name="nomProduit"></td>
			</tr>
			<tr>
				<td>La Categorie</td>
				<td><select>
						<%
							if (listeCategorie != null) {
									for (CategorieProduit categorie : listeCategorie) {
						%>
						<option><%=categorie.getNomCategorie()%></option>
						<%
							}
								}
						%>

				</select></td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="5">Description de produit </textarea>
				</td>
			</tr>
			<tr>
				<td><label>Le nom de Recette </label></td>
				<td><select>
						<%
							if (listeRecette != null) {
									for (Recette recette : listeRecette) {
						%>
						<option><%=recette.getNomRecette()%></option>
						<%
							}
								}
						%>

				</select></td>
			</tr>
			<tr>
				<td><input type="submit" name="annulerAjoutProduit"
					value="Annuler"></td>
			</tr>
			<tr>
				<td><input type="submit" name="AjouterCeProduit"
					value="Ajouter ce produit"></td>
			</tr>
		</table>
	</form>

	<%
		} else if (ajoutIngredient != null) {
	%>
	<h1>Ajout d'un nouveau ingredient</h1>
	<form action="ajoutNouveauDonnees" method="post">

		<label>Nom d'ingredient :</label> <input type="text"
			name="nomIngredient"> <input type="submit"
			name="annulerAjoutIngredient" value="Annuler"> <input
			type="submit" name="AjouterCeIngredient"
			value="Ajouter ce Ingredient">
	</form>
	<%
		} else if (ajoutRecette != null) {
	%>
	<h1>Ajout d'une nouvelle recettet</h1>
	<form action="ajoutNouveauDonnees" method="post">
		<label>Nom de Recette :</label> <input type="text" name="nomRecette">
		<h3>Les ingredients :</h3>
		<table>
			<tbody>
				<tr>
					<th>nom d'ingredient</th>
					<th>Quantité</th>
				</tr>
				<%
					for (int i = 1; i <= 10; i++) {
				%>
				<tr>
					<td><select name="nomIngredient<%=i%>">
							<%
								if (listeIngredient != null) {
											for (Ingredient Ing : listeIngredient) {
							%>
							<option value="<%out.print(Ing.getNomIngredient());%>">
								<%
									out.print(Ing.getNomIngredient());
								%>
							</option>
							<%
								}
										}
							%>
					</select></td>
					<td><input type="text" name="qtyIngredient"></td>
				</tr>
				<%
					}
				%>

			</tbody>
		</table>
		<input type="submit" name="annulerAjoutRecette" value="Annuler">
		<input type="submit" name="AjouterCetteRecette"
			value="Ajouter Recette">
	</form>
	<%
		}
	%>
	<%@ include file="../views/footer.jsp"%>
</body>
</html>













