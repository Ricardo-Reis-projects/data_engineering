USE [DB_CONSUMO]
GO

/****** Object:  View [dbo].[VW_SAMS_VOC_REPORT_ACORDOS_REPORT03]    Script Date: 12/12/2019 17:51:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[VW_SAMS_VOC_REPORT_ACORDOS_REPORT03]
AS

SELECT 
	A.[Ref# Ticket]
	,A.[Claim Type]
	,A.[Claim Type Desc]
	,A.[Ticket No#]
	,A.[Posting Date]
	,A.[Process Type]
	,A.[Process Type Desc]
	,A.[Detail Type]
	,A.[Detail Type2]
	,A.[Service Type]
	,A.[Status]
	,A.[Status Desc]
	,A.[Claim Type3]
	,A.[Claim Type Desc4]
	,A.[Solution]
	,A.[Solution Desc]
	,A.[Sub Solution]
	,A.[Sub Solution Desc]
	,A.[Complete Date]
	,A.[Serial No]
	,A.[ASC Code]
	,A.[ASC Name]
	,A.[Link Type]
FROM (
	SELECT
		ROW_NUMBER() OVER(PARTITION BY R.[Ref# Ticket] ORDER BY CONVERT(DATE, R.[Posting Date], 103) DESC) ORDEM
		,R.[Ref# Ticket]
		,R.[Claim Type]
		,R.[Claim Type Desc]
		,R.[Ticket No#]
		,R.[Posting Date]
		,R.[Process Type]
		,R.[Process Type Desc]
		,R.[Detail Type]
		,R.[Detail Type2]
		,R.[Service Type]
		,R.[Status]
		,R.[Status Desc]
		,R.[Claim Type3]
		,R.[Claim Type Desc4]
		,R.[Solution]
		,R.[Solution Desc]
		,R.[Sub Solution]
		,R.[Sub Solution Desc]
		,R.[Complete Date]
		,R.[Serial No]
		,R.[ASC Code]
		,R.[ASC Name]
		,R.[Link Type]
	FROM [DB_OUTROS].[dbo].[TB_SAMS_SAP_VOC_REPORT03] R

	LEFT JOIN [DB_OUTROS].[dbo].[TB_SAMS_VOC_REPORT_CONSOLIDADO] V WITH (NOLOCK)
	ON	R.[Ticket No#] = REPLACE(V.[Transaction ID], ' ', '')
	WHERE [Detail Type2] IN ('Exchange', 'Compensation', 'Refund')
	) A
WHERE ORDEM = 1


GO


