/* pizzaria do ze: */
/* Este script possui:
   - Criação da Base
   - Criação das Tabelas
   - Criação das Constraints
   - Inserção dos dados em algumas tabelas

   Falta fazer:
   - As tabelas para criação das pizzas, sabores que vão em cada pizza, pedidos, itens dos pedidos e controle de pagamentos
   - Inserção dos dados das pizzas e pedidos
*/

create database pizzaria_ze;

use pizzaria_ze;

CREATE TABLE tb_enderecos (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100),
    bairro VARCHAR(50),
    cidade_id INT,
    cep VARCHAR(8)
);

CREATE TABLE cad_cidades (
    id_cidade INT PRIMARY KEY AUTO_INCREMENT,
    nome_cidade VARCHAR(50),
    uf_id INT
);

CREATE TABLE cad_uf (
    id_uf INT PRIMARY KEY AUTO_INCREMENT,
    nome_uf VARCHAR(30),
    pais_id INT
);

CREATE TABLE cad_paises (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nome_pais VARCHAR(45)
);

CREATE TABLE tb_funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_funcionario VARCHAR(45),
    cpf VARCHAR(11),
    senha VARCHAR(256),
    telefone VARCHAR(11),
    email VARCHAR(45),
    endereco_id INT,
    numero VARCHAR(10)
);

CREATE TABLE tb_clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(50),
    cpf VARCHAR(11) UNIQUE,
    telefone VARCHAR(11),
    email VARCHAR(45),
    endereco_id INT,
    sexo INT,
    numero VARCHAR(10)
);

CREATE TABLE cad_ingredientes (
    id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    descricao_ingrediente VARCHAR(100) UNIQUE
);

CREATE TABLE tb_sabores (
    id_sabor INT PRIMARY KEY AUTO_INCREMENT,
    descricao_sabor VARCHAR(50) UNIQUE,
    foto BLOB,
    categoria CHAR(1),
    valor_sabor DECIMAL(11,2),
    tipo CHAR(1)
);

CREATE TABLE tb_sabores_ingredientes (
    id_itens_sabor INT PRIMARY KEY AUTO_INCREMENT,
    ingrediente_id INT,
    sabor_id INT
);

CREATE TABLE cad_produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    descricao_produto VARCHAR(45),
    valor_produto DECIMAL(11,2),
    tipo CHAR(1)
);
 
CREATE TABLE tb_pizzas (
id_pizza INT PRIMARY KEY AUTO_INCREMENT,
tamanho CHAR(1),
valor_tamanho DECIMAL(11,2)
);

CREATE TABLE sabores_pizza (
id_sabor_pizza INT PRIMARY KEY AUTO_INCREMENT,
pizza_id INT,
sabor_id INT
);

CREATE TABLE pedido (
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
cliente_id INT,
funcionario_id INT,
data_pedido DATE,
valor_pedido DECIMAL(11,2)
);

CREATE TABLE pizzas_pedido (
id_pizzas_pedido INT PRIMARY KEY AUTO_INCREMENT,
pedido_id INT,
pizza_id INT,
pizza_sabor_id INT
);

CREATE TABLE itens_pedido (
id_itens_pedido INT PRIMARY KEY AUTO_INCREMENT,
pedido_id INT,
produto_id INT
);


    
ALTER TABLE pizzas_pedido ADD CONSTRAINT FK_pizza_pedido
    FOREIGN KEY (pizza_id)
    REFERENCES tb_pizzas(id_pizza);
    
ALTER TABLE pizzas_pedido ADD CONSTRAINT fk_pedido_pizza
    FOREIGN KEY (pedido_id)
    REFERENCES pedido(id_pedido);
    
ALTER TABLE itens_pedido ADD CONSTRAINT fk_pedido_itens
    FOREIGN KEY (pedido_id)
    REFERENCES pedido(id_pedido);

ALTER TABLE itens_pedido ADD CONSTRAINT
    FOREIGN KEY (produto_id)
    REFERENCES cad_produtos(id_produto);

ALTER TABLE pedido ADD CONSTRAINT
    FOREIGN KEY (cliente_id)
    REFERENCES tb_clientes(id_cliente);

ALTER TABLE pedido ADD CONSTRAINT
    FOREIGN KEY (funcionario_id)
    REFERENCES tb_funcionarios(id_funcionario);

ALTER TABLE sabores_pizza ADD CONSTRAINT
    FOREIGN KEY (pizza_id)
    REFERENCES tb_pizzas(id_pizza);

ALTER TABLE pizzas_pedido ADD CONSTRAINT
    FOREIGN KEY (pizza_sabor_id)
    REFERENCES sabores_pizza(id_sabor_pizza);

