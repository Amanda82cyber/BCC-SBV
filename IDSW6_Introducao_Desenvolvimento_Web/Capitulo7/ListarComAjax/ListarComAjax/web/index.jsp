<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Listar com AJAX</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/css/estilos.css"/>
  </head>

  <body>

    <h1>Listar com AJAX</h1>

    <p>
      <a href="${cp}/formularios/frutas/listagem.jsp">Frutas</a>
    </p>
    <p>
      <a href="${cp}/formularios/carros/listagem.jsp">Carros</a>
    </p>
    <p>
      <a href="${cp}/formularios/produtos/listagem.jsp">Produtos</a>
    </p>

  </body>

</html>
