<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Biblioteca</title>
</head>
<body>
<h1>Bem-vindo à Biblioteca</h1>
<c:choose>
  <c:when test="${not empty sessionScope.usuarioLogado}">
    <p>Bem-vindo, ${sessionScope.usuarioLogado.nome}</p>
    <ul>
      <li><a href="LivroController?action=new">Cadastrar Livro</a></li>
      <li><a href="LivroController?action=list">Visualizar Livros</a></li>
      <li>
        <form action="UsuarioController" method="post" style="display:inline;">
          <input type="hidden" name="action" value="logout"/>
          <input type="submit" value="Logout"/>
        </form>
      </li>
    </ul>
  </c:when>
  <c:otherwise>
    <p><a href="login.jsp">Login</a></p>
    <p>Por favor, faça login para acessar as funcionalidades.</p>
  </c:otherwise>
</c:choose>
</body>
</html>
