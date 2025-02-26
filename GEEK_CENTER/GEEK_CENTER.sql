CREATE SCHEMA IF NOT EXISTS GEEK_CENTER DEFAULT 
CHARACTER SET utf8; 
use GEEK_CENTER; 
CREATE TABLE IF NOT EXISTS Cliente ( 
nome varchar (255) NOT NULL, 
cpf VARCHAR  (11) NOT NULL UNIQUE primary key, 
email VARCHAR(50) NOT NULL, 
endereço VARCHAR(255) not null) 
ENGINE = InnoDB;

insert into Cliente  values ("Neymar ",'02598328127', "neymar@gmail.com", 
"QNA 23 casa 10"); 
insert into Cliente  values ("Péricles",'02498328127', "Péricles@gmail.com", 
"QNA 23 casa 11");
insert into Cliente values ("Augostinho ",'02398328127',"Augostinho@gmail.com", "QNA 23 casa 12"); 
insert into Cliente  values ("Raphael Veigar",'02298328127', "Rapahelveigar@gmail.com", "QNA 23 casa 13"); 
insert into Cliente  values ("Bruno Henrique",'02198328127', "Brunohenrique@gmail.com", "QNA 23 casa 14");
insert into Cliente  values ("Joao Alvarenga",'02698328127', "Joaoalvarenga@gmail.com", "QNA 23 casa 15"); 
insert into Cliente  values ("Joao Carlos",'02798328127', "Joaocarlos@gmail.com", "QNA 23 casa 16"); 
insert into Cliente values ("Joao Marcos",'02898328127', "Joaomarcos@gmail.com", "QNA 23 casa 17"); 
insert into Cliente  values ("Joao Pedro",'02998328127', "Joaopedro@gmail.com", "QNA 23 casa 18"); 
insert into Cliente  values ("Joao Pimentel",'02098328127', "Joaopimentel@gmail.com", "QNA 23 casa 19"); 

select * from Cliente; 
create table if not exists Categoria ( 
id_categoria integer not null primary key, 
nome varchar (30) not null 
) engine = InnoDB; 
insert into Categoria values (1, 'Caneca'); 
insert into Categoria values (2, 'Camiseta'); 

create table Auditoria( 
id_produto varchar(255) not null unique,  
categoria_id  int not null, 
produto varchar (255) not null, 
preco_R$ decimal(10,2) not null, 
quantidade int not null, 
tamanho varchar (30), 
acao varchar(50) default null, 
modificado_em datetime default null 
)Engine = InnoDB; 

select * from Categoria; 
create table if not exists Produtos( 
id_produto varchar(255) not null unique, 
categoria_id int not null, 
produto varchar (255) not null, 
preco_R$ decimal (10,2) not null, 
quantidade int not null, 
tamanho varchar(30), 
primary key (id_produto), 
foreign key (categoria_id) references Categoria(id_categoria) 
) ENGINE = InnoDB; 

