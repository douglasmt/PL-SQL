CREATE EXCEPTION pf_inserir_erro 'Insercao de PF: Erro na insercao';
CREATE EXCEPTION pf_inserir_duplicado 'Insercao de PF: CPF Duplicado';


create or alter procedure PF_INSERIR (
    NOME varchar(50),
    CPF varchar(11),
    RG varchar(20),
    DATA_NASC date)
returns (
    PF_RET integer)
as
declare variable CODIGO_INSERIDO integer;
begin
    if (exists(select ID_Pessoa_Fisica From pessoa_fisica where cpf = :cpf)) then
        EXCEPTION pf_inserir_duplicado 'Insercao de PF - CPF Duplicado: ' || :CPF ;

    insert into pessoa (id_pessoa_tipo )  values (1)
     RETURNING id_pessoa INTO PF_RET;

    select gen_id(pessoa_identity,0) from rdb$database into  :codigo_inserido;

    insert into pessoa_fisica values
    (   :codigo_inserido,
        :nome,
        :cpf,
        :rg,
        :data_nasc );

    --WHEN ANY DO
    WHEN GDSCODE GRANT_OBJ_NOTFOUND,
       GDSCODE GRANT_FLD_NOTFOUND,
       GDSCODE GRANT_NOPRIV,
       GDSCODE GRANT_NOPRIV_ON_BASE DO
    begin
      EXCEPTION pf_inserir_erro 'Insercao de PF: Erro na insercao' || :CPF ;
    END
end


execute procedure pf_inserir('Roberto','51234512312','1277777773','1983-10-09')

select a.id_pessoa, b.nome, b.cpf, c.descricao from pessoa a, pessoa_fisica b, pessoa_tipo c 
where b.id_pessoa_fisica = a.id_pessoa
and a.id_pessoa_tipo = c.id_pessoa_tipo

/* Following GRANT statetements are generated automatically */

GRANT INSERT ON PESSOA TO PROCEDURE PF_INSERIR;
GRANT INSERT ON PESSOA_FISICA TO PROCEDURE PF_INSERIR;

/* Existing privileges on this procedure */

GRANT EXECUTE ON PROCEDURE PF_INSERIR TO SYSDBA;