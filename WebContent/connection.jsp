<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="views/header.jsp"%>

	<img src="images/connexion.jpeg" alt="Mamie clafoutis">

	<h1 id="titre-connection">Connectez-vous !</h1>

	<form action="" method="post" id="form-connect">
		<ul>
			<li><label for="username">Nom d'utilisateur</label> <input
				type="text" name="username"></li>
			<li><label for="pwd">Mot de passe</label> <input type="text"
				name="username"></li>
		</ul>
		<div id="form-bouton">
			<a href="#"><button id="connect-form">Connectez-vous</button></a>
		</div>
	</form>

	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>