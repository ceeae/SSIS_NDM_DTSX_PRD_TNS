-- Select All IdQuietanza from _oraIncassiFittizi not yet Imported
SELECT ora.* FROM _oraIncassiFittizi ora 
	LEFT JOIN ProvvIncassi pri ON ora.IDQUIETANZA = pri.IdQuietanza 
WHERE pri.IdQuietanza IS NULL