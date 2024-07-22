<%@ page import="com.library.model.User" %>
<%@ page import="com.library.dao.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
            <input type="text" id="email" name="email" required>
            <br>
            <label for="password">Password:</label>
            <input type="text" id="password" name="password" required>
            <br>
            <input type="submit" value="Login">
        </form>

        <%
            String email = request.getParameter("email");

            if (email != null && !email.isEmpty()) {
                UserDAO userDAO = new UserDAO();
                User user = userDAO.findByEmail(email);

                if (user != null) {

        %>

        <form action="${pageContext.request.contextPath}/admin/adminEditUser.jsp" method="get" style="display:inline;">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            <input type="hidden" name="name" value="<%= user.getName() %>">
            <input type="hidden" name="email" value="<%= user.getEmail() %>">
            <input type="hidden" name="password" value="<%= user.getPassword() %>">
            <input type="submit" value="Edit User">
        </form>
        <form action="${pageContext.request.contextPath}/admin/adminRemoveUser.jsp" method="get" style="display:inline;">
            <input type="hidden" name="id" value="<%= user.getId() %>">
            <input type="hidden" name="name" value="<%= user.getName() %>">
            <input type="hidden" name="email" value="<%= user.getEmail() %>">
            <input type="hidden" name="password" value="<%= user.getPassword() %>">
            <input type="submit" value="Remove User">
        </form>

        <%
                }
            }
        %>

    </div>
</div>
<jsp:include page="/common/footer.jsp"/>
</body>
</html>
