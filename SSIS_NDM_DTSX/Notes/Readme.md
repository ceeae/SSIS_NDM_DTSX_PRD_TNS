
DATE RANGE
==========
  <!-- 
    Automatic (import last 24 hours): set both values to '01-01-1899 12:00:00 AM'
    Dates Range: set BOTH values to well-formed dates e.g. Da = '01-07-2012 12:00:00 AM'; A = '31-07-2012 12:00:00 AM'
  -->
  
[SCHEDARIO TERRITORIO]
======================
  <!-- Production
    Data Source=sql_SchedarioTerritorio.net.siae;User ID=SchedarioTerritorioRW;Password=Sch3d4r1o0T3rrRWP455;
  -->

  <!-- Test
	Data Source=sql_SchedarioTerritorio.test.siae;User ID=schedarioterritoriorw;Password=ScHeD@r1015RW
  -->

  <!-- Development
    Data Source=Data Source=sql_emittenzaradiotelevisiva.sviluppo.siae;User ID=webserviziadmin;Password=WebAdminpass;
  -->


[PORTALE ISPETTIVO]
===================

  <!-- Production
	Data Source=sql_portaleispettivo.net.siae;User ID=PortaleIspettivoRW;Password=1spett1v0rw;Initial Catalog=PortaleIspettivo;
  -->



FLUSSI @2-May-2017
==================

.2	A		SQL Incassi e Incassi Fittizi
.	B		SQL Pagamenti Accentrati
.	C		FFL Atti di Constatazione															[AttiConstatAccertatori.csv]
.2	D		FFL Atti di Constatazione (Dettaglio) - Recuperi modelli 97 old e new				[Recuperi_modelli97_<new|old>.csv]
.2	E		FFL RCG - Scarichi ADC RCG e SUN													[Scarichi_ADC_<RCG|SUN>.csv]
#	F	?	SQL DOR/ERT (verificare sql estrae pochi dati)
.	G		SQL Accertamenti Erariali (modelli 93)
.	H		SQL Accertamenti AAMS (modelli 253)
.	I		FFL Accertamenti Autorali															[VigilanzeAutorali.csv]
.	L		SQL Accertamenti REGBSM
#	S	W	FFL Fatture SAP																		[SUN_SAP.csv]


NOTES:
-----

 
S	Flusso Fatture – si deve accedere alla cartella \\hnas1_50\SSI\temp\SAP\ (dove ancora non abbiamo i permessi, Marco Nicolosi ha fatto la richiesta di abilitazione in lettura per percussi, tricarico e micheletto
. Va verificata la eventuale richiesta per utenza SSIS). Qui dentro ci deve stare il file SUN_SAP.csv. deve andare direttamente nella tabella ProvvFattureSap (che non essendo di staging ma invocata da crsucotto non ha _ davanti)
 
F – DorErt fonte Sun, dove abbiamo già una query che deve essere sottoposta a revisione (SQL)
