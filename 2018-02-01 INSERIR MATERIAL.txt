create or alter procedure MAT_INSERIR_MATERIAL (
    MAT_DESCRICAO varchar(50),
    MAT_UNID char(2),
    MAT_V_UNIT decimal(15,2),
    MAT_QUANT decimal(5,3),
    MAT_FORNECEDOR integer,
    MAT_FASE integer)
returns (
    ATU_RET integer)
as
begin
insert into materiais (MAT_cod, MAT_QUANT, MAT_UNID, MAT_DESCRICAO, MAT_V_UNIT,
   MAT_V_TOTAL, MAT_FORNECEDOR, MAT_DATA, MAT_FASE )
 values(null, :MAT_QUANT,  :MAT_UNID,  :MAT_DESCRICAO, :MAT_V_UNIT, :MAT_V_UNIT * :MAT_QUANT ,
 :MAT_FORNECEDOR,  current_date, :MAT_FASE )
 RETURNING MAT_cod INTO atu_ret;
end