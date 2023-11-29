-- IF NOT EXISTS É OPCIONAL
CREATE DATABASE IF NOT EXISTS testeLBA;

-- comando exclusivo da database, entra dentro da DB
USE testeLBA;

-- apaga o DB inteiro
-- DROP DATABASE IF EXISTS testeLBA;

/*
-- EXEMPLO:
-- AUTO_INCREMENT SÓ PODE SER USADO COM INT E EM CHAVE PRIMÁRIA
CREATE TABLE IF NOT EXISTS CLIENTE(
	IDCLIENTE INT NOT NULL AUTO_INCREMENT,
    NOME VARCHAR(80) NOT NULL,
    NASC DATE NOT NULL,
    SALDO DEC(10,2) NOT NULL,
    PRIMARY KEY (IDCLIENTE)
);
*/

CREATE TABLE IF NOT EXISTS EMPRESAS (
	CNPJ VARCHAR(18) NOT NULL,
    NOME VARCHAR(80) NOT NULL,
    REPRESENTANTE VARCHAR(50) NOT NULL,
    TELEFONE VARCHAR(15) NOT NULL,
    PERCENTUAL DEC(5,2) NOT NULL,
    PRIMARY KEY(CNPJ)
);

/*
	FOREIGN KEY(COLUNA DA TABELA ATUAL) REFERENCES TABELA(CHAVE PRIMÁRIA DA TABELA REFERENCIADA) ON DELETE <OPÇÕES>;
    OPÇÕES:
		- CASCATE: DELETA TODAS AS TABELAS QUE POSSUEM A TABELA REFERENCIADA COMO FOREIGN_KEY
        - SET NULL: COLOCA NULL NA FOREIGN_KEY
        - NO ACTION / RESTRICT: NÃO DEIXA DELETAR SE TIVER FILHOS
*/
CREATE TABLE IF NOT EXISTS MODELOS (
	IDMODELO INT NOT NULL AUTO_INCREMENT,
    NOMEMODELO VARCHAR(30) NOT NULL,
    FK_EMPRESAS_CNPJ VARCHAR(18) NOT NULL,
    PRIMARY KEY(IDMODELO),
    FOREIGN KEY(FK_EMPRESAS_CNPJ) REFERENCES EMPRESAS(CNPJ)
);

CREATE TABLE IF NOT EXISTS PRODUTOS (
	IDPRODUTO INT NOT NULL AUTO_INCREMENT,
    NOMEPRODUTO VARCHAR(30) NOT NULL,
    VALORUNITARIO DEC(10,2) NOT NULL,
    FK_MODELOS_IDMODELO INT NOT NULL,
    PRIMARY KEY(IDPRODUTO),
    FOREIGN KEY(FK_MODELOS_IDMODELO) REFERENCES MODELOS(IDMODELO)
);

CREATE TABLE IF NOT EXISTS ESTADOS (
	SIGLA CHAR(2) NOT NULL,
    NOMEESTADO VARCHAR(20) NOT NULL,
    PRIMARY KEY(SIGLA)
);

CREATE TABLE IF NOT EXISTS CIDADES (
	IDCIDADE INTEGER NOT NULL AUTO_INCREMENT,
    NOMECIDADE VARCHAR(50) NOT NULL,
    FK_ESTADOS_SIGLA CHAR(2) NOT NULL,
    PRIMARY KEY(IDCIDADE),
    FOREIGN KEY(FK_ESTADOS_SIGLA) REFERENCES ESTADOS(SIGLA)
);

CREATE TABLE IF NOT EXISTS CEP (
	CEP VARCHAR(10) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    ENDERECO VARCHAR(80) NOT NULL,
    FK_CIDADES_IDCIDADE INTEGER NOT NULL,
    PRIMARY KEY(CEP),
    FOREIGN KEY(FK_CIDADES_IDCIDADE) REFERENCES CIDADES(IDCIDADE)
);

CREATE TABLE IF NOT EXISTS CLIENTES (
    CPF_CNPJ VARCHAR(18) NOT NULL,
    TIPO CHAR(1) NOT NULL,
    NOME VARCHAR(80) NOT NULL,
    TELEFONE VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(80) NOT NULL,
    NUMERO VARCHAR(10) NOT NULL,
    COMPLEMENTO VARCHAR(200),
    FK_CEP_CEP VARCHAR(10) NOT NULL,
    PRIMARY KEY(CPF_CNPJ),
    FOREIGN KEY(FK_CEP_CEP) REFERENCES CEP(CEP)
);

/*
	CHAVE PRIMÁRIA COMPOSTA: PRIMARY KEY(FK_PEDIDOS_PEDIDO, FK_PRODUTOS_IDPRODUTO)
    ÍNDICE ÚNICO (COLOCA DEPOIS DA PRIMARY KEY): UNIQUE(NOMEPRODUTO)
*/

CREATE TABLE IF NOT EXISTS PEDIDOS (
	IDPEDIDO INT NOT NULL AUTO_INCREMENT,
    DATAPREVISTA DATE NOT NULL,
    VALORTOTAL DEC(10,2) NOT NULL,
    VALORCOMISSAO DEC(10,2) NOT NULL,
    NOMERETIRADA VARCHAR(50) NOT NULL,
    DATAENTREGA DATE NOT NULL,
    FK_CLIENTES_CPF_CNPJ VARCHAR(18) NOT NULL,
    PRIMARY KEY(IDPEDIDO),
    FOREIGN KEY(FK_CLIENTES_CPF_CNPJ) REFERENCES CLIENTES(CPF_CNPJ)
);

CREATE TABLE IF NOT EXISTS PRODUTOSPEDIDO (
	IDITEM INT NOT NULL AUTO_INCREMENT,
    FK_PEDIDOS_IDPEDIDO INT NOT NULL,
    FK_PRODUTOS_IDPRODUTO INT NOT NULL,
    COR VARCHAR(15) NOT NULL,
    TAMANHO VARCHAR(5) NOT NULL,
    QUANTIDADE INT NOT NULL,
    PRIMARY KEY(IDITEM),
    FOREIGN KEY(FK_PEDIDOS_IDPEDIDO) REFERENCES PEDIDOS(IDPEDIDO),
    FOREIGN KEY(FK_PRODUTOS_IDPRODUTO) REFERENCES PRODUTOS(IDPRODUTO)
);