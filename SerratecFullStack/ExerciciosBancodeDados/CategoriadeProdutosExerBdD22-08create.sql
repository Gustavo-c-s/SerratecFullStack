create table categorias(
	id serial primary key,
	nome varchar(50) not null
);

create table produto (
	id serial primary key,
	nome varchar(100)not null,
	preco numeric not null,
	categoria int references categorias (id) not null
);
create table estoque (
	id serial primary key,
	produto_id int references produto(id),
	quantidade int not null
)
drop table estoque

-- Desafio 1: Inserir Dados
-- Preencha as tabelas de Categoria, Produto e Estoque com alguns dados fictícios, garantindo que as restrições sejam respeitadas.
insert into categorias (nome) 
values 
('limpeza'),
('comida'),
('escola'),
('obra'),
('bebidas');

insert into produto (nome, preco, categoria) 
values 
('espoja',2.00,'1'),
('vassoura',3.00,'1'),
('sabão em pó',15.00,'1'),
('sabão liquido ',25.00,'1'),
('biscoito',2.99,'2'),
('pão de forma',5.99,'2'),
('pão de alho',13.99,'2'),
('Arroz 5kg',23.99,'2'),
('lapis',2.99,'3'),
('caneta',2.99,'3'),
('caderno',12.99,'3'),
('mochila',32.99,'3'),
('serrote',196.99,'4'),
('martelo',26.99,'4'),
('colher de obra',16.99,'4'),
('luva',16.99,'4'),
('Wisky',99.99,'5'),
('Vinho',49.99,'5'),
('Suco',9.99,'5'),
('refrigerante',9.99,'5');

insert into estoque (produto_id, quantidade)
values
(1,20),(2,15),(3,10),(4,10),
(5,20),(6,15),(7,10),(8,10),
(9,20),(10,15),(11,10),(12,10),
(13,20),(14,15),(15,10),(16,10),
(17,20),(18,15),(19,10),(20,10)

-- Desafio 3: Atualização de Preço
-- Atualize o preço de um produto específico na tabela de Produtos.
update produto set preco = 1.99 where id = 1

update estoque set quantidade = 0 where id = 3
update estoque set quantidade = 0 where id = 12 