--------------------------------------------------------------------------------

-- Criação da tabela tb_produto
CREATE TABLE tb_produto (
    produto_id INTEGER,
    nome TEXT,
    tipo TEXT,
    preco REAL,
    descricao TEXT,
	PRIMARY KEY (produto_id AUTOINCREMENT)
);

-- Criação da tabela tb_mesa
CREATE TABLE tb_mesa (
    mesa_id INTEGER,
    numero TEXT,
    capacidade INTEGER,
	PRIMARY KEY (mesa_id AUTOINCREMENT)
);

-- Criação da tabela tb_cliente
CREATE TABLE tb_cliente (
    cliente_id INTEGER,
    nome TEXT,
    email TEXT,
    telefone TEXT,
	PRIMARY KEY (cliente_id AUTOINCREMENT)
);

-- Criação da tabela tb_pedido
CREATE TABLE tb_pedido (
    pedido_id INTEGER,
    mesa_id INTEGER,
    produto_id INTEGER,
    cliente_id INTEGER,
    quantidade INTEGER,
    total_pedido REAL,
	PRIMARY KEY (pedido_id AUTOINCREMENT),
    FOREIGN KEY (mesa_id) REFERENCES tb_mesa(mesa_id),
    FOREIGN KEY (produto_id) REFERENCES tb_produto(produto_id),
    FOREIGN KEY (cliente_id) REFERENCES tb_cliente(cliente_id)
);

--------------------------------------------------------------------------------

-- Inserção de registros tabela tb_produto

INSERT INTO tb_produto (nome, tipo, preco, descricao) VALUES 
('Risoto de Camarão', 'Prato', 45.90, 'Risoto cremoso com camarão e temperos especiais'),
('Bife à Parmegiana', 'Prato', 38.50, 'Bife empanado com queijo e molho de tomate'),
('Suco de Laranja', 'Bebida', 7.50, 'Suco natural de laranja'),
('Cerveja Artesanal', 'Bebida', 12.00, 'Cerveja local de fermentação natural'),
('Tiramisu', 'Sobremesa', 18.90, 'Sobremesa italiana com café e mascarpone'),
('Salada Caesar', 'Prato', 28.90, 'Salada com alface, croutons, frango e molho Caesar'),
('Água Mineral', 'Bebida', 4.50, 'Água sem gás, 500ml'),
('Espaguete à Carbonara', 'Prato', 39.90, 'Espaguete com molho cremoso, bacon e queijo'),
('Vinho Tinto', 'Bebida', 55.00, 'Vinho tinto seco, garrafa 750ml'),
('Pudim', 'Sobremesa', 15.90, 'Pudim tradicional com calda de caramelo');


-- Inserção de registros tabela tb_mesa
INSERT INTO tb_mesa (numero, capacidade) VALUES 
('M01', 2),
('M02', 4),
('M03', 2),
('M04', 6),
('M05', 4),
('M06', 10),
('M07', 2),
('M08', 4),
('M09', 6),
('M10', 8);


-- Inserção de registros tabela tb_cliente
INSERT INTO tb_cliente (nome, email, telefone) VALUES 
('Lucas Silva', 'lucas@email.com', '1234-5678'),
('Mariana Costa', 'mariana@email.com', '5678-1234'),
('Felipe Dias', 'felipe@email.com', '8765-4321'),
('Julia Martins', 'julia@email.com', '4321-8765'),
('Roberto Alves', 'roberto@email.com', '5555-6666'),
('Camila Souza', 'camila@email.com', '6666-5555'),
('Renato Oliveira', 'renato@email.com', '7777-8888'),
('Beatriz Santos', 'beatriz@email.com', '8888-7777'),
('Guilherme Lima', 'guilherme@email.com', '9999-1111'),
('Fernanda Rocha', 'fernanda@email.com', '1111-9999');


-- Inserção de registros tabela tb_pedido
INSERT INTO tb_pedido (mesa_id, produto_id, cliente_id, quantidade, total_pedido) VALUES 
(1, 1, 1, 1, 45.90),
(1, 3, 1, 15, 112.5),
(2, 2, 2, 2, 77.00),
(2, 6, 2, 40, 1156.00),
(3, 4, 3, 2, 24.00),
(4, 7, 4, 2, 9.00),
(5, 5, 5, 30, 567.00),
(6, 8, 6, 2, 79.80),
(7, 9, 7, 1, 55.00),
(8, 10, 8, 1, 15.90);


--------------------------------------------------------------------------------

-- Consulta de registros tabela tb_produto

SELECT * FROM tb_produto WHERE tipo = 'Bebida';
-- outro exemplo:
SELECT * FROM tb_produto WHERE tipo = 'Prato';
-- 
SELECT * FROM tb_produto WHERE tipo = 'Prato' OR 'Bebida';
--
SELECT sum(preco) FROM tb_produto WHERE tipo = 'Prato';
-- OU
SELECT total(preco) FROM tb_produto WHERE tipo = 'Prato';
--
SELECT * FROM tb_produto WHERE tipo = 'Prato' OR tipo = 'Bebida' ORDER BY tipo ASC;
SELECT * FROM tb_produto WHERE tipo = 'Prato' OR tipo = 'Bebida' ORDER BY tipo DESC;

----------------------------------------------

