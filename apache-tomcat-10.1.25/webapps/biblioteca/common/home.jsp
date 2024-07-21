<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/common/commonNavbar.jsp"/>
<div class="banner-container">
    <img src="${pageContext.request.contextPath}/resources/images/banner.png" alt="Library Banner" class="banner-img">
    <div class="banner-text">
        BIBLIOTECA DIGITAL
    </div>
</div>
<jsp:include page="/common/commonFooter.jsp"/>
</body>
</html>
