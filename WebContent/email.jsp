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
	<%@ include file="views/header.jsp"%>

	<!--MAIN-->
		<img src="images/banner-main.jpeg" alt="Mamie clafoutis" >
	<h1>Contactez-nous !</h1>
		<label for="message">Votre message : </label>
		<input type="text" name="message" id="message">
	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>