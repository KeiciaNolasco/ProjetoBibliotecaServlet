<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h1>Login</h1>
<c:if test="${param.error != null}">
    <p style="color:red;">Email ou senha inválidos.</p>
</c:if>
<form action="UsuarioController" method="post">
    <input type="hidden" name="action" value="login"/>
    Email: <input type="email" name="email" required/><br/>
    Senha: <input type="password" name="senha" required/><br/>
    <input type="submit" value="Login"/>
</form>
<a href="home.jsp">Voltar para Home</a>
</body>
</html>
