create or alter procedure FORN_CONSULTAR_FORN_POR_NOME (
    CON_FORN_NOME varchar(50))
returns (
FORCOD           NUMERIC(5,0) NOT NULL,
    FORSTATUS        CHAR(1),
    FORSITUACAO      CHAR(1),
    FORNOME          VARCHAR(50),
    FORPESSOA        CHAR(1),
    FORCNPJ          VARCHAR(14),
    FORINSC          VARCHAR(14),
    FOREND           VARCHAR(50),
    FORBAI           VARCHAR(20),
    FORCID           VARCHAR(30),
    FOREST           CHAR(2),
    FORCEP           NUMERIC(8,0),
    FORDDD1          NUMERIC(2,0),
    FORFONE1         VARCHAR(10),
    FORDDD2          NUMERIC(2,0),
    FORFONE2         VARCHAR(10),
    FORDDDFAX        NUMERIC(2,0),
    FORFAX           VARCHAR(10),
    FORCONT          VARCHAR(30),
    FORCONTDDD       NUMERIC(2,0),
    FORCONTFONE      VARCHAR(10),
    FORCONT2         VARCHAR(30),
    FORCONT2DDD      NUMERIC(2,0),
    FORCONT2FONE     VARCHAR(10),
    FORCONT3         VARCHAR(30),
    FORCONT3DDD      NUMERIC(2,0),
    FORCONT3FONE     VARCHAR(10),
    FOREMAIL         VARCHAR(30),
    FORFANTASIA      VARCHAR(60),
    FORDATACAD       CHAR(10),
    FOROCORR         CHAR(1),
    FORULTPED        CHAR(5),
    FORTIPO          CHAR(14),
    FORCNAE          CHAR(7),
    FORCODMUNICIPIO  INTEGER
    )
as
begin  for
    select            FORCOD ,
    FORSTATUS        ,
    FORSITUACAO      ,
    FORNOME          ,
    FORPESSOA        ,
    FORCNPJ          ,
    FORINSC          ,
    FOREND           ,
    FORBAI           ,
    FORCID           ,
    FOREST           ,
    FORCEP           ,
    FORDDD1          ,
    FORFONE1         ,
    FORDDD2          ,
    FORFONE2         ,
    FORDDDFAX        ,
    FORFAX           ,
    FORCONT          ,
    FORCONTDDD       ,
    FORCONTFONE      ,
    FORCONT2         ,
    FORCONT2DDD      ,
    FORCONT2FONE     ,
    FORCONT3         ,
    FORCONT3DDD      ,
    FORCONT3FONE     ,
    FOREMAIL         ,
    FORFANTASIA      ,
    FORDATACAD       ,
    FOROCORR         ,
    FORULTPED        ,
    FORTIPO          ,
    FORCNAE          ,
    FORCODMUNICIPIO         from fornecedores
    where FORNOME like '%'  || upper( :con_forn_nome )   || '%'
    into :FORCOD ,
    :FORSTATUS        ,
    :FORSITUACAO      ,
    :FORNOME          ,
    :FORPESSOA        ,
    :FORCNPJ          ,
    :FORINSC          ,
    :FOREND           ,
    :FORBAI           ,
    :FORCID           ,
    :FOREST           ,
    :FORCEP           ,
    :FORDDD1          ,
    :FORFONE1         ,
    :FORDDD2          ,
    :FORFONE2         ,
    :FORDDDFAX        ,
    :FORFAX           ,
    :FORCONT          ,
    :FORCONTDDD       ,
    :FORCONTFONE      ,
    :FORCONT2         ,
    :FORCONT2DDD      ,
    :FORCONT2FONE     ,
    :FORCONT3         ,
    :FORCONT3DDD      ,
    :FORCONT3FONE     ,
    :FOREMAIL         ,
    :FORFANTASIA      ,
    :FORDATACAD       ,
    :FOROCORR         ,
    :FORULTPED        ,
    :FORTIPO          ,
    :FORCNAE          ,
    :FORCODMUNICIPIO
    do begin
       SUSPEND;
    END
end

create or alter procedure FORN_CONSULTAR_FORN_POR_ID (
    CON_COD_FORN integer )
