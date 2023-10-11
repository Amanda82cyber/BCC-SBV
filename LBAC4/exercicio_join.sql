USE LBAEVENTOS;

-- ATIVIDADE DE JOINS

-- 1
-- JOIN
SELECT ENTIDADE.CNPJ_CPF, ENTIDADE.RAZAOSOCIAL, ATUACAO.NOMEATUACAO, SETOR.NOMESETOR
FROM ENTIDADE
INNER JOIN ATUACAO ON ATUACAO.CODATUACAO = ENTIDADE.FKCODATUACAO
INNER JOIN SETOR ON SETOR.CODSETOR = ATUACAO.FKCODSETOR
ORDER BY SETOR.NOMESETOR, ATUACAO.NOMEATUACAO, ENTIDADE.RAZAOSOCIAL;

-- WHERE
SELECT ENTIDADE.CNPJ_CPF, ENTIDADE.RAZAOSOCIAL, ATUACAO.NOMEATUACAO, SETOR.NOMESETOR
FROM ENTIDADE, ATUACAO, SETOR
WHERE ATUACAO.CODATUACAO = ENTIDADE.FKCODATUACAO
AND SETOR.CODSETOR = ATUACAO.FKCODSETOR
ORDER BY SETOR.NOMESETOR, ATUACAO.NOMEATUACAO, ENTIDADE.RAZAOSOCIAL;

-- 2
-- JOIN
SELECT EVENTO.*,
LOCALEVENTO.LOGRADOURO,
LOCALEVENTO.NUMERO,
LOCALEVENTO.BAIRRO,
LOCALEVENTO.CEP,
LOCALEVENTO.COMPLEMENTO,
CIDADE.NOMECIDADE,
ESTADO.*
FROM EVENTO
INNER JOIN LOCALEVENTO ON LOCALEVENTO.CODLOCAL = EVENTO.FKCODLOCAL
INNER JOIN CIDADE ON CIDADE.CODCIDADE = LOCALEVENTO.FKCODCIDADE
INNER JOIN ESTADO ON ESTADO.SIGLAUF = CIDADE.FKSIGLAUF;

-- WHERE
SELECT EVENTO.*,
LOCALEVENTO.LOGRADOURO,
LOCALEVENTO.NUMERO,
LOCALEVENTO.BAIRRO,
LOCALEVENTO.CEP,
LOCALEVENTO.COMPLEMENTO,
CIDADE.NOMECIDADE,
ESTADO.*
FROM EVENTO, LOCALEVENTO, CIDADE, ESTADO
WHERE LOCALEVENTO.CODLOCAL = EVENTO.FKCODLOCAL
AND CIDADE.CODCIDADE = LOCALEVENTO.FKCODCIDADE
AND ESTADO.SIGLAUF = CIDADE.FKSIGLAUF;

-- 3
-- JOIN
SELECT ENTIDADE.RAZAOSOCIAL,
COLABORADOR.NOMECONTATO,
REDESSOCIAISCOLABORADOR.USUARIO,
REDESSOCIAISENTIDADE.USUARIO,
TELEFONESENTIDADE.DDD,
TELEFONESENTIDADE.TELEFONE
FROM ENTIDADE
INNER JOIN COLABORADOR ON COLABORADOR.FKCNPJ_CPF = ENTIDADE.CNPJ_CPF
INNER JOIN REDESSOCIAISCOLABORADOR ON REDESSOCIAISCOLABORADOR.FKCODCONTATO = COLABORADOR.CODCONTATO
INNER JOIN REDESSOCIAISENTIDADE ON REDESSOCIAISENTIDADE.FKCNPJ_CPF = ENTIDADE.CNPJ_CPF
INNER JOIN TELEFONESENTIDADE ON TELEFONESENTIDADE.FKCNPJ_CPF = ENTIDADE.CNPJ_CPF
ORDER BY ENTIDADE.RAZAOSOCIAL, COLABORADOR.NOMECONTATO;

-- WHERE
SELECT ENTIDADE.RAZAOSOCIAL,
COLABORADOR.NOMECONTATO,
REDESSOCIAISCOLABORADOR.USUARIO,
REDESSOCIAISENTIDADE.USUARIO,
TELEFONESENTIDADE.DDD,
TELEFONESENTIDADE.TELEFONE
FROM ENTIDADE, COLABORADOR, REDESSOCIAISCOLABORADOR, REDESSOCIAISENTIDADE, TELEFONESENTIDADE
WHERE COLABORADOR.FKCNPJ_CPF = ENTIDADE.CNPJ_CPF
AND REDESSOCIAISCOLABORADOR.FKCODCONTATO = COLABORADOR.CODCONTATO
AND REDESSOCIAISENTIDADE.FKCNPJ_CPF = ENTIDADE.CNPJ_CPF
AND TELEFONESENTIDADE.FKCNPJ_CPF = ENTIDADE.CNPJ_CPF
ORDER BY ENTIDADE.RAZAOSOCIAL, COLABORADOR.NOMECONTATO;

-- 4
-- JOIN
SELECT COLABORADOR.NOMECONTATO,
INTERESSE.NOMEINTERESSE
FROM COLABORADOR
INNER JOIN INTERESSESCONTATO ON INTERESSESCONTATO.FKCODCONTATO = COLABORADOR.CODCONTATO
INNER JOIN INTERESSE ON INTERESSE.CODINTERESSE = INTERESSESCONTATO.FKCODINTERESSE
ORDER BY COLABORADOR.NOMECONTATO, INTERESSE.NOMEINTERESSE;

-- WHERE
SELECT COLABORADOR.NOMECONTATO,
INTERESSE.NOMEINTERESSE
FROM COLABORADOR, INTERESSESCONTATO, INTERESSE
WHERE INTERESSESCONTATO.FKCODCONTATO = COLABORADOR.CODCONTATO
AND INTERESSE.CODINTERESSE = INTERESSESCONTATO.FKCODINTERESSE
ORDER BY COLABORADOR.NOMECONTATO, INTERESSE.NOMEINTERESSE;

-- 5
-- JOIN
SELECT COLABORADOR.NOMECONTATO,
EVENTO.NOMEEVENTO
FROM COLABORADOR
INNER JOIN CLASSIFICACAOCONTATO ON CLASSIFICACAOCONTATO.FKCODCONTATO = COLABORADOR.CODCONTATO
INNER JOIN CLASSIFICACAO ON CLASSIFICACAO.CODCLASSIFICACAO = CLASSIFICACAOCONTATO.FKCODCLASSIFICACAO
INNER JOIN PUBLICOCONVIDADO ON PUBLICOCONVIDADO.FKCODCLASSIFICACAO = CLASSIFICACAO.CODCLASSIFICACAO
INNER JOIN EVENTO ON EVENTO.CODEVENTO = PUBLICOCONVIDADO.FKCODEVENTO;

-- WHERE
SELECT COLABORADOR.NOMECONTATO,
EVENTO.NOMEEVENTO
FROM COLABORADOR, CLASSIFICACAOCONTATO, CLASSIFICACAO, PUBLICOCONVIDADO, EVENTO
WHERE CLASSIFICACAOCONTATO.FKCODCONTATO = COLABORADOR.CODCONTATO
AND CLASSIFICACAO.CODCLASSIFICACAO = CLASSIFICACAOCONTATO.FKCODCLASSIFICACAO
AND PUBLICOCONVIDADO.FKCODCLASSIFICACAO = CLASSIFICACAO.CODCLASSIFICACAO
AND EVENTO.CODEVENTO = PUBLICOCONVIDADO.FKCODEVENTO;
