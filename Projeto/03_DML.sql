INSERT INTO LIV_LIVRO(LIV_ISBN, LIV_NOME, LIV_GENERO, LIV_EDITORA, LIV_NUM_EDICAO, LIV_ANO_EDICAO)
VALUES (8576572710,'Eu sou a Lenda','Terror','Gold Medal Books',2,2007);

INSERT INTO LIV_LIVRO(LIV_ISBN, LIV_NOME, LIV_GENERO, LIV_EDITORA, LIV_NUM_EDICAO, LIV_ANO_EDICAO)
VALUES (8581050395,'O Cemiterio','Terror','Suma',1,2013);

insert into for_fornecedor values(for_id_seq.nextval, 'Gold Medal Books', null);
insert into for_fornecedor values(for_id_seq.nextval, 'Suma', null);

insert into exe_exemplar values(8576572710,exe_id_seq.nextval,160,'Português','Brasil',null,39.99,1,default);
insert into exe_exemplar values(8581050395,exe_id_seq.nextval,424,'Português','Brasil',null,59.99,2,default);

update exe_exemplar set exe_valor=29.99 where exe_id=1;
update exe_exemplar set exe_idioma='Inglês' where exe_id=1;

--select * from exe_exemplar;
--select * from ofe_oferta;


--Teste do 2o trigger
insert into pes_pessoa(pes_cpf, pes_nome, pes_tel_res, pes_tel_cel, pes_tel_com, pes_email)
values(11111111111, 'Pessoa 1', null, null, null, null);

insert into pes_pessoa(pes_cpf, pes_nome, pes_tel_res, pes_tel_cel, pes_tel_com, pes_email)
values(22222222222, 'Pessoa 2', null, null, null, null);

insert into cli_cliente(cli_cpf, cli_endereco)
values(11111111111, null);

insert into fun_funcionario(fun_cpf, fun_cargo, fun_re)
values(22222222222, 'Vendedor', 0);

insert into ven_venda(ven_id, cli_cpf, fun_cpf, ven_data)
values(ven_id_seq.nextval, 11111111111, 22222222222, sysdate);
insert into ven_venda(ven_id, cli_cpf, fun_cpf, ven_data)
values(ven_id_seq.nextval, 11111111111, 22222222222, sysdate);

update exe_exemplar set ven_id=1 where exe_id=1;
update exe_exemplar set ven_id=1 where exe_id=2;

--teste do trigger exemplar_ja_vendido
update exe_exemplar set ven_id=2 where exe_id=1;
--update exe_exemplar set ven_id=null where exe_id=1;
--update exe_exemplar set ven_id=null where exe_id=2;

--select * from exe_exemplar;
--select * from exv_exemplar_vendido;
--select * from ven_venda;
