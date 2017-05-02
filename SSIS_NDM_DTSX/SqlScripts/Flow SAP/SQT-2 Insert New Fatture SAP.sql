use SchedarioTerritorio

insert into ProvvFattureSap
(
NumeroDocumentoContabile,
Esercizio,
TipoDocumento,
DataDocumento,
DataRegistrazione,
NumeroDocumentoRiferimento,
Imponibile,
IVA,
Importo,
DataAcquisizioneNDM,
UtenteAcquisizioneNDM,
UtenteRegistrazione,
UfficioVendite,
GAV
)
	select 
		g.NumeroDocumentoContabile,
		g.Esercizio,
		g.TipoDocumento,
		g.DataDocumento,
		g.DataRegistrazione,
		g.NumeroDocumentoRiferimento,
		g.Imponibile,
		g.IVA,
		g.Importo,
		g.DataAcquisizioneNDM,
		g.UtenteAcquisizioneNDM,
		g.UtenteRegistrazione,
		g.UfficioVendite,
		g.GAV		
	from (
		select 
			NumeroDocumentoContabile,
			Esercizio,
			TipoDocumento,
			DataDocumento,
			DataRegistrazione,
			NumeroDocumentoRiferimento,
			Imponibile,
			IVA,
			Importo,
			DataAcquisizioneNDM,
			UtenteAcquisizioneNDM,
			UtenteRegistrazione,
			UfficioVendite,
			GAV			
		from _fflProvvFattureSap
		group by 
			NumeroDocumentoContabile,
			Esercizio,
			TipoDocumento,
			DataDocumento,
			DataRegistrazione,
			NumeroDocumentoRiferimento,
			Imponibile,
			IVA,
			Importo,
			DataAcquisizioneNDM,
			UtenteAcquisizioneNDM,
			UtenteRegistrazione,
			UfficioVendite,
			GAV			
	) as g
	left join ProvvFattureSap as m
	ON g.NumeroDocumentoContabile = m.NumeroDocumentoContabile
	where m.NumeroDocumentoContabile IS NULL;

SELECT @@ROWCOUNT as RowsInserted; 