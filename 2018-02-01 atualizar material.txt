CREATE OR ALTER PROCEDURE MAT_ATUALIZAR (
    mat_atu_cod integer,
    mat_atu_desc varchar(50),
    mat_atu_unid char(2),
    mat_atu_v_unit decimal(10,2),
    mat_atu_quant decimal(10,3),
    mat_atu_fornecedor integer,
    mat_atu_fase integer)
returns (
    mat_atu_ret integer)
as
begin
update materiais
    set MAT_DESCRICAO = :MAT_ATU_DESC,
    MAT_UNID = :MAT_ATU_UNID,
    MAT_V_UNIT = :MAT_ATU_V_UNIT,
    MAT_QUANT = :MAT_ATU_QUANT,
    MAT_FORNECEDOR = :MAT_ATU_FORNECEDOR,
    MAT_V_total =  :MAT_ATU_V_UNIT * :MAT_ATU_QUANT,
    MAT_DATA = current_date,
    MAT_FASE = :MAT_ATU_FASE
    where MAT_cod = :MAT_atu_cod
    RETURNING :MAT_ATU_COD INTO MAT_ATU_RET;

end