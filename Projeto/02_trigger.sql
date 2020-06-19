SET SERVEROUTPUT ON;

--Para esse trigger funcionar, foi preciso ir em:
--Ferramentas->Preferências->Banco de Dados->Compilador de PL/SQL->Identificadores de PLScope->colocar em None
create or replace trigger oferta_registro_temporal
after insert or update on exe_exemplar
for each row

begin
    --dbms_output.put_line(:new.exe_id || ', ' || :new.liv_isbn || ', ' || :new.exe_valor || ', ' || sysdate);
    if inserting then
        insert into ofe_oferta(exe_id,liv_isbn,ofe_valor,ofe_data)
        values(:new.exe_id, :new.liv_isbn, :new.exe_valor, sysdate);
    elsif updating then
        --dbms_output.put_line(:old.exe_valor||' '||:new.exe_valor);
        --Verifica se houve alteracao no valor do exemplar
        if(:old.exe_valor != :new.exe_valor) then
            insert into ofe_oferta(exe_id,liv_isbn,ofe_valor,ofe_data)
            values(:new.exe_id, :new.liv_isbn, :new.exe_valor, sysdate);
        end if;
    end if;
end oferta_registro_temporal;
/
