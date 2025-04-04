<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html>
  <head>
    <title>Alterar Classificação Etária</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="${cp}/css/estilos.css"/>
  </head>

  <body>

    <h1>Alterar Classificação Etária</h1>

    <form method="post" action="${cp}/ClassificacaoEtariaServlet">

      <input name="acao" type="hidden" value="alterar"/>
      <input name="id" type="hidden" value="${requestScope.classificacaoEtaria.id}"/>

      <table>
        <tr>
          <td class="alinharDireita">Descrição:</td>
          <td>
            <input name="descricao"
                   type="text"
                   size="25"
                   maxlength="40"
                   required
                   value="${requestScope.classificacaoEtaria.descricao}"/>
          </td>
        </tr>
        
        <tr>
          <td>
            <a href="${cp}/formularios/classificacoesEtarias/listagem.jsp">
              Voltar
            </a>
          </td>
          <td class="alinharDireita">
            <input type="submit" value="Alterar"/>
          </td>
        </tr>
      </table>

    </form>

  </body>

</html>
