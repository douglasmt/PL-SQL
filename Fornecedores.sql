CREATE EXCEPTION forn_inserir_erro 'Insercao de Fornecedor - Erro na insercao: ';
CREATE EXCEPTION forn_inserir_duplicado 'Insercao de Fornecedor - Fornecedor ja existe: ';

create or alter procedure forn_inserir (
    FORCOD numeric(5,0),
    FORNOME varchar(50),
    FORPESSOA char(1),

    FOREST char(2)
)
returns (
    Fornecedor_RET integer)
as
begin
    if (exists(select FORCOD From fornecedores where FORCOD = :FORCOD)) then
        EXCEPTION forn_inserir_duplicado 'Insercao de Fornecedor - Fornecedor ja existe: ' || :FORCOD ;

    insert into fornecedores (FORCOD,
    FORNOME ,     FORPESSOA ,    FOREST )  values
    ( :FORCOD , :FORNOME ,     :FORPESSOA ,    :FOREST) RETURNING FORCOD INTO :Fornecedor_RET;

    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION forn_inserir_erro 'Insercao de Fornecedor: Erro na insercao ' || :FORCOD ;
    END
end

execute procedure forn_inserir(11, 'DHL', 2,'RJ')

select * from  filial join pessoa_juridica on filial.id_pessoa_filial  = pessoa_juridica.id_pessoa_juridica