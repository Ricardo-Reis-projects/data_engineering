insert into DB_SAMSUNG.dbo.TB_SAMSUNG_SAP_GATA
(
NM_Ticket
,NM_Preceding_document
,NM_Company_ID
,NM_Country
,NM_Process_Type
,NM_Status
,NM_Status_Desc
,NM_Reason
,NM_Reason_description
,NM_Comments
,NM_Data_Origin
,NM_ASC_Job_No
,NM_Dealer_Job_No
,NM_Det_type
,NM_Model
,NM_Version
,NM_Category_ID
,NM_Serial_No
,NM_IMEI
,DT_Posting_date
,NM_Channel_Desc
,NM_Category1
,NM_Category1_description
,NM_Category2
,NM_Category2_description
,NM_Category3
,NM_Category3_description
,NM_Consumer
,NM_Customer
,NM_Customer_Name
,NM_CP_Customer_Name
,NM_Created_by
,DT_Callback_date
,HR_Callback_Time
,DT_Change_date
,HR_Change_Time
,NM_Employee_responsible_ID
,NM_Employee_responsible_Name
,NM_SO_no
,NM_Customer_Comment
,DT_LTERM
,DT_PTERM
,DT_OTERM
,DT_Purchase_date
,DT_Unit_Received_date
,NM_Carrier
,DT_First_Visit_date
,DT_Last_Visit_date
,NM_Resolution
,NM_Resolution_description
,NM_Wty_Bill_No
,NM_Consumer_Type
,NM_CP_Custome
,NM_In_Out_Wty
,NM_In_Out
,DT_Appointment_date
,DT_ASC_Appointment_Date
,DT_ASC_Assign_Date
,HR_ASC_Assign_Time
,DT_ENG_Assign_Date
,HR_ENG_Assign_Time
,DT_ASC_Acknowledge_Date
,HR_ASC_Acknowledge_Time
,DT_Complete_date
,HR_RC_time
,DT_Delivery_date
,HR_GD_time
,NM_Aging
,NM_Aging_peri
,NM_Place_of_Purchase
,NM_Service_Type
,NM_Sub_SVC_Type
,NM_Smart_Form
,NM_Self_Upgrade
,NM_Self_Diagnosis
,NM_Attac
,DT_Customer_Requested_Date
,DT_ASC_1st_Appointment_Date
,HR_ASC_1st_Appointment_Time
,DT_DATA_INCLUSAO
,DT_Transaction_Start_Date
,HR_Transaction_Start_Time
)

