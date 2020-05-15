-- Exists
-- Quais gravadoras tem CDs cadastrados
desc cd;
desc gravadora;

select distinct(grav_nome)
from gravadora join cd using(grav_codigo);

-- Exists
select grav_codigo,grav_nome from gravadora
where EXISTS (select * from CD
where cd.grav_codigo = gravadora.grav_codigo);


-- IN
-- Quais os CDs que tem o preco igual ao menor preco de cada gravadora
select *
from cd
where cd_preco_venda in (select min(cd_preco_venda)
                            from cd
                            group by grav_codigo);
                            

-- ANY
-- Quais os CDs que tem preco inferior a qualquer um dos CDs da gravadora de codigo 2
select *
from cd
where cd_preco_venda<any(select cd_preco_venda from cd where grav_codigo=2);


-- ALL
-- Quais CDs tem o preco de venda menor que todas as medias de precos de vendas por gravadoras
select *
from cd
where cd_preco_venda<all(select avg(cd_preco_venda) from cd group by grav_codigo);


-- CASE
-- Dar desconto sobre o preço de venda dos CDs em função do preço.
SELECT cd_nome, cd_preco_venda,
CASE
    WHEN cd_preco_venda < 10 then cd_preco_venda * 0.10
    WHEN cd_preco_venda >=10 and cd_preco_venda < 13 then cd_preco_venda * 0.20
ELSE cd_preco_venda * 0.30
END VENDA
FROM CD;


-- CASE UPDATE
UPDATE CD
SET cd_preco_venda =
CASE
    WHEN cd_preco_venda < 10 then cd_preco_venda * 1.10
    WHEN cd_preco_venda >=10 and cd_preco_venda < 13 then cd_preco_venda * 1.20
ELSE cd_preco_venda * 1.30
END;


Commit;