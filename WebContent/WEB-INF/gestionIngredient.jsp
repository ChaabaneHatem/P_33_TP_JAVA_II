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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gestion des ingredients</title>
</head>
<body>
	<h2>Liste des ingredients presents :</h2>
	<%
		if (listeIngredient != null) {
	%>

	<h2>
		<a href="ajoutNouveauDonnees?ajoutIngredient=true">Ajouter un
			ingredient</a>
	</h2>
	<table>
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
</body>
</html>