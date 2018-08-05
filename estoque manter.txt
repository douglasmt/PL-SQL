CREATE or alter EXCEPTION est_inserir_erro 'Erro de inserção:  ';

CREATE OR ALTER TRIGGER ESTOQUE_MOV_TRIGGER FOR ESTOQUE_MOVIMENTADO
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.ID_estoque_movimentado is null) then
  begin
    new.ID_estoque_movimentado = gen_id(estoque_mov_identity,1);
  end
end

create or alter procedure est_manter (
    est_ID_Pessoa_filial integer,
    est_ID_Produto integer,
    est_quantidade integer
)
returns (
    est_RET integer
)
as
declare variable est_entrou_saiu char(1);

begin
    if (exists(select id_produto From estoque
                where ID_Pessoa_filial = :est_ID_Pessoa_filial
                and id_produto = :est_ID_Produto ))
    then
    begin

        update estoque set quantidade = quantidade + :est_quantidade
            where ID_Pessoa_filial = :est_ID_Pessoa_filial
            and id_produto = :est_ID_Produto
            RETURNING id_produto INTO :est_ret;
    end
    else
        begin

            insert into estoque ( ID_Pessoa_filial, ID_Produto, quantidade )
                values  ( :est_ID_Pessoa_filial, :est_ID_Produto, :est_quantidade )
                RETURNING id_produto INTO :est_ret;
        end

    if (:est_quantidade < 0 ) then
        est_entrou_saiu = 'S';
    else
        est_entrou_saiu = 'E';

    insert into estoque_movimentado
        (id_pessoa_filial, id_produto, quantidade, data_hora, entrou_saiu)
        values
        (:est_ID_Pessoa_filial, :est_ID_Produto, :est_quantidade, current_timestamp, :est_entrou_saiu);

    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION est_inserir_erro 'Insercao de Estoque: Erro na insercao ' || :est_RET  || SQLCODE;
    END

end

execute procedure est_manter(26,190,500)

select * from  filial
select * from produto
select * from estoque
select id_estoque_movimentado as "Transação",
    id_pessoa_filial as "Filial", id_produto as "Item", quantidade as "Quantos", data_hora as "Data",
    entrou_saiu as "E/S"
 from estoque_movimentado
delete from estoque_movimentado
delete from estoque



insert into produto (id_produto, nome_produto) select mat_cod , mat_descricao from materiais