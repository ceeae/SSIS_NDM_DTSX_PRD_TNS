-- Query di Aggregazione Principale (fittizi)
--
-- Paramentri:
-- {0} Data Quietanda Da
-- {1} Data Quietanza A
-- {2} Formato Data "'dd-mm-yyyy 12:00:00 AM'"

return @"
select
    trim( cast( quietanza.COD_SEPRAG as varchar(7) ) ) as codSepragScheda,
		quietanza.NUM_FATTURA as numeroPagamento,
		quietanza.DATA as dataQuietanza,
		spazio.DENOMINAZIONE as denominazioneSpazio,
		toponimoLocale.DENOMINAZIONE as denToponimoLocale,
		stradaLocale.DENOMINAZIONE as denStradaLocale,
		locale.NUMERO_CIVICO as numCivicoLocale,
		trim( cast( comuneLocale.COD_COMUNE_SIAE as varchar(3) ) ) as codiceComuneSiae,
		trim( cast( locale.COD_CATEG_LOCALE as varchar(1) ) ) as categoriaLocale,
		trim( cast( locale.COD_GENERE_LOCALE as varchar(3) ) ) as genereLocale,
		organizzatore.COGNOME as cognomeOrganizzatore,
		organizzatore.NOME as nomeOrganizzatore,
		organizzatore.CODICE_FISCALE as codiceFiscaleOrganizzatore,
		organizzatore.PARTITA_IVA as partitaIvaOrganizzatore,
		toponimoOrganizzatore.DENOMINAZIONE as denToponimoOrg,
		stradaOrganizzatore.DENOMINAZIONE as denStradaOrganizzatore,
		organizzatore.NUMERO_CIVICO as numCivicoOrganizzatore,
		comuneOrganizzatore.DESCRIZIONE as comuneOrganizzatore,
		trim( cast( provincia.SIGLA as varchar(2) ) ) as provinciaOrganizzatore,
		quietanza.importo as importo,
		St_Quietanza.data_Inizio As Datainizio,
		st_quietanza.DATA_FINE as dataFine,
		Trim( Cast( Locale.Cod_Seprag As Varchar(7) ) ) As Codsepraglocale,
		trim( cast( quietanza.origine as Varchar(3) ) ) as origineQuiet,
		raggruppamento.NUM_DITTA as numeroDitta,
		quietanza.id_quietanza as idquietanza,
		spazio.ID_SPAZIO as idSpazio,
		locale.TITOLARE as titolareLocale,
		locale.DENOMINAZIONE as denominazioneLocale,
		Trim( Cast(Quietanza.Cod_Genere_Evento As Varchar(2) ) ) As Genereevento,
		quietanza.num_documento as NumeroReversale

From
		Pagamento Pagamento,
		ORGANIZZATORE organizzatore,
		STRADA stradaOrganizzatore,
		TOPONIMO toponimoOrganizzatore,
		COMUNE comuneOrganizzatore,
		PROVINCIA provincia,
		SPAZIO spazio
			left join RAGGRUPPAMENTO_SPAZIO raggruppamentoSpazio on spazio.ID_SPAZIO=raggruppamentoSpazio.ID_SPAZIO
			left join RAGGRUPPAMENTO raggruppamento on raggruppamentoSpazio.ID_RAGGRUPPAMENTO =raggruppamento.ID_RAGGRUPPAMENTO,
		LOCALE locale,
		STRADA stradaLocale,
		TOPONIMO toponimoLocale,
		Comune Comunelocale,
		Quietanza Quietanza,
		info_stampa_QUIETANZA st_quietanza

Where	
		Quietanza.ID_ORGANIZZATORE=organizzatore.ID_ORGANIZZATORE and
		organizzatore.ID_STRADA=stradaOrganizzatore.ID_STRADA and
		stradaOrganizzatore.COD_TOPONIMO=toponimoOrganizzatore.COD_TOPONIMO and
		stradaOrganizzatore.COD_COMUNE=comuneOrganizzatore.COD_COMUNE and
		Comuneorganizzatore.Cod_Provincia=Provincia.Cod_Provincia And
		Quietanza.Id_Spazio=Spazio.Id_Spazio And
		Quietanza.id_info_stampa_quietanza = st_quietanza.id_info_stampa_quietanza and
		spazio.ID_LOCALE=locale.ID_LOCALE and
		locale.ID_STRADA=stradaLocale.ID_STRADA and
		stradaLocale.COD_TOPONIMO=toponimoLocale.COD_TOPONIMO and
		Stradalocale.Cod_Comune=Comunelocale.Cod_Comune And
		pagamento.num_fattura = quietanza.num_fattura and
		
		Pagamento.Stato='1' And 
		quietanza.DATA >= TO_DATE({0}, {2}) and 
		quietanza.DATA < TO_DATE({1}, {2}) and
		Quietanza.Origine = 'PUP'
			
