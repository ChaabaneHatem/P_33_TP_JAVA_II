
<%@page import="manager.ManagerPanier"%>
<header>
	<a href="index.jsp"><img id="logo" src="images/mamieclafoutis_logo.png" alt="Mamie clafoutis" ></a>
	<div id="nav-header">
		<ul>
			<li><a href="index.jsp">Accueil</a></li>
			<li><a href="afficherProduit">Produit</a></li>
			<li><a href="actionPanier?afficherPanier=true">Panier(<%=ManagerPanier.getNbArticle(request)%>)</a></li>
			<li><a href="email.jsp">Contact</a></li>
		</ul>
	</div>
</header>
