<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav>
    <a href="${pageContext.request.contextPath}/admin/adminHome.jsp">Home</a>
    <a href="${pageContext.request.contextPath}/admin/adminAbout.jsp">About</a>
    <a href="${pageContext.request.contextPath}/admin/adminListBooks.jsp">Books</a>
    <a href="${pageContext.request.contextPath}/admin/adminAddBook.jsp">Add Book</a>
    <a href="${pageContext.request.contextPath}/admin/adminEditBook.jsp">Edit Book</a>
    <a href="${pageContext.request.contextPath}/admin/adminRemoveBook.jsp">Remove Book</a>
    <a href="${pageContext.request.contextPath}/admin/adminLogout.jsp">Logout</a>
</nav>
