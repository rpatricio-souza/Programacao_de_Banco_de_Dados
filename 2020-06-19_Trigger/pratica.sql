SET SERVEROUTPUT ON SIZE UNLIMITED;

create table departamento(
    cod integer constraint dep_pk primary key,
    nome varchar2(30),
    total_sal number(10) default 0
);


create table empregado(
    id integer constraint emp_pk primary key,
    nome varchar2(50) not null,
    depto integer constraint emp_dep_fk references departamento(cod),
    salario number(10)
);

--Adicao da chave estrangeira
--alter table empregado add constraint emp_dep_fk foreign key(depto) references departamento(cod);


--Trigger
create or replace trigger dep_total_sal
after insert or update or delete on empregado
for each row-- when(new.depto is not null)

declare
    salario_total_dep departamento.total_sal%type;

begin
    if inserting then
        update departamento set total_sal=total_sal+:new.salario
        where cod=:new.depto;
    elsif updating then
        update departamento set total_sal=total_sal+(:new.salario-:old.salario)
        where cod=:new.depto;
    elsif deleting then
        update departamento set total_sal=total_sal-:old.salario
        where cod=:old.depto;
    end if;
    
    select total_sal into salario_total_dep
    from departamento
    where cod=:new.depto or cod=:old.depto;
    dbms_output.put_line('Salario total do departamento ' || :new.depto || ' = R$' || salario_total_dep);
end dep_total_sal;
/

--Sequencias
create sequence empregado_seq
increment by 1;

create sequence departamento_seq
increment by 1;


--Insercao dos departamentos
insert into departamento(cod, nome, total_sal)
values(departamento_seq.nextval, 'Departamento 1', default);

insert into departamento(cod, nome, total_sal)
values(departamento_seq.nextval, 'Departamento 2', default);

--Insercao dos funcionarios
insert into empregado(id, nome, depto, salario)
values(empregado_seq.nextval, 'Empregado 1', 1, 1600.00);

insert into empregado(id, nome, depto, salario)
values(empregado_seq.nextval, 'Empregado 2', 1, 1400.00);

insert into empregado(id, nome, depto, salario)
values(empregado_seq.nextval, 'Empregado 3', 1, 2000.00);

update empregado set salario=3000.00 where id=3;
update empregado set salario=1200.00 where id=2;

delete from empregado where id=1;


--select * from departamento;
--select * from empregado;