ALTER TABLE sabores_pizza ADD CONSTRAINT
    FOREIGN KEY (sabor_id)
    REFERENCES tb_sabores(id_sabor);
    
ALTER TABLE tb_enderecos ADD CONSTRAINT FK_endereco_cidade
    FOREIGN KEY (cidade_id)
    REFERENCES cad_cidades (id_cidade);
 
ALTER TABLE cad_cidades ADD CONSTRAINT FK_cidade_uf
    FOREIGN KEY (uf_id)
    REFERENCES cad_uf (id_uf);
 
ALTER TABLE cad_uf ADD CONSTRAINT FK_uf_pais
    FOREIGN KEY (pais_id)
    REFERENCES cad_paises (id_pais);
 
ALTER TABLE tb_funcionarios ADD CONSTRAINT FK_funcionario_endereco
    FOREIGN KEY (endereco_id)
    REFERENCES tb_enderecos (id_endereco);
 
ALTER TABLE tb_clientes ADD CONSTRAINT FK_cliente_endereco
    FOREIGN KEY (endereco_id)
    REFERENCES tb_enderecos (id_endereco);
 
ALTER TABLE tb_sabores_ingredientes ADD CONSTRAINT FK_itens_sabores
    FOREIGN KEY (ingrediente_id)
    REFERENCES cad_ingredientes (id_ingrediente);
 
ALTER TABLE tb_sabores_ingredientes ADD CONSTRAINT FK_iten_sabor
    FOREIGN KEY (sabor_id)
    REFERENCES tb_sabores (id_sabor);

-----------------------------------------
-----------------------------------------


INSERT INTO cad_paises (nome_pais) VALUES ('Brasil');

INSERT INTO cad_uf (nome_uf, pais_id) VALUES ('Santa Catarina', 1);

INSERT INTO cad_cidades (nome_cidade, uf_id)
VALUES ('Lages', 1), ('Sao Joaquim', 1), ('Urubici', 1), ('Florianópolis', 1),  ('Joinville', 1),('Blumenau', 1),('Criciúma', 1),('Chapecó', 1),('Itajaí', 1);

INSERT INTO tb_enderecos (logradouro, bairro, cidade_id, cep) VALUES
('Rua Correia Pinto', 'Centro', 7, '88500300'),
('Rua Verdes Campos', 'Coral', 5, '88500500'),
('Rua Coronel Córdova', 'Centro', 3, '89000000'),
('Rua do centro', 'Centro', 2, '87000000'),
('Av. Belisário Ramos', 'Centro', 4, '88500300'),
('Rua 31 de março', 'Guarujá', 3, '88507000'),
('Avenida das Palmeiras', 'Jardim Primavera', 1, '88600200'),
('Rua dos Ipês', 'Bela Vista', 1, '88500400'),
('Travessa do Comércio', 'Centro', 3, '89250000'),
('Rua da Amizade', 'Vila Esperança', 9, '87002000'),
('Avenida das Flores', 'Jardim Botânico', 8, '88500700'),
('Rua das Acácias', 'Balneário', 6, '88520700');

INSERT INTO tb_funcionarios (nome_funcionario, cpf, senha, telefone, email, endereco_id, numero)
VALUES
    ('João Silva', '12345678901', 'hash_senha_1', '123432789', 'joao@example.com', 1, '123'),
    ('Maria Oliveira', '23456789012', 'hash_senha_2', '287654321', 'maria@example.com', 2, '456'),
    ('Carlos Santos', '34567890123', 'hash_senha_3', '151222333', 'carlos@example.com', 3, '789'),
    ('Ana Souza', '45678901234', 'hash_senha_4', '555662777', 'ana@example.com', 4, '1011'),
    ('Paulo Lima', '56789012345', 'hash_senha_5', '444575666', 'paulo@example.com', 5, '1213'),
    ('Fernanda Santos', '67890123456', 'hash_senha_6', '999688777', 'fernanda@example.com', 6, '1415'),
    ('Lucas Oliveira', '78901234567', 'hash_senha_7', '333232111', 'lucas@example.com', 7, '1617'),
    ('Mariana Silva', '89012345678', 'hash_senha_8', '777889999', 'mariana@example.com', 8, '1819');

