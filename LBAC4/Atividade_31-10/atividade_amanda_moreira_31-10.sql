USE EmpresaPedidos;

-- ATIVIDADE (31/10)

-- 1) Liste o valor total de pedidos, por cliente da região sul, realizados nos últimos 2 anos
SELECT SUM(P.VALORTOTAL) AS VALOR_TOTAL,
C.NOME AS CLIENTE
FROM Pedido AS P
INNER JOIN Cliente AS C ON P.FKCLIENTE = C.IDCLIENTE
INNER JOIN Enderecos AS E ON C.IDCLIENTE = E.FKCIDADE
INNER JOIN Cidade AS CI ON CI.IDCIDADE = E.FKCIDADE
WHERE YEAR(P.DATAPEDIDO) IN(2023, 2022)
AND CI.SIGLAESTADO IN('PR', 'RS', 'SC')
GROUP BY C.NOME;

-- 2) Liste os 10 produtos mais vendidos no último ano
SELECT P.NOMEPRODUTO, (COUNT(PI.IDITEM) * PI.QUANTIDADE) AS QUANTIDADE_TOTAL
FROM PedidoItens AS PI
INNER JOIN Produto AS P ON P.IDPRODUTO = PI.FKPRODUTO
INNER JOIN Pedido AS PE ON PE.IDPEDIDO = PI.FKPEDIDO
WHERE YEAR(PE.DATAPEDIDO) = 2022
GROUP BY P.NOMEPRODUTO
ORDER BY QUANTIDADE_TOTAL DESC
LIMIT 10;

-- 3) Liste o valor total de pedidos, por cliente, mês a mês no ano de 2021, no formato a seguir. 
-- Utilize o UNION para juntar os valores de cada mês em um único SELECT.
CREATE VIEW SOMATOTAL AS
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, SUM(VALORTOTAL) AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 1
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, SUM(VALORTOTAL) AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 2
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, SUM(VALORTOTAL) AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 3
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, SUM(VALORTOTAL) AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 4
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, SUM(VALORTOTAL) AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 5
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, SUM(VALORTOTAL) AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 6
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
SUM(VALORTOTAL) AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 7
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, SUM(VALORTOTAL) AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 8
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, SUM(VALORTOTAL) AS 'SET', 0 AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 9
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', SUM(VALORTOTAL) AS 'OUT', 0 AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 10
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', SUM(VALORTOTAL) AS NOV, 0 AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 11
GROUP BY NOME, YEAR(DATAPEDIDO)
UNION
SELECT NOME, YEAR(DATAPEDIDO) AS AN0, 0 AS JAN, 0 AS FEV, 0 AS MAR, 0 AS ABR, 0 AS MAI, 0 AS JUN, 
0 AS JUL, 0 AS AGO, 0 AS 'SET', 0 AS 'OUT', 0 AS NOV, SUM(VALORTOTAL) AS DEZ, SUM(VALORTOTAL) AS TOTAL
FROM PEDIDO
INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = PEDIDO.FKCLIENTE
WHERE MONTH(DATAPEDIDO) = 12
GROUP BY NOME, YEAR(DATAPEDIDO);

SELECT NOME, SUM(JAN) AS JAN, SUM(FEV) AS FEV, SUM(MAR) AS MAR, SUM(ABR) AS ABR, SUM(MAI) AS MAI, SUM(JUN) AS JUN,
SUM(JUL) AS JUL, SUM(AGO) AS AGO, SUM('SET') AS 'SET', SUM('OUT') AS 'OUT', SUM(NOV) AS NOV, SUM(DEZ) AS DEZ
FROM SOMATOTAL
WHERE ANO = 2021
GROUP BY NOME
ORDER BY NOME;
