--01
select pes_nro_matricula, count(emp_cod) "quantidade"
from aluno join emprestimo using(pes_cod)
where emp_data_emprestimo='03/11/15'
group by pes_nro_matricula;


--02
select liv_titulo, count(exe_cod)
from livro join exemplar using(liv_cod)
group by rollup(liv_titulo);


--03
select liv_cod, emp_data_emprestimo, count(*) "quantidade"
from exemplar join item_emprestimo using(exe_cod) join emprestimo using(emp_cod)
group by cube(liv_cod, emp_data_emprestimo)
order by liv_cod;


--04
select edi_cod, edi_descricao, liv_cod
from editora left join livro using(edi_cod);

select e.edi_cod, e.edi_descricao, l.liv_cod
from editora e,livro l 
where e.edi_cod=l.edi_cod(+);


--05
create view view_emp_atrasadados as
select distinct(pes_nome) "Pessoas com atraso"
from pessoa join emprestimo using(pes_cod)
where emp_cod is not null and emp_cod not in(select distinct(emp_cod)
from pessoa join emprestimo using(pes_cod) join devolucao using(emp_cod)
where emp_data_prevdev<=data_dev);

--drop view view_emp_atrasadados;
select * from view_emp_atrasadados;


--06
create table emp_log(
    data date,
    user_log varchar2(30),
    emp_cod number
);

create or replace trigger trg_log_emprestimo
after update on emprestimo
for each row

declare
    user user_users.username%type;

begin
    select Username into user
    FROM USER_USERS;
    
    insert into emp_log
    values(sysdate, user, :new.emp_cod);
end trg_log_emprestimo;
/

update emprestimo set emp_data_emprestimo=sysdate where emp_cod=1;
select * from emp_log;
