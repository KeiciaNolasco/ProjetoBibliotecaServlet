<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/admin/adminNavbar.jsp"/>
<div class="add-book-container">
    <div class="add-book-form">
        <h2>Edit User</h2>
        <form action="${pageContext.request.contextPath}/adminEditUser" method="post">
            <input type="hidden" name="id" value="${param.id}" required>
            <div>
                <label for="id">ID:</label>
                <input type="number" id="id" name="id" value="${param.id}" required>
            </div>
            <div>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${param.name}" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="${param.email}" required>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="text" id="password" name="password" value="${param.password}" required>
            </div>
            <div>
                <input type="submit" value="Save">
            </div>
        </form>
    </div>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>
