<%@page import="services.C"%>
<%@page import="enitities.FonctionEmploye"%>
<%@page import="java.util.ArrayList"%>

<%ArrayList<FonctionEmploye> listeFonctionEmploye = (ArrayList<FonctionEmploye>) request

.getAttribute(C.listeFonctionEmploye); 

Employe unEmploye = (Employe) request.getAttribute(C.employe);%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inscription</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="views/header.jsp"%>

	<img src="images/connexion.jpeg" alt="Mamie clafoutis">

	<h1 id="titre-connection">Inscrivez-vous !</h1>

	<form action="Inscription" method="post" id="form-connect">
		<ul>
			<li><label for="nom">Nom </label> <input type="text" name="nom" value="<% if(unEmploye != null) {out.print(unEmploye.getNom());}%>"></li>
			<li><label for="prenom" value="<% if(unEmploye != null) {out.print(unEmploye.getPrenom());}%>">Prenom</label> <input type="text"
				name="prenom" ></li>
			<li><label for="phone">Numero de telephone</label> <input type="text"
				name="phone" value="<% if(unEmploye != null) {out.print(unEmploye.getPhone());}%>"></li>
			<li><label for="adresse">Adresse </label> <input type="text"
				name="adresse" value="<% if(unEmploye != null) {out.print(unEmploye.getAdress());}%>"></li>
			<li><label for="username">Username</label> <input type="text"
				name="username" value="<% if(unEmploye != null) {out.print(unEmploye.getUsername());}%>"></li>
			<li><label for="password">Password</label> <input type="password"
				name="password"></li>
			<li><label for="email">Email</label> <input type="text"
				name="email"></li>
		</ul>
		<select name="idCategorie">

		<%

			if (listeFonctionEmploye != null) {

				for (FonctionEmploye fonction : listeFonctionEmploye) {

		%>

		<option value="<%=fonction.getIdFonction()%>">

			<%

				out.print(fonction.getType());
			%>

		</option>

		<%

			}

			}

		%>



	</select>
		<div id="form-bouton">
			<input type="submit"
			name="validerInscription" value="valider">
		</div>
	</form>

	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>