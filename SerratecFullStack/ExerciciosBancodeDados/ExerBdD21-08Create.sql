--exer1 20/08 Criação de Tabelas Básicas:
--Crie uma tabela chamada clientes com as seguintes colunas: id (inteiro, chave primária, autoincremento), nome (texto, não nulo), email (texto, único) e data_cadastro (data).

 create table clientes(
	id serial primary key,
	nome varchar (100) not null,
	email varchar(50)not null,
	data_cadastro timestamp
);
alter table clientes alter column nome type text
alter table clientes alter column email type text
alter table clientes alter column data_cadastro type date

--exer2 Modificação de Tabela:
--Altere a tabela clientes para adicionar uma coluna telefone (texto) e uma coluna data_nascimento (data).

alter table clientes add telefone varchar(10);
alter table clientes add data_nascismento date;

--exer3 Renomear Coluna:
--Renomeie a coluna telefone da tabela clientes para celular.

alter table clientes rename column telefone to celular
alter table clientes alter column celular type text

--exer4 Excluir Coluna:
--Exclua a coluna data_nascimento da tabela clientes

alter table clientes drop column data_nascismento

--exer5 Criação de Tabela com Chave Estrangeira:
--Crie uma tabela chamada pedidos com as seguintes colunas: id (inteiro, chave primária, auto-incremento), cliente_id (inteiro, chave estrangeira que referencia a tabela clientes), data_pedido (data) e total (decimal).

create table pedidos(
	id serial primary key,
	client_id integer unique references clientes(id),
	data_pedido date,
	total decimal
)

--exer6 Alteração de Tipo de Coluna:
--Altere o tipo de dado da coluna total na tabela pedidos de decimal para numeric(10, 2).

alter table pedidos alter column total set data type numeric(10,2)

--exer7  Exclusão de Tabela:
--Exclua a tabela pedidos.

drop table pedidos

--exer8 Criação de Tabela com Restrições:
--Crie uma tabela chamada produtos com as seguintes colunas: id (inteiro, chave primária, autoincremento), nome (texto, não nulo), preco (decimal, maior que zero), e estoque (inteiro). Adicione uma restrição para que o nome seja único.

create table produtos (
	id serial primary key,
	nome text unique not null,
	preco decimal check(preco>0),
	estoque integer check(estoque>0)
)

--exer9 Adicionar Restrições:
--Na tabela produtos, adicione uma restrição para que o valor do estoque seja maior ou igual a zero.

alter table produtos add constraint estoque check (estoque>=0)

--exer10 Criar e Excluir Tabela:
--Crie uma tabela chamada categorias com as colunas id (inteiro, chave primária, auto-incremento) e nome (texto, não nulo, único). Em seguida, exclua a tabela.

create table categoria (
	id serial primary key,
	nome text  unique not null	
)
drop table categoria

--exer11 1. Inserção de Dados (INSERT)
--Exercício 1: Crie uma tabela chamada alunos com as colunas id, nome, idade e curso. Insira cinco registros nesta tabela.
--Exercício 2: Insira na tabela alunos um novo registro com o nome “João”, idade 20, e curso “Engenharia”.
--Exercício 3: Insira múltiplos registros de uma vez na tabela alunos, adicionando três novos alunos de diferentes cursos.
create table alunos(
	id serial primary key,
	nome text,
	idade numeric(10,2),
	curso text
)

insert into alunos (nome,idade,curso) values ( 'joao',20,'Engenharia');

insert into alunos (nome,idade,curso) values ( 'Gustavo',29,'FullStack');
insert into alunos (nome,idade,curso) values ( 'Bob',30,'Dançarino');
insert into alunos (nome,idade,curso) values ( 'Cristinao',31,'Cienco da Computação');

--exer 12 2. Atualização de Dados (UPDATE)
--Exercício 4: Atualize a idade do aluno chamado “João” para 21 anos.
--Exercício 5: Mude o curso de todos os alunos que estão cursando “Engenharia” para “Engenharia de Software”.
--Exercício 6: Aumente a idade de todos os alunos em 1 ano.
update alunos set idade = 21 where id=1

update alunos set curso = 'Engenharia de Software' where curso = 'Engenharia'

update alunos set idade = idade + 1 

--exer 13 3. Deleção de Dados (DELETE)
--Exercício 7: Delete o aluno com id igual a 3 da tabela alunos.
--Exercício 8: Delete todos os alunos que têm menos de 18 anos.
--Exercício 9: Delete todos os registros da tabela alunos (sem excluir a tabela).

delete from alunos where id = 3
delete from alunos where id = 7

delete from alunos where idade <18

delete from alunos 