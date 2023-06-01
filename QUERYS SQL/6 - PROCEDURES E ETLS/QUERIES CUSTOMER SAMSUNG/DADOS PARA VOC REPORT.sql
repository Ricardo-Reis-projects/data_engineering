IF OBJECT_ID('TEMPDB..#TMP_DATA_VOC') IS NOT NULL 
	DROP TABLE #TMP_DATA_VOC
IF OBJECT_ID('TEMPDB..#TMP_VOC_CIP') IS NOT NULL 
	DROP TABLE #TMP_VOC_CIP
IF OBJECT_ID('TEMPDB..#TMP_VOC_AUD') IS NOT NULL 
	DROP TABLE #TMP_VOC_AUD
IF OBJECT_ID('TEMPDB..#TMP_VOC_COURT') IS NOT NULL 
	DROP TABLE #TMP_VOC_COURT
IF OBJECT_ID('TEMPDB..#TMP_VOC_ACORDOS') IS NOT NULL 
	DROP TABLE #TMP_VOC_ACORDOS


SELECT [NM_REF_TICKET]
	,[DT_POSTING_DATE] as [DATA VOC]
	,DT_COMPLETE_DATE AS COMPLETE_DATE_VOC
	,[NM_SERIAL_NO]
INTO #TMP_DATA_VOC
FROM [DB_SAMSUNG].[dbo].[TB_SAMS_VOCS_REPORT]
where [NM_REF_TICKET] = [NM_TICKET_NO]

SELECT 
	ROW_NUMBER() OVER(PARTITION BY A.[NM_REF_TICKET] ORDER BY A.[DT_POSTING_DATE] DESC) POSICAO
	,A.[NM_REF_TICKET]
      ,A.[NM_CLAIM_TYPE_DESC_1]
      ,A.[NM_TICKET_NO]
      ,A.[DT_POSTING_DATE]
	  ,[DATA VOC]
	  ,DATEDIFF(D, A.[DT_POSTING_DATE], B.[DATA VOC]) AS TAT
      ,A.[NM_PROCESS_TYPE_DESC]
      ,A.[NM_DETAIL_TYPE_2]
      ,A.[NM_CLAIM_TYPE_DESC_2]
       ,A.[NM_SERIAL_NO]
INTO #TMP_VOC_CIP
FROM [DB_SAMSUNG].[dbo].[TB_SAMS_VOCS_REPORT] A
LEFT JOIN  #TMP_DATA_VOC B
ON A.[NM_REF_TICKET] = B.[NM_REF_TICKET]
WHERE A.[NM_REF_TICKET] != A.[NM_TICKET_NO]
	AND A.NM_CLAIM_TYPE_DESC_2 = 'Procon (CIP)'  
	AND DATEDIFF(D, A.[DT_POSTING_DATE], B.[DATA VOC]) >=0
	AND A.[NM_SERIAL_NO] = B.[NM_SERIAL_NO]
ORDER BY A.[NM_REF_TICKET]


SELECT 
	ROW_NUMBER() OVER(PARTITION BY A.[NM_REF_TICKET] ORDER BY A.[DT_POSTING_DATE] DESC) POSICAO
	,A.[NM_REF_TICKET]
      ,A.[NM_CLAIM_TYPE_DESC_1]
      ,A.[NM_TICKET_NO]
      ,A.[DT_POSTING_DATE]
	  ,[DATA VOC]
	  ,DATEDIFF(D, A.[DT_POSTING_DATE], B.[DATA VOC]) AS TAT
      ,A.[NM_PROCESS_TYPE_DESC]
      ,A.[NM_DETAIL_TYPE_2]
      ,A.[NM_CLAIM_TYPE_DESC_2]
       ,A.[NM_SERIAL_NO]
INTO #TMP_VOC_AUD
FROM [DB_SAMSUNG].[dbo].[TB_SAMS_VOCS_REPORT] A
LEFT JOIN  #TMP_DATA_VOC B
ON A.[NM_REF_TICKET] = B.[NM_REF_TICKET]
WHERE A.[NM_REF_TICKET] != A.[NM_TICKET_NO]
	AND A.NM_CLAIM_TYPE_DESC_2 != 'Procon (CIP)'  AND A.NM_CLAIM_TYPE_DESC_2 LIKE 'Procon%'
	AND DATEDIFF(D, A.[DT_POSTING_DATE], B.[DATA VOC]) >=0
	AND A.[NM_SERIAL_NO] = B.[NM_SERIAL_NO]
ORDER BY A.[NM_REF_TICKET]

SELECT 
	ROW_NUMBER() OVER(PARTITION BY A.[NM_REF_TICKET] ORDER BY A.[DT_POSTING_DATE] DESC) POSICAO
	,A.[NM_REF_TICKET]
      ,A.[NM_CLAIM_TYPE_DESC_1]
      ,A.[NM_TICKET_NO]
      ,A.[DT_POSTING_DATE]
	  ,[DATA VOC]
	  ,DATEDIFF(D, A.[DT_POSTING_DATE], B.[DATA VOC]) AS TAT
      ,A.[NM_PROCESS_TYPE_DESC]
      ,A.[NM_DETAIL_TYPE_2]
      ,A.[NM_CLAIM_TYPE_DESC_2]
       ,A.[NM_SERIAL_NO]
INTO #TMP_VOC_COURT
FROM [DB_SAMSUNG].[dbo].[TB_SAMS_VOCS_REPORT] A
LEFT JOIN  #TMP_DATA_VOC B
ON A.[NM_REF_TICKET] = B.[NM_REF_TICKET]
WHERE A.[NM_REF_TICKET] != A.[NM_TICKET_NO]
	AND A.NM_CLAIM_TYPE_DESC_2 LIKE 'COURT%'
	AND DATEDIFF(D, A.[DT_POSTING_DATE], B.[DATA VOC]) >=0
	AND A.[NM_SERIAL_NO] = B.[NM_SERIAL_NO]
ORDER BY A.[NM_REF_TICKET]

SELECT 
	ROW_NUMBER() OVER(PARTITION BY A.[NM_REF_TICKET] ORDER BY B.[COMPLETE_DATE_VOC] DESC) POSICAO
	,A.[NM_REF_TICKET]
      ,A.[NM_CLAIM_TYPE_DESC_1]
      ,A.[NM_TICKET_NO]
      ,A.DT_COMPLETE_DATE
	  ,[DATA VOC]
	  ,DATEDIFF(D, A.[DT_POSTING_DATE], B.[COMPLETE_DATE_VOC]) AS TAT
      ,A.[NM_PROCESS_TYPE_DESC]
      ,A.[NM_DETAIL_TYPE_2]
      ,A.[NM_CLAIM_TYPE_DESC_2]
       ,A.[NM_SERIAL_NO]
INTO #TMP_VOC_ACORDOS
FROM [DB_SAMSUNG].[dbo].[TB_SAMS_VOCS_REPORT] A
LEFT JOIN  #TMP_DATA_VOC B
ON A.[NM_REF_TICKET] = B.[NM_REF_TICKET]
WHERE A.[NM_REF_TICKET] != A.[NM_TICKET_NO]
	AND NM_DETAIL_TYPE_2 IN ('Exchange', 'Compensation', 'Refund')
	AND DATEDIFF(D, A.DT_COMPLETE_DATE, B.[COMPLETE_DATE_VOC]) >=0
	AND A.[NM_SERIAL_NO] = B.[NM_SERIAL_NO]
ORDER BY A.[NM_REF_TICKET]

