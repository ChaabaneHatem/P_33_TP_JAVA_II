
<%@page import="enitities.Recette"%>
<%@page import="enitities.CategorieProduit"%>
<%@page import="services.C"%>
<%@page import="java.util.ArrayList"%>
<%
	String ajoutProduit = request.getParameter("ajoutProduit");
	String ajoutIngredient = request.getParameter("ajoutIngredient");
	String ajoutRecette = request.getParameter("ajoutRecette");
	ArrayList<CategorieProduit> listeCategorie = (ArrayList<CategorieProduit>) request.getAttribute(C.listeCategorieProduit);
	ArrayList<Recette> listeRecette = (ArrayList<Recette>) request.getAttribute(C.listeRecette);
	
%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajout des données</title>
</head>
<body>
	<%
		if (ajoutProduit != null) {
	%>
	<h1>Ajout d'un nouveau produit </h1>
	<form action="ajoutNouveauDonnees" method="post">
		<label>Nom de produit :</label> <input type="text" name="nomProduit">
		<label>La Categorie : </label> <select>
			<%
				if (listeCategorie != null) {
						for (CategorieProduit categorie : listeCategorie) {
			%>
			<option><%=categorie.getNomCategorie()%></option>
			<%
				}
					}
			%>

		</select>
		
		<textarea rows="5" cols="5">Description de produit </textarea>
		
		<label>Le nom de Recette : </label> <select>
			<%
				if (listeRecette != null) {
						for (Recette recette : listeRecette) {
			%>
			<option><%=recette.getNomRecette()%></option>
			<%
				}
					}
			%>

		</select>
		<input type="submit" name="annulerAjout" value="Annuler">
		<input type="submit" name="AjouterCeProduit" value="Ajouter ce produit">

	</form>

	<%
		}
	%>
</body>
</html>