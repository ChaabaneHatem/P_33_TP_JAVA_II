<%@page import="org.apache.tomcat.util.buf.UEncoder"%>
<%@page import="enitities.Ingredient"%>
<%@page import="services.C"%>
<%@page import="enitities.Recette"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Recette> listeRecette = (ArrayList<Recette>) request.getAttribute(C.listeRecette);
	Recette uneRecette = (Recette) request.getAttribute(C.recette);
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
<title>Gestion des Recettes</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="../views/header.jsp"%>
	<!--MAIN -->
	<img src="images/gestion-recette.jpeg" alt="Mamie clafoutis">

	<h2 id="titre-gestion-recette">Liste des Recettes presentes :</h2>
	<%
		if (listeRecette != null) {
	%>

	<h2>
		<a id="lien-gestion-recette"
			href="ajoutNouveauDonnees?ajoutRecette=true">Ajouter une Recette</a>
	</h2>
	<table id="table-gestion-recette">
		<tbody>
			<tr>
				<th>nom de Recette</th>
				<th>Modifier</th>
				<th>Retirer</th>
			</tr>
			<%
				for (Recette recette : listeRecette) {
			%>
			<tr>
				<td><%=recette.getNomRecette()%></td>
				<td><a
					href="gestionRecette?idRecetteAModifier=<%=recette.getIdRecette()%>">modifier
						Recette</a></td>
				<td><a
					href="retirerDonnees?idRecette=<%=recette.getIdRecette()%>?retirerRecette=true">retirer
						Recette</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<%
		} else if (uneRecette != null) {
	%>
	<form id="recette-modifier" action="gestionRecette" method="post">
		<label>nom de Recette :</label> <input type="text" name="nomProduit"
			value="<%=uneRecette.getNomRecette()%>">
		<h4>les ingredients :</h4>
		<table>
			<tbody>
				<tr>
					<th>Ingredient</th>
					<th>Quantité en grammes (g)</th>
				</tr>
				<%
					ArrayList<Ingredient> lesIngredients = uneRecette.getLesIngredient();
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
		<ul id=bouton-gestion-recette>
			<li><input class="boutton-modif-recette" type="submit" name="annulerModificationRecette"
				value="Annuler"></li>
			<li><input class="boutton-modif-recette" type="submit" name="enregistrerRecette"
				value="Enregister les modifications"></li>
		</ul>

	</form>

	<%
		}
	%>
	<!--FOOTER-->
	<%@ include file="../views/footer.jsp"%>
</body>
</html>