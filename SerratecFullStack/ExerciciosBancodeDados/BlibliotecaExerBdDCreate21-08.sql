-- Exercicios 21/08
-- Mini Mundo: Sistema de Gestão de Biblioteca Escolar
-- Descrição:
-- Alunos

-- Cada aluno possui um número de matrícula, nome e série.
-- Um aluno pode pegar vários livros emprestados, mas um livro só pode ser emprestado para um aluno por vez.

-- Livros

-- Cada livro tem um código, título, autor e ano de publicação.
-- Um livro pode ser emprestado por vários alunos ao longo do tempo (histórico de empréstimos), e um aluno pode pegar vários livros emprestados.

-- Empréstimos

-- Cada empréstimo possui a data de retirada, a data de devolução e uma referência ao aluno e ao livro.
-- Um empréstimo é único para um par aluno-livro em uma data específica.

create table alunos2 (
	id serial primary key,
	nome varchar(50) not null,
	serie varchar(50)not null
);
create table livros (
	id serial primary key,
	titulo varchar(50) not null,
	autor varchar(50)not null,
	ano_publicacao date not null
);
alter table livros alter column ano_publicacao type varchar(10);

-- create table emprestimos (  'ctrl + ;'
-- 	id_aluno int references alunos2(id),
-- 	id_livro int references livros(id),
-- 	data_retirada date not null ,
-- 	data_devolucao date not null,
-- 	primary key(id_aluno,data_retirada,id_livro)
-- );

create table emprestimos (
	id serial primary key,
	id_aluno int references alunos2(id)not null,
	id_livro int not null references livros(id) ,
	data_retirada date not null ,
	data_devolucao date	
)
 
create unique index idx_unico_emprestimo_ativo on emprestimos(id_livro) where data_devolucao is null;
drop table emprestimos

insert into alunos2 (nome,serie) values 
('Carlos','primeiro semestres'),
('Alberto','primeiro semestres'),
('Aline','primeiro semestres'),
('Gisele','primeiro semestres'),
('Marcos','primeiro semestres');
insert into livros (titulo,autor,ano_publicacao) values 
('Altos e Baixos','Felipe Monteiro', '2024-03-21'),
('A Preparação','Constantin Stanislavski','1995-04-09'),
('A Construção da Personagem','Constantin Stanislavki','1995-04-09'),
('Memórias Póstumas de Brás Cubas','Machado de Assis','1881'),
('Dom Casmurro','Machado de Assis','1899'),
('Helena','Machado de Assis','1876'),
('Quincas Borba','Machado de Assis','1891'),
('Casa Velha','Machado de Assis','1885'),
('Memorial de Aires','Machado de Assis','1908'),
('A Mão e a Luva','Machado de Assis','1874'),
('Ressurreição','Machado de Assis','1872'),
('Esaú e jacó','Machado de Assis', '1904'),
('Iaiá Garcia','Machado de Assis','1878')

insert into emprestimos (id_aluno,id_livro,data_retirada)values
-- (2,8,'2020-02-21'),
-- (2,1,'2020-02-21'),
-- (8,5,'2022-02-01'),
-- (4,2,'2024-03-24'),
-- (3,4,'2024-12-21'),
-- (2,7,'2022-05-21'),
-- (5,6,'2024-10-21'),
-- (6,16,'2022-08-22'),
-- (7,11,'2024-03-24'),
-- (7,10,'2024-12-21')
(2,16,'2024-02-02'),
(2,10,'2024-02-02'),
(3,5,'2024-02-01'),
(4,2,'2024-03-24'),
(4,4,'2024-03-21'),
(5,7,'2024-03-21'),
(5,6,'2024-03-21'),
(8,14,'2024-02-22'),
(3,11,'2024-05-24'),
(6,9,'2024-02-21')


-- funçao para coloca data de devoluçao com um prazo de dias escolhido 
update emprestimos set data_devolucao = data_retirada + interval '15 days' where data_devolucao is null

-- funçao para coloca data de devoluçao com um prazo de dias escolhido com determidato aluno ou livro 
update emprestimos set data_devolucao = data_retirada + interval '15 days' where data_devolucao is null and id_livro = 9
