---------------------
-- CRIA TABLESPACE --
---------------------

CREATE TABLESPACE  TS_2020_06_08
DATAFILE  'D:\Docs\Fatec\Programacao_de_Banco_de_Dados\2020-06-08_cube_rollup_grouping\TS_2020_06_08.dbf' SIZE 1M
AUTOEXTEND ON;

------------------
-- CRIA USUÁRIO --
------------------

CREATE USER USER_GROUPING
IDENTIFIED BY aluno
DEFAULT TABLESPACE TS_2020_06_08
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON TS_2020_06_08;

-----------------
-- PRIVILÉGIOS --
-----------------

GRANT DBA TO USER_GROUPING WITH ADMIN OPTION;
