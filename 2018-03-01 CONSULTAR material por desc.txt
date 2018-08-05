CREATE OR ALTER PROCEDURE MAT_CONSULTAR_MATERIAL_POR_DESC (
    con_desc varchar(50))
returns (
    mat_cod integer,
    mat_quant decimal(5,3),
    mat_unid char(2),
    mat_descricao varchar(50),
    mat_v_unit decimal(15,2),
    mat_v_total decimal(15,2),
    mat_fornecedor_cod integer,
    mat_fornecedor_nome varchar(50),
    mat_data date,
    mat_fase integer)
as
begin                                                                                           for
    select            MAT_COD,
    MAT_QUANT,
    MAT_UNID,
    MAT_DESCRICAO,
    MAT_V_UNIT,
        MAT_V_TOTAL,
        MAT_Fornecedor,   (select FORNOME from fornecedores where FORCOD = MAT_Fornecedor),
        MAT_DATA,
        MAT_FASE        from materiais
    where upper(MAT_DESCRICAO) like '%'  || upper(:con_desc) || '%'
    into :MAT_COD,                                                                   :MAT_QUANT,
        :MAT_UNID,                                                                   :MAT_DESCRICAO,
        :MAT_V_UNIT,                                                                 :MAT_V_TOTAL,
        :mat_fornecedor_cod, :mat_fornecedor_nome,
        :MAT_DATA,
        :MAT_FASE                                                                do begin
       SUSPEND;                                                                  END
end

execute procedure mat_consultar_material_por_desc('')