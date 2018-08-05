CREATE EXCEPTION pJ_inserir_erro 'Insercao de PJ: Erro na insercao';
CREATE EXCEPTION pJ_inserir_duplicado 'Insercao de PJ: CNPJ Duplicado';


create or alter procedure PJ_INSERIR (
    NOME_FANTASIA       VARCHAR(50),
    RAZAO_SOCIAL        VARCHAR(50),
    CNPJ                VARCHAR(14),
    INSCRICAO_ESTADUAL  VARCHAR(20),
    DATA_FUNDACAO       DATE)
returns (
    PJ_RET integer)
as
declare variable CODIGO_INSERIDO integer;
begin
    if (exists(select ID_Pessoa_juridica From pessoa_juridica where CNPJ = :CNPJ)) then
        EXCEPTION pj_inserir_duplicado 'Insercao de PJ: CNPJ Duplicado: ' || :CNPJ ;

    insert into pessoa (id_pessoa_tipo )  values (2)
     RETURNING id_pessoa INTO :PJ_RET;

    select gen_id(pessoa_identity,0) from rdb$database into  :codigo_inserido;

    insert into pessoa_juridica values
    (   :codigo_inserido,
        :NOME_FANTASIA,
        :RAZAO_SOCIAL,
        :CNPJ,
        :INSCRICAO_ESTADUAL,
        :DATA_FUNDACAO );

    --WHEN ANY DO
    WHEN SQLCODE -901,
       SQLCODE -313,
       GDSCODE unavailable,
       GDSCODE no_dup DO
    begin
      EXCEPTION pf_inserir_erro 'Insercao de PJ: Erro na insercao' || :CNPJ ;
    END
end




execute procedure pf_inserir('Roberto','51234512312','1277777773','1983-10-09')

select a.id_pessoa, b.nome, b.cpf, c.descricao from pessoa a, pessoa_fisica b, pessoa_tipo c where b.id_pessoa_fisica = a.id_pessoa
and a.id_pessoa_tipo = c.id_pessoa_tipo

select * from  RDB$USER_PRIVILEGES