SELECT
LTRIM(RTRIM([Ticket              ]))                                                                                 as   [Ticket]    
,LTRIM(RTRIM([Preceding document  ]))                     as   [Preceding document]
,LTRIM(RTRIM([Company ID]))                        as   [Company ID]
,LTRIM(RTRIM([Country  ]))                        as   [Country]
,LTRIM(RTRIM([Process Type        ]))                     as   [Process Type]
,LTRIM(RTRIM([Status    ]))                        as   [Status]
,LTRIM(RTRIM([Status Desc                   ]))                                                                      as   [Status Desc]                   
,LTRIM(RTRIM([Reason     ]))                       as   [Reason]
,LTRIM(RTRIM([Reason description                                ]))              as   [Reason description]            
,LTRIM(RTRIM([Comments                                                        ]))          as   [Comments]                  
,LTRIM(RTRIM([Data Origin]))                       as   [Data Origin]
,LTRIM(RTRIM([ASC Job No                    ]))                                                                      as   [ASC Job No]         
,LTRIM(RTRIM([Dealer Job No                 ]))                   as   [Dealer Job No]      
,LTRIM(RTRIM([Det type                      ]))                   as   [Det type]           
,LTRIM(RTRIM([Model             ]))                      as   [Model]
,LTRIM(RTRIM([Version ]))                        as   [Version]
,LTRIM(RTRIM([Category ID                   ]))                   as   [Category ID]        
,LTRIM(RTRIM([Serial No           ]))                     as   [Serial No]          
,LTRIM(RTRIM([IMEI              ]))                      as   [IMEI]
,TRY_CONVERT(DATE, [Posting date                  ], 103)                             as   [Posting date]
,LTRIM(RTRIM([Channel Desc                                      ]))              as   [Channel Desc]    
,LTRIM(RTRIM([Category1    ]          ))              as   [Category1]  
,LTRIM(RTRIM([Category1 description         ]      ))              as   [Category1 description]  
,LTRIM(RTRIM([Category2    ]          ))              as   [Category2]  
,LTRIM(RTRIM([Category2 description         ]      ))              as   [Category2 description] 
,LTRIM(RTRIM([Category3    ]          ))              as   [Category3]   
,LTRIM(RTRIM([Category3 description         ]      ))              as   [Category3 description] 
,LTRIM(RTRIM([Consumer  ]           ))              as   [Consumer]   
,LTRIM(RTRIM([Customer  ]           ))              as   [Customer]   
,LTRIM(RTRIM([Customer Name                                               ]))           as   [Customer Name]
,LTRIM(RTRIM([CP Customer Name                                            ]))           as   [CP Customer Name]
,LTRIM(RTRIM([Created by  ]))                       as   [Created by]
,TRY_CONVERT(DATE, [Callback date                 ],103)                as   [Callback date]
,TRY_CONVERT(TIME(0), [Time ])                       as   [Time]  
,TRY_CONVERT(DATE, [Change date         ],103)                   as   [Change date]
,TRY_CONVERT(TIME(0), [Time      0])                     as   [Time0]
,LTRIM(RTRIM([Employee responsible ID       ]))                   as   [Employee responsible ID] 
,LTRIM(RTRIM([Employee responsible Name               ]))                as   [Employee responsible Name]         
,LTRIM(RTRIM([SO no     ]))                        as   [SO no]      
,LTRIM(RTRIM([Customer Comment]))                      as   [Customer Comment]    
,TRY_CONVERT(DATE,[LTERM                         ],103)                   as   [LTERM] 
,TRY_CONVERT(DATE,[PTERM                         ],103)                   as   [PTERM] 
,TRY_CONVERT(DATE,[OTERM                         ],103)                   as   [OTERM] 
,TRY_CONVERT(DATE, [Purchase date                 ],103)                as   [Purchase date]               
,TRY_CONVERT(DATE,[Unit Received date  ],103)                    as   [Unit Received date]   
,LTRIM(RTRIM([Carrier   ]))                        as   [Carrier]      
,TRY_CONVERT(DATE, [First Visit date    ], 103)                   as   [First Visit date] 
,TRY_CONVERT(DATE, [Last Visit date     ], 103)                   as   [Last Visit date] 
,LTRIM(RTRIM([Resolution   ]))                       as   [Resolution]     
,LTRIM(RTRIM([Resolution description        ]))                   as   [Resolution description] 
,LTRIM(RTRIM([Wty Bill No         ]))                     as   [Wty Bill No]   
,LTRIM(RTRIM([Consumer Type                           ]))                as   [Consumer Type]                     
,LTRIM(RTRIM([CP Custome]))                        as   [CP Custome]      
,LTRIM(RTRIM([In Out Wty]))                        as   [In Out Wty]      
,LTRIM(RTRIM([In Out]  ))                        as   [In Out]      
,TRY_CONVERT(DATE, [Appointment date              ], 103)                as   [Appointment date]        
,TRY_CONVERT(DATE, [ASC Appointment Date          ], 103)                as   [ASC Appointment Date]        
,TRY_CONVERT(DATE,[ASC Assign Date               ],103)                   as   [ASC Assign Date] 
,TRY_CONVERT(time(0), [Time    00])                       as   [Time00]     
,TRY_CONVERT(DATE,[ENG Assign Date               ],103)                   as   [ENG Assign Date] 
,TRY_CONVERT(time(0), [Time    1])                       as   [Time1]     
,TRY_CONVERT(DATE,[ASC Acknowledge Date          ],103)                   as   [ASC Acknowledge Date] 
,TRY_CONVERT(time(0), [Time    2])                       as   [Time2]     
,TRY_CONVERT(DATE, [Complete date                 ],103)                as   [Complete date]               
,TRY_CONVERT(time(0), [RC time ])                       as   [RC time]     
,TRY_CONVERT(DATE, [Delivery date                 ], 103)                as   [Delivery date]               
,TRY_CONVERT(time(0),[GD time ])                       as   [GD time]     
,LTRIM(RTRIM([Aging]))                        as   [Aging]      
,LTRIM(RTRIM([Aging peri]))                        as   [Aging peri]      
,LTRIM(RTRIM([Place of Purchase        ]))                    as   [Place of Purchase]  
,LTRIM(RTRIM([Service Type   ]))                      as   [Service Type]    
,LTRIM(RTRIM([Sub SVC Type   ]))                      as   [Sub SVC Type]    
,LTRIM(RTRIM([Smart Form]))                        as   [Smart Form]      
,LTRIM(RTRIM([Self-Upgrade                  ]))                   as   [Self-Upgrade] 
,LTRIM(RTRIM([Self-Diagnosis                ]))                   as   [Self-Diagnosis] 
,LTRIM(RTRIM([Attac               ]    ))                   as   [Attac]
,TRY_CONVERT(DATE,[Customer Requested Date       ],103)                   AS   [Customer Requested Date]
,TRY_CONVERT(DATE,[ASC 1st Appointment Date      ],103)                   AS   [ASC 1st Appointment Date]
,TRY_CONVERT(time(0),[Time    3]      )                   AS   [Time3]
,getdate()                                                                                                           AS   [DataInclusao]
,NULL
,NULL
FROM DB_OUTROS.dbo.TB_SAMS_SAP_ATR_GATA
WHERE CONVERT(DATE, [Posting date                  ], 103) BETWEEN '2019-01-01' AND  '2019-10-15'
