CREATE or alter EXCEPTION PED_ITEM_INSERIR_erro 'Erro de inserção item do pedido:  ';

CREATE OR ALTER PROCEDURE PED_ITEM_INSERIR (
    ped_item_ins_id_pedido integer,
    ped_item_ins_id_produto integer,
    ped_item_ins_QUANTIDADE           DECIMAL(15,3),
    ped_item_ins_VALOR_UNITARIO       DECIMAL(18,2),
    ped_item_ins_PERC_DESC  DECIMAL(5,2),
    ped_item_ins_VALOR_DESCONTO       DECIMAL(18,2),
    ped_item_ins_VALOR_TOTAL          DECIMAL(18,2))
returns (
    ped_item_ins_ret integer)
as
begin

    insert into pedido_item (id_pedido,
    id_produto,
    quantidade,
    valor_unitario,
    percentual_desconto,
    valor_desconto,
    valor_total)
    values (:ped_item_ins_id_pedido,
    :ped_item_ins_id_produto,
    :ped_item_ins_QUANTIDADE,
    :ped_item_ins_VALOR_UNITARIO,
    :ped_item_ins_PERC_DESC,
    :ped_item_ins_VALOR_DESCONTO,
    :ped_item_ins_VALOR_TOTAL)

    RETURNING id_produto INTO :ped_item_ins_ret;

    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION PED_ITEM_INSERIR_erro 'Erro de inserção item do pedido:  ' || :ped_item_ins_ret  || SQLCODE;
    END

end

select * from produto
select * from pedido
select * from pedido_item
execute procedure ped_item_inserir( 1,1,3,13.00,1.3,3.0,10.0)
execute procedure ped_item_inserir( 1,2,3,13.00,1.3,3.0,10.0)
alter table PEDIDO_ITEM
add constraint PK_PEDIDO_ITEM
primary key (ID_PEDIDO,ID_PRODUTO)
using index IX_PEDIDO_ITEM