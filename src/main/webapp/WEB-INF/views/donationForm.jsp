<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Przekaż dary</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<section id="donation-form" class="container container--85">
    <h2>Przekaż dary</h2>
    <form:form method="post" modelAttribute="donation" >
        <div class="form-group">
            <label for="categories">Kategorie:</label>
            <form:checkboxes path="categories" items="${categories}" itemLabel="name" itemValue="id" class="form-group form-group--50"/>
        </div>
        <div class="form-group">
            <label for="institution">Fundacja:</label>
            <form:select path="institution" items="${institutions}" itemLabel="name" itemValue="id" class="form-group form-group--50"/>
        </div>
        <div class="form-group">
            <label for="zipCode">Kod pocztowy: </label>
            <form:input path="zipCode" class="form-group form-group--50"/>
        </div>
        <div class="form-group">
            <label for="street">Ulica:</label>
            <form:input path="street"/>
        </div>
        <div class="form-group">
            <label for="city">Miasto:</label>
            <form:input path="city"/>
        </div>
        <div class="form-group">
            <label for="quantity">Ilość:</label>
            <form:input path="quantity"/>
        </div>
        <div class="form-group">
            <label for="pickUpComment">Komentarz:</label>
            <form:textarea path="pickUpComment"/>
        </div>
        <div class="form-group">
            <label for="pickUpDate">Data odbioru:</label>
            <form:input type="date" path="pickUpDate"/>
        </div>
        <div class="form-group">
            <label for="pickUpTime">Godzina odbioru:</label>
            <form:input type="time" path="pickUpTime"/>
        </div>
        <button type="submit" class="btn">Przekaż darowiznę</button>
    </form:form>
    <div id="summary" style="display:none;">
        <h3>Podsumowanie Darowizny</h3>
        <p>Kategorie: <span id="summary-categories"></span></p>
        <p>Instytucja: <span id="summary-institution"></span></p>
        <p>Kod pocztowy: <span id="summary-zipCode"></span></p>
        <p>Ulica: <span id="summary-street"></span></p>
        <p>Miasto: <span id="summary-city"></span></p>
        <p>Ilość: <span id="summary-quantity"></span></p>
        <p>Komentarz do odbioru: <span id="summary-pickUpComment"></span></p>
        <p>Data odbioru: <span id="summary-pickUpDate"></span></p>
        <p>Godzina odbioru: <span id="summary-pickUpTime"></span></p>
    </div>
    <button id="showSummary">Podsumowanie</button>
</section>

<jsp:include page="footer.jsp"/>
<script>
    $(document).ready(function() {
        $('#showSummary').click(function() {
            var categories = [];
            $('input[name="categories"]:checked').each(function() {
                categories.push($(this).next('label').text());
            });
            var institution = $('#institution option:selected').text();
            var zipCode = $('#zipCode').val();
            var street = $('#street').val();
            var city = $('#city').val();
            var quantity = $('#quantity').val();
            var pickUpComment = $('#pickUpComment').val();
            var pickUpDate = $('#pickUpDate').val();
            var pickUpTime = $('#pickUpTime').val();


            $('#summary-categories').text(categories.join(', '));
            $('#summary-institution').text(institution);
            $('#summary-zipCode').text(zipCode);
            $('#summary-street').text(street);
            $('#summary-city').text(city);
            $('#summary-quantity').text(quantity);
            $('#summary-pickUpComment').text(pickUpComment);
            $('#summary-pickUpDate').text(pickUpDate);
            $('#summary-pickUpTime').text(pickUpTime);


            $('#summary').show();
        });
    });
</script>
</body>
</html>