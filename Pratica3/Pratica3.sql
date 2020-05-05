/*1. Listar o nome da pessoa do empr�stimo de n�mero 1.*/
desc emprestimo;
desc pessoa;

select pes_nome
from pessoa natural join emprestimo
where emprestimo.emp_cod=1;

/*2. Listar todas as editoras ordenadas por ordem alfab�tica.*/
desc editora;

select edi_descricao
from editora
order by edi_descricao;

/*3. Exibir os t�tulos dos livros que come�am com a letra A.*/
desc livro;

select liv_titulo
from livro
where upper(liv_titulo) like 'A%';

/*4. Exibir os t�tulos dos livros que come�am com a letra A e que tenham o ano de publica��o maior que 2013.*/
select liv_titulo
from livro
where upper(liv_titulo) like 'A%' and anopublicacao>TO_DATE('31-12-2013','DD-MM-YYYY');

/*5. Exibir a quantidade de telefones que possuem DDD igual a 12.*/


/*6. Listar a quantidade de empr�stimo por aluno. (exiba: - pes_nro_matricula e - quantidade).*/

/*7. Listar as editoras e os seus livros. (exiba: - edi_cod,edi_descricao, - liv_cod).*/

/*8. Listar os c�digos dos exemplares (exe_cod), a descri��o (exe_descricao) do empr�stimo realizado
em uma determinada data.*/

/*9. Listar os livros que possuam mais de 3 exemplares.*/

/*10. Listar os professores (nome e titula��o) com seus respectivos telefones. OBS: Listar tamb�m os
professores que n�o tenham telefone. Realizar duas resolu��es uma com a sintaxe ANSI e outra
com a sintaxe ORACLE.*/

/*11. Listar o livro (liv_titulo) mais antigo da biblioteca*/

/*12. Exibir o nome da pessoa que mais emprestou livro na biblioteca.*/

/*13. Listar a quantidade de exemplares por livro.*/

/*14. Listar os livros (liv_titulo) que come�am com A e possuem ano de publica��o maior que 2011.*/

/*15. Listar os livros emprestados pela pessoa de c�digo 1 (Listar liv_titulo)*/