SELECT
	ar.artista_nome AS 'artista',
    al.album_nome AS 'album',
    COUNT(se.artista_id) AS 'seguidores'
FROM SpotifyClone.artistas AS ar
	LEFT JOIN SpotifyClone.albuns AS al
		ON ar.artista_id = al.artista_id
	LEFT JOIN SpotifyClone.seguidores AS se
		ON ar.artista_id = se.artista_id
GROUP BY ar.artista_nome, al.album_nome
ORDER BY seguidores DESC, ar.artista_nome, al.album_nome;