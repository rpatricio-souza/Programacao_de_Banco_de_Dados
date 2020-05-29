create table curso
 (cod_curso number(3) constraint cursos_pk primary key,
  nome_curso varchar2(60) constraint cursos_nome_nu not null,
  carga_horaria number(3),
  preco number (7,2) default 0,
  pre_requisito number(3));

insert into curso (cod_curso,nome_curso,carga_horaria,preco)
values (1,'Introdu�ao � L�gica de Programa��o',32,800);

insert into curso (cod_curso,nome_curso,carga_horaria,preco)
values (2,'Fundamentos da Modelagem de Dados',40,950);

insert into curso (cod_curso,nome_curso)
values (3,'Redes I');

insert into curso (cod_curso,nome_curso)
values (4,'Introdu��o a Sistema Operacionais');

insert into curso (cod_curso,nome_curso)
values (5,'An�lise Orientda por Objetos');

insert into curso (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (6,'Delphi: Recursos B�sicos', 24, 400,1);

insert into curso (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (7,'Delphi: Acesso a Banco de Dados', 24, 400,1);

insert into curso (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (8,'Oracle: SQL*Plus e SQL',32,750,2);

insert into curso (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (9,'Oracle: SQL/Plus e SQL', 24,750,8);

insert into curso (cod_curso,nome_curso,pre_requisito)
values (10,'Redes II',3);

create table curso_velho
 (cod_curso number(3) constraint cursos_pk_velho primary key,
  nome_curso varchar2(60) constraint cursos_nome_nu_velho not null,
  carga_horaria number(3),
  preco number (7,2) default 0,
  pre_requisito number(3));

insert into curso_velho (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (101,'Windowns 3.1: Recursos B�sicos',80,1000,null);

insert into curso_velho (cod_curso,nome_curso,carga_horaria,preco,pre_requisito)
values (102,'Windows 3.1: Recursos Avan�ados',80,1000,null);

insert into curso_velho (cod_curso,nome_curso,pre_requisito)
values (103,'Delphi: Recursos B�sicos',3);
commit;