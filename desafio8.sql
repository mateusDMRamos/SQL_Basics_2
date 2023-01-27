SELECT
	ar.artista_nome AS 'artista',
    al.album_nome AS 'album'
FROM SpotifyClone.artistas AS ar
	LEFT JOIN SpotifyClone.albuns AS al
		ON ar.artista_id = al.artista_id
WHERE ar.artista_nome = 'Elis Regina'
ORDER BY al.album_nome;