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
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
</nav>
</body>
</html>
