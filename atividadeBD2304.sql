create database bd_videolocadora;
use bd_videolocadora;

create table cliente(
	idCliente int primary key identity(1,1),
	nome varchar(100),
	cidade varchar(50)
);

create table filme(
	idFilme int primary key identity(1,1),
	titulo varchar(50),
	genero varchar(50),
	anoLancamento int
);

create table locacao(
	idLocacao int primary key identity(1,1),
	idCliente int, --Chave estrangeira
	idFilme int, --Chave estrangeira
	foreign key (idCliente) references cliente(idCliente),
    foreign key (idFilme) references filme(idFilme),
	dataLocacao date,
	valor decimal (5,2)
);

insert into cliente(nome, cidade) values
('Carlos Silva', 'São Paulo'),
('Ana Souza', 'Rio de Janeiro'),
('Marcos Lima', 'Belo Horizonte'),
('Fernanda Dias', 'São Paulo'),
('Gabriel Marques', 'Santo André'),
('Luis Fernando', 'São Caetano');

insert into filme(titulo, genero,anoLancamento) values
('Matrix', 'Ficção Científica', 1999),
('Titanic', 'Romance', 1997),
('Vingadores', 'Ação', 2012),
('Coringa', 'Drama', 2019),
('Click', 'Comédia', 2006),
('Ratatouille', 'Animação', 2007),
('Halloween', 'Terror', 1978);

insert into locacao(idCliente, idFilme, dataLocacao, valor) values
(1, 1, '2023-05-01', 5.00),
(1, 3, '2023-05-03', 6.00),
(2, 2, '2023-05-02', 4.50),
(2, 1, '2023-05-04', 5.00),
(3, 4, '2023-05-01', 6.50),
(4, 1, '2023-05-01', 5.00),
(4, 4, '2023-05-05', 6.50),
(5, 7, '2023-05-07', 5.80),
(5, 6, '2023-05-10', 6.00),
(6, 1, '2023-05-12', 5.00),
(6, 3, '2023-05-15', 6.00),
(6, 5, '2023-05-20', 5.50);

-- Consultas SQL:

select * from filme;

select * 
from cliente
where cidade = 'São Paulo';

select c.nome as cliente, f.titulo as filme, l.datalocacao, l.valor
from locacao l
join cliente c on l.idcliente = c.idcliente
join filme f on l.idfilme = f.idfilme;

select c.nome as cliente, count(l.idlocacao) as totalLocacoes
from cliente c
left join locacao l on c.idcliente = l.idcliente
group by c.idcliente, c.nome;

select * 
from filme
order by anolancamento desc;

select c.nome as cliente
from cliente c
join locacao l on c.idcliente = l.idcliente
group by c.idcliente, c.nome
having count(l.idlocacao) > 1;
