IF OBJECT_ID('TEMPDB..#TEMP_PROGRAMA_SKILL') IS NOT NULL
	BEGIN
		DROP TABLE #TEMP_PROGRAMA_SKILL
	END;
GO

SELECT 
	ROW_NUMBER() OVER(PARTITION BY [SKILL_CODIGO] ORDER BY SKILL_HIERARQUIA_ID DESC, OPERACAO_ID DESC) AS NR_ORDEM
    ,[SKILL_ID]									AS NR_SKILL_ID
    ,[SKILL_CODIGO]								AS NM_SKILL_CODIGO
    ,[SKILL_NOME]								AS NM_SKILL_NOME
    ,[SKILL_SITE]								AS NM_SKILL_SITE
    ,[SKILL_DAC]								AS NR_SKILL_DAC
    ,[DAC_SITE_NOME]							AS NM_DAC_SITE_NOME
    ,[DAC_ATIVO]								AS NM_DAC_ATIVO
    ,[DAC_CRIADO_EM]							AS DT_DAC_CRIADO_EM
    ,[PILAR_NOME]								AS NM_PILAR_NOME
    ,[OPERACAO_NOME]							AS NM_OPERACAO_NOME
    ,[CELULA_NOME]								AS NM_CELULA_NOME
    ,[SEGMENTO_NOME]							AS NM_SEGMENTO_NOME
    ,[PROGRAMA_NOME]							AS NM_PROGRAMA_NOME
    ,[PROGRAMA_VIGENCIA_INICIO]					AS DT_PROGRAMA_VIGENCIA_INICIO
    ,[PROGRAMA_VIGENCIA_FIM]					AS DT_PROGRAMA_VIGENCIA_FIM
    ,[PROGRAMA_DIRETORIA_EXEC_BI_NOME]			AS NM_PROGRAMA_DIRETORIA_EXEC_BI_NOME	
    ,[PROGRAMA_DAC_ID]							AS NR_PROGRAMA_DAC_ID
    ,[PROGRAMA_DAC_NOME]						AS NM_PROGRAMA_DAC_NOME
    ,[PROGRAMA_ATIVO]							AS NM_PROGRAMA_ATIVO
    ,[ORGANIZACAO_NOME]							AS NM_ORGANIZACAO_NOME
    ,[ORGANIZACAO_WFM]							AS NM_ORGANIZACAO_WFM
    ,[ORGANIZACAO_CRIADO_EM]					AS DT_ORGANIZACAO_CRIADO_EM
    ,[ORGANIZACAO_ATIVO]						AS NM_ORGANIZACAO_ATIVO
	INTO DBO.#TEMP_PROGRAMA_SKILL
FROM
	[DB_REP_ADM].[DBO].[VW_PROGRAMA_SKILL]
WHERE 
	[DIRETORIA_NOME] LIKE '%SAMS%'
  
GO

SELECT 
	 CMS.[Data]						AS DT_DATA						
    ,CMS.[Skill]					AS NR_Skill
	,ADM.[NM_SKILL_NOME]               AS NM_SKILL_NOME
    ,ADM.[NM_PILAR_NOME]               AS NM_PILAR_NOME
    ,ADM.[NM_OPERACAO_NOME]            AS NM_OPERACAO_NOME
    ,ADM.[NM_CELULA_NOME]              AS NM_CELULA_NOME
    ,ADM.[NM_SEGMENTO_NOME]            AS NM_SEGMENTO_NOME
    ,ADM.[NM_PROGRAMA_NOME]            AS NM_PROGRAMA_NOME
    ,CMS.[Horario]					AS NR_Horario
    ,CMS.[Tempo em Servico (Seg)]	AS NR_Tempo_em_Servico_Seg
    ,CMS.[Tempo Livre (Seg)]		AS NR_Tempo_Livre_Seg
    ,CMS.[Tempo Outros (Seg)]		AS NR_Tempo_Outros_Seg
    ,CMS.[Aux1 (Seg)]				AS NR_Aux1_Seg
    ,CMS.[Aux2 (Seg)]				AS NR_Aux2_Seg
    ,CMS.[% de Ocupacao]			AS VL_PORCETUAL_Ocupacao
    ,CMS.[Tempo Pausa (Seg)]		AS NR_Tempo_Pausa_Seg
    ,CMS.[Ativo Indisponivel (Seg)]	AS NR_Ativo_Indisponivel_Seg
    ,CMS.[Lanche (Seg)]				AS NR_Lanche_Seg
    ,CMS.[Desanso (Seg)]			AS NR_Desanso_Seg
    ,CMS.[Ambulatorio (Seg)]		AS NR_Ambulatorio_Seg
    ,CMS.[Defeito (Seg)]			AS NR_Defeito_Seg
    ,CMS.[Backoffice (Seg)]			AS NR_Backoffice_Seg
    ,CMS.[Treinamento (Seg)]		AS NR_Treinamento_Seg
    ,CMS.[Feedback (Seg)]			AS NR_Feedback_Seg
    ,CMS.[Particular (Seg)]			AS NR_Particular_Seg
    ,CMS.[Reuniao (Seg)]			AS NR_Reuniao_Seg
    ,CMS.[Pas Logadas]				AS VL_Pas_Logadas
    ,CMS.[PAs Providas]				AS VL_PAs_Providas
  FROM [DB_REP_CMS].[dbo].[10_155_0_93_SAMSUNG_DESEMP_SERV_INTERV_GR_DIV_MIS_02_HORARIA] AS CMS
 LEFT JOIN  DBO.#TEMP_PROGRAMA_SKILL AS ADM
	ON CMS.[SKILL] = ADM.[NM_SKILL_CODIGO]
WHERE 
	ADM.NR_ORDEM = 1
	AND CONVERT(DATE, CMS.[DATA], 103) >= DATEADD(D, -10, CONVERT(DATE, GETDATE(), 103))