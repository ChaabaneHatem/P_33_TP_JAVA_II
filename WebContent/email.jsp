<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="https://fonts.googleapis.com/css?family=Khula"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!--HEADER-->
	<%@ include file="views/header.jsp"%>

	<!--MAIN-->
		<img src="images/patiss.jpeg" alt="Mamie clafoutis" >
	<h1>Contactez-nous !</h1>
		<form action="SendMail" method="post">
        <table border="0" width="35%" align="center">
            <tr>
                <td width="50%">Votre addresse courriel </td>
                <td><input type="text" name="email" size="50"/></td>
            </tr>
            <tr>
                <td>Sujet </td>
                <td><input type="text" name="sujet" size="50"/></td>
            </tr>
            <tr>
                <td>Message </td>
                <td><textarea rows="10" cols="39" name="message"></textarea> </td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Soumettre"/></td>
            </tr>
        </table>
         
    </form>
	<!--FOOTER-->
	<%@ include file="views/footer.jsp"%>
</body>
</html>