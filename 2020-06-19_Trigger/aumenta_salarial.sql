create table emp_log
( emp_id number(10),
  data_emp date,
  novo_sal number(10,2),
  msg varchar(30));

create or replace TRIGGER AUMENTO_SALARIO
AFTER UPDATE ON EMP_TAB
FOR EACH ROW WHEN (NEW.SAL > 1000)
BEGIN
  INSERT INTO EMP_LOG (EMP_ID,DATA_EMP,NOVO_SAL,MSG)VALUES (:NEW.EMPID,SYSDATE,:NEW.SAL,'Novo Salário Superavaliado');
end;