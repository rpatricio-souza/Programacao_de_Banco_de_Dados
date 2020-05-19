---------------------
-- CRIA TABLESPACE --
---------------------

CREATE TABLESPACE  TS_BD_catalogo
DATAFILE  'C:\BD\ts_bd_catalogo.dbf' SIZE 1M
AUTOEXTEND ON;

------------------
-- CRIA USU�RIO --
------------------

CREATE USER USER_catalogo
IDENTIFIED BY aluno
DEFAULT TABLESPACE TS_BD_catalogo
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TS_BD_catalogo;

-----------------
-- PRIVIL�GIOS --
-----------------

GRANT DBA TO USER_catalogo WITH ADMIN OPTION;
