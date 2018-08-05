--CREATE OR ALTER VIEW FOREIGNKEY()
--AS
select pessoa.id_pessoa,
    pessoa.id_pessoa_tipo,
    pessoa_tipo.descricao as "DescricaoTipo",
    case
        when pessoa.id_pessoa_tipo = 1 then 'CPF = ' || pessoa_fisica.cpf
        else 'CNPJ = ' || pessoa_juridica.cnpj
    end as CPF_CNPJ,
    case
        when pessoa.id_pessoa_tipo = 1 then 'CPF = ' || pessoa_fisica.nome
        else 'CNPJ = ' || pessoa_juridica.nome_fantasia
    end as CPF_CNPJ


from pessoa
    join
        pessoa_tipo on pessoa.id_pessoa_tipo =     pessoa_tipo.id_pessoa_tipo
    left join
        pessoa_fisica on pessoa.id_pessoa = pessoa_fisica.id_pessoa_fisica
    left join
        pessoa_juridica on pessoa.id_pessoa = pessoa_juridica.id_pessoa_juridica
