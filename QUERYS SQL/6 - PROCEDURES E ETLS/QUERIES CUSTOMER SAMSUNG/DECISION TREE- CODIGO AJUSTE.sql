IF OBJECT_ID('TEMPDB..#TMP_BASE') IS NOT NULL 
	DROP TABLE #TMP_BASE

SELECT  
	CONVERT(DATE, A.[Posting date], 103) AS [DT_DATA]
	,A.[Ticket]		AS 'TRANSACTION'
	,CASE WHEN CT.[ATUALIZADO] IS NULL THEN 'OUTROS' ELSE  CT.[ATUALIZADO] END AS [NM_PILAR]
	,Q.[GRUPO] NM_GRUPO
	,Q.[SUPERVISOR] NM_SUPERVISOR
	,Q.[AGENTE] NM_AGENTE
	--,[Comments                                                        ] 
	--,B.CODIGO
	,CASE WHEN B.CODIGO IS NOT NULL THEN 1 ELSE 0 END AS N_UTILIZOU
	,CASE WHEN B.CODIGO IS NULL THEN 1 ELSE 0 END AS N_NAOUTILIZOU
	,1 N_TOT
	,SUBSTRING(A.[Comments                                                        ], CHARINDEX(B.COD COLLATE Latin1_General_CI_AI, [Comments                                                        ]) - 1, 25) 'C_COD'
	,CASE WHEN B.CODIGO IS NULL THEN NULL ELSE ROW_NUMBER() OVER(PARTITION BY SUBSTRING(A.[Comments                                                        ], CHARINDEX(B.COD COLLATE Latin1_General_CI_AI, [Comments                                                        ]) - 1, 25) 
		ORDER BY SUBSTRING(A.[Comments                                                        ], CHARINDEX(B.COD COLLATE Latin1_General_CI_AI, [Comments                                                        ]) - 1, 25), A.[Ticket]) END N_CONT
	,CASE WHEN B.CODIGO IS NOT NULL AND ROW_NUMBER() OVER(PARTITION BY SUBSTRING(A.[Comments                                                        ], CHARINDEX(B.COD COLLATE Latin1_General_CI_AI, [Comments                                                        ]) - 1, 25) 
		ORDER BY A.[Ticket]) != 1 THEN 1 ELSE 0 END N_DUP
	,ROW_NUMBER() OVER(PARTITION BY A.[Ticket] ORDER BY Q.AGENTE) N_AG_DUP
INTO #TMP_BASE
FROM [DB_SAMSUNG].[dbo].[st_GATA] A WITH (NOLOCK)
LEFT JOIN [DB_SAMSUNG].[dbo].[TB_DP_CODIGOS_DECISION_TREE] B 
	ON  a.[Comments                                                        ] collate Latin1_General_CI_AI like b.CODIGO collate Latin1_General_CI_AI
LEFT JOIN [DB_SAMSUNG].[dbo].[St_Quadro]	Q	WITH(NOLOCK) 
	ON Q.SAP_GCIC collate Latin1_General_CI_AI = a.[Created by] collate Latin1_General_CI_AI AND A.[Posting date] = Q.DataReferencia
LEFT JOIN [DB_SAMSUNG].[dbo].[TB_SAMS_DP_CTSRR]	CT	WITH(NOLOCK) 
	ON Q.[GRUPO] COLLATE Latin1_General_CI_AI = CT.[GRUPO BASE] COLLATE Latin1_General_CI_AI 
WHERE [Process Type        ] LIKE '%TECHNICAL ADVICE%'
AND [Reason description                                ] IN ('UNINTENDED DISCONNECTED','CLOSE WITH CONSULTATION','TRANSFER TO SERVICE REQUEST','TRANSFER TO OTHER RESPONSIBLE','INFORM SERVICE LOCATION','CUSTOMER REQUEST')
AND CONVERT(DATE, [Posting date                  ], 103) >= '2019-01-01'
ORDER BY CASE WHEN B.CODIGO IS NOT NULL AND ROW_NUMBER() OVER(PARTITION BY SUBSTRING(A.[Comments                                                        ], CHARINDEX(B.COD COLLATE Latin1_General_CI_AI, [Comments                                                        ]) - 1, 25) 
		ORDER BY A.[Ticket]) != 1 THEN 1 ELSE 0 END DESC


SELECT [DT_DATA] 
	,NM_PILAR
	,NM_GRUPO
	,NM_SUPERVISOR
	,NM_AGENTE
	,SUM(N_UTILIZOU) N_UTILIZOU
	,SUM(N_NAOUTILIZOU) N_NAOUTILIZOU
	,SUM(N_TOT) N_TOT
	,SUM(N_DUP) AS N_DUP
--CRIAR TABELA AQUI	 
FROM #TMP_BASE
GROUP BY [DT_DATA]	,NM_PILAR	,NM_GRUPO	,NM_SUPERVISOR	,NM_AGENTE	

SELECT * 
--CRIAR TABELA AQUI
FROM #TMP_BASE
WHERE [DT_DATA] > EOMONTH(CONVERT(DATE, GETDATE(), 103), -3)