ALTER PROC [dbo].[PRC_SAMS_EMAIL_FALHA_JOB]  @getJobName VARCHAR(100)


AS


DECLARE 
@subjectText nvarchar(100)='',
@body nvarchar(MAX)='',
@subjectBody nvarchar(MAX)='',
@messageBodyRow1 nvarchar(MAX)='',
@messageBodyRow2 nvarchar(MAX)='',
@messageBodyRow3 nvarchar(MAX)='',
@destination nvarchar(MAX)='',
@getDateText nvarchar(50)='',
@getDate datetime=null

-- Assunto do Email
SET @subjectText = 'Aviso de Erro de Execução - ' + @getJobName
-- Titulo do Corpo do Email
SET @subjectBody = 'Aviso de Erro de Execução'
-- Mensagem do Corpo do email
SET @messageBodyRow1 = 'Caros, informamos que '
SET @messageBodyRow2 = 'a JOB reportou falha em sua execução: '
SET @messageBodyRow3 = @getJobName
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
	  		padding-left:1px;
			padding-right:1px;
			
	  }
		table.bigbox{
			border-color: #bfbfbf;
			background-color: #F2F2F2;		
		
		}
		
	  div.imagem1{
    		top: 1;	
     	    position:relative;
		}

		div.titulo{
      		font-size: 20px;
      		color: #404040;
			text-align:center;
	}
      
		div.mensagem{
    		position:relative;				
  		    font-size: 15px;
			color: #404040;
			align:center;
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
<table class="bigbox"
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
		<br />
		<strong>'+ @messageBodyRow3 + '</strong><br />
		</p>
      </div>
	  <br />
	  <br />                   
      <div class="finalzinho">
           <span class="textend">Atento Brasil S/A | Vice Presidência de Tecnologia, Infraestrutura e PMC</span>  
    	<div class="imagem2">
		         <img class="logodti"
		 			alt="Data Infraestructure Team" 
			 		src="\\brsbesrv960\publico\HTML_SCRIPT\IMAGES\1000.png" 
                   >
    	</div>
       </div>
    <div class="rodape">
		Esta mensagem, incluindo seus anexos, pode conter informacoes privilegiadas e/ou de carater confidencial, nao podendo ser retransmitida sem autorizacao do remetente. Se voce nao e o destinatario ou pessoa autorizada a recebe-la, informamos que o seu uso
, divulgacao, copia ou arquivamento sao proibidos. Portanto, se você recebeu esta mensagem por engano, por favor, nos informe respondendo imediatamente a este e-mail e em seguida apague-a.
	</div>

</table>
</body>
</html>
'
--------------------------------------------------------------------------------------------------
--------------------------------------- ENVIO DO EMAIL -------------------------------------------
--------------------------------------------------------------------------------------------------

EXEC msdb.dbo.sp_send_dbmail ----procedure que envia os emails
@body = @body ----corpo do email, passando variavel acima definida
, @recipients = @destination ----destinatario(s) do email
, @subject = @subjectText --— assunto do email
, @profile_name = 'Notificacao Relatorio' ----nome do profile que ira disparar o email
, @body_format = 'HTML'; ----importante informar o formato do email, nesse caso HTML;



