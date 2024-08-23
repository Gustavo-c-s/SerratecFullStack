
-- Desafio 2: Consulta de Produtos
-- Escreva uma consulta para exibir o nome, preço e categoria de todos os produtos.
select * from produto
select * from estoque

-- Desafio 4: Contagem de Categorias
-- Calcule quantas categorias diferentes existem na tabela Categoria.
select count(*) as "total de categorias" from categorias 

-- Desafio 5: Estoque Total
-- Calcule a quantidade total de produtos em estoque.
select sum(quantidade) as "total de produtos" from estoque 

-- Desafio 6 (Bônus): Produtos Esgotados
-- Liste os produtos que estão completamente esgotados (quantidade em estoque igual a zero).
select p.nome,e.quantidade from estoque e
join produto p on e.produto_id = p.id
where quantidade = 0

-- Desafio 7 (Bônus): Preço Médio por Categoria
-- Calcule o preço médio dos produtos para cada categoria.
select c.nome,round(avg(p.preco),2) from categorias c
join produto p on c.id = p.categoria
group by c.nome

-- Desafio 8 (Bônus): Produtos em Estoque Baixo
-- Liste os produtos que têm uma quantidade em estoque menor do que um valor específico.

select p.nome,p.preco,e.quantidade from produto p
join estoque e on e.produto_id = p.id
where quantidade <= 10.00

-- Desafio 9 (Bônus): Produtos por Categoria
-- Exiba o nome da categoria e a quantidade de produtos nela para cada categoria existente.
select c.nome, count(p.id) as "total" from categorias c
join produto p on c.id = p.categoria
group by c.nome

-- Desafio 10 (Bônus): Detalhes do Estoque
-- Crie uma consulta que mostre o nome do produto, a quantidade em estoque e o nome da categoria para todos os produtos.
select p.nome,e.quantidade,c.nome from produto p
join categorias c on c.id = p.categoria
join estoque e on p.id = e.produto_id






