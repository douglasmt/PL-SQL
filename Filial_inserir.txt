CREATE EXCEPTION filial_inserir_erro 'Insercao de Filial - Erro na insercao: ';
CREATE EXCEPTION filial_inserir_duplicado 'Insercao de Filial - Filial ja existe: ';

create or alter procedure filial_inserir (
    ID_PESSOA_FILIAL  INTEGER )
returns (
    Filial_RET integer)
as
declare variable CODIGO_INSERIDO integer;
begin
    if (exists(select ID_Pessoa_filial From filial where ID_Pessoa_filial = :ID_Pessoa_filial)) then
        EXCEPTION filial_inserir_duplicado 'Insercao de Filial - Filial ja existe: ' || :ID_Pessoa_filial ;

    insert into filial values
    ( :ID_Pessoa_filial ) RETURNING ID_Pessoa_filial INTO :Filial_RET;

    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION filial_inserir_erro 'Insercao de PJ: Erro na insercao ' || :ID_Pessoa_filial ;
    END
end

execute procedure filial_inserir(26)

select * from  filial join pessoa_juridica on filial.id_pessoa_filial  = pessoa_juridica.id_pessoa_juridica