<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>About</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/admin/adminNavbar.jsp"/>
<div class="about-container">
    <div class="about-content">
        <h2>About the Library</h2>
        <p>Welcome to the Digital Library website. Here you can find and manage your favorite books.</p>
    </div>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>
