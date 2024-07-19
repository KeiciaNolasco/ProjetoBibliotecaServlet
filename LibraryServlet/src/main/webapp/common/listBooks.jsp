<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Books</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/common/navbar.jsp"/>
<div class="table-container">
    <h2>List Books</h2>
    <c:out value="${listBooks.size()}" />
    <table>
        <thead>
        <tr>
            <th>ISBN</th>
            <th>Title</th>
            <th>Category</th>
            <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="books" value="${listBooks.size()}">
            <tr>
                <td>${books.isbn}</td>
                <td>${books.title}</td>
                <td>${books.category}</td>
                <td>${books.quantity}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/common/footer.jsp"/>
</body>
</html>