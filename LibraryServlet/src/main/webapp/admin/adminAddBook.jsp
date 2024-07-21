<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/admin/adminNavbar.jsp"/>
<div class="add-book-container">
    <div class="add-book-form">
        <h2>Add Book</h2>
        <form action="${pageContext.request.contextPath}/adminAddBook" method="post">
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" required>
            <br>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            <br>
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required>
            <br>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" required>
            <br>
            <label for="image">Image URL:</label>
            <input type="text" id="image" name="image" required>
            <br>
            <input type="submit" value="Add Book">
        </form>
    </div>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>
