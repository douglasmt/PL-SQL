CREATE or alter EXCEPTION ped_ite_inserir_erro 'Erro de inserção de item de pedido:  ';

CREATE OR ALTER PROCEDURE PED_ITE_INSERIR (
    PED_ITE_INS_ID_PEDIDO           INTEGER,
    PED_ITE_INS_ID_PRODUTO           INTEGER,
    PED_ITE_INS_QUANTIDADE           DECIMAL(15,3),
    PED_ITE_INS_VALOR_UNITARIO       DECIMAL(18,2),
    PED_ITE_INS_PERCENTUAL_DESCONTO  DECIMAL(5,2),
    PED_ITE_INS_VALOR_DESCONTO       DECIMAL(18,2),
    PED_ITE_INS_VALOR_TOTAL          DECIMAL(18,2))
returns (
    PED_ITE_INS_ret integer)
as
begin

    if (exists(select ID_PEDIDO, ID_PRODUTO From pedido_item where ID_PEDIDO = :PED_ITE_INS_ID_PEDIDO
    and ID_PRODUTO = :PED_ITE_INS_ID_PRODUTO )) then
        EXCEPTION ped_ite_inserir_erro
        'Insercao de item de pedido: duplicado = ' || :PED_ITE_INS_ret  || SQLCODE;

    insert into pedido_item(
                            ID_PEDIDO,
                            ID_PRODUTO ,
                            QUANTIDADE ,
                            VALOR_UNITARIO,
                            PERCENTUAL_DESCONTO,
                            VALOR_DESCONTO,
                            VALOR_TOTAL)

        values (            :PED_ITE_INS_ID_PEDIDO,
                            :PED_ITE_INS_ID_PRODUTO ,
                            :PED_ITE_INS_QUANTIDADE ,
                            :PED_ITE_INS_VALOR_UNITARIO,
                            :PED_ITE_INS_PERCENTUAL_DESCONTO,
                            :PED_ITE_INS_VALOR_DESCONTO,
                            :PED_ITE_INS_VALOR_TOTAL)
        returning id_pedido into :PED_ITE_INS_ret;  --Select @@Identity as Retorno;

    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION ped_ite_inserir_erro 'Insercao de item de pedido: Erro = ' || :PED_ITE_INS_ret  || SQLCODE;
    END

end


alter table PEDIDO_ITEM
add constraint PK_PEDIDO_ITEM
primary key (ID_PRODUTO,ID_PEDIDO) pois precisava ter mais produtos ou itens em cada pedido


select * from pedido
select    * from produto
select * from pedido_item
execute procedure ped_ite_inserir(1,2,11,26.90,0,0,800)
execute procedure ped_ite_inserir(1,3,11,26.90,0,0,800)












