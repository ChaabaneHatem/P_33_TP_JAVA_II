<%@page import="enitities.Ingredient"%>
<%@page import="services.C"%>
<%@page import="java.util.ArrayList"%>
<%
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
<title>Gestion des ingredients</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="../views/header.jsp"%>
	<!--MAIN -->
	<img src="images/gestion-ingredrient.jpeg" alt="Mamie clafoutis">

	<h2 id="titre-ingredient">Liste des ingredients presents :</h2>
	<%
		if (listeIngredient != null) {
	%>

	<h2 id="lien-ingredient">
		<a href="ajoutNouveauDonnees?ajoutIngredient=true">Ajouter un
			ingredient</a>
	</h2>
	<table id="table-ingredient">
		<tbody>
			<tr>
				<th>nom d'ingredient</th>
				<th>Retier Ingredient</th>
			</tr>
			<%
				for (Ingredient ing : listeIngredient) {
			%>
			<tr>
				<td><%=ing.getNomIngredient()%></td>
				<td><a
					href="retirerDonnees?idIngredient=<%=ing.getIdIngredient()%>?retirerIngredient=true">retirer
						ingredient</a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<%
		}
	%>
	<!--FOOTER-->
	<%@ include file="../views/footer.jsp"%>
</body>
</html>