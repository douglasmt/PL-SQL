CREATE EXCEPTION cli_inserir_erro 'Insercao de Fornecedor - Erro na insercao: ';
CREATE EXCEPTION cli_inserir_duplicado 'Insercao de Fornecedor - Fornecedor ja existe: ';

create or alter procedure cli_inserir (     --SQL Server
    CLICOD           NUMERIC(7,0),          --@CliCod as Numeric
    CLINOME          CHAR(50),
    CLIPESSOA        CHAR(1),
    CLIDATACAD       CHAR(10),
    CLINACTO         CHAR(10),
    CLIEND           CHAR(45),
    CLINRO           CHAR(5),
    CLIBAI           CHAR(20),
    CLICID           CHAR(30),
    CLIEST           CHAR(2),
    CLIDDD1          NUMERIC(2,0),
    CLIFONE1         CHAR(10)
)
returns (
    Cli_RET integer)
as
begin
    /* Begin try
            Begin tran */
    if (exists(select CLICOD From clientes where CLICOD = :CLICOD)) then
        EXCEPTION cli_inserir_duplicado 'Insercao de Fornecedor - Fornecedor ja existe: ' || :CLICOD ;
        /* RAISE ERROR('Insercao de Fornecedor - Fornecedor ja existe: '), 14, 1)*/

    insert into clientes (
    CLICOD,
    CLINOME          ,
    CLIPESSOA        ,
    CLIDATACAD       ,
    CLINACTO         ,
    CLIEND           ,
    CLINRO           ,
    CLIBAI           ,
    CLICID           ,
    CLIEST           ,
    CLIDDD1          ,
    CLIFONE1          )  values
    ( 
    :CLICOD,
    :CLINOME          ,
    :CLIPESSOA        ,
    :CLIDATACAD       ,
    :CLINACTO         ,
    :CLIEND           ,
    :CLINRO           ,
    :CLIBAI           ,
    :CLICID           ,
    :CLIEST           ,
    :CLIDDD1          ,
    :CLIFONE1         ) RETURNING CLICOD INTO :Cli_RET;

    /*      Commit tran
        End Try
        Begin catch
            rollback tran
            SELECT ERROR_MESSAGE() as Retorno; */
    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION cli_inserir_erro 'Insercao de Fornecedor: Erro na insercao ' || :CLICOD ;
    END
end

execute procedure cli_inserir(5,'Loja do mario','2','2017-10-01','2017-11-01','Rua Vieira de Moura','100','Vila Mariana'
,'São Paulo','SP',11,'122374')


insert certo!
execute procedure cli_inserir(23,'Loja do Fisicao','1','2017-10-01','2017-11-01','Rua João Pessoa','100','Vila Mariana'
,'São Paulo','SP',11,'8888888')

select * from  clientes join pessoa_fisica on clientes.clicod  = pessoa_fisica.id_pessoa_fisica