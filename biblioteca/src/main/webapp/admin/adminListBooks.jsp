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
<div class="container">
    <h2>List Books</h2>
    <table>
        <thead>
        <tr>
            <th>ISBN</th>
            <th>Title</th>
            <th>Category</th>
            <th>Quantity</th>
            <c:if test="${sessionScope.users != null}">
                <th>Actions</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="books" items="${listBooks}">
            <tr>
                <td>${books.isbn}</td>
                <td>${books.title}</td>
                <td>${books.category}</td>
                <td>${books.quantity}</td>
                <c:if test="${sessionScope.users != null}">
                    <td>
                        <a href="${pageContext.request.contextPath}/adminEditBook?isbn=${books.isbn}">Edit</a>
                        <a href="${pageContext.request.contextPath}/adminRemoveBook?isbn=${books.isbn}">Delete</a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>
