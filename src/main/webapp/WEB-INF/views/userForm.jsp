<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Rejestracja</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<section id="registration-form" class="container container--85">
    <h2>Zarejestruj się</h2>
    <form:form method="post" modelAttribute="user">
        <div class="form-group">
            <label for="name">Imię:</label>
            <form:input path="name" class="form-group form-group--50"/>
        </div>
        <div class="form-group">
            <label for="lastName">Nazwisko:</label>
            <form:input path="lastName" class="form-group form-group--50"/>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <form:input path="email" type="email" class="form-group form-group--50"/>
        </div>
        <div class="form-group">
            <label for="password">Hasło:</label>
            <form:input path="password" type="password" class="form-group form-group--50"/>
        </div>
        <button type="submit" class="btn">Zarejestruj się</button>
    </form:form>
    <c:if test="${not empty message}">
        <div class="alert alert-success">
                ${message}
        </div>
    </c:if>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact">
            <div class="form-group form-group--50"><input type="text" name="name" placeholder="Imię"/></div>
            <div class="form-group form-group--50"><input type="text" name="surname" placeholder="Nazwisko"/></div>
            <div class="form-group"><textarea name="message" placeholder="Wiadomość" rows="1"></textarea></div>
            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="images/icon-facebook.svg"/></a>
            <a href="#" class="btn btn--small"><img src="images/icon-instagram.svg"/></a>
        </div>
    </div>
</footer>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
