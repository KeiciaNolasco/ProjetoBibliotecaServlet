<%@ page import="com.library.model.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/admin/adminNavbar.jsp"/>
<div class="add-book-container">
    <div class="add-book-form">
        <h2>Edit Book</h2>
        <form action="${pageContext.request.contextPath}/adminEditBook" method="post">
            <input type="hidden" name="isbn" value="${param.isbn}" required>
            <div>
                <label for="isbn">ISBN:</label>
                <input type="text" id="isbn" name="isbn" value="${param.isbn}" required>
            </div>
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${param.title}" required>
            </div>
            <div>
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" value="${param.category}" required>
            </div>
            <div>
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" value="${param.quantity}" required>
            </div>
            <div>
                <label for="image">Image URL:</label>
                <input type="text" id="image" name="image" value="${param.image}" required>
            </div>
            <div>
                <input type="submit" value="Edit Book">
            </div>
        </form>
    </div>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>