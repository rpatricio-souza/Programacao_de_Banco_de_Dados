INSERT INTO LIV_LIVRO(LIV_ISBN, LIV_NOME, LIV_GENERO, LIV_EDITORA, LIV_NUM_EDICAO, LIV_ANO_EDICAO)
VALUES (8576572710,'Eu sou a Lenda','Terror','Gold Medal Books',2,2007);

insert into for_fornecedor values(for_id_seq.nextval, 'Gold Medal Books', null);

insert into exe_exemplar values(8576572710,exe_id_seq.nextval,160,'Português','Brasil',null,39.99,1,default);

update exe_exemplar set exe_valor=29.99 where exe_id=1;
update exe_exemplar set exe_idioma='Inglês' where exe_id=1;

select * from exe_exemplar;
select * from ofe_oferta;

--delete from exe_exemplar;
--delete from ofe_oferta;
