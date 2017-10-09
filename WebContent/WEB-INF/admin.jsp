<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="https://fonts.googleapis.com/css?family=Khula"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page admin</title>
</head>
<body>
	<!--HEADER-->
	<header> <img id="logo" src="images/mamieclafoutis_logo.png"
		alt="Mamie clafoutis">
	<div id="nav-header">
		<ul>
			<li><a href="index.jsp">Accueil</a></li>
			<li><a href="afficherProduit">Produit</a></li>
			<li><a href="admin.jsp">Admin</a></li>
		</ul>
	</div>
	</header>
	<main> <nav id="sous_menu_nav">
	<ul>
		<li><a href="gestionProduit">Gestion de produit</a></li>
		<li><a href="gestionRecette">Gestion de Recette</a></li>
		<li><a href="gestionIngredient">Gestion de ingredient</a></li>
		<li><a href="gestionEmploye">Gestion d'employé</a></li>
	</ul>
	</nav> 
	
	
	
	
	
	
	</main>



	<!--FOOTER-->
	<%@ include file="../views/footer.jsp"%>
</body>
</html>