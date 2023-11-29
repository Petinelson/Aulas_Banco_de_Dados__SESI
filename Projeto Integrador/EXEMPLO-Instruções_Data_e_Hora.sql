-- EXEMPLO COM CAMPOS DATAS

-- Criar uma tabela PAGAMENTOS
CREATE TABLE tb_pagamentos (
    id INTEGER,
    nome TEXT,
    data_pagamento_previsto TEXT, -- SQLite usa TEXT para datas no formato 'YYYY-MM-DD'
    data_pagamento_realizado TEXT,
    PRIMARY KEY (id AUTOINCREMENT)
);

-- 	Observação
--	Embora o SQLite não tenha um tipo de dado nativo para data, ele permite armazenar datas como texto no formato 'YYYY-MM-DD'. Assim, os campos data_pagamento_previsto e data_pagamento_realizado também são definidos como TEXT.

-----------------------------------------------

-- Vamos popular TABELA tb_pagamentos com registros aleatórios (UMA FORMA DE INSERIR REGISTROS)

INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Alice Silva', '2023-01-10', '2023-01-15');
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Bruno Costa', '2023-02-05', '2023-02-07');
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Carlos Pereira', '2023-02-20', '2023-02-22');
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Daniela Gomes', '2023-03-01', NULL); -- Ainda não pagou
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Eduardo Santos', '2023-03-15', '2023-03-18');
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Fernanda Lima', '2023-04-01', '2023-04-05');
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Gabriel Souza', '2023-04-10', NULL); -- Ainda não pagou
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Heloísa Rocha', '2023-05-05', '2023-05-10');
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Igor Neves', '2023-05-20', '2023-05-25');
INSERT INTO tb_pagamentos (nome, data_pagamento_previsto, data_pagamento_realizado) VALUES ('Júlia Martins', '2023-06-01', '2023-06-23');

-----------------------------------------------

-- Consultar Dados  referente a data

SELECT 
    nome,
    data_pagamento_previsto,
    data_pagamento_realizado,
    julianday(data_pagamento_realizado) - julianday(data_pagamento_previsto) AS dias_diferenca
FROM tb_pagamentos
WHERE nome = 'Júlia Martins';

-- Será calculado a quantidade de dias (dias_diferenca)
-- A função SQLite utilizada para calcular a diferença de datas é JULIANDAY

-----------------------------------------------

-- Temos outras maneiras de trabalhar datas:

-- strftime():É uma das mais versáteis para datas no SQLite. Ela pode ser usada para extrair partes de uma data ou formatar datas.
-- EXEMPLO:
SELECT nome, strftime('%Y', data_pagamento_previsto) AS Ano_Previsto FROM tb_pagamentos;

--	Letras utilizadas:
--	%Y: Ano com quatro dígitos.
--	%y: Ano com dois últimos dígitos.
--	%m: Mês como um número decimal (01-12).
--	%d: Dia do mês como número decimal (01-31).
--	%H: Hora (00-24).
--	%M: Minuto (00-59).
--	%S: Segundos (00-59).
--	%w: Dia da semana como um número decimal, onde 0 é domingo e 6 é sábado.
--	%j: Dia do ano (001-366).
--	%W: Semana do ano (00-53), onde segunda-feira é considerada o primeiro dia da semana.
--	%s: O número de segundos desde 1970-01-01 00:00:00 UTC (conhecido como Unix time ou epoch time).


-- weekday(): Retorna o dia da semana de uma data, onde 0 é domingo e 6 é sábado.
-- EXEMPLO:
SELECT nome, strftime('%w', data_pagamento_realizado) AS Dia_Semana_Realizado FROM tb_pagamentos;

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------


-- EXEMPLO COM CAMPOS HORAS E MINUTOS
-- Criar uma tabela Permanencia de Veiculos

CREATE TABLE tb_veiculo_permanencia (
    id INTEGER,
    placa TEXT,
    hora_entrada TEXT,
    hora_saida TEXT,
	PRIMARY KEY (id AUTOINCREMENT)
);


-- Vamos popular TABELA tb_veiculo_permanencia com registros aleatórios (OUTRA FORMA DE INSERIR REGISTROS)

INSERT INTO tb_veiculo_permanencia (placa, hora_entrada, hora_saida) VALUES 
('ABC-1234', '08:15:00', '10:20:00'),
('XYZ-9876', '09:05:00', '12:25:00'),
('LMN-4567', '10:45:00', '14:30:00'),
('OPQ-8520', '11:10:00', '16:05:00'),
('RST-3691', '11:55:00', '17:45:00'),
('GHI-7890', '12:30:00', '18:10:00'),
('JKL-2468', '13:15:00', '18:40:00'),
('DEF-1357', '14:05:00', '19:20:00'),
('UVW-8025', '15:00:00', '20:00:00'),
('CDE-6473', '15:45:00', '21:15:00');

-----------------------------------------------
-- Utilizando 

SELECT 
    placa,
    (strftime('%H', hora_saida) - strftime('%H', hora_entrada)) AS HORAS,
    (strftime('%M', hora_saida) - strftime('%M', hora_entrada)) AS MINUTOS
FROM 
    tb_veiculo_permanencia
WHERE 
    placa = 'XYZ-9876';
	
	
-- Utilizando ROUND (para obtermos total de minutos)
-- ROUND (é uma função SQL que arredonda um número especificado de casas decimais. Em muitos sistemas de banco de dados, incluindo o SQLite, você pode especificar dois argumentos para esta função: o número que você deseja arredondar e o número de casas decimais.)

SELECT 
    placa,
    ROUND((julianday(hora_saida) - julianday(hora_entrada)) * 24 * 60) AS total_minutes
FROM 
    tb_veiculo_permanencia
WHERE 
    placa = 'CDE-6473';