SELECT 
	u.usuario_nome AS 'usuario',
    COUNT(r.usuario_id) AS 'qt_de_musicas_ouvidas',
    CONVERT(round( SUM(m.musica_duracao)/60, 2),char) AS 'total_minutos'
FROM SpotifyClone.usuarios AS u 
	INNER JOIN SpotifyClone.reproducoes AS r
		ON u.usuario_id = r.usuario_id
	INNER JOIN SpotifyClone.musicas AS m
		ON m.musica_id = r.musica_id
GROUP BY usuario_nome ORDER BY u.usuario_nome;