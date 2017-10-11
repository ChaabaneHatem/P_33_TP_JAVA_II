
<%@page import="manager.ManagerSession"%>
<%@page import="enitities.Employe"%>
<%@page import="manager.ManagerPanier"%>

<%
	Employe employeConnecte = (Employe) ManagerSession.get(request, "user");
%>

<header>
	<a href="index.jsp"><img id="logo"
		src="images/mamieclafoutis_logo.png" alt="Mamie clafoutis"></a>
	<div id="nav-header">
		<ul>
			<li><a href="index.jsp">Accueil</a></li>
			<li><a href="afficherProduit">Produit</a></li>
			<%
				if (employeConnecte != null) {
					if (employeConnecte.getFonction().getType().equals("Admin")) {
			%>
			<li><a href="redirectionDesPages?user=admin">Admin</a></li>

			<%
				}
				} else {
			%>
			<li><a href="actionPanier?afficherPanier=true">Panier(<%=ManagerPanier.getNbArticle(request)%>)
			</a></li>
			<%
				}
			%>

			<li><a href="email.jsp">Contact</a></li>
		</ul>
	</div>
</header>
