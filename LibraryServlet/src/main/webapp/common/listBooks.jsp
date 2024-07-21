<%@ page import="com.library.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.library.dao.BookDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>List Books</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/common/navbar.jsp"/>
<div class="books-container">
    <h2>List Books</h2>
    <div class="books-grid-container">
        <%
            BookDAO bdao = new BookDAO();
            List<Book> list = bdao.findAll();
            for (Book book : list) {
        %>
        <div class="books-box">
            <div class="box-image">
                <img src="${pageContext.request.contextPath}/resources/<%= book.getImage() %>" alt="<%= book.getTitle() %>">
            </div>
            <div class="book-info">
                <div class="book-isbn">ISBN: <%= book.getIsbn() %></div>
                <div class="book-title">Title: <%= book.getTitle() %></div>
                <div class="book-category">Category: <%= book.getCategory() %></div>
                <div class="book-quantity">Quantity: <%= book.getQuantity() %></div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
<jsp:include page="/common/footer.jsp"/>
</body>
</html>