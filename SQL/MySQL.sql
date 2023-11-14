create table tb_departamento(
	id_departamento int primary key,
    descricao_depto varchar(100)
    );
create table tb_funcionarios(
	id_funcionario int primary key,
    nome varchar(30),
    cpf varchar(11),
    departamento_id int
    );
create table tb_projeto_empregado(
	id_projeto_empregado int primary key,
    data_inicio date,
    data_fim date,
    funcionario_id int,
    projeto_id int
    );
create table tb_projetos(
	id_projeto int primary key,
    descricao_projeto varchar(100)
    );

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
add comissao decimal(8,4);

alter table tb_funcionarios
drop column comissao;

alter table tb_funcionarios
modify column nome varchar(50);
