<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Lista de Livros</title>
</head>
<body>
<h1>Lista de Livros</h1>
<table border="1">
  <tr>
    <th>ISBN</th>
    <th>Título</th>
    <th>Categoria</th>
    <th>Quantidade</th>
    <th>Ações</th>
  </tr>
  <c:forEach var="livro" items="${livros}">
    <tr>
      <td>${livro.isbn}</td>
      <td>${livro.titulo}</td>
      <td>${livro.categoria}</td>
      <td>${livro.quantidade}</td>
      <td>
        <a href="LivroController?action=edit&isbn=${livro.isbn}">Alterar</a> |
        <a href="LivroController?action=delete&isbn=${livro.isbn}">Excluir</a>
      </td>
    </tr>
  </c:forEach>
</table>
<a href="home.jsp">Voltar para Home</a>
</body>
</html>
