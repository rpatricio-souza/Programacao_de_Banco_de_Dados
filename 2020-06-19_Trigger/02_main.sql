create table emp_tab(
    empid number(10) primary key,
     emp_nome varchar2(30),
     sal number(10,2),
     depid number(10)
);
 

CREATE OR REPLACE TRIGGER Imp_altera_Salarial
BEFORE DELETE OR INSERT OR UPDATE ON EMP_TAB
FOR EACH ROW WHEN (new.EmpID > 0)
DECLARE sal_diff number;
BEGIN
  sal_diff:= :new.sal- :old.sal;
  dbms_output.put_line ('Old salary:'|| :old.sal);
  dbms_output.put_line ('New salary:'|| :new.sal);
  dbms_output.put_line ('Difference:'|| sal_diff);
END;
/


create table emp_log(
    emp_id number(10),
    data_emp date,
    novo_sal number(10,2),
    msg varchar(30)
);


create or replace TRIGGER AUMENTO_SALARIO
AFTER UPDATE ON EMP_TAB
FOR EACH ROW WHEN (NEW.SAL > 1000)
BEGIN
  INSERT INTO EMP_LOG (EMP_ID,DATA_EMP,NOVO_SAL,MSG)VALUES (:NEW.EMPID,SYSDATE,:NEW.SAL,'Novo Salário Superavaliado');
end;
/


SET SERVEROUTPUT ON SIZE UNLIMITED;

insert into emp_tab values (1,'Gabriel',6000.00,1);
update emp_tab set sal=10000 where empid=1;

insert into emp_tab values (2,'Joao',20000.00,1);
update emp_tab set sal=7000 where empid=2;

select * from emp_log;
