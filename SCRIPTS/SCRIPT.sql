CREATE TABLE USUARIO(
ID int PRIMARY KEY NOT NULL,
NOME varchar(255),
DAT_NASCIMENTO date,
DAT_CRIACAO date,
DAT_ALTERACAO date,
DAT_EXCLUSAO date,
CRIADO_POR_USU_ID int,
ALTERADO_POR_USU_ID int, 
EXCLUIDO_POR_USU_ID int,
IND_ATIVO char
);

CREATE TABLE PRODUTOS(
ID int PRIMARY KEY NOT NULL,
USUARIO_ID int,
NOME varchar (255),
VALOR decimal,
DAT_CRIACAO date,
DAT_ALTERACAO date,
DAT_EXCLUSAO date,
CRIADO_POR_USU_ID int,
ALTERADO_POR_USU_ID int,
EXCLUIDO_POR_USU_ID int,
IND_ATIVO char,
CONSTRAINT FK_PRODUTOUSUARIO FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO(ID));


CREATE TABLE ESTOQUE(
ID int PRIMARY KEY NOT NULL,
ID_PRODUTO int,
NM_QUANTIDADE int,
IND_ATIVO char
CONSTRAINT FK_ESTOQUEPRODUTO FOREIGN KEY (ID_PRODUTO)
REFERENCES PRODUTOS(ID));


CREATE TABLE VENDAS(
ID int PRIMARY KEY NOT NULL,
USUARIO_ID int,
DAT_CRIACAO date,
DAT_ALTERACAO date, 
DAT_EXCLUSAO date,
CRIADO_POR_USU_ID int,
ALTERADO_POR_USU_ID int,
EXCLUIDO_POR_USU_ID int ,
IND_ATIVO char,
CONSTRAINT FK_VENDAUSUARIO FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO(ID));

CREATE TABLE VENDAS_PRODUTOS(
ID int PRIMARY KEY NOT NULL,
ID_VENDA int,
ID_PRODUTO int,
USUARIO_ID int,
VALOR decimal,
DESCONTO decimal,
VALOR_FINAL decimal,
DAT_CRIACAO date,
DAT_ALTERACAO date,
DAT_EXCLUSAO date,
CRIADO_POR_USU_ID int,
ALTERADO_POR_USU_ID int,
EXCLUIDO_POR_USU_ID int,
IND_ATIVO char,
CONSTRAINT FK_VENDASPRODUTO_USUARIO FOREIGN KEY (USUARIO_ID)
REFERENCES USUARIO(ID),
CONSTRAINT FK_VENDA_VENDASPRODUTO FOREIGN KEY (ID_VENDA)
REFERENCES VENDAS(ID),
CONSTRAINT FK_VENDA_PRODUTO FOREIGN KEY (ID_PRODUTO)
REFERENCES PRODUTOS(ID));

CREATE TABLE ENVIAR_EMAIL(
  ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
  DESTINATARIO varchar(150),
  ASSUNTO varchar(200),
  CORPO varchar(max)
);

-- Crie uma trigger para a tabela de vendas que notifique o e-mail ‘contato@sysmap.com.br’ toda vez que uma venda for criada.
CREATE TRIGGER tgr_enviarEmail

ON VENDAS

FOR INSERT 
AS
BEGIN 
  DECLARE 
  @IdVenda int,
  @DatCriacao date;

  SELECT @IdVenda = ID,
		 @DatCriacao = DAT_CRIACAO
  FROM 
		 INSERTED 

  INSERT INTO dbo.ENVIAR_EMAIL
  (
		DESTINATARIO,
		ASSUNTO,
		CORPO 
  )
  VALUES
  (
	'contato@sysmap.com.br',
	'Nova venda realizada',
	'Foi realizada uma venda'
  )
END

-- Crie uma trigger para a tabela de venda que notifique o e-mail ‘contato@sysmap.com.br’ toda vez que um produto for vendido e houver menos de 3 itens em estoque.
CREATE TRIGGER tgr_enviarEmail

ON PRODUTOS

FOR INSERT 
AS
BEGIN 
  DECLARE 
  @Id int,
  @DatCriacao date,
  @NomeDoProduto varchar(255);

  IF ((SELECT count(ID_PRODUTO) FROM ESTOQUE where ID_PRODUTO = @Id) > 2)  
    SELECT @Id = ID,
		   @DatCriacao = DAT_CRIACAO,
		   @NomeDoProduto = NOME
	FROM 
		 INSERTED
  
	INSERT INTO dbo.ENVIAR_EMAIL
	(
			DESTINATARIO,
			ASSUNTO,
			CORPO 
	)
	VALUES
	(
		'contato@sysmap.com.br',
		'Nova venda realizada',
		'Foi vendido um o produto' + @NomeDoProduto 'está acabando os itens no estoque.'
	)
END


-- Crie uma procedure que envie um e-mail para ‘contato@sysmap.com.br’ com o resumo dos 3 produtos mais vendidos dos últimos 7 dias.
CREATE PROCEDURE EnviarEmailProdutosMaisVendidos

AS

SELECT
  ID_PRODUTO, Sum(ID_PRODUTO) AS QUANTIDADE
FROM
  VENDAS_PRODUTOS
WHERE  DAT_CRIACAO >= (select dateadd(day, -6, max(DAT_CRIACAO)) from VENDAS_PRODUTOS)
GROUP BY
  ID_PRODUTO
ORDER BY 
  ID_PRODUTO 

INSERT INTO dbo.ENVIAR_EMAIL
	(
			DESTINATARIO,
			ASSUNTO,
			CORPO 
	)
	VALUES
	(
		'contato@sysmap.com.br',
		'Produtos mais vendidos',
		'Os produtos mais vendidos'
	)
	

-- Crie uma procedure que envie um email de estoque de todos os produtos quinzenalmente.
CREATE PROCEDURE EnviarEmailEstoqueProdutos

AS

SELECT
  E.ID_PRODUTO, Sum(E.ID_PRODUTO) AS QUANTIDADE,
  P.NOME AS NOMEPRODUTO
FROM
  ESTOQUE E
INNER JOIN PRODUTOS P
ON E.ID_PRODUTO = P.ID
WHERE  DAT_CRIACAO >= (select dateadd(day, 15, max(p.DAT_CRIACAO)) from PRODUTOS)
GROUP BY
  ID_PRODUTO
ORDER BY 
  ID_PRODUTO 

INSERT INTO dbo.ENVIAR_EMAIL
	(
			DESTINATARIO,
			ASSUNTO,
			CORPO 
	)
	VALUES
	(
		'contato@sysmap.com.br',
		'Estoque de produtos',
		'Segue os produtos que estão em estoque'
	)	















