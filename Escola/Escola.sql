drop database Escola;
create schema if not exists Escola default character set utf8;
use Escola;

create table if not exists Estudantes
(
id integer not null auto_increment,
nome varchar(255) not null,
email varchar(255) not null,
telefone varchar(14),
altura decimal(3,2),
aprovado tinyint(1),
primary key(id)
)engine = InnoDB;

select * from Estudantes;

insert into Estudantes(id,nome,email,telefone,altura,aprovado) values (null, 'João Pimentel', 'jpapim@gmail.com', '(61)98787-9999', 1.74,1);
insert into Estudantes(id,nome,email,telefone,altura,aprovado) values (null, 'João Silva', 'jsilva@gmail.com', '(61)97474-9959', 1.74,0);
insert into Estudantes(id,nome,email,telefone,altura,aprovado) values (null, 'João Fernando', 'jnando@gmail.com', '(61)95454-5879', 1.94,1);
insert into Estudantes(id,nome,email,telefone,altura,aprovado) values (null, 'Pedro', 'pedro@gmail.com', '(61)97685-9879', 1.94,0);
insert into Estudantes(id,nome,email,telefone,altura,aprovado) values (null, 'Fabio Pereira', 'freiram@gmail.com', '(61)98787-9988',1.94,0);

select * from Estudantes;

select avg(altura) from Estudantes where aprovado = 0;
select count(altura) from Estudantes where altura >=1.7;
select sum(altura) from Estudantes;
select sum(altura) from Estudantes where aprovado = 1;
select max(altura) from Estudantes;
select min(altura) from Estudantes;

drop database Subconsultas;
create schema if not exists Subconsultas  default character set utf8;
use Subconsultas;

create table if not exists Aluno
(
id integer not null auto_increment,
nome varchar(255) not null,
email varchar(255) not null,
dataNascimento datetime,
primary key(id)
)engine = InnoDB;

select * from Aluno;

create table if not exists Turma
(
id integer not null auto_increment,
inicio datetime,
fim datetime,
observacoes longtext,
primary key(id)
)engine = InnoDB;

select* from Turma;

create table if not exists AlunoTurma
(
aluno_id integer not null,
turma_id integer not null,
primary key(aluno_id,turma_id),
foreign key(aluno_id) references Aluno(id),
foreign key(turma_id) references Turma(id)
)engine = InnoDB;

select* from AlunoTurma;

insert into Aluno values
(null,'João','joao@gmail.com','1978-02-19'),
(null,'Maria','mar@gmail.com','1988-07-12'),
(null,'Carmem','carme@gmail.com','1968-12-14'),
(null,'Paulo','paul@gmail.com','1978-09-09');

select * from Aluno;

insert into Turma values
(null,'2019-03-01','2019-07-15','Turma de Banco de Dados I'),
(null,'2019-04-01','2019-07-22','Turma de Banco de Dados II');

select * from Turma;

insert into AlunoTurma values
(1,1),
(2,1),
(3,2);

select * from AlunoTurma;

create table if not exists Nota
(
id int not null ,
aluno_id int not null,
turma_id int not null,
nota decimal(4,2),
primary key(id),
foreign key(aluno_id) references Aluno(id),
foreign key(turma_id) references Turma(id)
)engine = InnoDB;

select* from Nota;

insert into Nota values
(1,1,1,10),
(2,2,2,8),
(3,3,2,5),
(4,4,1,9);

select * from Nota;

select * from Nota as n1 where n1.nota > 
(select avg(n2.nota) from Nota as n2 where n2.turma_id = n1.turma_id);

select n1.*,(select max(n2.nota) from Nota as n2 where n2.turma_id = 1) 
as maior_nota from Nota as n1 where n1.turma_id;

select n1.*,(select max(n2.nota)from Nota as n2 where n2.turma_id = 1)
 as maior_nota from Nota as n1 where n1.turma_id = 1 or n1.turma_id =2;