---------------------
-- CRIA TABLESPACE --
---------------------

CREATE TABLESPACE  TS_BD_catalogo
DATAFILE  'D:\Docs\Fatec\Programacao_de_Banco_de_Dados\BD\ts_bd_catalogo_Desktop.dbf' SIZE 1M
AUTOEXTEND ON;

------------------
-- CRIA USUÁRIO --
------------------

CREATE USER USER_catalogo
IDENTIFIED BY aluno
DEFAULT TABLESPACE TS_BD_catalogo
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TS_BD_catalogo;

-----------------
-- PRIVILÉGIOS --
-----------------

GRANT DBA TO USER_catalogo WITH ADMIN OPTION;
