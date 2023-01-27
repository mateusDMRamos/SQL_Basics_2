SELECT
	m.musica_nome AS 'nome',
	COUNT(r.usuario_id) AS 'reproducoes'
FROM SpotifyClone.reproducoes AS r
	LEFT JOIN SpotifyClone.musicas AS m
		ON r.musica_id = m.musica_id
	LEFT JOIN SpotifyClone.usuarios AS u
		ON u.usuario_id = r.usuario_id
WHERE u.plano_id IN (1, 4)
GROUP BY nome
ORDER BY nome;