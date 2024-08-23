SELECT * FROM public.alunos2
ORDER BY id ASC 
SELECT * FROM public.livros
ORDER BY id ASC 
SELECT * FROM public.emprestimos
ORDER BY id ASC 

-- seleciona o nome de qm pegou o livro em ''
select a.nome from alunos2 a
join emprestimos e on a.id = e.id_aluno
join livros l on e.id_livro = l.id
where l.titulo = 'Casa Velha';

--seleciona o livro q a derterminada pessoa pegou 
select l.titulo from livros l
join emprestimos e on l.id = e.id_livro
join alunos2 a on e.id_livro = a.id
where a.nome in ('Gustavo','Marcos','Gisele','Carlos');

--mostra os livros dos determinados alunos com o titulo e nome do aluno
select l.titulo,a.nome,e.data_retirada
from livros l
join emprestimos e on l.id = e.id_livro
join alunos2 a on e.id_livro = a.id
where a.nome in ('Gustavo','Marcos','Gisele','Carlos');

--total de emprestimos feito
select count(*)as ttl_emprestimos
from emprestimos;

-- lista de quantidade de vezes q o livro foi emprestada 
select l.titulo, count(e.id) as ttl_emprestimos
from livros l
left join emprestimos e on l.id = e.id_livro
group by l.titulo --agrupa pelo titulo
order by ttl_emprestimos desc --ordena o resultado 

--total rank de alunos q pegaram livros emprestado 
select a.nome,count(e.id)as ttl_emprestado,
string_agg(l.titulo,',') as titulos-- acrecenta os livros q pegou emprestado 
from emprestimos e 
left join alunos2 a on e.id_aluno = a.id
join livros l on e.id_livro = l.id
group by a.nome
order by ttl_emprestado desc

--mostra o nome da pessoa q pegou determinado livro do autor e com o titulo
select a.nome,l.titulo,e.data_retirada
from alunos2 a
join emprestimos e on a.id = e.id_aluno 
join livros l on e.id_livro = l.id 
where l.autor = 'Machado de Assis';

--mostra o nome da pessoa q pegou determinado livro do autor e determinado titulo
select a.nome,l.titulo,e.data_retirada
from alunos2 a
join emprestimos e on a.id = e.id_aluno 
join livros l on e.id_livro = l.id 
where l.autor = 'Machado de Assis' and l.titulo =  'Casa Velha';

--mostra livros disponiveis q nao estao emprestados 
select l.*
from livros l
left join emprestimos e on l.id = e.id_livro and e.data_devolucao is null
where e.id_livro is null
	
--mostra as tabelas com tds as colunas 
SELECT l.*, e.*,a.*
FROM livros l
full JOIN emprestimos e ON l.id = e.id_livro 
full join alunos2 a on e.id_aluno = a.id
order by l.id asc

SELECT l.id, l.titulo, e.data_devolucao
FROM livros l
INNER JOIN emprestimos e ON l.id = e.id_livro
order by l.id asc

--mostra alunos q nao devolveras os livros e a data q pegaram 
select a.nome,e.data_retirada,l.titulo
 from alunos2 a 
 join emprestimos e on a.id = e.id_aluno
 join livros l on l.id = e.id_livro
 where e.data_devolucao is null

 