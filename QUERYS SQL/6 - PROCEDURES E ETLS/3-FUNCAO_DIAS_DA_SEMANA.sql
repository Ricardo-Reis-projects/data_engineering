--DROP FUNCTION DBO.DIA_DA_SEMANA

CREATE FUNCTION DBO.DIA_DA_SEMANA (@DATA DATE)
RETURNS VARCHAR(20)
AS
BEGIN
 
 
	DECLARE @diasemana int
	DECLARE @nomedia VARCHAR(20)
 
	SET @diasemana = Datepart(dw, @DATA)
 
	If (@diasemana = 1)
		Set @nomedia = '1-DOMINGO'
	Else If (@diasemana = 2)
		Set @nomedia = '2-SEGUNDA-FEIRA'
	Else If (@diasemana = 3)
		Set @nomedia = '3-TERÇA-FEIRA'
	Else If (@diasemana = 4)
		Set @nomedia = '4-QUARTA-FEIRA'
	Else If (@diasemana = 5)
		Set @nomedia = '5-QUINTA-FEIRA'
	Else If (@diasemana = 6)
		Set @nomedia = '6-SEXTA-FEIRA'
	Else If (@diasemana = 7)
		Set @nomedia = '7-SABADO'
 
RETURN @nomedia
 
END;