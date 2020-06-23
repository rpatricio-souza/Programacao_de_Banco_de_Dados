SET SERVEROUTPUT ON;

--Trigger que exibe quais livros foram comprados em determinada venda
create or replace trigger resumo_venda
after update on exe_exemplar
for each row when(new.ven_id is not null)

declare
    --cursor que recebe o id dos exemplares e o nome dos livros
    cursor c_livros
    is
    select exe_id, liv_nome
    from liv_livro join exe_exemplar using(liv_isbn)
    where ven_id=:new.ven_id;
    --mesmo usando AFTER UPDATE, o valor exe_exemplar.ven_id ainda nao foi atualizado, por isso a consulta acima não retorna nenhum valor.
   
    --Para evitar o erro ORA-04091:
    Pragma Autonomous_Transaction;

begin
    dbms_output.put_line('Resumo do pedido ' || :new.ven_id);
        
    for c_livro in c_livros
    loop
        dbms_output.put_line(c_livro.exe_id || ' ' || c_livro.liv_nome);
    end loop;
end resumo_venda;
/
--drop trigger resumo_venda;