insert into Produtos values('01', 1 , 'Caneca do Kaneki', 15.00 , 30 ,'Único'); 
insert into Produtos values('02', 2 , 'Camiseta do Omori', 55.00, 22 ,'PP-P-M-G
GG'); 
insert into Produtos values('03', 2, 'Camiseta do Star Wars', 75.50, 15 ,'GG'); 
insert into Produtos values('04', 1, 'Caneca do Attack on Titan', 115.90 , 
50,'Único'); 
insert into Produtos values('05', 2 , 'Camiseta do Harry Potter', 89.90 , 47 ,'PP
P-G'); 
insert into Produtos values('06', 2 , 'Camiseta dos Jogos Vorazes', 35.00, 20 ,'PP-P-M-G-GG');
insert into Produtos values('07', 2, 'Camiseta do Caça Fantasmas', 75.50, 15 ,'P
M-GG'); 
insert into Produtos values('08', 1, 'Caneca do Tokyo Revengers', 15.97 , 
10,'Único'); 
insert into Produtos values('09', 1 , 'Caneca da Power', 45.70 , 80 ,'Único'); 
insert into Produtos values('10', 2 , 'Camiseta do Sherlock Holmes', 100.00, 52 
,'PP-P-M-G-GG'); 
insert into Produtos values('11', 2, 'Camiseta da Lisa Simpsons', 43.45, 26 ,'PP-
P-M'); 
insert into Produtos values('12', 2, 'Camiseta do Hellfire', 130.89 , 200,'GG-XGG'); 
insert into Produtos values('13', 1 , 'Caneca do Luffy', 47.76 , 2 ,'Único'); 
insert into Produtos values('14', 1 , 'Caneca do Bill Cipher', 32.00, 74 ,'Único'); 
insert into Produtos values('15', 2, 'Camiseta do Mikey', 86.71, 84 ,'PP-P-M-XGG'); 
insert into Produtos values('16', 2, 'Camiseta da Mikasa', 66.90 , 12,'PP-M'); 
insert into Produtos values('17', 1 , 'Caneca do Sally Face', 15.80 , 29 ,'Único'); 
insert into Produtos values('18', 1 , 'Caneca de The Last of Us', 275.10, 22 
,'Único'); 
insert into Produtos values('19', 2, 'Camiseta da Clementine ', 25.99, 187 ,'GG'); 
insert into Produtos values('20', 1, 'Caneca do Life is Strange', 5.88 , 
50,'Único');

select * from Produtos; 
create table if not exists Encomenda ( 
codigo varchar(255)not null unique, 
cpf VARCHAR  (11) NOT NULL UNIQUE, 
data_encomenda date not null, 
primary key(codigo), 
foreign key(cpf) references Cliente(cpf) 
) engine = InnoDB; 

insert into Encomenda values (10,'02598328127','2023-06-12'); 
insert into Encomenda values (11,'02498328127','2023-05-01'); 
insert into Encomenda values (12,'02398328127','2023-08-03'); 
insert into Encomenda values (13,'02298328127','2023-01-7'); 
insert into Encomenda values (14,'02198328127','2023-05-06'); 
insert into Encomenda values (15,'02698328127','2023-02-9'); 
insert into Encomenda values (16,'02798328127','2023-04-10'); 
insert into Encomenda values (17,'02898328127','2023-01-13'); 
insert into Encomenda values (18,'02998328127','2023-08-09'); 
insert into Encomenda values (19,'02098328127','2023-03-04'); 

select * from Encomenda; 
create table if not exists encomenda_produto ( 
codigo varchar(255)not null, 
produto_id varchar(255) not null, 
foreign key(codigo) references Encomenda(codigo), 
foreign key(produto_id) references Produtos(id_produto) 
) engine = InnoDB; 

insert into encomenda_produto values (10,'05'); 
insert into encomenda_produto values (11,'01'); 
insert into encomenda_produto values (12,'04'); 
insert into encomenda_produto values (13,'09'); 
insert into encomenda_produto values (14,'10'); 
insert into encomenda_produto values (15,'20'); 
insert into encomenda_produto values (15,'20'); 
insert into encomenda_produto values (17,'08'); 
insert into encomenda_produto values (18,'16'); 
insert into encomenda_produto values (19,'03'); 
insert into encomenda_produto values (10,'01');
insert into encomenda_produto values (11,'19'); 
insert into encomenda_produto values (12,'07'); 
insert into encomenda_produto values (13,'11'); 
insert into encomenda_produto values (13,'13'); 
insert into encomenda_produto values (15,'12'); 
insert into encomenda_produto values (16,'20'); 
insert into encomenda_produto values (17,'09'); 
insert into encomenda_produto values (18,'07'); 
insert into encomenda_produto values (19,'05'); 

select*from encomenda_produto; 
select * from Produtos where preco_R$ <= 75.00; 
select * from Produtos where preco_R$ >= 55.00; 
select * from Produtos where preco_R$ between 45.00 and 86.71; 
select * from Produtos where preco_R$ not between 66.00 and 100.00; 
select * from Produtos where preco_R$ > 32.00 and categoria_id like 1; 
select * from Produtos where preco_R$ > 86.00 and categoria_id like 2; 
select count(*) as QUANTIDADE from Produtos where categoria_id like 1; 
select avg(preco_R$) as MÉDIA from Produtos where categoria_id like 1; 
select sum(preco_R$) as SOMA from Produtos where categoria_id like 1; 
select * from Produtos where  preco_R$ = 75.50 ;

select * from Produtos where  preco_R$ < 75.50; 
select * from Produtos where  preco_R$ > 75.50; 
select * from Produtos where preco_R$ in (15.00, 35.00,43.45); 
select avg(preco_R$) as "Média do preço dos produtos" from Produtos; 
select max(preco_R$) as "Máximo do preço das canecas" from Produtos where 
categoria_id like 1 ; 
select min(preco_R$) as "Mínimo do preço das camisetas" from Produtos where 
categoria_id like 2;

SELECT Produtos.id_produto, encomenda_produto.produto_id  FROM Produtos 
INNER JOIN encomenda_produto 
ON Produtos.id_produto = encomenda_produto.produto_id; 

DELIMITER $$ 
CREATE TRIGGER Mudando_Produto  
before update on Produtos  
for each row 
begin 
insert into Auditoria 
set acao = 'update', 
id_produto =  OLD.id_produto,  
categoria_id = OLD.categoria_id,  
produto = OLD.produto, 
preco_R$ = OLD.preco_R$, 
quantidade = OLD.quantidade, 
tamanho  = OLD.tamanho, 
modificado_em = now();  
end $$ 
delimiter ; 

show triggers; 

update  Produtos set preco_R$ = 75.00, quantidade = 10, tamanho = "P-M-G" WHERE id_produto = "02"; 
update  Produtos set produto = 'Camiseta do Bart Simpsons', tamanho = "P-M-G-GG-XGG" WHERE id_produto = "11";   
update  Produtos set tamanho = "P-M-G", preco_R$ = 150.00, quantidade = 10 WHERE id_produto = "05"; 
update  Produtos set preco_R$ = 80.00, quantidade = 120, tamanho = "PP-P-M-G-GG-XGG" WHERE id_produto = "15"; 

select * from Produtos; 
select* from Auditoria 

delimiter $$ 
CREATE PROCEDURE Quantidade_Entre_Valores(out quantidade int) 
begin 
SELECT COUNT(*) AS QUANTIDADE FROM Produtos where  preco_R$  between 15.00 and 101.00; 
end $$ 
delimiter ; 

call Quantidade_Entre_Valores(@total); 

drop database GEEK_CENTER;  