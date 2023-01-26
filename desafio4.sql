SELECT 
	u.usuario_nome AS 'usuario',
    IF(YEAR(MAX(r.data_reproducao))>2020, 'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.usuarios AS u 
	INNER JOIN SpotifyClone.reproducoes AS r
		ON u.usuario_id = r.usuario_id
GROUP BY u.usuario_id ORDER BY u.usuario_nome;