DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      plano_nome VARCHAR(50) NOT NULL,
      plano_valor DECIMAL(5,2)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
    usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    usuario_nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE,
    FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      artista_nome VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      album_nome VARCHAR(50) NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.musicas(
    musica_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    musica_nome VARCHAR(50) NOT NULL,
    musica_duracao INT NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguidores(
    artista_id INT NOT NULL,
    usuario_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(artista_id, usuario_id),
		    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
        FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproducoes(
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    data_reproducao DATETIME,
    CONSTRAINT PRIMARY KEY(musica_id, usuario_id),
		    FOREIGN KEY (musica_id) REFERENCES musicas (musica_id),
        FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.artistas (artista_nome)
  VALUES
    ('Nina Simone'),
    ('Blind Guardian'),
    ('Baco Exu do Blues'),
    ('Elis Regina'),
    ('Queen'),
    ('Beyoncé');
    
      INSERT INTO SpotifyClone.albuns (album_nome, artista_id)
  VALUES
    ('I Put A Spell On You', 1),
    ('Somewhere Far Beyond', 2),
    ('QVVJFA?', 3),
    ('Vento de Maio', 4),
    ('Falso Brilhante', 4),
    ('Hot Space', 5),
    ('Jazz', 5),
    ('Renaissance', 6);

  INSERT INTO SpotifyClone.plano (plano_nome, plano_valor)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.musicas (musica_nome, musica_duracao, artista_id, album_id)
  VALUES
    ('Feeling Good', 100, 1, 1),
    ('The Bard’s Song', 244, 2, 2),
    ('Samba em Paris', 267, 3, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 4, 4),
    ('Como Nossos Pais', 105, 4, 5),
    ('Under Pressure', 152, 5, 6),
    ('Don’t Stop Me Now', 203, 5, 7),
    ('ALIEN SUPERSTAR', 116, 6, 8),
    ('VIRGO’S GROOVE', 369, 6, 8),
    ('BREAK MY SOUL', 279, 6, 8);

  INSERT INTO SpotifyClone.usuarios (usuario_nome, idade, plano_id, data_assinatura)
  VALUES
    ('Jorge Amado', 58, 4, DATE('2017-02-17')),
    ('Judith Butler', 45, 4, DATE('2020-05-13')),
    ('Christopher Alexander', 85, 4, DATE('2019-06-05')),
    ('Bell Hooks', 26, 3, DATE('2018-01-05')),
    ('Paulo Freire', 19, 3, DATE('2018-02-14')),
    ('Sandi Metz', 58, 2, DATE('2018-04-29')),
    ('Martin Fowler', 46, 2, DATE('2017-01-17')),
    ('Ada Lovelace', 37, 2, DATE('2017-12-30')),
    ('Robert Cecil Martin', 58, 1, DATE('2017-01-06')),
    ('Barbara Liskov', 82, 1, DATE('2019-10-20'));
    
      INSERT INTO SpotifyClone.reproducoes (usuario_id, musica_id, data_reproducao)
  VALUES
    (1, 8, '2015-12-13 08:30:22'),
    (2, 2, '2022-02-24 21:14:22'),
    (3, 7, '2012-03-17 14:56:41'),
    (4, 7, '2011-12-15 22:30:49'),
    (5, 10, '2017-10-12 12:35:20'),
    (5, 4, '2017-01-24 00:31:17'),
    (6, 6, '2020-08-06 15:23:43'),
    (6, 3, '2022-01-09 01:44:33'),
    (7, 3, '2021-08-15 17:10:10'),
    (8, 9, '2020-12-05 18:38:30'),
    (8, 1, '2020-11-13 16:55:13'),
    (9, 4, '2020-01-02 07:40:33'),
    (9, 1, '2022-08-05 08:05:17'),
    (10, 1, '2020-03-06 11:22:33'),
    (10, 9, '2020-05-02 05:30:35'),
    (10, 3, '2022-02-28 10:45:55');

INSERT INTO SpotifyClone.seguidores (usuario_id, artista_id)
  VALUES
    (1, 5),
    (2, 4),
    (4, 1),
    (5, 6),
    (5, 1),
    (6, 1),
    (6, 2),
    (7, 3),
    (8, 5),
    (9, 4),
    (9, 6),
    (10, 4),
    (10, 5),
    (10, 6);
