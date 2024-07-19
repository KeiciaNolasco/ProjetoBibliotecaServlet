<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/common/navbar.jsp"/>
<div class="banner-container">
    <img src="${pageContext.request.contextPath}/resources/images/banner.png" alt="Library Banner" class="banner-img">
    <div class="banner-text">
        DIGITAL LIBRARY
    </div>
</div>
<jsp:include page="/common/footer.jsp"/>
</body>
</html>
