create database empresa_db;
use empresa_db;

create table tb_departamento(
	id_departamento int primary key AUTO_INCREMENT,
    descricao_depto varchar(100)
    );
insert into tb_departamento
(descricao_depto)
values
	('Desenvolvimento'),
    ('RH'),
    ('Financeiro'),
    ('Admininstrativo'),
    ('Comercial');



create table tb_funcionarios(
	id_funcionario int primary key AUTO_INCREMENT,
    nome varchar(30),
    cpf varchar(11),
    departamento_id int
    );
alter table tb_funcionarios
add comissao decimal(11,2);
    
insert into tb_funcionarios
	(departamento_id, nome, comissao)
values
	(1,'Arthur','1000'),
    (1,'Gabriel','1000'),
    (1,'Gabriela','1000'),
    (1,'Mateus','1000'),
    (2,'Carlos','1200'),
    (2,'Guilherme','1200'),
    (2,'Oliveira','1200'),
    (2,'Carla','1200'),
    (3,'Ana','1150'),
    (3,'Paula','1150'),
    (3,'Roberta','1150'),
    (3,'Roberto','1150'),
    (4,'Lucas','1400'),
    (4,'Luana','1400'),
    (4,'Maria','1400'),
    (4,'Beatriz','1400'),
    (5,'Maria','2400'),
    (5,'Tais','2400'),
    (5,'Paola','2400'),
    (5,'Tiago','2400');
    
    UPDATE tb_funcionarios
SET comissao = comissao * 1.15
WHERE departamento_id = 1 and nome = 'Arthur' or nome = 'Gabriel' or nome = 'Gabriela';


    


create table tb_projeto_empregado(
	id_projeto_empregado int primary key AUTO_INCREMENT,
    data_inicio date,
    data_fim date,
    funcionario_id int,
    projeto_id int
    );
    
insert into tb_projeto_empregado
(funcionario_id, projeto_id, data_inicio, data_fim)
values
	(1,1,'2022-09-02','2022-10-02'),
    (2,1,'2023-10-12','2023-11-03'),
    (3,1,'2022-02-22','2022-03-04'),
    (4,2,'2022-08-11','2022-09-05'),
    (5,2,'2021-12-12','2022-01-06'),
    (6,2,'2020-04-07','2021-07-07'),
    (7,3,'2023-09-18','2023-10-08'),
    (8,3,'2022-01-20','2022-02-09'),
    (9,3,'2022-10-28','2022-11-10'),
    (10,4,'2022-12-29','2023-01-14'),
    (11,4,'2022-05-15,','2022-06-12'),
    (12,4,'2023-06-24','2023-07-02'),
    (13,5,'2022-09-06','2022-10-03'),
    (14,5,'2022-07-13','2022-09-04'),
    (15,5,'2022-03-17','2022-09-02');
    
DELETE FROM tb_projeto_empregado
WHERE projeto_id = 2 and funcionario_id = 4 or funcionario_id = 5 or funcionario_id = 6;
    
create table tb_projetos(
	id_projeto int primary key AUTO_INCREMENT,
    descricao_projeto varchar(100)
    );
    
insert into tb_projetos
(descricao_projeto)
values
	('Projeto de TI'),
    ('Projeto de Pesquisa'),
    ('Projeto Empresarial'),
    ('Projeto de comunicação e marketing'),
    ('Projeto Social');

DELETE FROM tb_projetos
WHERE id_projeto = 2;

alter table tb_funcionarios
add FOREIGN KEY (departamento_id) REFERENCES
tb_departamento(id_departamento);
    
alter table tb_projeto_empregado
add FOREIGN KEY (funcionario_id) REFERENCES
tb_funcionarios(id_funcionario);

alter table tb_projeto_empregado
add FOREIGN KEY (projeto_id) REFERENCES
tb_projetos(id_projeto);


alter table tb_funcionarios
drop column cpf;

alter table tb_funcionarios
modify column nome varchar(50);