-- Consulta de registros tabela tb_mesa
SELECT * FROM tb_mesa WHERE numero = 'M03';
-- outro exemplo:
SELECT * FROM tb_mesa WHERE numero = 'M05';
-- Caso queira saber registros retornados entre 'M02' e 'M05':
SELECT * FROM tb_mesa WHERE numero BETWEEN 'M02' AND 'M05';
-- Caso queira saber quantos registros possui a tabela:
SELECT count() FROM tb_mesa;

----------------------------------------------

-- Consulta de registros tabela tb_produto
SELECT nome, tipo, preco FROM tb_produto;

-- Consulta de registros tabela tb_mesa
SELECT * FROM tb_mesa WHERE capacidade > 6;

-- Consulta INNER JOIN (sem tabela cliente)
SELECT 
    tb_produto.nome,
    tb_produto.tipo,
    tb_produto.preco,
    tb_mesa.numero,
    tb_mesa.capacidade,
    tb_pedido.pedido_id,
    tb_pedido.quantidade
FROM tb_pedido
INNER JOIN tb_produto 
	ON tb_pedido.produto_id = tb_produto.produto_id
INNER JOIN tb_mesa 
	ON tb_pedido.mesa_id = tb_mesa.mesa_id;


-- Consulta INNER JOIN (com tabela cliente)
SELECT 
    tb_produto.nome,
    tb_produto.tipo,
    tb_produto.preco,
    tb_cliente.nome,
    tb_mesa.numero,
    tb_mesa.capacidade,
    tb_pedido.pedido_id,
    tb_pedido.quantidade,
    tb_pedido.total_pedido
FROM tb_pedido
INNER JOIN tb_produto 
	ON tb_pedido.produto_id = tb_produto.produto_id
INNER JOIN tb_mesa 
	ON tb_pedido.mesa_id = tb_mesa.mesa_id
INNER JOIN tb_cliente 
	ON tb_pedido.cliente_id = tb_cliente.cliente_id;
WHERE tb_pedido.total_pedido > 30.0


-- Consulta INNER JOIN (ITEM 8)
SELECT 
    tb_produto.nome,
    tb_produto.tipo,
    tb_produto.preco,
    tb_cliente.nome,
    tb_mesa.numero,
    tb_mesa.capacidade,
    tb_pedido.pedido_id,
    tb_pedido.quantidade,
    tb_pedido.total_pedido
FROM tb_pedido
INNER JOIN tb_produto 
	ON tb_pedido.produto_id = tb_produto.produto_id
INNER JOIN tb_mesa 
	ON tb_pedido.mesa_id = tb_mesa.mesa_id
INNER JOIN tb_cliente 
	ON tb_pedido.cliente_id = tb_cliente.cliente_id
WHERE tb_pedido.total_pedido > 30.0;


-- Consulta INNER JOIN (ITEM 9)
SELECT 
    tb_produto.nome,
    tb_produto.tipo,
    tb_produto.preco,
    tb_cliente.nome,
    tb_mesa.numero,
    tb_mesa.capacidade,
    tb_pedido.pedido_id,
    tb_pedido.quantidade,
    tb_pedido.total_pedido
FROM tb_pedido
INNER JOIN tb_produto 
	ON tb_pedido.produto_id = tb_produto.produto_id
INNER JOIN tb_mesa 
	ON tb_pedido.mesa_id = tb_mesa.mesa_id
INNER JOIN tb_cliente 
	ON tb_pedido.cliente_id = tb_cliente.cliente_id
WHERE tb_pedido.quantidade > 20;


--------------------------------------------------------------------------------


-- Alteração de Tabela tb_produto
UPDATE tb_produto 
SET nome = 'Prato Especial 1', preco = 25.99 
WHERE produto_id = 1;

UPDATE tb_produto 
SET nome = 'Bebida Refrescante 2', preco = 7.50 
WHERE produto_id = 2;

UPDATE tb_produto 
SET nome = 'Sobremesa Deliciosa 3', preco = 12.00 
WHERE produto_id = 3;

UPDATE tb_produto 
SET nome = 'Prato Vegano 4', preco = 20.00 
WHERE produto_id = 4;

UPDATE tb_produto 
SET nome = 'Bebida Alcoólica 5', preco = 15.50 
WHERE produto_id = 5;

-- Alteração de Tabela tb_mesa

UPDATE tb_mesa 
SET numero = 'M11', capacidade = 4 
WHERE mesa_id = 1;

UPDATE tb_mesa 
SET numero = 'M12', capacidade = 6 
WHERE mesa_id = 2;

UPDATE tb_mesa 
SET numero = 'M13', capacidade = 4 
WHERE mesa_id = 3;

UPDATE tb_mesa 
SET numero = 'M14', capacidade = 8 
WHERE mesa_id = 4;

UPDATE tb_mesa 
SET numero = 'M15', capacidade = 4 
WHERE mesa_id = 5;

--------------------------------------------------------------------------------

DELETE FROM tb_pedido WHERE pedido_id = 1;
DELETE FROM tb_pedido WHERE pedido_id = 2;
DELETE FROM tb_pedido WHERE pedido_id = 3;
DELETE FROM tb_pedido WHERE pedido_id = 4;
DELETE FROM tb_pedido WHERE pedido_id = 5;


--------------------------------------------------------------------------------

DROP TABLE tb_pedido;
DROP TABLE tb_cliente;
DROP TABLE tb_produto;
DROP TABLE tb_mesa;







