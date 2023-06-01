
DECLARE 
@subjectText nvarchar(100)='',
@getDateText nvarchar(50)='',
@getDate datetime=null,
@body nvarchar(MAX)='',
@subjectBody nvarchar(MAX)='',
@destination nvarchar(MAX)='',
@cols nvarchar(2)='',
@messageBodyRow1 nvarchar(max)= '',
@messageBodyRow2 nvarchar(max)= '',
@messageBodyRow3 nvarchar(max)= ''

-- Assunto do Email
SET @subjectText = 'Carga Base NBA - Oi Retenção Fixo e Velox'
-- Titulo do Corpo do Email
SET @subjectBody = 'Report Carga Base NBA: Operação Oi Retenção Fixo e Velox'
-- Mensagem do Corpo do email - LINHA 1
SET @messageBodyRow1 = 'Conclusão da Carga: '
-- Mensagem do Corpo do email - LINHA 2 
SET @messageBodyRow2 = ''
-- Mensagem do Corpo do email - LINHA 3
SET @messageBodyRow3 = 'DataBase: DB_OUTROS | Tabela: TB_NBA_OI_ILHA_UNIFICADO'
-- Quantidade de colunas 
SET @cols = 3
SET @getDate = getdate()
SET @getDateText = FORMAT(@getDate,'D','pt-BR') + ' as ' + FORMAT(@getDate,'HH:mm')
--SET @destination = 'eduardo.rodrigues@atento.com; tais.goncalves@atento.com; alberto.filho@atento.com; Mayara.Oliveira2@atento.com; Robson.Jesus@atento.com; Karen.Jesus@atento.com; Kaique.Hauman@atento.com; Marcelo.Virgens@atento.com; Walace.Amaral@ATENTO.com; Gustavo.Lourenco@atento.com; Darcio.Correa@atento.com'
SET @destination = 'ricardo.reis@atento.com'


-----------------------------------------------------------
------------- CORPO EMAIL ------------------------------
-----------------------------------------------------------
SET @body = 
'
<!DOCTYPE html">
<html>
<head>

<title>Banner</title>

<link rel="stylesheet" type="type/css" href="style3.css"/>

	<style>

		body {
			font-family: "Segoe UI";
			text-align:center;
     		border-color: #bfbfbf;
			padding:1px;
			background-color: #F2F2F2;
		  
	  }
		
	  div.imagem1{
    		top: 1;	
     	    position:relative;
      		text-align:center;
		}

	  div.titulo{
      		font-size: 20px;
      		color: #404040;
			text-align:center;
	}
      
		div.mensagem{
    		position:relative;				
  		    padding-left:10%;
			padding-right:10%;
			width:70%;
			font-size: 15px;
			color: #404040;
			text-align:center;
			align:center;
		}
          
      
      table{
			width: 70%;	
			border: 1px solid;
			
   }
     thead{
      		background-color:gray;
      		color:black;
      }

      div.finalzinho{
      		position:relatiive;
      		text-align:center;
       		align:middle;
      		align:center;
			text-align:center;
	  }
      
     span.textend{
      		top:1;
      		color: #404040;
			font-size:12px;
      }
      
      div.imagem2{
    	  	position:relative;
			text-align:center;
      		align:middle;
      		align:center;
			width: 200px;
           	height: 30px;
      		bottom:1;
      }
    
      img.logodti {
      		position: relative;
      		bottom:1;
      		align:middle;
      		align:center;
     		
      }   
      
		div.rodape{
			position: relative;
			bottom: 1;
      		padding-bottom:10px;;
			font-size: 10px;
			text-align:center;	
			color: #a6a6a6;
		}

</style>
  </head>
<body>
<div class="bigbox"
	<div class="imagem1">
         <img class="cabecalho"
          	 	alt="Performance Management Center | Data Office Structure & Tools" 
             	src="\\brsbesrv960\publico\HTML_SCRIPT\IMAGES\banner.png"
             	style="display: block;
            	height="200" border="0">
    </div>
    <div class="titulo">
		<p>
             <strong> '+ @subjectBody +'</strong>
		</p>
	</div>	
	<div class="mensagem">
		<p>
		'+ @messageBodyRow1 +' '+ @getDateText +'<br />
		'+ @messageBodyRow2 + '<br />
		<strong>'+ @messageBodyRow3 + '</strong><br />
		</p><br />'


-- TITULO DA TABELA ( INCLUIR <TH>TITULO DA COLUNA<TH> NA MESMA QUANTIDADE DAS COLUNAS DA CONSULTA )

+ '<table>'
+ '<thead>'
+ '<tr><th>DATA<th>DIA<th>REGISTROS</tr>'
+ '</thead>'
-- CONVERSAO PARA XML
                                           
+ '<tbody nth-child(even) bgcolor="white">'                                        
+ CAST( (

				  SELECT 
					
					 DATA_CRIACAO					AS [td]
					,DP.ST_DIA_DA_SEMANA_ABREV		AS [td]
					,COUNT(*)						AS [td]
  

  FROM [DB_OUTROS].[dbo].[TB_NBA_OI_ILHA_UNIFICADO] AS NBA

  LEFT JOIN [DB_DEPARA].[dbo].[TB_D_DATA] AS DP
			ON NBA.DATA_CRIACAO = DP.DT_DATA
  
  WHERE DATA_CRIACAO BETWEEN DATEADD(DAY,-DATEPART(DAY,GETDATE()),GETDATE()) AND GETDATE()

  GROUP BY DATA_CRIACAO, DP.ST_DIA_DA_SEMANA_ABREV

  ORDER BY DATA_CRIACAO


FOR XML RAW('tr'), ELEMENTS 

) AS NVARCHAR(MAX))

-- RODAPE DA TABELA


+ '</tbody>'
+ '</table>


      </div>                   
      <div class="finalzinho">
			<br />
			<br />
			<br />
           <span class="textend">Atento Brasil S/A | Vice Presidência de Tecnologia, Infraestrutura e PMC</span>  
    		
		<div class="imagem2">
		         <img class="logodti"
		 			alt="Data Infraestructure Team" 
			 		src="\\brsbesrv960\publico\HTML_SCRIPT\IMAGES\1000.png" 
                   >
    	</div>
      </div>
    <div class="rodape">
		Esta mensagem, incluindo seus anexos, pode conter informacoes privilegiadas e/ou de carater confidencial, nao podendo ser retransmitida sem autorizacao do remetente. Se voce nao e o destinatario ou pessoa autorizada a recebe-la, informamos que o seu uso, divulgacao, copia ou arquivamento sao proibidos. Portanto, se você recebeu esta mensagem por engano, por favor, nos informe respondendo imediatamente a este e-mail e em seguida apague-a.
	</div>

</div>

</body>
</html>



'


SET @body = @body

--------------------------------------------------------------------------------------------------
--------------------------------------- ENVIO DO EMAIL -------------------------------------------
--------------------------------------------------------------------------------------------------

EXEC msdb.dbo.sp_send_dbmail ----procedure que envia os emails
  @body = @body ----corpo do email, passando variavel acima definida
, @recipients = @destination ----destinatario(s) do email
, @subject = @subjectText--— assunto do email
, @profile_name = 'Notificacao Relatorio' ----nome do profile que ira disparar o email
, @body_format = 'HTML'; ----importante informar o formato do email, nesse caso HTML;