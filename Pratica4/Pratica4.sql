--1. Quais as gravadoras que não possuem CDs cadastrados com preço inferior a 80,00? 
desc gravadora;
desc cd;

select grav_nome
from gravadora join cd using(grav_codigo)
where cd_preco_venda not in(select cd_preco_venda from cd where cd_preco_venda <80);

--2. Quais os CDs que têm o preço igual ao maior preço de cada gravadora?
select cd_nome
from cd
where cd_preco_venda >= any(select max(cd_preco_venda) from cd group by grav_codigo);

--3. Quais os CDs que têm preço inferior a qualquer outro CD da gravadora com código 10? 
select cd_nome
from cd
where cd_preco_venda < any(select cd_preco_venda from cd join gravadora using(grav_codigo) where grav_codigo=10);

--4. Quais CDs têm o preço de venda menor que a média de preço de venda de todas as gravadoras?
select cd_nome
from cd
where cd_preco_venda < (select avg(cd_preco_venda) from cd join gravadora using(grav_codigo));

--5. Liste os nomes dos CDs que tenham preço de venda maior que 10,00 reais ou a gravadora seja a de código 3,
-- ordenados por ordem alfabética decrescente dos nomes dos CDs. Exibir os nomes dos CDs em iniciando com a letra maiúscula.
select initcap(cd_nome)
from cd join gravadora using(grav_codigo)
where cd_preco_venda>10 or grav_codigo=3
order by cd_nome desc;

--6. Exibir o nome, a data de lançamento e nome da gravadora dos CDs que possuem data de lançamento em um intervalo de datas. 
select cd_nome, cd_data_lancamento, grav_nome
from cd join gravadora using(grav_codigo)
where cd_data_lancamento in (TO_DATE('01/01/20','dd/mm/yy'),TO_DATE('18/05/20','dd/mm/yy'));

--7. Exibir o nome do Cd e de suas gravadoras, exiba também os CD´S que não possuam gravadoras.
select cd_nome, grav_nome
from cd left outer join gravadora using(grav_codigo);

--8. Listar quantas músicas que há em cada CD. (Exibir código do CD e a quantidade de música).
desc musica;
desc faixa;

select cd_codigo, count(mus_codigo)
from cd join faixa using(cd_codigo) join musica using(mus_codigo)
group by cd_codigo;

--9. Definir a qual categoria (cat_codigo) cada Cd pertence.
select cd_nome, cat_codigo
from cd, cd_categoria
where cd_preco_venda>menor_preco and cd_preco_venda<maior_preco;

--10. Listar o nome do CD indicado para cada CD gravado.
select c2.cd_nome
from cd c1, cd c2
where c1.cd_indicado=c2.cd_codigo;

--11.
--insert:(7, 51, 60)
--update:(7, 52, 60)
--select: 7 | 52 | 60

--12. Liste o código, nome, preço de venda, o tempo de duração total, o nome da gravadora do CD de código 101.
select cd_codigo, cd_nome, cd_preco_venda, sum(mus_duracao), grav_nome
from gravadora join cd using(grav_codigo) join faixa using(cd_codigo) join musica using(mus_codigo)
where cd_codigo=101
group by cd_codigo, cd_nome, cd_preco_venda, grav_nome;

--13. Listar o nome das gravadoras que possuem mais de 2 Cds relacionados a ela.
select grav_nome, count(cd_codigo)
from gravadora join cd using(grav_codigo)
group by grav_nome
having count(cd_codigo)>2;

--14. Listar o nome da música de maior duração.
select mus_nome
from musica
where mus_duracao=(select max(mus_duracao) from musica);

--15. Listar o nome das músicas, a faixa e o nome do CD em que está a música, apenas os Cds de código 102 e 103.
select mus_nome, faixa_numero, cd_nome
from musica join faixa using(mus_codigo) join cd using(cd_codigo)
where cd_codigo=102 or cd_codigo=103;

--16. Listar (um único resultado) os autores (código autor, nome autor) com código menor que 10 e as músicas
-- (código musica, nome musica) com código menor que 15. (Utilizarem UNION).
select aut_codigo "Codigos", aut_nome "Autor/Musica" from autor
where aut_codigo<10
union
select mus_codigo, mus_nome from musica
where mus_codigo<15;
