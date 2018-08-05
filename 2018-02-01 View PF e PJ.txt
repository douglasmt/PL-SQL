CREATE OR ALTER VIEW pessoa_fisica_juridica_view
AS
select pessoa.id_pessoa,
    pessoa.id_pessoa_tipo,
    pessoa_tipo.descricao as "DescricaoTipo",
    case
        when pessoa.id_pessoa_tipo = 1 then 'CPF = ' || pessoa_fisica.cpf
        else 'CNPJ = ' || pessoa_juridica.cnpj
    end as CPF_CNPJ,
    case
        when pessoa.id_pessoa_tipo = 1 then pessoa_fisica.nome
        else pessoa_juridica.nome_fantasia
    end as Nome
