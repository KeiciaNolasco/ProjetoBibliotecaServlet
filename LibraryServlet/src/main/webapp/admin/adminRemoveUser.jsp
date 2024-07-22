<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>Remove User</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/admin/adminNavbar.jsp"/>
<div class="add-book-container">
    <div class="add-book-form">
        <h2>Remove User</h2>
        <div class="book-details">
            <div class="info-container" style="background: rgba(255, 255, 255, 0.9); padding: 15px; border-radius: 10px; display: inline-block; margin: 10px 0;">
                <div class="book-info">
                    <div class="info-row"><strong>ID:</strong> ${param.id}</div>
                    <div class="info-row"><strong>Name:</strong> ${param.name}</div>
                    <div class="info-row"><strong>Email:</strong> ${param.email}</div>
                    <div class="info-row"><strong>Password:</strong> ${param.password}</div>
                </div>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/adminRemoveUser" method="post">
            <input type="hidden" name="id" value="${param.id}">
            <input type="hidden" name="name" value="${param.name}">
            <input type="hidden" name="email" value="${param.email}">
            <input type="hidden" name="password" value="${param.password}">
            <div>
                <input type="submit" value="Remove User">
            </div>
        </form>
    </div>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>
