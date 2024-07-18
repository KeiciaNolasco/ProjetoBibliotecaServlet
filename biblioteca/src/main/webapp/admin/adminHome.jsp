<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Home</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/admin/adminNavbar.jsp"/>
<div class="adminHome-container">
    <div class="adminHome-form">
    <h2>Welcome to the Admin Home Page</h2>
        <form action="${pageContext.request.contextPath}/adminHome" method="get">
</div>
<jsp:include page="adminFooter.jsp"/>
</body>
</html>