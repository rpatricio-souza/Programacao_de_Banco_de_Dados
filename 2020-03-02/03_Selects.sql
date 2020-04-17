desc produto;

select prod_descricao, pro_valor_unidade, pro_valor_unidade*1.1 "Valor acrescido de 10%"
from produto;


desc pedido;

select * from pedido
where ped_data = '12/04/11';

/* PRODUTO CARTESIANO */
select c.cli_nome, p.ped_data
from pedido p, cliente c
where p.cli_codigo=c.cli_codigo;

select c.cli_nome, p.ped_data
from pedido p join cliente c on(p.cli_codigo=c.cli_codigo);

/*Listar os pedidos realizados pelo vendedor José*/
select p.ped_numero, p.ped_data, v.ven_nome, c.cli_nome
    from vendedor v inner join pedido p on(v.ven_codigo=p.ven_codigo)
       inner join cliente c on(p.cli_codigo=c.cli_codigo)
where UPPER(v.ven_nome) like 'JOS_';