INSERT INTO tb_clientes (nome_cliente, cpf, telefone, email, endereco_id, sexo, numero)
VALUES
    ('Ana Souza', '12345628901', '987654321', 'ana@example.com', 1, 2, '123'),
    ('Carlos Santos', '23256789012', '111422333', 'carlos@example.com', 2, 1, '456'),
    ('Mariana Lima', '34537890123', '555636777', 'mariana@example.com', 3, 2, '789'),
    ('Fernando Oliveira', '55678901234', '499888777', 'fernando@example.com', 4, 1, '1011'),
    ('Lucas Oliveira', '56779012345', '444355666', 'lucas@example.com', 5, 1, '1213'),
    ('Gabriela Santos', '67890123456', '992888777', 'gabriela@example.com', 6, 2, '1415'),
    ('Pedro Lima', '78901232567', '333222111', 'pedro@example.com', 7, 1, '1617'),
    ('Juliana Silva', '89013345678', '777828999', 'juliana@example.com', 8, 2, '1819'),
	('Roberto Silva', '90124456789', '111262333', 'roberto@example.com', 1, 1, '222'),
    ('Amanda Oliveira', '01634567890', '447555666', 'amanda@example.com', 2, 2, '333'),
    ('Felipe Santos', '12341678911', '777888999', 'felipe@example.com', 3, 1, '444'),
    ('Laura Lima', '23456782012', '999888757', 'laura@example.com', 4, 2, '555'),
	('Carlos Fernandes', '30567890123', '323222111', 'carlos@example.com', 5, 1, '666'),
    ('Camila Silva', '45678001234', '555661777', 'camila@example.com', 6, 2, '777'),
    ('Rafael Oliveira', '56089012345', '996888777', 'rafael@example.com', 7, 1, '888'),
    ('Isabel Lima', '67890103456', '777888999', 'isabel@example.com', 8, 2, '999');

INSERT INTO cad_ingredientes (id_ingrediente, descricao_ingrediente) VALUES (1, 'Queijo muzzarela'), (2, 'Queijo parmesão'), (3, 'Queijo gorgonzola'), (4, 'Azeitona'), (5, 'Milho'), (6, 'Frango'), (7, 'Filezinho'), (8, 'Batata palha'), (9, 'Calabresa'), (10,'Tomate'), (11, 'Brócolis'), (12, 'Bacon'), (13, 'Presunto'), (14, 'Camarão'), (15, 'Ovo'), (16, 'Bacalhau Desfiado'), (17, 'Chocolate'), (18, 'Bombom'), (19, 'Morango'), (20, 'Salmão'), (21, 'Queijo catupiry'), (22, 'Molho de Tomate'), (23, 'Mangericão'), (24, 'Leite Condensado');

INSERT INTO tb_sabores (descricao_sabor, categoria, valor_sabor, tipo)
VALUES ('Sabor Calabresa', 'N', 10, 'S'), ('Sabor Portuguesa', 'N', 10, 'S'), ('Sabor Muçarela', 'N', 10, 'S'), ('Sabor Marguerita', 'N', 10, 'S'), ('Sabor Quatro Queijos', 'N', 15, 'S'), ('Sabor Frango com Catupiry', 'N', 15, 'S'), ('Sabor Salmão', 'E', 25, 'S'), ('Sabor brócolis com bacon', 'N', 35, 'S'), ('Sabor bacon', 'N', 10, 'S'),('Sabor Morango com Chocolate', 'N', 10, 'D'),('Sabor Brigadeiro', 'N', 10, 'D'),('Sabor Chocolate com Bombom', 'N', 10, 'D'), ('Sabor Strogonoff de carne', 'N', 10, 'S'), ('Sabor Camarão', 'E', 25, 'S'), ('Sabor Bacalhau', 'E', 25, 'S');

INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (9,1);  #calabresa
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,1);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (22,1);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,2);  #portuguesa
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (4,2);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (15,2);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (5,2);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (13,2);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,3);   #muçarela
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (22,3);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (10,3);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (22,4);  #marguerita
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (23,4);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,4);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,5);  #quatro queijos
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (2,5);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (3,5);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,6);   #frango com catupiry
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (21,6);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (6,6);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,7);   #salmao
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (20,7);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,8);   #brocolis com bacon
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (11,8);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (12,8);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,9);   #bacon
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (12,9);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (17,10);  #morango com chocolate
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (19,10);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (24,11);  #brigadeiro
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (17,11);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (18,12);  #Bombom com chocolate
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (17,12);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (7,13);   #strogonoff de carne
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (8,13);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,13);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,14);   #camarão
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (22,14);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (14,14);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (1,15);   #bacalhau
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (10,15);
INSERT INTO tb_sabores_ingredientes (ingrediente_id, sabor_id) VALUES (16,15);


INSERT INTO cad_produtos (descricao_produto, valor_produto, tipo)
VALUES
    ('Refrigerante Coca-Cola', 5.99, 'B'),
    ('Água Mineral', 2.50, 'B'),
    ('Salada Mista', 12.99, 'A'),
    ('Sobremesa Cheesecake', 8.99, 'A'),
    ('Cerveja Artesanal', 8.99, 'B'),
    ('Caipirinha', 12.99, 'B'),
    ('Vinho Tinto', 25.99, 'B');
    
