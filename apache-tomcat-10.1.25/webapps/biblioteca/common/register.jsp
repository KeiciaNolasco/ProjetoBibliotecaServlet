<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Cadastro</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<jsp:include page="/common/commonNavbar.jsp"/>
<div class="register-container">
  <div class="register-form">
    <h2>Cadastro</h2>
    <form action="${pageContext.request.contextPath}/register" method="post">
      <label for="nome">Nome:</label>
      <input type="text" id="nome" name="nome" required>
      <br>
      <label for="email">Email:</label>
      <input type="email" id="email" name="email" required>
      <br>
      <label for="senha">Senha:</label>
      <input type="password" id="senha" name="senha" required>
      <br>
      <input type="submit" value="Cadastrar">
    </form>
  </div>
</div>
<jsp:include page="/common/commonFooter.jsp"/>
</body>
</html>