Union All

select
		trim( cast( quietanza.COD_SEPRAG as varchar(7) ) ) as codSepragScheda,
		quietanza.NUM_FATTURA as numeroPagamento,
		quietanza.DATA as dataQuietanza,
		spazio.DENOMINAZIONE as denominazioneSpazio,
		toponimoLocale.DENOMINAZIONE as denToponimoLocale,
		stradaLocale.DENOMINAZIONE as denStradaLocale,
		locale.NUMERO_CIVICO as numCivicoLocale,
		trim( cast( comuneLocale.COD_COMUNE_SIAE as varchar(3) ) ) as codiceComuneSiae,
		trim( cast( locale.COD_CATEG_LOCALE as varchar(1) ) ) as categoriaLocale,
		trim( cast( locale.COD_GENERE_LOCALE as varchar(3) ) ) as genereLocale,
		organizzatore.COGNOME as cognomeOrganizzatore,
		organizzatore.NOME as nomeOrganizzatore,
		organizzatore.CODICE_FISCALE as codiceFiscaleOrganizzatore,
		organizzatore.PARTITA_IVA as partitaIvaOrganizzatore,
		toponimoOrganizzatore.DENOMINAZIONE as denToponimoOrg,
		stradaOrganizzatore.DENOMINAZIONE as denStradaOrganizzatore,
		organizzatore.NUMERO_CIVICO as numCivicoOrganizzatore,
		comuneOrganizzatore.DESCRIZIONE as comuneOrganizzatore,
		trim( cast( provincia.SIGLA as varchar(2) ) ) as provinciaOrganizzatore,
		quietanza.importo as importo,
		St_Quietanza.data_Inizio As Datainizio,
		st_quietanza.DATA_FINE as dataFine,
		Trim( Cast( Locale.Cod_Seprag As Varchar(7) ) ) As Codsepraglocale,
		trim( cast( quietanza.origine as Varchar(3) ) ) as origineQuiet, 
		raggruppamento.NUM_DITTA as numeroDitta,
		quietanza.id_quietanza as idquietanza,
		spazio.ID_SPAZIO as idSpazio,
		locale.TITOLARE as titolareLocale,
		locale.DENOMINAZIONE as denominazioneLocale,
		Trim( Cast(Quietanza.Cod_Genere_Evento As Varchar(2) ) ) As Genereevento,
		quietanza.num_documento as NumeroReversale

From
		ORGANIZZATORE organizzatore 
			left join STRADA stradaOrganizzatore on organizzatore.id_strada = stradaOrganizzatore.id_strada 
			left join TOPONIMO toponimoOrganizzatore on stradaOrganizzatore.cod_toponimo = toponimoOrganizzatore.cod_toponimo
			left join COMUNE comuneOrganizzatore on stradaOrganizzatore.cod_comune = comuneOrganizzatore.cod_comune
			left join PROVINCIA provincia on comuneOrganizzatore.cod_provincia = provincia.cod_provincia,
		SPAZIO spazio
			left join RAGGRUPPAMENTO_SPAZIO raggruppamentoSpazio on spazio.ID_SPAZIO=raggruppamentoSpazio.ID_SPAZIO
			left join RAGGRUPPAMENTO raggruppamento on raggruppamentoSpazio.ID_RAGGRUPPAMENTO =raggruppamento.ID_RAGGRUPPAMENTO,
		LOCALE locale,
		STRADA stradaLocale,
		TOPONIMO toponimoLocale,
		Comune Comunelocale,
		Quietanza Quietanza,
   		info_stampa_QUIETANZA st_quietanza

Where
		Quietanza.ID_ORGANIZZATORE=organizzatore.ID_ORGANIZZATORE and
		Quietanza.Id_Spazio=Spazio.Id_Spazio And
   		Quietanza.id_info_stampa_quietanza = st_quietanza.id_info_stampa_quietanza and
		spazio.ID_LOCALE=locale.ID_LOCALE and
		locale.ID_STRADA=stradaLocale.ID_STRADA and
		stradaLocale.COD_TOPONIMO=toponimoLocale.COD_TOPONIMO and
		Stradalocale.Cod_Comune=Comunelocale.Cod_Comune and
		
		quietanza.DATA >= TO_DATE({0}, {2}) and 
		quietanza.DATA < TO_DATE({1}, {2}) and			 
		quietanza.stato = '1' and 
		(((Quietanza.Origine = 'PUP') and (quietanza.id_metodo_pagamento = '11' )) OR ((Quietanza.Origine = 'PTP') and (quietanza.id_tipo_modello = 1)))           

