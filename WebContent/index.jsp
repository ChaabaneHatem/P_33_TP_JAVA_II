
<%@page import="manager.ManagerSession"%>
<%@page import="enitities.Employe"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Khula"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mamie Clafoutis</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="views/header.jsp"%>


	<!--MAIN-->
	<img src="images/accueil-banner.jpeg" alt="Mamie clafoutis">
	<h1 id="titre-accueil">Bienvenue chez Mamie!</h1>
	<p id="text-accueil">Lorem ipsum dolor sit amet, consectetur
		adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
		magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
		ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute
		irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
		fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
		sunt in culpa qui officia deserunt mollit anim id est laborum</p>



	<%
		if (employeConnecte != null) {
			if (employeConnecte.getFonction().getType().equals("Admin")) {
	%>
	<div class="connect-div">
		<a href="redirectionDesPages?deconnexion=true"><button
				class="connect-bouton">Deconnexion</button></a>
	</div>

	<%
		}
		} else {
	%>
	<div class="connect-div">
		<a href="connection.jsp"><button class="connect-bouton">Connectez-vous</button></a>
	</div>
	<%
		}
	%>




	<div class="connect-div">
		<a href="Inscription"><button class="connect-bouton">Inscrivez-vous</button></a>
	</div>



	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>