INSERT INTO tb_pizzas (tamanho, valor_tamanho)
VALUES
    ('P', 20.00),
    ('M', 25.00),
    ('G', 30.00);

INSERT INTO sabores_pizza (pizza_id, sabor_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (1, 2),
    (2, 2),
    (3, 2),
    (1, 3),
    (2, 3),
    (3, 3),
    (1, 4),
    (2, 4),
    (3, 4),
    (1, 5),
    (2, 5),
    (3, 5),
    (1, 6),
    (2, 6),
    (3, 6),
	(1, 7), -- Pizza pequena de Salmão
    (2, 7), -- Pizza média de Salmão
    (3, 7), -- Pizza grande de Salmão
    (1, 8), -- Pizza pequena de Brócolis com Bacon
    (2, 8), -- Pizza média de Brócolis com Bacon
    (3, 8), -- Pizza grande de Brócolis com Bacon
    (1, 9), -- Pizza pequena de Bacon
    (2, 9), -- Pizza média de Bacon
    (3, 9), -- Pizza grande de Bacon
    (1, 10), -- Pizza pequena de Morango com Chocolate
    (2, 10), -- Pizza média de Morango com Chocolate
    (3, 10), -- Pizza grande de Morango com Chocolate
    (1, 11), -- Pizza pequena de Brigadeiro
    (2, 11), -- Pizza média de Brigadeiro
    (3, 11), -- Pizza grande de Brigadeiro
    (1, 12), -- Pizza pequena de Bombom com Chocolate
    (2, 12), -- Pizza média de Bombom com Chocolate
    (3, 12), -- Pizza grande de Bombom com Chocolate
    (1, 13), -- Pizza pequena de Strogonoff de Carne
    (2, 13), -- Pizza média de Strogonoff de Carne
    (3, 13), -- Pizza grande de Strogonoff de Carne
    (1, 14), -- Pizza pequena de Camarão
    (2, 14), -- Pizza média de Camarão
    (3, 14), -- Pizza grande de Camarão
    (1, 15), -- Pizza pequena de Bacalhau
    (2, 15), -- Pizza média de Bacalhau
    (3, 15); -- Pizza grande de Bacalhau

INSERT INTO pedido (cliente_id, funcionario_id, data_pedido)
VALUES
    (1, 1, '2023-01-01'),
    (12, 2, '2023-01-02'),
    (3, 3, '2023-01-03'),
    (12, 4, '2023-01-04'),
    (5, 5, '2023-01-05'),
    (8, 6, '2023-01-06'),
    (7, 7, '2023-01-07'),
    (8, 8, '2023-01-08'),
    (9, 4, '2023-01-09'),
    (16, 2, '2023-01-10'),
    (11, 6, '2023-01-11'),
    (12, 1, '2023-01-12'),
    (13, 5, '2023-01-13'),
    (8, 7, '2023-01-14'),
    (15, 3, '2023-01-15'),
	(1, 1, '2023-02-01'),
    (2, 2, '2023-02-02'),
    (3, 3, '2023-02-03'),
    (4, 4, '2023-02-04'),
    (5, 5, '2023-02-05'),
    (6, 6, '2023-02-06'),
    (7, 7, '2023-02-07'),
    (8, 8, '2023-02-08'),
    (9, 4, '2023-02-09'),
    (10, 8, '2023-02-10'),
    (11, 1, '2023-02-11'),
    (12, 2, '2023-02-12'),
    (13, 3, '2023-02-13'),
    (10, 4, '2023-02-14'),
    (12, 5, '2023-02-15');

INSERT INTO pizzas_pedido (pedido_id, pizza_sabor_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 1),
    (12, 2),
    (13, 3),
    (14, 4),
    (15, 5),
    (16, 6),
    (17, 7),
    (18, 8),
    (19, 9),
    (20, 10),
    (21, 1),
    (22, 2),
    (23, 3),
    (24, 4),
    (25, 5),
    (26, 6),
    (11, 1),
	(12, 2),
	(13, 3),
	(14, 4),
	(15, 5),
	(16, 6),
	(17, 7),
	(18, 8),
	(19, 9),
	(1, 10),
	(2, 1),
	(3, 2),
	(5, 3),
	(8, 4),
	(25, 5),
	(26, 6),
	(27, 15),
	(28, 22),
	(29, 7),
	(30, 18),
	(8, 5),
	(27, 15), 
	(28, 22),
	(29, 7), 
	(24, 18), 
	(12, 5);
    
INSERT INTO itens_pedido (pedido_id, produto_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 3),
    (9, 4),
	(17, 1),
    (12, 2),
    (25, 3),
    (21, 4),
    (20, 5),
    (6, 6);