Union All

select
    	trim( cast( quietanza.COD_SEPRAG as varchar(7) ) ) as codSepragScheda,
		quietanza.NUM_FATTURA as numeroPagamento,
		quietanza.DATA as dataQuietanza,
		spazio.DENOMINAZIONE as denominazioneSpazio,
		toponimoLocale.DENOMINAZIONE as denToponimoLocale,
		stradaLocale.DENOMINAZIONE as denStradaLocale,
		locale.NUMERO_CIVICO as numCivicoLocale,
		trim( cast( comuneLocale.COD_COMUNE_SIAE as varchar(3) ) ) as codiceComuneSiae,
		trim( cast( locale.COD_CATEG_LOCALE as varchar(1) ) ) as categoriaLocale,
		trim( cast( locale.COD_GENERE_LOCALE as varchar(3) ) ) as genereLocale,
		organizzatore.COGNOME as cognomeOrganizzatore,
		organizzatore.NOME as nomeOrganizzatore,
		organizzatore.CODICE_FISCALE as codiceFiscaleOrganizzatore,
		organizzatore.PARTITA_IVA as partitaIvaOrganizzatore,
		toponimoOrganizzatore.DENOMINAZIONE as denToponimoOrg,
		stradaOrganizzatore.DENOMINAZIONE as denStradaOrganizzatore,
		organizzatore.NUMERO_CIVICO as numCivicoOrganizzatore,
		comuneOrganizzatore.DESCRIZIONE as comuneOrganizzatore,
		trim( cast( provincia.SIGLA as varchar(2) ) ) as provinciaOrganizzatore,
		quietanza.importo as importo,
		St_Quietanza.data_Inizio As Datainizio,
		st_quietanza.DATA_FINE as dataFine,
		Trim( Cast( Locale.Cod_Seprag As Varchar(7) ) ) As Codsepraglocale,
		trim( cast( quietanza.origine as Varchar(3) ) ) as origineQuiet, 
		raggruppamento.NUM_DITTA as numeroDitta,
		quietanza.id_quietanza as idquietanza,
		spazio.ID_SPAZIO as idSpazio,
		locale.TITOLARE as titolareLocale,
		locale.DENOMINAZIONE as denominazioneLocale,
		Trim( Cast(Quietanza.Cod_Genere_Evento As Varchar(2) ) ) As Genereevento,
		quietanza.num_documento as NumeroReversale

From
		ORGANIZZATORE organizzatore 
			left join STRADA stradaOrganizzatore on organizzatore.id_strada = stradaOrganizzatore.id_strada 
			left join TOPONIMO toponimoOrganizzatore on stradaOrganizzatore.cod_toponimo = toponimoOrganizzatore.cod_toponimo
			left join COMUNE comuneOrganizzatore on stradaOrganizzatore.cod_comune = comuneOrganizzatore.cod_comune
			left join PROVINCIA provincia on comuneOrganizzatore.cod_provincia = provincia.cod_provincia,
		SPAZIO spazio
			left join RAGGRUPPAMENTO_SPAZIO raggruppamentoSpazio on spazio.ID_SPAZIO=raggruppamentoSpazio.ID_SPAZIO
			left join RAGGRUPPAMENTO raggruppamento on raggruppamentoSpazio.ID_RAGGRUPPAMENTO =raggruppamento.ID_RAGGRUPPAMENTO,
		LOCALE locale,
		STRADA stradaLocale,
		TOPONIMO toponimoLocale,
		Comune Comunelocale,
		Quietanza Quietanza,
        info_stampa_QUIETANZA st_quietanza

Where
		Quietanza.ID_ORGANIZZATORE=organizzatore.ID_ORGANIZZATORE and
		Quietanza.Id_Spazio=Spazio.Id_Spazio And
   		Quietanza.id_info_stampa_quietanza = st_quietanza.id_info_stampa_quietanza and
		spazio.ID_LOCALE=locale.ID_LOCALE and
		locale.ID_STRADA=stradaLocale.ID_STRADA and
		stradaLocale.COD_TOPONIMO=toponimoLocale.COD_TOPONIMO and
		Stradalocale.Cod_Comune=Comunelocale.Cod_Comune and 

		quietanza.DATA >= TO_DATE({0}, {2}) and 
		quietanza.DATA < TO_DATE({1}, {2}) and	      
		quietanza.stato = '1' and 
		quietanza.origine = 'SAP' and 
		(quietanza.id_metodo_pagamento = 14 OR quietanza.id_metodo_pagamento = 13 OR quietanza.id_metodo_pagamento = 15 OR quietanza.id_metodo_pagamento = 16 )     

