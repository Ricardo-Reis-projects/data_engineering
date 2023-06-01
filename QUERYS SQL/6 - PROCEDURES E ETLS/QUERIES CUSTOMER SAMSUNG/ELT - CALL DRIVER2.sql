CREATE PROCEDURE dbo.PRC_SAMS_FAT_CALL_DRIVER AS
-- =============================================
-- AUTHOR: RICARDO REIS
-- CREATE DATE: 2019-11-07
-- USED TABLES: TB_SAMSUNG_SAP_GATA, ST_QUADRO
-- DESCRIPTION: Alimentação da tabela TB_FAT_SAMS_CALL_DRIVER_PBI que sera consumida pelo PowerBI MIS80192
-- UPDATE: <Atualizações realizadas (Data/RE/Descrição da atualização)>
-- =============================================
BEGIN

DECLARE @DATA_INICIO DATE 
SET @DATA_INICIO = DATEADD(DAY,-7,CONVERT(DATE,GETDATE(),103))

--DELETE FROM DB_SAMSUNG.dbo.TB_FAT_SAMS_CALL_DRIVER_PBI WHERE DT_POSTING_DATE >= @DATA_INICIO

--INSERT INTO DB_SAMSUNG.dbo.TB_FAT_SAMS_CALL_DRIVER_PBI
--(

--)
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
		WHEN GATA.NM_PROCESS_TYPE = 'Technical Advice'	
		THEN (CASE 
				WHEN GATA.NM_Reason_description = CD.NM_REASON_DESCRIPTION 
				THEN CD.NM_CALL_DRIVER 

				ELSE (CASE WHEN GATA.NM_PROCESS_TYPE = 'General Advice' AND GATA.NM_Reason_description <> '' AND GATA.NM_Reason_description  <> 'Close with consultation' AND GATA.NM_Reason_description  <> 'Transfer to other responsible'
					  THEN (CASE WHEN GATA.NM_Reason_description = CD.NM_REASON_DESCRIPTION 
								 THEN CD.NM_CALL_DRIVER 
								 ELSE  (CASE 
											WHEN GATA.NM_PROCESS_TYPE = 'General Advice' AND GATA.NM_Category1_description = 'Others'  
											THEN (CASE 
													WHEN GATA.NM_Category2_description = CD.NM_CATEGORY2_DESCRIPTION 
													THEN CD.NM_CALL_DRIVER 
													ELSE (CASE 
															WHEN GATA.NM_Category1_description = CD.NM_CATEGORY1_DESCRIPTION 
															THEN CD.NM_CALL_DRIVER 
															ELSE ''
														   END)
												  END)
										END)
							END)		
					  END)		
			  END)											
	ELSE 'Outros'
	END AS NM_NEW_DRIVER
	,CASE 
		WHEN NM_Comments LIKE '%BRAND SHOP%' THEN 'BRAND SHOP'
	END																				AS NM_BRAND_LOCAL
	,ROW_NUMBER() OVER(PARTITION BY GATA.NM_TICKET ORDER BY Q.GRUPO, Q.AGENTE ASC)	AS NR_DUPLICADOS
FROM 
	DB_SAMSUNG.DBO.TB_SAMSUNG_SAP_GATA	AS GATA WITH (NOLOCK)
LEFT JOIN DB_SAMSUNG.DBO.ST_QUADRO		AS Q WITH(NOLOCK) 
	ON GATA.NM_CREATED_BY COLLATE LATIN1_GENERAL_CI_AI = Q.SAP_GCIC COLLATE LATIN1_GENERAL_CI_AI  AND GATA.DT_POSTING_DATE = Q.DATAREFERENCIA 
LEFT JOIN (SELECT DISTINCT NM_Process_Type FROM TB_SAMSUNG_SAP_GATA WITH (NOLOCK))	AS PT 
	ON GATA.NM_Process_Type = PT.NM_Process_Type
LEFT JOIN DB_SAMSUNG.dbo.TB_SAMS_CALL_DRIVER AS CD
	ON PT.NM_Process_Type = CD.NM_Process_Type
WHERE 
	GATA.DT_POSTING_DATE >= @DATA_INICIO
ORDER BY GATA.DT_POSTING_DATE
END;

''


SELECT DISTINCT NM_PROCESS_TYPE FROM DB_SAMSUNG.DBO.TB_SAMSUNG_SAP_GATA
WHERE NM_PROCESS_TYPE ='General Advice'

Technical Advice