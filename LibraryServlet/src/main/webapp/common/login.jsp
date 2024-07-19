<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/common/navbar.jsp"/>
<div class="login-container">
    <div class="login-form">
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <input type="submit" value="Login">
            <c:if test="${not empty errorMessage}">
                <p style="color:red">${errorMessage}</p>
            </c:if>
        </form>
    </div>
</div>
<jsp:include page="/common/footer.jsp"/>
</body>
</html>
