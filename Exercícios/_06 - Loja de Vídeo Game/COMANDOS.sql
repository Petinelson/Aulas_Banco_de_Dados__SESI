-----------------------------------------------------------------
	-- TABELAS

CREATE TABLE "tb_plataforma" (
    cod_plataforma INTEGER,
    nome TEXT NOT NULL,
    fabricante TEXT NOT NULL,
	PRIMARY KEY("cod_plataforma" AUTOINCREMENT)
);

CREATE TABLE "tb_jogo" (
    cod_jogo INTEGER,
    titulo TEXT NOT NULL,
    genero TEXT NOT NULL,
    lancamento DATE NOT NULL,
    cod_plataforma INTEGER NOT NULL,
    PRIMARY KEY("cod_jogo" AUTOINCREMENT),
    FOREIGN KEY("cod_plataforma") REFERENCES "tb_plataforma"("cod_plataforma")
);

---------------------------------------------------------------

	-- REGISTROS
	
INSERT INTO "tb_plataforma" (nome, fabricante) VALUES
('PlayStation 5', 'Sony'),
('Xbox Series X', 'Microsoft'),
('Nintendo Switch', 'Nintendo'),
('PlayStation 4', 'Sony'),
('Xbox One', 'Microsoft'),
('Wii U', 'Nintendo'),
('PlayStation 3', 'Sony'),
('Xbox 360', 'Microsoft'),
('Nintendo Wii', 'Nintendo'),
('PlayStation 2', 'Sony');


INSERT INTO "tb_jogo" (titulo, genero, lancamento, cod_plataforma) VALUES
('Demon’s Souls', 'RPG', '2020-11-12', 1),
('Ratchet & Clank: Rift Apart', 'Ação/Aventura', '2021-06-11', 1),
('Halo Infinite', 'FPS', '2021-12-08', 2),
('Forza Horizon 5', 'Corrida', '2021-11-09', 2),
('The Legend of Zelda: Breath of the Wild', 'Ação/Aventura', '2017-03-03', 3),
('Animal Crossing: New Horizons', 'Simulação', '2020-03-20', 3),
('God of War', 'Ação/Aventura', '2018-04-20', 4),
('Horizon Zero Dawn', 'RPG', '2017-02-28', 4),
('Gears of War 4', 'Tiro', '2016-10-11', 5),
('Forza Motorsport 7', 'Corrida', '2017-10-03', 5),
('The Legend of Zelda: Wind Waker HD', 'Ação/Aventura', '2013-09-20', 6),
('Super Mario 3D World', 'Plataforma', '2013-11-21', 6),
('The Last of Us', 'Ação/Aventura', '2013-06-14', 7),
('Uncharted 3: Drake’s Deception', 'Ação/Aventura', '2011-11-01', 7),
('Halo 4', 'FPS', '2012-11-06', 8),
('Gears of War 3', 'Tiro', '2011-09-20', 8),
('The Legend of Zelda: Skyward Sword', 'Ação/Aventura', '2011-11-18', 9),
('Wii Sports Resort', 'Esporte', '2009-06-25', 9),
('Gran Turismo 4', 'Corrida', '2004-12-28', 10),
('God of War II', 'Ação/Aventura', '2007-03-13', 10);


---------------------------------------------------------------

	-- CONSULTAS
	
SELECT 
    tb_jogo.titulo, 
    tb_jogo.genero, 
    tb_jogo.lancamento, 
    tb_plataforma.nome AS nome_plataforma, 
    tb_plataforma.fabricante
FROM 
    tb_jogo
INNER JOIN 
    tb_plataforma
ON 
    tb_jogo.cod_plataforma = tb_plataforma.cod_plataforma;
	

	-- CONSULTA COM WHERE

SELECT 
    tb_jogo.titulo, 
    tb_jogo.genero, 
    tb_jogo.lancamento, 
    tb_plataforma.nome AS nome_plataforma, 
    tb_plataforma.fabricante
FROM 
    tb_jogo
INNER JOIN 
    tb_plataforma
ON 
    tb_jogo.cod_plataforma = tb_plataforma.cod_plataforma 
WHERE
	tb_jogo.genero = "RPG";
	
-- OU 

SELECT 
    tb_jogo.titulo, 
    tb_jogo.genero, 
    tb_jogo.lancamento, 
    tb_plataforma.nome AS plataforma, 
    tb_plataforma.fabricante
FROM 
    tb_jogo
INNER JOIN 
    tb_plataforma
ON 
    tb_jogo.cod_plataforma = tb_plataforma.cod_plataforma 
WHERE
	plataforma = "PlayStation 5";
	
UPDATE tb_jogo
SET lancamento = "2023-12-12"
WHERE cod_jogo = 1;

UPDATE tb_jogo
SET lancamento = "2023-12-12"
WHERE cod_jogo = 2;

UPDATE tb_jogo
SET lancamento = "2023-12-12"
WHERE cod_jogo = 3;

UPDATE tb_jogo
SET lancamento = "2023-12-12"
WHERE cod_jogo = 4;

--------------------------------------------------------------------

DELETE FROM tb_jogo WHERE cod_jogo = 1;
DELETE FROM tb_jogo WHERE cod_jogo = 2;
DELETE FROM tb_jogo WHERE cod_jogo = 3;
DELETE FROM tb_jogo WHERE cod_jogo = 4;