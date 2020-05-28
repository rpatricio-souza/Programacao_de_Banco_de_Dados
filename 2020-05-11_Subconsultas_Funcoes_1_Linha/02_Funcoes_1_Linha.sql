desc produto;

select lower(PROD_DESCRICAO) from produto;

select upper(PROD_DESCRICAO) from produto;

select initcap(PROD_DESCRICAO) from produto;

select concat(prod_descricao, pro_valor_unidade) from produto;

select prod_descricao || ' ' || pro_valor_unidade from produto;

select substr(prod_descricao,1,3) from produto;

select length(prod_descricao) from produto;

select prod_descricao, instr(prod_descricao, 'A') from produto;

select lpad(prod_descricao,10,'.') from produto;

select rpad(prod_descricao,10,'.') from produto;

select trim('A' from prod_descricao) from produto;
