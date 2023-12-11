-----------------------------------------------------------------
	-- TABELAS


CREATE TABLE "tb_cliente" (
    "cliente_id" INTEGER,
    "nome" TEXT NOT NULL,
    "cnh" TEXT,
    "telefone" TEXT,
	PRIMARY KEY ("cliente_id" AUTOINCREMENT)
);

CREATE TABLE "tb_veiculo" (
    "veiculo_id" INTEGER,
    "modelo" TEXT NOT NULL,
    "ano" INTEGER NOT NULL,
    "placa" TEXT NOT NULL,
    "disponibilidade" TEXT NOT NULL,
	PRIMARY KEY ("veiculo_id" AUTOINCREMENT)
);


CREATE TABLE "tb_aluguel" (
    "aluguel_id" INTEGER,
    "cliente_id" INTEGER NOT NULL,
    "veiculo_id" INTEGER NOT NULL,
    "data_inicio" DATE NOT NULL,
    "data_fim" DATE NOT NULL,
    FOREIGN KEY ("cliente_id") REFERENCES "tb_cliente"("cliente_id"),
    FOREIGN KEY ("veiculo_id") REFERENCES "tb_veiculo"("veiculo_id"),
	PRIMARY KEY ("aluguel_id" AUTOINCREMENT)
);



---------------------------------------------------------------

	-- REGISTROS
	
INSERT INTO "tb_cliente" ("nome", "cnh", "telefone")
VALUES 
('João Silva', '12345678901', '12345-6789'),
('Maria Oliveira', '12345678902', '12345-6790'),
('Pedro Alves', '12345678903', '12345-6791'),
('Ana Pereira', '12345678904', '12345-6792'),
('Bruno Costa', '12345678905', '12345-6793'),
('Carla Martins', '12345678906', '12345-6794'),
('Fernando Souza', '12345678907', '12345-6795'),
('Gabriela Santos', '12345678908', '12345-6796'),
('Henrique Lima', '12345678909', '12345-6797'),
('Isabela Fernandes', '12345678910', '12345-6798');

INSERT INTO "tb_veiculo" ("modelo", "ano", "placa", "disponibilidade")
VALUES 
('Fiat Uno', 2015, 'ABC-1234', 'disponível'),
('Volkswagen Gol', 2018, 'DEF-5678', 'disponível'),
('Ford Ka', 2019, 'GHI-9012', 'disponível'),
('Chevrolet Onix', 2020, 'JKL-3456', 'alugado'),
('Honda Civic', 2017, 'MNO-7890', 'disponível'),
('Toyota Corolla', 2021, 'PQR-1234', 'alugado'),
('Hyundai HB20', 2022, 'STU-5678', 'disponível'),
('Renault Sandero', 2016, 'VWX-9012', 'disponível'),
('Nissan Versa', 2020, 'YZA-3456', 'disponível'),
('Peugeot 208', 2018, 'BCD-7890', 'alugado');

INSERT INTO "tb_aluguel" ("cliente_id", "veiculo_id", "data_inicio", "data_fim")
VALUES 
(1, 2, '2023-09-01', '2023-09-10'),
(2, 3, '2023-09-03', '2023-09-17'),
(3, 4, '2023-09-05', '2023-09-20'),
(4, 5, '2023-09-08', '2023-09-18'),
(5, 6, '2023-09-10', '2023-09-24'),
(6, 7, '2023-09-12', '2023-09-26'),
(7, 8, '2023-09-15', '2023-09-29'),
(8, 9, '2023-09-18', '2023-09-30'),
(9, 10, '2023-09-20', '2023-09-27'),
(10, 1, '2023-09-22', '2023-09-28'),
(3, 7, '2023-10-01', '2023-10-11'),
(6, 2, '2023-10-03', '2023-10-15'),
(9, 5, '2023-10-06', '2023-10-20'),
(2, 8, '2023-10-09', '2023-10-19'),
(7, 1, '2023-10-11', '2023-10-21'),
(1, 9, '2023-10-13', '2023-10-23'),
(4, 6, '2023-10-16', '2023-10-26'),
(8, 3, '2023-10-18', '2023-10-28'),
(5, 10, '2023-10-20', '2023-10-30'),
(10, 4, '2023-10-22', '2023-11-01');




---------------------------------------------------------------

	-- CONSULTAS - tb_cliente
	
SELECT 
	*
FROM 
    tb_cliente
;
------------------------------------
SELECT 
	*
FROM 
    tb_cliente
WHERE
	telefone = "12345-6792"
;
------------------------------------
SELECT 
	*
FROM 
    tb_cliente
WHERE
	cnh = "12345678909"
;
------------------------------------
SELECT 
	nome, cnh
FROM 
    tb_cliente
;
---------------------------------------------------------------

	-- CONSULTA - tb_veiculo

SELECT 
    *
FROM 
    tb_veiculo
;
------------------------------------
SELECT 
    *
FROM 
    tb_veiculo
WHERE
	ano = "2022"
;
------------------------------------
SELECT 
    *
FROM 
    tb_veiculo
WHERE
	veiculo_id = 3
;
------------------------------------
SELECT 
    *
FROM 
    tb_veiculo
WHERE
	disponibilidade = "alugado"
;
---------------------------------------------------------------

	-- CONSULTA - tb_aluguel
	
SELECT
	tb_cliente.nome,
	tb_cliente.cnh,
	tb_veiculo.modelo,
	tb_veiculo.placa,
	tb_veiculo.disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_inicio,
	tb_aluguel.data_fim
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
;

------------------------------------

SELECT
	tb_cliente.nome,
	tb_cliente.cnh,
	tb_veiculo.modelo,
	tb_veiculo.placa,
	tb_veiculo.disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_inicio,
	tb_aluguel.data_fim
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
WHERE
	tb_veiculo.disponibilidade = "alugado"
;

------------------------------------

SELECT
	tb_cliente.nome,
	tb_cliente.cnh,
	tb_veiculo.modelo,
	tb_veiculo.placa,
	tb_veiculo.disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_inicio,
	tb_aluguel.data_fim
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
WHERE
	tb_veiculo.disponibilidade = "disponível"
;

---------------------------------------------------------------
	-- ALTERACAO - tb_cliente
	
UPDATE tb_cliente
SET telefone = "99887-6798"
WHERE cliente_id = 1;

UPDATE tb_cliente
SET telefone = "99887-6799"
WHERE cliente_id = 2;

UPDATE tb_cliente
SET telefone = "99887-6898"
WHERE cliente_id = 3;

UPDATE tb_cliente
SET telefone = "99887-6998"
WHERE cliente_id = 4;

UPDATE tb_cliente
SET telefone = "99887-8798"
WHERE cliente_id = 5;

---------------------------------------------------------------
	-- ALTERACAO - tb_veiculo
	
UPDATE tb_veiculo
SET disponibilidade = "alugado"
WHERE veiculo_id = 1 OR veiculo_id = 2 OR veiculo_id = 7 OR veiculo_id = 8 OR veiculo_id = 9;

---------------------------------------------------------------
	-- ALTERACAO - tb_aluguel
	
DELETE FROM tb_aluguel WHERE aluguel_id = 1;