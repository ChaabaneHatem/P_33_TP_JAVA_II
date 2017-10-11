<%@page import="enitities.FonctionEmploye"%>
<%@page import="services.C"%>
<%@page import="enitities.Employe"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Employe> listeEmploye = (ArrayList<Employe>) request.getAttribute(C.listeEmploye);
	ArrayList<FonctionEmploye> listeFonctionEmploye = (ArrayList<FonctionEmploye>) request
			.getAttribute(C.listeFonctionEmploye);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Khula"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Gestion des Employes</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="../views/header.jsp"%>
	<!--MAIN -->
	<%@ include file="../views/sous-menu.jsp"%>
	<%
		if (listeEmploye != null) {
	%>

	<h2 id="titre-gestion">Liste des Employés présents</h2>

	<h2 id="lien-ajoutProd">
		<a href="Inscription">Ajouter un Employe</a>
	</h2>
	<table id="table-gestion">
		<tbody>
			<tr>
				<th>Prenom</th>
				<th>Nom</th>
				<th>Role</th>
				<th>Validité</th>
				<th>modifier</th>
				<th>retirer</th>
			</tr>
			<%
				for (Employe employe : listeEmploye) {
			%>
			<tr>

				<td><%=employe.getNom()%></td>
				<td><%=employe.getPrenom()%></td>
				<td><%=employe.getFonction().getType()%></td>
				<td>
					<%  if(employe.isValide()) {out.print("oui") ;} else{ out.print("non");}%>
				</td>
				<td><a
					href="Inscription?idEmployeAModifier=<%=employe.getIdEmploye()%>">modifier
						l'employé</a></td>
				<td><a
					href="retirerDonnees?idEmployeARetirer=<%=employe.getIdEmploye()%>">retirer
						l'employé</a></td>
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