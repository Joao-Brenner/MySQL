create schema if not exists LojaProjec default character set utf8;
use LojaProjec;
create table categorias(
id int not null auto_increment primary key,
nome varchar (255) not null
) engine = InnoDB;
create table produtos(
id int not null auto_increment primary key,
categoria_id int not null,
nome varchar(255) not null,
preco decimal (10,2) not null
)engine = InnoDB; 
insert into categorias values(1,'Camisetas');
insert into categorias values(2,'Canecas');
select * from categorias;
insert into produtos values(1,1, 'Camiseta Social' , 45.00);
insert into produtos values(2,1, 'Camiseta Regata' ,31.99);
insert into produtos values(3,2, 'Caneca Grande' ,18.90);
select * from produtos;

select produtos.*,categorias.nome as categoria from  produtos
inner join categorias on produtos.categoria_id = categorias.id
order by produtos.nome ASC;

drop table categorias;
create table categorias(
id int not null auto_increment primary key,
categoria varchar (255) not null
) engine = InnoDB;
insert into categorias values(1,'Camisetas');
insert into categorias values(2,'Canecas');
select * from produtos;
select categoria,produtos.* from  produtos
inner join categorias on produtos . categoria_id = categorias.id
order by produtos.nome ASC;
 select c.categoria as categorias_categoria,p.nome as produtos_nome from categorias as c, produtos as p;





