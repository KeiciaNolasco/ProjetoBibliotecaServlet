<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Navbar</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<nav>
    <a href="${pageContext.request.contextPath}/admin/adminHome.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/admin/adminAbout.jsp">About</a>
    <div class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Books</a>
        <div class="dropdown-content">
            <a href="${pageContext.request.contextPath}/admin/adminAddBook.jsp">Add</a>
            <a href="${pageContext.request.contextPath}/admin/adminListBooks.jsp">List</a>
        </div>
    </div>
    <div class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">Profile</a>
    <div class="dropdown-content">
        <c:if test="${not empty sessionScope.user}">
            <a href="${pageContext.request.contextPath}/admin/adminEditUser.jsp?id=${sessionScope.user.id}&name=${sessionScope.user.name}&email=${sessionScope.user.email}&password=${sessionScope.user.password}">Edit</a>
        </c:if>
        <a href="${pageContext.request.contextPath}/logout">Logout</a>
        <c:if test="${not empty sessionScope.user}">
            <a href="${pageContext.request.contextPath}/admin/adminRemoveUser.jsp?id=${sessionScope.user.id}&name=${sessionScope.user.name}&email=${sessionScope.user.email}&password=${sessionScope.user.password}">Remove</a>
        </c:if>
    </div>
    </div>
</nav>
</body>
</html>
