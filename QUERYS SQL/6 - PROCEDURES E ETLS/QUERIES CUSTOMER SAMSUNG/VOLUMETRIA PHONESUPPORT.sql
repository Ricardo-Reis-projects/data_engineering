SELECT C.[DT_DATA]
    ,C.[NR_SKILL]					-- RETIRAR
    ,C.[NM_SKILL_NOME]				-- RETIRAR
    ,C.[NM_PILAR_NOME]				-- RETIRAR
    ,C.[NM_OPERACAO_NOME]
    ,C.[NM_CELULA_NOME] 
    ,C.[NM_SEGMENTO_NOME]			-- RETIRAR
    ,C.[NM_PROGRAMA_NOME]			-- RETIRAR
    ,C.[NR_HORARIO]					-- RETIRAR
	,H.[DEPARA]
   
   --SOMAR
   
    ,C.[NR_CHAMS_PERMS]
    ,C.[NR_CHAMS_ATEND]
    ,C.[VL_NIVEL_AT]				-- RETIRAR
    ,C.[VL_FCL09_AT]				-- RETIRAR
    ,C.[VL_TMO_CMS]					-- RETIRAR
    ,C.[VL_TMO_SEG]					
    ,C.[VL_TME_CMS]					-- RETIRAR
    ,C.[VL_TME_SEG]					-- RETIRAR
    ,C.[NR_ATEND_0_A_A2]
    ,C.[NR_ATEND_A2_A_A3]
    ,C.[NR_ATEND_A3_A_A5]
    ,C.[NR_ATEND_MAIOR_A5]
    ,C.[NR_ABAN_0_A_A2]
    ,C.[NR_ABAN_MAIOR_A5]
    ,C.[NR_CHAMS_ABAND]
    ,C.[NR_TEMPO_DAC_SEG]
    ,C.[NR_TEMPO_POS_AT_SEG]
    ,C.[NR_TEMPO_TOCANDO_SEG]
    ,C.[NR_TEMPO_HOLD_SEG]
    ,C.[NR_TRANS_EXT]
    ,C.[NR_ATEND_MAIOR_A6]
    ,C.[NR_ABAN_MAIOR_A6]
    ,C.[NR_TOTAL_ATEND_ATE_A1]
    ,C.[NR_TOTAL_ATEND_ATE_A2]
    ,C.[NR_TOTAL_ATEND_ATE_A3]
    ,C.[NR_TOTAL_ATEND_ATE_A4]
    ,C.[NR_TOTAL_ATEND_ATE_A5]
    ,C.[NR_TOTAL_ATEND_ATE_A6]
    ,C.[NR_TOTAL_ABAND_ATE_A1]
    ,C.[NR_TOTAL_ABAND_ATE_A2]
    ,C.[NR_TOTAL_ABAND_ATE_A3]
    ,C.[NR_TOTAL_ABAND_ATE_A4]
    ,C.[NR_TOTAL_ABAND_ATE_A5]
    ,C.[NR_TOTAL_ABAND_ATE_A6]
    ,C.[NR_CHAM_FORA_DA_CENTRAL]				-- RETIRAR
    ,C.[VL_TEMPO_MEDIO_FORA_DA_CENTRAL_SEG]		-- RETIRAR
    ,C.[NR_TEMPO_DAC_FORA_DA_CENTRAL_SEG]		-- RETIRAR
    ,C.[NR_CHAMS_RAMAL_SAIDA]
    ,C.[VL_TEMPO_MEDIO_RAMAL_SAIDA_SEG]			-- RETIRAR
    ,C.[NR_TEMPO_RAMAL_SAIDA_SEG]				-- RETIRAR
    ,C.[NR_ANSTIME_SEG]							-- RETIRAR
    ,C.[NR_CHAMS_OCUP_FORCADO]					-- RETIRAR
    ,C.[NR_CHAMS_RVDAS_FILAS]					-- RETIRAR
    ,C.[NR_CHAMS_DESC_FORCADA]					-- RETIRAR
    ,C.[NR_FLUXO_SAIDA]							-- RETIRAR
    ,C.[NR_CHAM_CONF]							-- RETIRAR
    ,C.[NR_CHAM_ATEND_ACEITAVEL]				-- RETIRAR
    ,C.[NR_CHAM_ABAND_ACEITAVEL]				-- RETIRAR
    ,C.[NR_TEMPO_MAXIMO_DE_ESPERA]				-- RETIRAR
    ,C.[VL_TEMPO_MED_ABAN_SEG]					-- RETIRAR

    ,T.[NR_Tempo_em_Servico_Seg]
    ,T.[NR_Tempo_Livre_Seg]
    ,T.[NR_Tempo_Outros_Seg]
    ,T.[NR_Aux1_Seg]
    ,T.[NR_Aux2_Seg]
    ,T.[VL_PORCETUAL_Ocupacao]
    ,T.[NR_Tempo_Pausa_Seg]
    ,T.[NR_Ativo_Indisponivel_Seg]
    ,T.[NR_Lanche_Seg]
    ,T.[NR_Desanso_Seg]
    ,T.[NR_Ambulatorio_Seg]
    ,T.[NR_Defeito_Seg]
    ,T.[NR_Backoffice_Seg]
    ,T.[NR_Treinamento_Seg]
    ,T.[NR_Feedback_Seg]
    ,T.[NR_Particular_Seg]
    ,T.[NR_Reuniao_Seg]
    ,T.[VL_Pas_Logadas]
    ,T.[VL_PAs_Providas]
FROM [DB_SAMSUNG].[dbo].[TB_SAMS_CMS_DESEMP_SERV_INTERV_GR_DIV_MIS_01] C
LEFT JOIN [DB_SAMSUNG].[dbo].[TB_SAMS_CMS_DESEMP_SERV_INTERV_GR_DIV_MIS_02] T
	ON C.[DT_DATA] = T.[DT_DATA] AND C.[NR_SKILL] = T.[NR_SKILL] AND C.[NR_HORARIO] = T.[NR_HORARIO]
LEFT JOIN [DB_DEPARA].[dbo].[TB_D_HORARIO] H
	ON C.[NR_HORARIO] = H.[Horario]
WHERE C.[NM_OPERACAO_NOME] = 'PHONE SUPORTE'
	AND C.[DT_DATA] = '2019-11-19'


	 
	 

