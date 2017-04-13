-- Get All IdQuietanza (just) Imported
--USE SchedarioTerritorio
--SELECT DISTINCT pri.IdQuietanza, pri.Id FROM ProvvIncassi pri INNER JOIN _oraIncassi ora 
--ON pri.IdQuietanza = ora.IDQUIETANZA
--ORDER BY pri.IdQuietanza DESC

-- Get All IdQuietanza (just) Imported without details

USE SchedarioTerritorio
;WITH IdQuietanzeImported (IdQuietanza, Id)
AS (
	SELECT DISTINCT pri.IdQuietanza, pri.Id FROM ProvvIncassi pri INNER JOIN _oraIncassiFittizi ora 
	ON pri.IdQuietanza = ora.IDQUIETANZA
--	ORDER BY pri.IdQuietanza DESC
) SELECT idqi.IdQuietanza, idqi.Id FROM IdQuietanzeImported idqi LEFT JOIN 
	(
		SELECT DISTINCT idquietanza FROM ProvvIncassiDettaglio WHERE IdQuietanza IS NOT NULL 
	) AS IdQuietanzeConDettaglio 
ON idqi.IdQuietanza = IdQuietanzeConDettaglio.IdQuietanza
WHERE IdQuietanzeConDettaglio.IdQuietanza IS NULL