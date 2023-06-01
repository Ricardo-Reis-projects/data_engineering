/****** Script for SelectTopNRows command from SSMS  ******/

INSERT INTO [DB_SAMSUNG].[dbo].[SAMS_ODS_SERVICE_FOLLOW]
	(
	NR_NO
	,NM_SERVICE_ORDER
	,DT_POSTING_DATE
	,NM_DETAIL_TYPE
	,NM_EXCHANGE_TYPE
	,NM_STATUS
	,NM_STATUS2
	,NM_MODEL_CODE
	,NM_MODEL_CATEGORY
	,NM_SERIAL_NUMBER
	,NM_ORIGINTRANSACTION
	,NM_CLAIM_TYPE
	,NM_CLAIM_TYPE_DESC
	,NM_DETAIL_TYPE_2
	,NM_DETAIL_TYPE_2_DESC
	,NM_ASC_CODE
	,NM_ASC_NAME
	,NM_ASC_REGION
	,NM_ASC_CITY
	,NM_ASC_STATUS
	,NM_CONSUMER_NAME
	,NM_CONSUMER_CPF
	,NM_CONSUMER_TEL
	,NM_CONSUMER_CEL
	,NM_E_MAIL
	,NM_CONSUMER_ADDR_
	,NM_CONSUMER_REGION
	,NM_CONSUMER_CITY
	,NM_CONSUMER_DISTR_
	,NM_CONSUMER_POST_CODE
	,NM_CONTACT_PERMISSION
	,NM_GRMS_NUMBER
	,NM_GRMS_CREATE_DATE
	,NM_GRMS_SUBMIT_DATE
	,NM_GRMS_APPROVAL_DATE
	,NM_GRMS_APPROVAL_STATUS
	,NM_REASON_CODE
	,NM_SUB_REASON_CODE
	,NM_EXCEPTION_CODE
	,NM_EXCEPTION_REASON
	,NM_EXCEPTION_REASON2
	,NM_EXCEPTION_REASON3
	,NM_EXCHANGE_S_O
	,NM_EXCHANGE_S_O_DATE
	,NM_EXCHANGE_DELIVERY
	,NM_EXCHANGE_DELIV_DATE
	,NM_EXCHANGE_G_I_DOC_
	,NM_EXCHANGE_G_I_DATE
	,NM_EXCHANGE_MODEL
	,NM_ORIG_PUR_AMOUNT
	,NM_REFUND_FI_DOC
	,NM_REFUND_STATUS
	,NM_REFUND_STATUS_DESCR_
	,NM_REFUND_DATE
	,NM_REFUND_AMOUNT
	,NM_COMPENSATION_AMOUNT
	,NM_PAYMENT_METHOD
	,NM_BANK_CODE
	,NM_AGENCY_CODE
	,NM_AGENCY_DIGIT
	,NM_BANK_ACCOUNT
	,NM_COURT_ID
	,NM_SALES_STORAGE_LOC
	,NM_REASON
	,NM_REASON_DESC
	,NM_CREATED_BY
	,NM_WARRANTY
	,NM_SERVICE_TYPE
	,NM_AGREEMENT_PENDING
	,NM_SUBMIT_PENDING
	,NM_GRMS_PENDING
	,NM_TAT_AP
	,NM_TAT_SP
	,NM_TAT_GP
	,NM_ID
	,NM_GROUP
	,NM_SAW_CATEGORY
	,DT_SAW_DATE
	,DT_SAW_APPROVED_DATE
	,DT_DATA_BASE
	,DT_DATA_INCLUSAO
	)
SELECT 
	TRY_CONVERT(DECIMAL,[No#])
	,[Service Order]
	,TRY_CONVERT(DATE,[Posting Date],103)
	,[Detail Type]
	,[Exchange Type]
	,[Status]
	,[Status2]
	,[Model Code]
	,[Model Category]
	,[Serial Number]
	,[OriginTransaction]
	,[Claim Type]
	,[Claim Type Desc]
	,[Detail Type 2]
	,[Detail Type 2 Desc]
	,[ASC Code]
	,[ASC Name]
	,[ASC Region]
	,[ASC City]
	,[ASC Status]
	,[Consumer Name]
	,[Consumer CPF]
	,[Consumer Tel]
	,[Consumer Cel]
	,[E-mail]
	,[Consumer Addr#]
	,[Consumer Region]
	,[Consumer City]
	,[Consumer Distr#]
	,[Consumer Post#Code]
	,[Contact Permission]
	,[GRMS Number]
	,[GRMS Create Date]
	,[GRMS Submit Date]
	,[GRMS Approval Date]
	,[GRMS Approval Status]
	,[Reason Code]
	,[Sub Reason Code]
	,[Exception Code]
	,[Exception Reason]
	,[Exception Reason2]
	,[Exception Reason3]
	,[Exchange S O]
	,[Exchange S O Date]
	,[Exchange Delivery]
	,[Exchange Deliv#Date]
	,[Exchange G I Doc#]
	,[Exchange G I Date]
	,[Exchange Model]
	,[Orig#Pur#Amount]
	,[Refund FI Doc]
	,[Refund Status]
	,[Refund Status Descr#]
	,[Refund Date]
	,[Refund Amount]
	,[Compensation Amount]
	,[Payment Method]
	,[Bank Code]
	,[Agency Code]
	,[Agency Digit]
	,[Bank Account]
	,[Court ID]
	,[Sales Storage Loc]
	,[Reason]
	,[Reason Desc]
	,[Created By]
	,[Warranty]
	,[Service Type]
	,[Agreement Pending]
	,[Submit Pending]
	,[GRMS Pending]
	,[TAT AP]
	,[TAT SP]
	,[TAT GP]
	,[Id]
	,[Group]
	,[SAW Category]
	,TRY_CONVERT(DATE,[SAW Date],103)
	,TRY_CONVERT(DATE,[SAW Approved Date],103)
	,TRY_CONVERT(DATE,[DATA_BASE],103)
	,[DT_INCLUSAO]
FROM [DB_OUTROS].[dbo].[TB_SAMS_TELAS_SERVICE_FOLLOW_SAW]
WHERE [DATA_BASE] >='2019-09-28'