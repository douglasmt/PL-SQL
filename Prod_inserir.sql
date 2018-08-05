create or alter procedure prod_inserir (     --SQL Server
    prod_DESCRICAO varchar(50),
    prod_UNID char(2),
    prod_V_UNIT decimal(15,2),
    prod_QUANT decimal(5,3),
    prod_FORNECEDOR integer,
    prod_FASE integer
)
returns (
    prod_RET integer,
    mat_ret integer,
    prod_desc varchar(50))
as
begin
    /* Begin try
            Begin tran */
    if (exists(select MAT_cod From materiais where MAT_DESCRICAO = :PROD_DESCRICAO)) then
        EXCEPTION prod_inserir_duplicado 'Insercao de produto - ja existe esta descricao: ' || :prod_desc ;

        /* if (exists(select Id_produto From produto where nome_produto = :nome_produto)) then
        EXCEPTION prod_inserir_duplicado 'Insercao de produto - ja existe esta descricao: ' || :MAT_DESCRICAO ;

        RAISE ERROR('Insercao de Fornecedor - Fornecedor ja existe: '), 14, 1)*/

    insert into materiais (MAT_cod, MAT_QUANT, MAT_UNID, MAT_DESCRICAO, MAT_V_UNIT,
                            MAT_V_TOTAL, MAT_FORNECEDOR, MAT_DATA, MAT_FASE )
                values(null,
                :prod_QUANT,  :prod_UNID,  :prod_DESCRICAO, :prod_V_UNIT,
                :prod_V_UNIT * :prod_QUANT, :prod_FORNECEDOR,  current_date, :prod_FASE )
                RETURNING MAT_cod INTO :mat_ret;

    insert into produto (nome_produto) values (:prod_DESCRICAO) RETURNING id_produto INTO :prod_ret;


    /*  Commit tran
        End Try
        Begin catch
            rollback tran
            SELECT ERROR_MESSAGE() as Retorno; */
    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION prod_inserir_erro 'Insercao de Produto: Erro na insercao ' || :prod_ret  || SQLCODE;
    END
end


execute procedure prod_inserir('pá de teste', 'm',13.00,12,3,5)