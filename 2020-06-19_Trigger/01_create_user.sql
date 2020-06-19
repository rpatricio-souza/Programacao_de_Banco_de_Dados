---------------------
-- CRIA TABLESPACE --
---------------------

CREATE TABLESPACE  TS_2020_06_19
DATAFILE  'D:\Docs\Fatec\Programacao_de_Banco_de_Dados\2020-06-19_Trigger\TS_2020_06_19.dbf' SIZE 1M
AUTOEXTEND ON;

------------------
-- CRIA USUÁRIO --
------------------

CREATE USER USER_TRIGGER
IDENTIFIED BY aluno
DEFAULT TABLESPACE TS_2020_06_19
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TS_2020_06_19;

-----------------
-- PRIVILÉGIOS --
-----------------

GRANT DBA TO USER_TRIGGER WITH ADMIN OPTION;
