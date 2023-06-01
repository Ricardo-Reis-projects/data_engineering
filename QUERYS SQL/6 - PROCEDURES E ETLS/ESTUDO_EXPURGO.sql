 
 USE TESTES
 
 CREATE TABLE TB_AUDIT 
	(
	ORG				VARCHAR(3),
	LOGO			VARCHAR(3),
	CONTA			VARCHAR(19),
	ST_CONTA		VARCHAR(1),
	CONTA_2			VARCHAR(1),
	DT_B1_CONTA		DATE,
	B2_CONTA		VARCHAR(1),
	DT_B2_CONTA		DATE,
	DT_ULT_CMPR		DATE,
	COL_REL			VARCHAR(3),
	CAMINHO_TABELA	VARCHAR(20),
	CAMINHO_TAB		VARCHAR(20),
	CAMINHO			VARCHAR(1),
	NUM_CARTAO		VARCHAR(19),
	TIT_CARTAO		VARCHAR(1),
	ST_CARTAO		VARCHAR(1),
	BLQ_CARTAO		VARCHAR(1),
	DT_BLK_CARTAO	VARCHAR(8),
	DT_DESBLOQ		VARCHAR(8),
	CAM_CARTAO		VARCHAR(1),
	DT_ABERT_CONTA	VARCHAR(8),
	DT_CONTA_ALTER	VARCHAR(8)
	)

INSERT INTO TB_AUDIT
SELECT
ORG,				
LOGO,			
CONTA,			
ST_CONTA,		
CONTA_2,
CASE WHEN DT_B1_CONTA NOT IN ('00000000') THEN (SUBSTRING(DT_B1_CONTA,5,4) +'-'+  SUBSTRING(DT_B1_CONTA,3,2) +'-'+ SUBSTRING(DT_B1_CONTA,1,2)) ELSE NULL END DT_B1_CONTA,
B2_CONTA,
CASE WHEN DT_B2_CONTA NOT IN ('00000000') THEN (SUBSTRING(DT_B2_CONTA,5,4) +'-'+  SUBSTRING(DT_B2_CONTA,3,2) +'-'+ SUBSTRING(DT_B2_CONTA,1,2)) ELSE NULL END DT_B2_CONTA,
CASE WHEN DT_ULT_CMPR NOT IN ('00000000') THEN (SUBSTRING(DT_ULT_CMPR,5,4) +'-'+  SUBSTRING(DT_ULT_CMPR,3,2) +'-'+ SUBSTRING(DT_ULT_CMPR,1,2)) ELSE NULL END DT_ULT_CMPR,
COL_REL,		
CAMINHO_TABELA,
CAMINHO_TAB,	
CAMINHO,	
NUM_CARTAO,	
TIT_CARTAO,		
ST_CARTAO,	
BLQ_CARTAO,
DT_BLK_CARTAO,
DT_DESBLOQ,
CAM_CARTAO,
DT_ABERT_CONTA,
DT_CONTA_ALTER
FROM [dbo].[RESUMO]

