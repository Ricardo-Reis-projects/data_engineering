USE BRA_SOLUCOES_PDV
--====================INPORT ARQUIVO TXT==============================================
EXECUTE INPORT_TXT

--====================INPORT ARQUIVO EXCEL TODOS======================================
EXECUTE INPORT_XLS

--====================INPORT ARQUIVO EXCEL POR PROCESSO===============================
EXECUTE INPORT_XLS_ADESAO
EXECUTE INPORT_XLS_CONSULTA_PREVIA
EXECUTE INPORT_XLS_PREVIA_APROVADA
EXECUTE INPORT_XLS_PROPOSTA

--====================INPORT ARQUIVO EXCEL POR PROCESSO E PARCEIRO====================

--====================CONSULTA PR�VIA=================================================
EXECUTE INPORT_XLS_CONSULTA_PREVIA_ANGELONI
EXECUTE INPORT_XLS_CONSULTA_PREVIA_COOP
EXECUTE INPORT_XLS_CONSULTA_PREVIA_LASA
EXECUTE INPORT_XLS_CONSULTA_PREVIA_MAKRO
EXECUTE INPORT_XLS_CONSULTA_PREVIA_SODIMAC

--====================PR�VIA APROVADA=================================================
EXECUTE INPORT_XLS_PREVIA_APROVADA_ANGELONI
EXECUTE INPORT_XLS_PREVIA_APROVADA_COOP
EXECUTE INPORT_XLS_PREVIA_APROVADA_LASA
EXECUTE INPORT_XLS_PREVIA_APROVADA_MAKRO
EXECUTE INPORT_XLS_PREVIA_APROVADA_SODIMAC

--====================PROPOSTA========================================================
EXECUTE INPORT_XLS_PROPOSTA_ANGELONI
EXECUTE INPORT_XLS_PROPOSTA_COOP
EXECUTE INPORT_XLS_PROPOSTA_LASA
EXECUTE INPORT_XLS_PROPOSTA_MAKRO
EXECUTE INPORT_XLS_PROPOSTA_SODIMAC

--====================ADESAO=========================================================
EXECUTE INPORT_XLS_ADESAO_ANGELONI
EXECUTE INPORT_XLS_ADESAO_COOP
EXECUTE INPORT_XLS_ADESAO_LASA
EXECUTE INPORT_XLS_ADESAO_MAKRO
EXECUTE INPORT_XLS_ADESAO_SODIMAC





