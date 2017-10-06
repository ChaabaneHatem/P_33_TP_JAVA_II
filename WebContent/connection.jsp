<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="parts/header.jsp"%>

	<img src="images/connection.jpeg" alt="Mamie clafoutis">

	<h1>Connectez-vous !</h1>
	<label for="username">Nom d'utilisateur</label>
	<input type="text" name="username">
	<label for="pwd">Mot de passe</label>
	<input type="text" name="username">

	<!--FOOTER-->
	<%@ include file="parts/footer.jsp"%>
</body>
</html>