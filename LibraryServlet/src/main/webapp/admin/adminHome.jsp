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
<div class="banner-container">
    <img src="${pageContext.request.contextPath}/resources/images/background%20banner.png" alt="Library Banner" class="banner-img">
    <div class="banner-text">
        DIGITAL LIBRARY ADMINISTRATOR
    </div>
</div>
<jsp:include page="/admin/adminFooter.jsp"/>
</body>
</html>