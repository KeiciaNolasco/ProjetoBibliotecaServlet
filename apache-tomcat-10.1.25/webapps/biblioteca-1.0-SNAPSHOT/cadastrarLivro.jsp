<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Livro</title>
</head>
<body>
<h1>Cadastrar Livro</h1>
<form action="LivroController?action=insert" method="post">
    ISBN: <input type="text" name="isbn" required/><br/>
    Título: <input type="text" name="titulo" required maxlength="50"/><br/>
    Categoria: <input type="text" name="categoria"/><br/>
    Quantidade: <input type="number" name="quantidade" required/><br/>
    <input type="submit" value="Cadastrar"/>
</form>
<a href="home.jsp">Voltar para Home</a>
</body>
</html>
