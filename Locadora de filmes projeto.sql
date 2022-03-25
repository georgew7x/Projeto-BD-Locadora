---------------------------------------------------------------------------------------------------

CREATE DATABASE LOCADORA

CREATE TABLE FILMES(
COD_FILMES INT IDENTITY,
TITULO VARCHAR(50) NOT NULL,
DATA_LANCAMENTO DATE NOT NULL,
VALOR_ALUGUEL FLOAT NOT NULL,
PRIMARY KEY(COD_FILMES));

CREATE TABLE CLIENTE(
COD_CLIENTE INT IDENTITY NOT NULL,
NOME_CLIENTE VARCHAR(50) NOT NULL,
DATA_CADASTRO DATE NOT NULL,
ENDERECO_CLIENTE VARCHAR(50) NOT NULL,
PRIMARY KEY(COD_CLIENTE));

CREATE TABLE FUNCIONARIOS(
COD_FUNCIONARIO INT IDENTITY NOT NULL,
NOME_FUNCIONARIO VARCHAR(50) NOT NULL,
ENDERECO_FUNCIONARIO VARCHAR(100) NOT NULL,
DATA_CONTRATACAO DATE NOT NULL,
DATA_DEMISSAO DATE,
CPF_FUNCIONARIO CHAR(14) NOT NULL,
PRIMARY KEY(COD_FUNCIONARIO));

CREATE TABLE ALUGUEIS(
COD_ALUGUEL INT IDENTITY,
CLIENTE INT NOT NULL,
FILMES INT NOT NULL,
FUNCIONARIOS INT NOT NULL,
DATA_ALUGUEL SMALLDATETIME NOT NULL,
PRIMARY KEY(COD_ALUGUEL),
FOREIGN KEY (CLIENTE) REFERENCES CLIENTE(COD_CLIENTE),
FOREIGN KEY (FILMES) REFERENCES FILMES(COD_FILMES),
FOREIGN KEY (FUNCIONARIOS) REFERENCES FUNCIONARIOS(COD_FUNCIONARIO));

----------------------------------------------INSERTS----------------------------------------------------

INSERT INTO CLIENTE (NOME_CLIENTE, DATA_CADASTRO, ENDERECO_CLIENTE) VALUES ('PEDRO', '2020-01-02', 'RUA 15 DE DEZEMBRO')
INSERT INTO CLIENTE (NOME_CLIENTE, DATA_CADASTRO, ENDERECO_CLIENTE) VALUES ('JOAO', '2020-07-09', 'RUA FERNANDO DE ALMEIDA')
INSERT INTO CLIENTE (NOME_CLIENTE, DATA_CADASTRO, ENDERECO_CLIENTE) VALUES ('MARIA', '2019-11-25', 'RUA DOM PEDRO I')
INSERT INTO CLIENTE (NOME_CLIENTE, DATA_CADASTRO, ENDERECO_CLIENTE) VALUES ('JOSE', '2020-05-16', 'RUA DOM JOÃO VI')
INSERT INTO CLIENTE (NOME_CLIENTE, DATA_CADASTRO, ENDERECO_CLIENTE) VALUES ('TIAGO', '2021-12-02', 'RUA CASTRO ALVES')

INSERT INTO FUNCIONARIOS (NOME_FUNCIONARIO, ENDERECO_FUNCIONARIO, DATA_CONTRATACAO, DATA_DEMISSAO, CPF_FUNCIONARIO) VALUES ('VINICIUS', 'RUA CASTRO ALVES', '2018-11-09', '2020-11-10', '827.472.944-98')
INSERT INTO FUNCIONARIOS (NOME_FUNCIONARIO, ENDERECO_FUNCIONARIO, DATA_CONTRATACAO, DATA_DEMISSAO, CPF_FUNCIONARIO) VALUES ('MIGUEL', 'RUA 15 DE DEZEMBRO', '2020-11-15', NULL, '037.374.354-65')
INSERT INTO FUNCIONARIOS (NOME_FUNCIONARIO, ENDERECO_FUNCIONARIO, DATA_CONTRATACAO, DATA_DEMISSAO, CPF_FUNCIONARIO) VALUES ('EDUARDO', 'RUA 10 DE MARÇO', '2020-10-25', NULL, '056.759.555-98')

INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('VENOM', '2018-09-24', 25.50)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('INTERSTELLAR', '2014-11-06', 25.50)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('V DE VINGANÇA', '2006-04-07', 19.99)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('TITANIC', '1998-01-16', 25.50)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('HOMEM ARANHA 2', '2004-07-02', 15.49)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('VINGADORES ULTIMATO', '2019-04-25', 29.99)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('LAGOA AZUL', '1980-07-05', 14.49)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('FORREST GUMP', '1994-12-07', 25.50)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('TOY STORY 3', '2010-06-18', 25.50)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('STAR WARS IV', '1983-10-06', 14.49)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('STAR WARS III', '2005-05-19', 15.50)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('STAR WARS I', '1999-06-24', 15.50)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('DE VOLTA PRO FUTURO 3', '1990-07-13', 15.50)
INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES ('DEMON SLAYER MUGEN TRAIN', '2021-05-13', 29.99)

INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (4, 5, 1, '2020-05-04 11:08:43')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (2, 7, 2, '2021-19-05 20:32:40')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (4, 4, 3, '2021-02-11 08:12:09')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (5, 11, 1, '2020-30-10 17:57:33')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (3, 2, 3, '2021-11-11 10:25:15')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (1, 5, 2, '2018-01-12 14:58:23')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (1, 3, 3, '2021-05-11 15:08:43')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (2, 10, 1, '2019-02-03 16:23:04')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (3, 1, 2, '2021-04-01 11:38:09')
INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (4, 6, 3, '2021-09-09 11:08:43')

-----------------------------------------VISÕES----------------------------------------------------------

CREATE VIEW VW_FILMESNOVOS AS SELECT * FROM FILMES WHERE DATA_LANCAMENTO > '2000-01-01';
CREATE VIEW VW_FILMESCLASSICOS AS SELECT * FROM FILMES WHERE DATA_LANCAMENTO < '2000-01-01'; 
CREATE VIEW VW_ALUGUEISAPOS2020 AS SELECT * FROM ALUGUEIS WHERE DATA_ALUGUEL > '2020-01-01'; 
CREATE VIEW VW_FILMESBARATOS AS SELECT * FROM FILMES WHERE VALOR_ALUGUEL < 20;               
CREATE VIEW VW_FUNC_DEMITIDOS AS SELECT * FROM FUNCIONARIOS WHERE DATA_DEMISSAO IS NOT NULL; 
CREATE VIEW VW_FUNC_ATIVOS AS SELECT * FROM FUNCIONARIOS WHERE DATA_DEMISSAO IS NULL;        

SELECT * FROM VW_FILMESNOVOS 
SELECT * FROM VW_FILMESCLASSICOS 
SELECT * FROM VW_ALUGUEISAPOS2020 
SELECT * FROM VW_FILMESBARATOS   
SELECT * FROM VW_FUNC_DEMITIDOS  
SELECT * FROM VW_FUNC_ATIVOS 

----------------------------------------PROCEDURES-------------------------------------------------------

CREATE PROCEDURE SP_ALUGUEISDOCLIENTEX @XCLIENTE INT AS SELECT * FROM ALUGUEIS WHERE CLIENTE = @XCLIENTE;
CREATE PROCEDURE SP_ALUGUEISDEPOISDEX @XDATA DATE AS SELECT * FROM ALUGUEIS WHERE DATA_ALUGUEL > @XDATA;
CREATE PROCEDURE SP_PRECOMAISBARATOQUEX @XPRECO FLOAT AS SELECT * FROM FILMES WHERE VALOR_ALUGUEL < @XPRECO;
CREATE PROCEDURE SP_PESQUISAFILME @FILMESEARCH VARCHAR(50) AS SELECT * FROM FILMES WHERE TITULO LIKE '%' + @FILMESEARCH + '%';
CREATE PROCEDURE SP_ADDFILME @TITULOFILME VARCHAR(50), @DATAFILME DATE, @VALORFILME FLOAT AS INSERT INTO FILMES (TITULO, DATA_LANCAMENTO, VALOR_ALUGUEL) VALUES (@TITULOFILME, @DATAFILME, @VALORFILME);
CREATE PROCEDURE SP_ADDCLIENTE @NOMECLIENTE VARCHAR(50), @DATACADASTRO DATE, @ENDERECOCLIENTE VARCHAR(50) AS INSERT INTO CLIENTE (NOME_CLIENTE, DATA_CADASTRO, ENDERECO_CLIENTE) VALUES (@NOMECLIENTE, @DATACADASTRO, @ENDERECOCLIENTE);
CREATE PROCEDURE SP_ADDFUNCIONARIO @NOMEFUNC VARCHAR(50), @ENDERECOFUNC VARCHAR(50), @DATACONTRATACAO DATE, @DATADEMISSAO DATE, @CPFFUNC VARCHAR(14) AS INSERT INTO FUNCIONARIOS (NOME_FUNCIONARIO, ENDERECO_FUNCIONARIO, DATA_CONTRATACAO, DATA_DEMISSAO, CPF_FUNCIONARIO) VALUES (@NOMEFUNC, @ENDERECOFUNC, @DATACONTRATACAO, @DATADEMISSAO, @CPFFUNC);
CREATE PROCEDURE SP_ADDTRANSACAO @CLIENTEALUGUEL INT, @FILMESALUGUEL INT, @FUNCIONARIOSALUGUEL INT, @DATAALUGUEL DATETIME AS INSERT INTO ALUGUEIS (CLIENTE, FILMES, FUNCIONARIOS, DATA_ALUGUEL) VALUES (@CLIENTEALUGUEL, @FILMESALUGUEL, @FUNCIONARIOSALUGUEL, @DATAALUGUEL);

EXEC SP_ALUGUEISDOCLIENTEX 1;
EXEC SP_ALUGUEISDEPOISDEX '2020-01-01'; 
EXEC SP_PRECOMAISBARATOQUEX 20 ;
EXEC SP_PESQUISAFILME 'STAR WARS';
EXEC SP_ADDFILME 'SENHOR DOS ANEIS', '2002-01-01', 22.50;
EXEC SP_ADDCLIENTE 'WAGNER', '2005-03-04', 'RUA ALECRIM E TOMILHO';
EXEC SP_ADDFUNCIONARIO 'JESSICA', 'RUA JOAQUIM RIBEIRO', '2007-05-01', '2008-01-05', '000.055.999.00';
EXEC SP_ADDTRANSACAO '4', '8', '4', '2009-11-10 17:55:05';

---------------------------------------------------------------------------------------------------------