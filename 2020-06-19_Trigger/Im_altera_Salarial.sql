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