<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Books</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/admin/adminNavbar.jsp"/>
<div class="book-list-container">
    <h2>List Books</h2>
    <div class="book-list">
        <c:forEach var="book" items="${listBooks}">
            <div class="book-item">
                <img src="${pageContext.request.contextPath}/resources/images/${book.image}" alt="Book Image" class="book-image">
                <div class="book-details">
                    <p><strong>ISBN:</strong> ${book.isbn}</p>
                    <p><strong>Title:</strong> ${book.title}</p>
                    <p><strong>Category:</strong> ${book.category}</p>
                    <p><strong>Quantity:</strong> ${book.quantity}</p>
                    <div class="book-actions">
                        <a href="${pageContext.request.contextPath}/editBook?isbn=${book.isbn}">Edit</a>
                        <a href="${pageContext.request.contextPath}/removeBook?isbn=${book.isbn}">Delete</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>
