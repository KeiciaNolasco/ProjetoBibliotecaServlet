<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Books</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/common/commonNavbar.jsp"/>
<div class="container">
    <h2>List of Books</h2>
    <table>
        <thead>
        <tr>
            <th>ISBN</th>
            <th>Title</th>
            <th>Category</th>
            <th>Quantity</th>
            <c:if test="${sessionScope.usuarios != null}">
                <th>Actions</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="livros" items="${listaLivros}">
            <tr>
                <td>${livros.isbn}</td>
                <td>${livros.titulo}</td>
                <td>${livros.categoria}</td>
                <td>${livros.quantidade}</td>
                <c:if test="${sessionScope.usuarios != null}">
                    <td>
                        <a href="${pageContext.request.contextPath}/editarLivro?isbn=${livros.isbn}">Edit</a>
                        <a href="${pageContext.request.contextPath}/deletarLivro?isbn=${livros.isbn}">Delete</a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/common/commonFooter.jsp"/>
</body>
</html>
