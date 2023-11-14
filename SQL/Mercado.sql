CREATE DATABASE mercado_db;

CREATE TABLE tb_clientes (
	id_cliente INT PRIMARY KEY,
	nome VARCHAR(50)
	);
CREATE TABLE tb_funcionarios (
	id_funcionario INT PRIMARY KEY,
	cargo VARCHAR(20)
	);
CREATE TABLE tb_fornecedores (
	id_fornecedor INT PRIMARY KEY,
	telefone VARCHAR(20)
	);
CREATE TABLE tb_estoque (
	id_estoque INT PRIMARY KEY,
	quantidade_estoque INT
	);
CREATE TABLE tb_produtos (
	id_produto INT PRIMARY KEY,
	estoque_id INT,
	fornecedor_id INT,
	descricao VARCHAR(20),
	preco DECIMAL(11,2)
	);
CREATE TABLE tb_vendas (
	id_venda INT PRIMARY KEY,
	funcionario_id INT,
	cliente_id INT,
	valor_total DECIMAL(11,2)
	);
CREATE TABLE tb_vendas_itens (
	id_venda_itens INT PRIMARY KEY,
	produto_id INT,
	venda_id INT,
	valor DECIMAL(11,2),
	quantidade INT
	);
	
AFTER TABLE tb_vendas
ADD FOREIGN KEY (funcionario_id)
REFERENCES tb_funcionarios(id_funcionario);

AFTER TABLE tb_vendas
ADD FOREIGN KEY (cliente_id)
REFERENCES tb_clientes(id_cliente);

AFTER TABLE tb_vendas_itens
ADD FOREIGN KEY (produto_id)
REFERENCES tb_produtos(id_produto);

AFTER TABLE tb_vendas_itens
ADD FOREIGN KEY (venda_id)
REFERENCES tb_vendas(id_venda);

AFTER TABLE tb_produtos
ADD FOREIGN KEY (estoque_id)
REFERENCES tb_estoque(id_estoque);

AFTER TABLE tb_produtos
ADD FOREIGN KEY (fornecedor_id)
REFERENCES tb_fornecedores(id_fornecedor);
	