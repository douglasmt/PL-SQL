CREATE or alter EXCEPTION est_res_inserir_erro 'Erro de inserção:  ';

create or alter procedure est_reservado_manter (
    est_res_ID_Pessoa_filial integer,
    est_res_ID_Produto integer,
    est_res_quantidade integer
)
returns (
    est_res_RET integer
)
as
declare variable est_res_entrou_saiu char(1);

begin
    if (exists(select id_produto From estoque_reservado
                where ID_Pessoa_filial = :est_res_ID_Pessoa_filial
                and id_produto = :est_res_ID_Produto ))
    then
    begin

        update estoque_reservado set quantidade = quantidade + :est_res_quantidade
            where ID_Pessoa_filial = :est_res_ID_Pessoa_filial
            and id_produto = :est_res_ID_Produto
            RETURNING id_produto INTO :est_res_ret;
    end
    else
        begin

            insert into estoque_reservado ( ID_Pessoa_filial, ID_Produto, quantidade )
                values  ( :est_res_ID_Pessoa_filial, :est_res_ID_Produto, :est_res_quantidade )
                RETURNING id_produto INTO :est_res_ret;
        end

    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION est_res_inserir_erro 'Insercao de Estoque reservado: Erro = ' || :est_res_RET  || SQLCODE;
    END

end

execute procedure est_reservado_manter(26,190,2)
/* para reservar , depois que efetuar a compra  "execute procedure est_reservado_manter(26,190,-2)"
para tirar de reserva e também excluir de estoque "execute procedure est_manter(26,190,-2)"
    e finalizar o pedido*/


select * from filial
select * from produto
select * from estoque
select * from estoque_reservado
select id_estoque_movimentado as "Transação",
    id_pessoa_filial as "Filial", id_produto as "Item", quantidade as "Quantos", data_hora as "Data",
    entrou_saiu as "E/S"
 from estoque_movimentado
--delete from estoque_movimentado
--delete from estoque