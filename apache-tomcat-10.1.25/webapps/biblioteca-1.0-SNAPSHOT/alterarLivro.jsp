<!DOCTYPE html>
<html>
<head>
  <title>Alterar Livro</title>
</head>
<body>
<h1>Alterar Livro</h1>
<form action="LivroController?action=update" method="post">
  ISBN: <input type="text" name="isbn" value="${livro.isbn}" readonly/><br/>
  Título: <input type="text" name="titulo" value="${livro.titulo}" required maxlength="50"/><br/>
  Categoria: <input type="text" name="categoria" value="${livro.categoria}"/><br/>
  Quantidade: <input type="number" name="quantidade" value="${livro.quantidade}" required/><br/>
  <input type="submit" value="Alterar"/>
</form>
<a href="home.jsp">Voltar para Home</a>
</body>
</html>
