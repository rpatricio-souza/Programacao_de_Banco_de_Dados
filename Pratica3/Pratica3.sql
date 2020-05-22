/*1. Listar o nome da pessoa do empréstimo de número 1.*/
desc emprestimo;
desc pessoa;

select pes_nome
from pessoa natural join emprestimo
where emprestimo.emp_cod=1;


/*2. Listar todas as editoras ordenadas por ordem alfabética.*/
desc editora;

select edi_descricao
from editora
order by edi_descricao;


/*3. Exibir os títulos dos livros que começam com a letra A.*/
desc livro;

select liv_titulo
from livro
where upper(liv_titulo) like 'A%';


/*4. Exibir os títulos dos livros que começam com a letra A e que tenham o ano de publicação maior que 2013.*/
select liv_titulo
from livro
where upper(liv_titulo) like 'A%' and anopublicacao>TO_DATE('31-12-2013','DD-MM-YYYY');


/*5. Exibir a quantidade de telefones que possuem DDD igual a 12.*/
desc telefone;

select count(*)
from telefone
where tel_ddd=12;


/*6. Listar a quantidade de empréstimo por aluno. (exiba: - pes_nro_matricula e - quantidade).*/
desc aluno;
desc emprestimo;

select a.pes_nro_matricula "Matrícula", count(*) "Qtd de empréstimos"
from aluno a natural join emprestimo e
group by a.pes_nro_matricula;


/*7. Listar as editoras e os seus livros. (exiba: - edi_cod,edi_descricao, - liv_cod).*/
desc editora;
desc livro;

select e.edi_cod, edi_descricao, l.liv_cod, l.liv_titulo
from editora e join livro l on (e.edi_cod=l.edi_cod)
order by e.edi_descricao;


/*8. Listar os códigos dos exemplares (exe_cod), a descrição (exe_descricao) do empréstimo realizado
em uma determinada data.*/
desc emprestimo;
desc exemplar;
desc item_emprestimo;

select * from emprestimo;

select exe_cod, exe_descricao
from emprestimo join item_emprestimo using(emp_cod)
    join exemplar using(exe_cod)
where emp_data_emprestimo='10/10/15';


/*9. Listar os livros que possuam mais de 3 exemplares.*/
desc exemplar;
desc livro;

select l.liv_titulo, count(e.exe_cod) "Quantidade de Exemplares"
from exemplar e join livro l using(liv_cod)
group by l.liv_titulo
having count(e.exe_cod) > 3;


/*10. Listar os professores (nome e titulação) com seus respectivos telefones. OBS: Listar também os
professores que não tenham telefone. Realizar duas resoluções uma com a sintaxe ANSI e outra
com a sintaxe ORACLE.*/
desc pessoa;
desc professor;
desc telefone;

insert into pessoa(PES_COD,PES_NOME,CPF,RG,EMAIL)
values(6,'Rafael','33333333333','666666666','rafael@fatec.com');
insert into professor(PES_COD,TITULACAO)
values(6,'Aluno');

select pe.pes_nome, pr.titulacao, t.tel_numero
from professor pr left join pessoa pe using(pes_cod)
    left join telefone t using(pes_cod);
    
select pe.pes_nome, pr.titulacao, t.tel_numero
from professor pr, pessoa pe, telefone t
where pr.pes_cod=pe.pes_cod(+) and pr.pes_cod=t.pes_cod(+);


/*11. Listar o livro (liv_titulo) mais antigo da biblioteca*/
desc livro;

select liv_titulo
from livro
where anopublicacao=(select min(anopublicacao) from livro);


/*12. Exibir o nome da pessoa que mais emprestou livro na biblioteca.*/
select p.pes_nome, count(*) "Qtd de empréstimos"
from pessoa p natural join emprestimo e
group by p.pes_nome
having count(*)=(select max(count(pes_cod)) from pessoa join emprestimo using(pes_cod) group by pes_cod);

--Resposta correta:
select p.pes_cod, p.pes_nome, count(*)Quant
from pessoa p, emprestimo e
where p.pes_cod=e.pes_cod
group by p.pes_cod, p.pes_nome
having count(*)= (select max(count(p.pes_cod)) from emprestimo e, pessoa p
where p.pes_cod=e.pes_cod
group by p.pes_cod);


/*13. Listar a quantidade de exemplares por livro.*/
select l.liv_titulo, count(*) "No de exemplares"
from exemplar e join livro l using(liv_cod)
group by l.liv_titulo;


/*14. Listar os livros (liv_titulo) que começam com A e possuem ano de publicação maior que 2011.*/
select anopublicacao
from livro;

select liv_titulo
from livro
where upper(liv_titulo) like 'A%' and anopublicacao>2011;


/*15. Listar os livros emprestados pela pessoa de código 1 (Listar liv_titulo)*/
select livro.liv_titulo
from pessoa join emprestimo using(pes_cod)
    join item_emprestimo using(emp_cod)
        join exemplar using(exe_cod)
            join livro using(liv_cod)
                where pes_cod=1;