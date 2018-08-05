create or alter  view uvw_pessoa_pf_pj
as

select a.id_pessoa, a.id_pessoa_tipo, b.descricao,
        case
            when a.id_pessoa_tipo = 1 then  c.cpf
            else  d.cnpj
        end as CPF_CNPJ,
        case
            when a.id_pessoa_tipo = 1 then c.nome
            else d.nome_fantasia
        end as Nome
from pessoa a join pessoa_tipo  b
    on a.id_pessoa_tipo = b.id_pessoa_tipo
left join
        pessoa_fisica c on a.id_pessoa = c.id_pessoa_fisica
left join
        pessoa_juridica d on a.id_pessoa = d.id_pessoa_juridica

---------------------------------------------------------------

select * from pessoa join pessoa_tipo
    on pessoa.id_pessoa_tipo = pessoa_tipo.id_pessoa_tipo

select a.id_pessoa, a.id_pessoa_tipo, b.descricao from pessoa a join pessoa_tipo  b
    on a.id_pessoa_tipo = b.id_pessoa_tipo

----------------------------------------------------------------------------------------
----------- só pega pessoa física se tirar o left
select a.id_pessoa, a.id_pessoa_tipo, b.descricao 
	from pessoa a join pessoa_tipo  b
        	on a.id_pessoa_tipo = b.id_pessoa_tipo
    left 
	join
        pessoa_fisica c on a.id_pessoa = c.id_pessoa_fisica 

----------------------------------------------------------------------------------------
-----------só traz o cpf 
select a.id_pessoa, a.id_pessoa_tipo, b.descricao,
        c.cpf
from pessoa a join pessoa_tipo  b
    on a.id_pessoa_tipo = b.id_pessoa_tipo
    left join
        pessoa_fisica c on a.id_pessoa = c.id_pessoa_fisica

----------------------------------------------------------------------------------------
-----------traz todos
select a.id_pessoa, a.id_pessoa_tipo, b.descricao,
        c.cpf , d.cnpj
from pessoa a join pessoa_tipo  b
    on a.id_pessoa_tipo = b.id_pessoa_tipo
left join
        pessoa_fisica c on a.id_pessoa = c.id_pessoa_fisica
left join -- SEPARA PARA SER MOSTRADO COM AS OUTRAS LEFT
        pessoa_juridica d on a.id_pessoa = d.id_pessoa_juridica