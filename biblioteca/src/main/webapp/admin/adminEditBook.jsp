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
<div class="container">
    <h2>Edit Book</h2>
    <form action="${pageContext.request.contextPath}/adminEditBook" method="post">
        <div>
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" value="${books.isbn}" readonly>
        </div>
        <div>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${books.title}" required>
        </div>
        <div>
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" value="${books.category}" required>
        </div>
        <div>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" value="${books.quantity}" required>
        </div>
        <div>
            <button type="submit">Edit Book</button>
        </div>
    </form>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>
