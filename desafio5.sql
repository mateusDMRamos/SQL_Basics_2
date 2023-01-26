SELECT 
	m.musica_nome AS 'cancao',
    COUNT(r.musica_id) AS 'reproducoes'
FROM SpotifyClone.musicas AS m
	INNER JOIN SpotifyClone.reproducoes AS r
		ON m.musica_id = r.musica_id
GROUP BY r.musica_id, m.musica_nome
ORDER BY reproducoes DESC, m.musica_nome
LIMIT 2;