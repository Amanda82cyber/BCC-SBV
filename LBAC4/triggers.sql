USE EmpresaPedidos;

/*
	Utilizando o banco de dados empresapedidos, crie um gatilho para gravar o
	histórico de um pedido antes de sua alteração. Para tanto, crie a tabela
	pedidohistorico utilizando o script a seguir. O valor da DataAtual é a data e hora
	do servidor e a Acao é "U" de update.
*/

CREATE TABLE IF NOT EXISTS pedidoHistorico (
	idHistorico INT AUTO_INCREMENT,
    idPedido INT,
    ValorTotal DECIMAL(10,2),
    PrevisaoEntrega DATETIME,
    DataAtual DATETIME,
    Acao CHAR(1),
    PRIMARY KEY(idHistorico)
);

DELIMITER //

CREATE TRIGGER insert_pedido_historico BEFORE UPDATE ON PEDIDO
FOR EACH ROW
BEGIN
	INSERT INTO PEDIDOHISTORICO(IDPEDIDO, VALORTOTAL, PREVISAOENTREGA, DATAATUAL, ACAO) VALUES(
		OLD.IDPEDIDO,
        OLD.VALORTOTAL,
        OLD.PREVISAOENTREGA,
        NOW(),
        'U'
    );
END;

//

DELIMITER ;

SELECT * FROM PEDIDOHISTORICO;

/*
	Utilizando o banco de dados empresapedidos, crie gatilhos para atualizar
	o valor total do pedido após a inclusão, alteração ou exclusão de um item do pedido
*/

DELIMITER //

CREATE TRIGGER UP_PEDIDO_AFTER_INS AFTER INSERT ON PEDIDOITENS
FOR EACH ROW
BEGIN
	SET VALORUNITARIO := (SELECT VALORUNITARIO FROM PRODUTO WHERE IDPRODUTO = NEW.FKPRODUTO);
    
	UPDATE PEDIDO SET
		VALORTOTAL = VALORTOTAL + (VALORUNITARIO * NEW.QUANTIDADE)
	WHERE IDPEDIDO = NEW.FKPEDIDO;
END;

CREATE TRIGGER UP_PEDIDO_AFTER_DEL AFTER DELETE ON PEDIDOITENS
FOR EACH ROW
BEGIN
	SET VALORUNITARIO := (SELECT VALORUNITARIO FROM PRODUTO WHERE IDPRODUTO = OLD.FKPRODUTO);
    
	UPDATE PEDIDO SET
		VALORTOTAL = VALORTOTAL - (VALORUNITARIO * OLD.QUANTIDADE)
	WHERE IDPEDIDO = OLD.FKPEDIDO;
END;

CREATE TRIGGER UP_PEDIDO_AFTER_UP AFTER UPDATE ON PEDIDOITENS
FOR EACH ROW
BEGIN
	SET VALORTOTALUP := (
		SELECT SUM(PR.VALORUNITARIO * PI.QUANTIDADE) INTO valorTotalPedido
		FROM PEDIDOITENS PI
		INNER JOIN PRODUTO PR ON PI.FKPRODUTO = PR.IDPRODUTO
		WHERE PI.FKPEDIDO = NEW.FKPEDIDO
    );
    
	UPDATE PEDIDO SET
		VALORTOTAL = VALORTOTALUP
	WHERE IDPEDIDO = NEW.FKPEDIDO;
END;

//

DELIMITER ;

SELECT * FROM PEDIDOITENS;