Union All

select
    	trim( cast( quietanza.COD_SEPRAG as varchar(7) ) ) as codSepragScheda,
		quietanza.NUM_FATTURA as numeroPagamento,
		quietanza.DATA as dataQuietanza,
		spazio.DENOMINAZIONE as denominazioneSpazio,
		toponimoLocale.DENOMINAZIONE as denToponimoLocale,
		stradaLocale.DENOMINAZIONE as denStradaLocale,
		locale.NUMERO_CIVICO as numCivicoLocale,
		trim( cast( comuneLocale.COD_COMUNE_SIAE as varchar(3) ) ) as codiceComuneSiae,
		trim( cast( locale.COD_CATEG_LOCALE as varchar(1) ) ) as categoriaLocale,
		trim( cast( locale.COD_GENERE_LOCALE as varchar(3) ) ) as genereLocale,
		organizzatore.COGNOME as cognomeOrganizzatore,
		organizzatore.NOME as nomeOrganizzatore,
		organizzatore.CODICE_FISCALE as codiceFiscaleOrganizzatore,
		organizzatore.PARTITA_IVA as partitaIvaOrganizzatore,
		toponimoOrganizzatore.DENOMINAZIONE as denToponimoOrg,
		stradaOrganizzatore.DENOMINAZIONE as denStradaOrganizzatore,
		organizzatore.NUMERO_CIVICO as numCivicoOrganizzatore,
		comuneOrganizzatore.DESCRIZIONE as comuneOrganizzatore,
		trim( cast( provincia.SIGLA as varchar(2) ) ) as provinciaOrganizzatore,
		quietanza.importo as importo,
		St_Quietanza.data_Inizio As Datainizio,
		st_quietanza.DATA_FINE as dataFine,
		Trim( Cast( Locale.Cod_Seprag As Varchar(7) ) ) As Codsepraglocale,
		trim( cast( quietanza.origine as Varchar(3) ) ) as origineQuiet, 
		raggruppamento.NUM_DITTA as numeroDitta,
		quietanza.id_quietanza as idquietanza,
		spazio.ID_SPAZIO as idSpazio,
		locale.TITOLARE as titolareLocale,
		locale.DENOMINAZIONE as denominazioneLocale,
		Trim( Cast(Quietanza.Cod_Genere_Evento As Varchar(2) ) ) As Genereevento,
		quietanza.num_documento as NumeroReversale

From
		ORGANIZZATORE organizzatore left join STRADA stradaOrganizzatore on organizzatore.id_strada = stradaOrganizzatore.id_strada 
			left join TOPONIMO toponimoOrganizzatore on stradaOrganizzatore.cod_toponimo = toponimoOrganizzatore.cod_toponimo
			left join COMUNE comuneOrganizzatore on stradaOrganizzatore.cod_comune = comuneOrganizzatore.cod_comune
			left join PROVINCIA provincia on comuneOrganizzatore.cod_provincia = provincia.cod_provincia,
		SPAZIO spazio
			left join RAGGRUPPAMENTO_SPAZIO raggruppamentoSpazio on spazio.ID_SPAZIO=raggruppamentoSpazio.ID_SPAZIO
			left join RAGGRUPPAMENTO raggruppamento on raggruppamentoSpazio.ID_RAGGRUPPAMENTO =raggruppamento.ID_RAGGRUPPAMENTO,
		LOCALE locale,
		STRADA stradaLocale,
		TOPONIMO toponimoLocale,
		Comune Comunelocale,
		Quietanza Quietanza,
   		info_stampa_QUIETANZA st_quietanza

Where
		Quietanza.ID_ORGANIZZATORE=organizzatore.ID_ORGANIZZATORE and
		Quietanza.Id_Spazio=Spazio.Id_Spazio And
   		Quietanza.id_info_stampa_quietanza = st_quietanza.id_info_stampa_quietanza and
		spazio.ID_LOCALE=locale.ID_LOCALE and
		locale.ID_STRADA=stradaLocale.ID_STRADA and
		stradaLocale.COD_TOPONIMO=toponimoLocale.COD_TOPONIMO and
		Stradalocale.Cod_Comune=Comunelocale.Cod_Comune and 
      
		quietanza.DATA >= TO_DATE({0}, {2}) and 
		quietanza.DATA < TO_DATE({1}, {2}) and	
		quietanza.stato = '1' and 
		quietanza.origine = 'PRM';  
";