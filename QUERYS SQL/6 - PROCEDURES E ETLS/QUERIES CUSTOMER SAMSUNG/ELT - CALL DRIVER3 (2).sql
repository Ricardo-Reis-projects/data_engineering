CREATE PROCEDURE dbo.PRC_SAMS_FAT_CALL_DRIVER AS
-- =============================================
-- AUTHOR: RICARDO REIS
-- CREATE DATE: 2019-11-11
-- USED TABLES: TB_SAMSUNG_SAP_GATA, ST_QUADRO
-- DESCRIPTION: Alimentação da tabela TB_FAT_SAMS_CALL_DRIVER_PBI que sera consumida pelo PowerBI MIS80192
-- UPDATE: <Atualizações realizadas (Data/RE/Descrição da atualização)>
-- =============================================
BEGIN

DECLARE @DATA_INICIO DATE 
SET @DATA_INICIO = DATEADD(DAY,-7,CONVERT(DATE,GETDATE(),103))

DELETE FROM DB_SAMSUNG.dbo.TB_FAT_SAMS_CALL_DRIVER_PBI WHERE DT_POSTING_DATE >= @DATA_INICIO

INSERT INTO DB_SAMSUNG.dbo.TB_FAT_SAMS_CALL_DRIVER_PBI
(
	 NM_Ticket
	,NM_Process_Type
	,NM_Status
	,NM_Reason_description
	,NM_Comments
	,DT_Posting_date
	,NM_Channel_Desc
	,NM_Category1_description
	,NM_Category2_description
	,NM_Category3_description
	,NM_Created_by
	,NM_EMPRESA
	,NM_GRUPO
	,NM_AGENTE
	,NM_SUPERVISOR
	,NM_NEW_DRIVER
	,NM_BRAND_LOCAL
	,NR_DUPLICADOS
)
SELECT 
	 GATA.NM_Ticket
	,GATA.NM_Process_Type
	,GATA.NM_Status
	,GATA.NM_Reason_description
	,GATA.NM_Comments
	,GATA.DT_Posting_date
	,GATA.NM_Channel_Desc
	,GATA.NM_Category1_description
	,GATA.NM_Category2_description
	,GATA.NM_Category3_description
	,GATA.NM_Created_by
	,LTRIM(REPLACE(IIF(Q.SUPERVISOR IS NULL,'-','ATENTO'),'  ',' '))				AS NM_EMPRESA
	,Q.GRUPO																		AS NM_GRUPO
	,Q.AGENTE																		AS NM_AGENTE
	,Q.SUPERVISOR																	AS NM_SUPERVISOR
	,CASE
		WHEN GATA.NM_PROCESS_TYPE = 'Technical Advice'	AND GATA.NM_Reason_description = 'Close with consultation'
		THEN 'Resolvido em Linha'

		WHEN GATA.NM_PROCESS_TYPE = 'Technical Advice'	AND GATA.NM_Reason_description = 'Transfer to Service Request'
		THEN 'Abertura de OS'

		WHEN GATA.NM_PROCESS_TYPE = 'Technical Advice'	AND GATA.NM_Reason_description = 'Transfer to other responsible'
		THEN 'Consumidor/Produto indisponível'

		WHEN GATA.NM_PROCESS_TYPE = 'Technical Advice'	AND GATA.NM_Reason_description = 'Inform Service Location'
		THEN 'Direcionado ASC Balcão'

		WHEN GATA.NM_PROCESS_TYPE = 'Technical Advice'	AND GATA.NM_Reason_description = 'Unintended disconnected'
		THEN 'Desconectado sem intenção'

		WHEN GATA.NM_PROCESS_TYPE = 'Technical Advice'	AND GATA.NM_Reason_description = 'Transferred to HP'
		THEN 'Erro na tabulação'
			
		WHEN GATA.NM_PROCESS_TYPE = 'General Advice'	AND GATA.NM_Reason_description = 'Inform Service Location'
		THEN 'Informado Endereço ASC'

		WHEN GATA.NM_PROCESS_TYPE = 'General Advice'	AND GATA.NM_Reason_description = 'Unintended disconnected'
		THEN 'Desconectado sem intenção'

		WHEN GATA.NM_PROCESS_TYPE = 'General Advice'	AND GATA.NM_Reason_description in('Transferred to HP','Closed by MUSE','Transfer to Service Request')
		THEN 'Erro na tabulação'			

		WHEN GATA.NM_PROCESS_TYPE = 'General Advice'	AND GATA.NM_Reason_description in('Close with consultation','Transfer to other responsible','') and GATA.NM_Category1_description = 'Others' and GATA.NM_Category2_description in ('Ghost Call','Abandon call','Joke/ Misscall')
		THEN 'Ghost Call'
		
		WHEN GATA.NM_PROCESS_TYPE = 'General Advice'	AND GATA.NM_Reason_description in('Close with consultation','Transfer to other responsible','') and GATA.NM_Category1_description = 'Others' and GATA.NM_Category2_description = 'Call from other subsidiary CCC'
		THEN 'Ligação de outro grupo'
		
		WHEN GATA.NM_PROCESS_TYPE = 'General Advice'	AND GATA.NM_Reason_description in('Close with consultation','Transfer to other responsible','') and GATA.NM_Category1_description in ('Suggestion','Marketing/Sales')
		THEN 'Marketing/Sales/Sugestões'

		WHEN GATA.NM_PROCESS_TYPE = 'General Advice'	AND GATA.NM_Reason_description in('Close with consultation','Transfer to other responsible','') and GATA.NM_Category1_description in ('Service')
		THEN 'Posicionamento de OS'

		WHEN GATA.NM_PROCESS_TYPE = 'General Advice'	AND GATA.NM_Reason_description in('Close with consultation','Transfer to other responsible','') and GATA.NM_Category1_description in ('Others') and GATA.NM_Category2_description = 'Lost/Stolen Product'
		THEN 'Produto roubado'

		ELSE 'Outros'
	END																				AS NM_NEW_DRIVER

	,IIF(NM_Comments LIKE '%BRAND SHOP%','BRAND SHOP','-')							AS NM_BRAND_LOCAL
																				
	,ROW_NUMBER() OVER(PARTITION BY GATA.NM_TICKET ORDER BY Q.GRUPO, Q.AGENTE ASC)	AS NR_DUPLICADOS
FROM 
	DB_SAMSUNG.DBO.TB_SAMSUNG_SAP_GATA	AS GATA WITH (NOLOCK)
LEFT JOIN DB_SAMSUNG.DBO.ST_QUADRO		AS Q WITH(NOLOCK) 
	ON GATA.NM_CREATED_BY COLLATE LATIN1_GENERAL_CI_AI = Q.SAP_GCIC COLLATE LATIN1_GENERAL_CI_AI  AND GATA.DT_POSTING_DATE = Q.DATAREFERENCIA 
WHERE 
	GATA.DT_POSTING_DATE >= @DATA_INICIO
ORDER BY GATA.DT_POSTING_DATE
END;