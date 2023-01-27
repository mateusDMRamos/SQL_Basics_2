SELECT
	COUNT(r.usuario_id) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.reproducoes AS r
	LEFT JOIN SpotifyClone.usuarios AS u
		ON r.usuario_id = u.usuario_id
WHERE u.usuario_nome = 'Barbara Liskov';