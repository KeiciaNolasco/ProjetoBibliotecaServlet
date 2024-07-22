<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Remove Book</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/admin/adminNavbar.jsp"/>
<div class="add-book-container">
    <div class="add-book-form">
        <h2>Remove Book</h2>
        <div class="book-details">
            <div class="box-image">
                <img src="${pageContext.request.contextPath}/resources/${param.image}" alt="Book Image">
            </div>
            <div class="info-container" style="background: rgba(255, 255, 255, 0.9); padding: 15px; border-radius: 10px; display: inline-block; margin: 10px 0;">
                <div class="book-info">
                    <div class="info-row"><strong>ISBN:</strong> ${param.isbn}</div>
                    <div class="info-row"><strong>Title:</strong> ${param.title}</div>
                    <div class="info-row"><strong>Category:</strong> ${param.category}</div>
                    <div class="info-row"><strong>Quantity:</strong> ${param.quantity}</div>
                    <div class="info-row"><strong>Image URL:</strong> ${param.image}</div>
                </div>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/adminRemoveBook" method="post">
            <input type="hidden" name="isbn" value="${param.isbn}">
            <input type="hidden" name="image" value="${param.image}">
            <input type="hidden" name="title" value="${param.title}">
            <input type="hidden" name="category" value="${param.category}">
            <input type="hidden" name="quantity" value="${param.quantity}">
            <div>
                <input type="submit" value="Remove Book">
            </div>
        </form>
    </div>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>
