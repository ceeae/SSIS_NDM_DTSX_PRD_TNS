
CONNECTION STRINGS
==================

  <!-- Production
    Data Source=sql_SchedarioTerritorio.net.siae;User ID=SchedarioTerritorioRW;Password=Sch3d4r1o0T3rrRWP455;
  -->

  <!-- Development
    Data Source=Data Source=sql_emittenzaradiotelevisiva.sviluppo.siae;User ID=webserviziadmin;Password=WebAdminpass;
  -->

README
======

Flusso A
Flusso A fittizi
Flusso B Pagamenti
Flusso D (Dettaglio incassi Adc - Accertatori)
Flusso E (RCG – Scarichi Adc RCG)
Flusso CDE (Recuperi)
Flusso I (Vigilanze Autorali)
 
Sono da completare:

G – Modelli 93 – Fonte SUN
H – Modelli 253- Fonte SUN

 
Flusso Fatture – si deve accedere alla cartella \\hnas1_50\SSI\temp\SAP\ (dove ancora non abbiamo i permessi, Marco Nicolosi ha fatto la richiesta di abilitazione in lettura per percussi, tricarico e micheletto
. Va verificata la eventuale richiesta per utenza SSIS). Qui dentro ci deve stare il file SUN_SAP.csv. deve andare direttamente nella tabella ProvvFattureSap (che non essendo di staging ma invocata da crsucotto non ha _ davanti)
 
C – Adc fonte SUN
F – DorErt fonte Sun, dove abbiamo già una query che deve essere sottoposta a revisione (SQL)
L – REGBSM – da Portale Ispettivo , con refresh una volta al mese (
