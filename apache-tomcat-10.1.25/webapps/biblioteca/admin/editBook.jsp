<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/common/commonNavbar.jsp"/>
<div class="container">
    <h2>Edit Book</h2>
    <form action="${pageContext.request.contextPath}/atualizarLivro" method="post">
        <div>
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" value="${livros.isbn}" readonly>
        </div>
        <div>
            <label for="titulo">Title:</label>
            <input type="text" id="titulo" name="titulo" value="${livros.titulo}" required>
        </div>
        <div>
            <label for="categoria">Category:</label>
            <input type="text" id="categoria" name="categoria" value="${livros.categoria}" required>
        </div>
        <div>
            <label for="quantidade">Quantity:</label>
            <input type="number" id="quantidade" name="quantidade" value="${livros.quantidade}" required>
        </div>
        <div>
            <button type="submit">Update Book</button>
        </div>
    </form>
</div>
<jsp:include page="/common/commonFooter.jsp"/>
</body>
</html>