returns (
    FORCOD           NUMERIC(5,0) NOT NULL,
    FORSTATUS        CHAR(1),
    FORSITUACAO      CHAR(1),
    FORNOME          VARCHAR(50),
    FORPESSOA        CHAR(1),
    FORCNPJ          VARCHAR(14),
    FORINSC          VARCHAR(14),
    FOREND           VARCHAR(50),
    FORBAI           VARCHAR(20),
    FORCID           VARCHAR(30),
    FOREST           CHAR(2),
    FORCEP           NUMERIC(8,0),
    FORDDD1          NUMERIC(2,0),
    FORFONE1         VARCHAR(10),
    FORDDD2          NUMERIC(2,0),
    FORFONE2         VARCHAR(10),
    FORDDDFAX        NUMERIC(2,0),
    FORFAX           VARCHAR(10),
    FORCONT          VARCHAR(30),
    FORCONTDDD       NUMERIC(2,0),
    FORCONTFONE      VARCHAR(10),
    FORCONT2         VARCHAR(30),
    FORCONT2DDD      NUMERIC(2,0),
    FORCONT2FONE     VARCHAR(10),
    FORCONT3         VARCHAR(30),
    FORCONT3DDD      NUMERIC(2,0),
    FORCONT3FONE     VARCHAR(10),
    FOREMAIL         VARCHAR(30),
    FORFANTASIA      VARCHAR(60),
    FORDATACAD       CHAR(10),
    FOROCORR         CHAR(1),
    FORULTPED        CHAR(5),
    FORTIPO          CHAR(14),
    FORCNAE          CHAR(7),
    FORCODMUNICIPIO  INTEGER)
as
begin
select  FORCOD ,
    FORSTATUS        ,
    FORSITUACAO      ,
    FORNOME          ,
    FORPESSOA        ,
    FORCNPJ          ,
    FORINSC          ,
    FOREND           ,
    FORBAI           ,
    FORCID           ,
    FOREST           ,
    FORCEP           ,
    FORDDD1          ,
    FORFONE1         ,
    FORDDD2          ,
    FORFONE2         ,
    FORDDDFAX        ,
    FORFAX           ,
    FORCONT          ,
    FORCONTDDD       ,
    FORCONTFONE      ,
    FORCONT2         ,
    FORCONT2DDD      ,
    FORCONT2FONE     ,
    FORCONT3         ,
    FORCONT3DDD      ,
    FORCONT3FONE     ,
    FOREMAIL         ,
    FORFANTASIA      ,
    FORDATACAD       ,
    FOROCORR         ,
    FORULTPED        ,
    FORTIPO          ,
    FORCNAE          ,
    FORCODMUNICIPIO         from fornecedores
    where FORCOD = :con_cod_FORN
    into :FORCOD ,
    :FORSTATUS        ,
    :FORSITUACAO      ,
    :FORNOME          ,
    :FORPESSOA        ,
    :FORCNPJ          ,
    :FORINSC          ,
    :FOREND           ,
    :FORBAI           ,
    :FORCID           ,
    :FOREST           ,
    :FORCEP           ,
    :FORDDD1          ,
    :FORFONE1         ,
    :FORDDD2          ,
    :FORFONE2         ,
    :FORDDDFAX        ,
    :FORFAX           ,
    :FORCONT          ,
    :FORCONTDDD       ,
    :FORCONTFONE      ,
    :FORCONT2         ,
    :FORCONT2DDD      ,
    :FORCONT2FONE     ,
    :FORCONT3         ,
    :FORCONT3DDD      ,
    :FORCONT3FONE     ,
    :FOREMAIL         ,
    :FORFANTASIA      ,
    :FORDATACAD       ,
    :FOROCORR         ,
    :FORULTPED        ,
    :FORTIPO          ,
    :FORCNAE          ,
    :FORCODMUNICIPIO;

end

execute procedure forn_consultar_forn_por_nome ('')
execute procedure forn_consultar_forn_por_id (2)

execute procedure mat_total_por_desc('tabajara')

select * from fornecedores where fornome like '%'  || upper( :CON_DESC )   || '%'