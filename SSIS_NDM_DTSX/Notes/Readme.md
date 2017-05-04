
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

Input Path: \\hnas1_50\WebServiziUpload\SchedarioTerritorio\Provvigioni\   (parametro)
Archive:	\\hnas1_50\WebServiziUpload\SchedarioTerritorio\Provvigioni\Archive

.2	A		G	SQL Incassi e Incassi Fittizi
.	B		G	SQL Pagamenti Accentrati
.	C		M	FFL Atti di Constatazione															[AttiConstatAccertatori.csv]
#   C   ?       SQL Atti di Constatazione (estrazione da SUN - SQL da definire)
.2	D		M	FFL Atti di Constatazione (Dettaglio) - Recuperi modelli 97 old e new				[Recuperi_modelli97_<new|old>.csv]
.2	E		M	FFL RCG - Scarichi ADC RCG e SUN													[Scarichi_ADC_<RCG|SUN>.csv]
.	F		M	SQL DOR/ERT (verificare sql estrae pochi dati)
.	G		M 	SQL Accertamenti Erariali (modelli 93)
.	H		M	SQL Accertamenti AAMS (modelli 253)
.	I		M	FFL Accertamenti Autorali															[VigilanzeAutorali.csv]
.	L		M	SQL Accertamenti REGBSM
.	S	W	G	FFL Fatture SAP																		[SUN_SAP.csv]


NOTES:
-----

 
S	Flusso Fatture – si deve accedere alla cartella \\hnas1_50\SSI\temp\SAP\ (dove ancora non abbiamo i permessi, Marco Nicolosi ha fatto la richiesta di abilitazione in lettura per percussi, tricarico e micheletto
. Va verificata la eventuale richiesta per utenza SSIS). Qui dentro ci deve stare il file SUN_SAP.csv. deve andare direttamente nella tabella ProvvFattureSap (che non essendo di staging ma invocata da crsucotto non ha _ davanti)
 
F – DorErt fonte Sun, dove abbiamo già una query che deve essere sottoposta a revisione (SQL)



CREATE TABLE [dbo].[_AdC](
	[NumeroAtto] [varchar](12) NULL,
	[DataDocumento] [varchar](50) NULL,
	[DataControllo] [varchar](50) NULL,
	[Datainserimento] [varchar](500) NULL,
	[Automatico] [varchar](500) NULL,
	[PA] [varchar](500) NULL,
	[GenereManifestazione] [varchar](150) NULL,
	[NaturaAtto] [varchar](13) NULL,
	[SepragObiettivo] [varchar](500) NULL,
	[Seprag] [varchar](500) NULL,
	[Esito] [varchar](500) NULL,
	[StatoDocumento] [varchar](500) NULL,
	[DenominazioneOrganizzatore] [varchar](500) NULL,
	[PIVACodiceFiscale] [varchar](500) NULL,
	[LocaleSpazio] [varchar](500) NULL,
	[SepragLocale] [varchar](500) NULL,
	[AttInIspezione] [varchar](500) NULL,
	[DirittoEvaso] [varchar](500) NULL,
	[DirittoRecuperato] [varchar](500) NULL,
	[PenaliRecuperate] [varchar](500) NULL,
	[InteressiRecuperati] [varchar](500) NULL,
	[ImportoDovuto] [varchar](500) NULL,
	[ImportoPagato] [varchar](500) NULL,
	[SommaDepositi] [varchar](500) NULL,
	[DataScadenzaPagamento] [varchar](500) NULL,
	[PresenzaAllegati] [varchar](500) NULL,
	[NumeroAttestato] [varchar](500) NULL,
	[DataAttestato] [varchar](500) NULL,
	[NumeroDiffida] [varchar](500) NULL,
	[DataDiffida] [varchar](500) NULL,
	[DataEventoInizio] [varchar](500) NULL,
	[DataEventoFine] [varchar](500) NULL,
	[DataStatus] [varchar](500) NULL,
	[NumeroReversale] [varchar](500) NULL,
	[DataReversale] [varchar](500) NULL,
	[Colonna35] [varchar](500) NULL
) ON [PRIMARY]
