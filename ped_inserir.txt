--Verificar SQLCODE de Foreign Key!
CREATE or alter EXCEPTION ped_ite_inserir_erro 'Erro de inserção de pedido:  ';

CREATE OR ALTER PROCEDURE PED_INSERIR (
    ped_ins_id_operacao integer,
    ped_ins_id_situacao integer,
    ped_ins_id_pessoa_emitente integer,
    ped_ins_id_pessoa_destinatario integer)
returns (
    ped_ins_ret integer)
as
begin
    insert into pedido (data_hora,
            id_operacao,
            id_situacao,
            id_pessoa_emitente,
            id_pessoa_destinatario)
        values ( current_timestamp, --GET_DATE() no SQL Server
            :ped_ins_ID_operacao,
            :ped_ins_ID_situacao,
            :ped_ins_id_pessoa_emitente,
            :ped_ins_id_pessoa_destinatario)
        returning id_pedido into :ped_ins_RET;  --Select @@Identity as Retorno;

    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION ped_inserir_erro 'Insercao de pedido: Erro = ' || :ped_ins_RET  || SQLCODE;
    END

end

execute procedure ped_inserir(1,1,26,23) -- para o cliente 23 Loja do Fisicao
execute procedure ped_inserir(1,1,26,5) -- para o cliente 5 Mario

select * from pedido
select * from operacao  --1 venda
select * from situacao  -- 1
select * from filial    -- 26  do teste: execute procedure est_reservado_manter( 26 ,190,2)
select * from clientes  -- 23



select ID_PEDIDO, DATA_HORA, ID_OPERACAO, ID_SITUACAO, ID_PESSOA_EMITENTE, ID_PESSOA_DESTINATARIO from pedido

select * from produto
select * from estoque
select * from estoque_reservado
select id_estoque_movimentado as "Transação",
    id_pessoa_filial as "Filial", id_produto as "Item", quantidade as "Quantos", data_hora as "Data",
    entrou_saiu as "E/S"
 from estoque_movimentado
--delete from estoque_movimentado
--delete from estoque



insert into produto (id_produto, nome_produto) select mat_cod , mat_descricao from materiais