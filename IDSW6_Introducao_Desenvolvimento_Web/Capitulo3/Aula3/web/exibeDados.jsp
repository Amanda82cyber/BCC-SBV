<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exibe Dados</title>
    </head>
    <body>
        Descrição: ${requestScope.prod.descricao} <!-- expression language -->
        <br/>
        <a href="index.html">Voltar</a>
    </body>
</html>
