update fornecedores set forPESSOA = 1   where FORCOD IN (1,2,9,10)

create or alter procedure FORN_CONSULTAR_FORN_POR_NOME (
    CON_FORN_NOME varchar(50))
returns (
    FORCOD numeric(5,0) not null,
    FORSTATUS char(1),
    FORSITUACAO char(1),
    FORNOME varchar(50),
    FORPESSOA VARCHAR(20),
    FORCNPJ varchar(14),
    FORINSC varchar(14),
    FOREND varchar(50),
    FORBAI varchar(20),
    FORCID varchar(30),
    FOREST char(2),
    FORCEP numeric(8,0),
    FORDDD1 numeric(2,0),
    FORFONE1 varchar(10),
    FORDDD2 numeric(2,0),
    FORFONE2 varchar(10),
    FORDDDFAX numeric(2,0),
    FORFAX varchar(10),
    FORCONT varchar(30),
    FORCONTDDD numeric(2,0),
    FORCONTFONE varchar(10),
    FORCONT2 varchar(30),
    FORCONT2DDD numeric(2,0),
    FORCONT2FONE varchar(10),
    FORCONT3 varchar(30),
    FORCONT3DDD numeric(2,0),
    FORCONT3FONE varchar(10),
    FOREMAIL varchar(30),
    FORFANTASIA varchar(60),
    FORDATACAD char(10),
    FOROCORR char(1),
    FORULTPED char(5),
    FORTIPO char(14),
    FORCNAE char(7),
    FORCODMUNICIPIO integer)
as
begin  for
    select            FORCOD ,
    FORSTATUS        ,
    FORSITUACAO      ,
    FORNOME          ,
    (select  descricao from pessoa_tipo where id_pessoa_tipo = forpessoa),
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

CREATE SEQUENCE estOQUE_mov_IDENTITY;

CREATE OR ALTER TRIGGER estOQUE_mov_TRIGGER FOR estoque_movimentado
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.ID_estoque_movimentado is null) then
  begin
    new.ID_estoque_movimentado = gen_id(PROD_IDENTITY,1);
  end
end

CREATE SEQUENCE ped_IDENTITY;

drop table pedido
CREATE TABLE PEDIDO (
    ID_PEDIDO               INTEGER NOT NULL,
    DATA_HORA               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ID_OPERACAO             INTEGER,
    ID_SITUACAO             INTEGER,
    ID_PESSOA_EMITENTE      INTEGER,
    ID_PESSOA_DESTINATARIO  INTEGER
);

-----------------------------------------------------------------------------------

ALTER TABLE PEDIDO ADD CONSTRAINT PK_PEDIDO PRIMARY KEY (ID_PEDIDO);

CREATE OR ALTER TRIGGER ped_TRIGGER FOR pedido
ACTIVE BEFORE INSERT POSITION 0
AS
begin
  if (new.ID_pedido is null) then
  begin
    new.ID_pedido = gen_id(ped_IDENTITY,1);
  end
end
ALTER TABLE pedido ADD CONSTRAINT FK_pedido_operacao -- PARA SEMPRE EXISTIR EM operacao  ANTES DE pedido
FOREIGN KEY (id_operacao) REFERENCES operacao (ID_operacao);

ALTER TABLE pedido ADD CONSTRAINT FK_pedido_situacao -- PARA SEMPRE EXISTIR EM situacao ANTES DE pedido
FOREIGN KEY (id_situacao) REFERENCES situacao (ID_situacao);

ALTER TABLE pedido ADD CONSTRAINT FK_pedido_pessoa_emitente -- PARA SEMPRE EXISTIR EM pessoa ANTES DE pedido
FOREIGN KEY (id_pessoa_emitente) REFERENCES pessoa (ID_pessoa);

ALTER TABLE pedido ADD CONSTRAINT FK_pedido_pessoa_destinatario -- PARA SEMPRE EXISTIR EM pessoa ANTES DE pedido
FOREIGN KEY (id_pessoa_destinatario) REFERENCES pessoa (ID_pessoa);

ALTER TABLE pedido_item ADD CONSTRAINT FK_pedido_item_pedido -- PARA SEMPRE EXISTIR EM pedido ANTES DE pedidoitem
FOREIGN KEY (id_pedido) REFERENCES pedido (ID_pedido);

ALTER TABLE pedido_item ADD CONSTRAINT FK_pedido_item_para_Produto -- PARA SEMPRE EXISTIR EM produto ANTES DE pedidoitem
FOREIGN KEY (id_produto) REFERENCES produto (id_produto);


CREATE TABLE PRECO (
    ID_PRODUTO  INTEGER NOT NULL,
    PRECO       DECIMAL(18,2)
);
ALTER TABLE PRECO

ADD CONSTRAINT PK_PRECO
PRIMARY KEY (ID_PRODUTO)
alter table preco add constraint fk_preco_para_produto
foreign key (id_produto) references produto(id_produto)


alter table preco add constraint fk_preco_para_produto
foreign key (id_produto) references produto(id_produto)

ALTER TABLE pedido_item ADD CONSTRAINT
pk_pedido_item PRIMARY KEY (ID_pedido);


-- Tentando o backup

C:\>cd C:\Program Files\Firebird\Firebird_2_5\bin

-- Fazendo 2 backups com nomes diferentes
C:\Program Files\Firebird\Firebird_2_5\bin>gbak -b -user SYSDBA -password master
key "C:\LASS\DB1.fdb" "C:\LASS\Materiais Backup\Materiais.gbk"

C:\Program Files\Firebird\Firebird_2_5\bin>gbak -b -user SYSDBA -password master
key "C:\LASS\DB1.fdb" "C:\LASS\Materiais Backup\Materiais 17-11-2017.gbk"

C:\Program Files\Firebird\Firebird_2_5\bin>gbak -r -user SYSDBA -password master
key "C:\LASS\Materiais Backup\Materiais 17-11-2017.gbk" "C:\LASS\Materiais Resto
re\Materiais 17-11-2017.gdb"

C:\Program Files\Firebird\Firebird_2_5\bin>gbak -r -user SYSDBA -password master
key "C:\LASS\Materiais Backup\Materiais 17-11-2017.gbk" "C:\LASS\Bancos Materiai
s\Materiais Restore\Materiais 17-11-2017.fdb"


