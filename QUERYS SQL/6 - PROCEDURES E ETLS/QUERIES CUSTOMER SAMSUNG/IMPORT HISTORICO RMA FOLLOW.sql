INSERT INTO [DB_SAMSUNG].[dbo].[TB_SAMSUMG_SAP_RMA_FOLLOW]
       (
       NM_COMPANY
       ,[NM_TICKET]
       ,[DT_POSTING_DATE]
       ,NM_SVC_STATUS
       ,NM_SVC_STATUS_DESC
       ,DT_RCV_REF_DATE
       ,NR_TAT
       ,NM_MODEL
       ,NM_SERIAL_NO
       ,NM_REGION
       ,NR_ASC_CODE
       ,NM_ASC_NAME
       ,NM_CONSUMER
       ,NM_FIRST_NAME
       ,NM_LAST_NAME
       ,NM_TEL_NO
       ,NM_UNIQUE_ID
       ,NM_COUNTRY
       ,NM_CITY
       ,NM_DISTRICT
       ,NM_STREET
       ,NM_POSTAL_CODE
       ,NM_HC_STATUS
       ,NM_HC_REMARK
       ,DT_HC_DATE 
       ,NM_HC_AGENT_ID
       ,NM_PREVIOUS_AGENT_BP      
       ,NM_PREVIOUS_STATUS
       ,NM_PREVIOUS_REMARK
       ,DT_PREVIOUS_DATE 
       ,NM_PREVIOUS_AGENT_ID
       ,NM_PREVIOUS_2_STATUS
       ,NM_PREVIOUS_2_REMARK
       ,DT_PREVIOUS_2_DATE 
       ,NM_PREVIOUS_2_AGENT_ID
       ,NM_PREVIOUS_3_STATUS
       ,NM_PREVIOUS_3_REMARK
       ,DT_PREVIOUS_3_DATE 
       ,NM_PREVIOUS_3_AGENT_ID
       ,NM_RESPONSAVEL
       ,DT_DATA_BASE
       ,DT_DATA_INCLUSAO
       )
       SELECT [Company]                                                   AS NM_COMPANY
               ,[Ticket No/]                                                    AS [NM_TICKET]
               ,CONVERT(DATE, [Posting Date], 103)          AS [DT_POSTING_DATE]
               ,[SVC Status]                                                    AS NM_SVC_STATUS
               ,[SVC Status Desc]                                  AS NM_SVC_STATUS_DESC
               ,CONVERT(DATE, [ASC Rcv Date], 103)          AS DT_RCV_REF_DATE
               ,CONVERT(INT, [TAT]      )                                 AS NR_TAT
               ,[Model]                                                         AS NM_MODEL
               ,[Serial No]                                                     AS NM_SERIAL_NO
               ,[Region]                                                        AS NM_REGION
               ,TRY_CONVERT(INT, [ASC Code])                       AS NR_ASC_CODE
               ,[ASC Name]                                                AS NM_ASC_NAME
               ,[Consumer]                                                AS NM_CONSUMER
               ,[First Name]                                                    AS NM_FIRST_NAME
               ,[Last Name]                                                     AS NM_LAST_NAME
               ,[Tel No/]                                                       AS NM_TEL_NO
               ,[Unique ID]                                                     AS NM_UNIQUE_ID
               ,[Country]                                                 AS NM_COUNTRY
               ,[City]                                                          AS NM_CITY
               ,[District]                                                AS NM_DISTRICT
               ,[Street]                                                        AS NM_STREET
               ,[Postal Code]                                             AS NM_POSTAL_CODE
               ,[HC Status]                                                     AS NM_HC_STATUS
               ,[HC Remark]                                                     AS NM_HC_REMARK
               ,TRY_CONVERT(DATE, [HC Date], 103)           AS DT_HC_DATE 
               ,[HC Agent ID]                                             AS NM_HC_AGENT_ID
               ,[HC Agent BP]                                             AS NM_PREVIOUS_AGENT_BP    
               ,[Previous Status]                                  AS NM_PREVIOUS_STATUS
               ,[Previous Remark]                                  AS NM_PREVIOUS_REMARK
               ,TRY_CONVERT(DATE, [Previous Date], 103)     AS DT_PREVIOUS_DATE 
               ,[Previous Agent]                                          AS NM_PREVIOUS_AGENT_ID
               ,[Previous Status2]                                        AS NM_PREVIOUS_2_STATUS
               ,[Previous Remark2]                                        AS NM_PREVIOUS_2_REMARK
               ,TRY_CONVERT(DATE, [Previous Date2], 103)    AS DT_PREVIOUS_2_DATE 
               ,[Previous Agent2]                                  AS NM_PREVIOUS_2_AGENT_ID
               ,[Previous Status3]                                        AS NM_PREVIOUS_3_STATUS
               ,[Previous Remark3]                                        AS NM_PREVIOUS_3_REMARK
               ,TRY_CONVERT(DATE, [Previous Date3], 103)    AS DT_PREVIOUS_3_DATE 
               ,[Previous Agent3]                                  AS NM_PREVIOUS_3_AGENT_ID
               ,[Responsavel]                                             AS NM_RESPONSAVEL
               ,CONVERT(DATE, [DT_BASE], 103)               AS DT_DATA_BASE
               ,GETDATE()                                                 AS DT_DATA_INCLUSAO
       --FROM [DB_SAMSUNG].[dbo].st_RMA_BASE
       FROM [DB_OUTROS].[dbo].[TB_SAMS_EXCEL_RMA_FOLLOW_BASE_OPERACAO]
