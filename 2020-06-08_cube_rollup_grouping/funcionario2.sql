drop table funcionario;
drop table departamento;
create table departamento
(dep_id number(6) primary key,
 dep_descricao varchar2(30));

create table funcionario
(func_cod number(6) primary key,
 func_nome varchar2(20),
 func_sal number(10,2),
  dep_id number(6) references departamento (dep_id),
 fun_cargo varchar2(30));
 
insert into departamento values (1,'RH');
insert into departamento values (2,'Vendas');
insert into departamento values (3,'Informática');
insert into departamento values (4,'Compras');

insert into funcionario values (1,'Paulo',4000.00,1,'Analista');
insert into funcionario values (2,'Maria',1500.00,2,'Vendedor');
insert into funcionario values (3,'João',4000.00,1,'Analista');
insert into funcionario values (4,'Laura',5000.00,2,'Gerente');
insert into funcionario values (5,'Ana',6000.00,3,'Programador');

commit