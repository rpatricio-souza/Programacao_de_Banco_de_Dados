--Exemplar
delete from ofe_oferta;
delete from exe_exemplar;
delete from for_fornecedor;
delete from ven_venda;

drop sequence exe_id_seq;
create sequence exe_id_seq
increment by 1;

drop sequence for_id_seq;
create sequence for_id_seq
increment by 1;

drop sequence ven_id_seq;
create sequence ven_id_seq
increment by 1;

--Pessoa
--delete from cli_cliente;
--delete from fun_funcionario;
--delete from pes_pessoa;