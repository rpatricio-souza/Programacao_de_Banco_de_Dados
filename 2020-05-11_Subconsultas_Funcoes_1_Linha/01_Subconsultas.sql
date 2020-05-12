CREATE TABLE produto (
       pro_codigo           NUMBER NOT NULL,
       prod_descricao       VARCHAR2(10) NULL,
       pro_quantidade       NUMBER NULL,
       pro_valor_unidade    NUMBER(10,2) NULL,
       PRIMARY KEY (pro_codigo)
);


insert into produto values (1,'cANETA',1.00,100);
insert into produto values (2,'APONTADOR',4.00,400);
insert into produto values (3,'REGUA',5.00,600);


/*Maior valor do produto*/
select max(pro_valor_unidade)
from produto;

/*Produto que possui o maior valor*/
select prod_descricao
from produto
where pro_valor_unidade=(select max(pro_valor_unidade) from produto);

/*Atualizar o produto mais caro em 10%*/
update produto
set pro_valor_unidade=1.1*pro_valor_unidade
where pro_valor_unidade=(select max(pro_valor_unidade) from produto);

/*Criar uma tabela na qual constem os produtos cujo preco seja menor que a media*/
create table pabm_produto_abaixo_media as
select *
from produto
where pro_valor_unidade < (select AVG(pro_valor_unidade)from produto);

select * from pabm_produto_abaixo_media;

/*Eliminar o produto mais barato*/
delete from pabm_produto_abaixo_media
where pro_valor_unidade=(select min(pro_valor_unidade) from pabm_produto_abaixo_media);
