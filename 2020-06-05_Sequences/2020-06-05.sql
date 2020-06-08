create table copy_departmens as
select * from departments;

create sequence dep_id_seq
increment by 10
start with 120
maxvalue 9999;

select *
from user_sequences
where sequence_name='DEP_ID_SEQ';--nome da sequencia deve estar em maiusculo no select, mesmo que tenha sido criada em minusculo

create table departamento(
    dep_cod number(3) constraint dep_pk primary key,
    dep_nome varchar2(30)
);

select * from departamento;
select dep_id_seq.currval from dual;
select dep_id_seq.nextval from dual;

insert into departamento values(dep_id_seq.nextval, 'Vendas');
insert into departamento values(dep_id_seq.nextval, 'Recursos Humanos');

alter sequence dep_id_seq
increment by 1
maxvalue 99999;

insert into departamento values(dep_id_seq.nextval, 'TI');

--drop sequence dep_id_seq;