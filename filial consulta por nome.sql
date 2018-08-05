create or alter procedure filial_cons_por_nome
(
    fil_nome varchar(50)
    )
 returns (
    fil_id_pessoa_filial integer,
    fil_CPF_CNPJ varchar(14) ,
    fil_nome_ret varchar(50),
    fil_id_pessoa_tipo integer,
    fil_tipo varchar(20)
     )
as
begin
    select fil.id_pessoa_filial, pes.CPF_CNPJ , pes.nome AS NOME, pes.id_pessoa_tipo, pes.tipo
     from filial as fil
    join
    UVW_PESSOA_PF_PJ as pes on
        fil.id_pessoa_filial   = pes.id_pessoa

    where upper(pes.nome) like '%' || upper(:fil_nome) || '%'
    INTO :fil_id_pessoa_filial,
    :fil_CPF_CNPJ ,
    :fil_nome_ret,
    :fil_id_pessoa_tipo,
    :fil_tipo;
    SUSPEND;
end

execute procedure filial_cons_por_nome('drausio')