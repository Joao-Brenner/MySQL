create schema if not exists Faculdade default character set utf8;
use Faculdade;

create table Aluno
(
cod int not null auto_increment primary key,
nome varchar(255) not null,
curso int not null,
status_ int not null
)engine = InnoDB;

create table Curso
(
cod int not null auto_increment primary key,
descricao varchar(255) not null
)engine = InnoDB;

create table Matricula
(
cod int not null auto_increment primary key,
aluno_cod int not null,
curso_cod int not null
)engine = InnoDB;

insert into Curso values
(null,'Ciências  da Computação'),
(null,'Tecnologia em Análise e Desenvolvimento de Sistemas'),
(null,'Engenharia da Computação'),
(null,'Sistemas de Informação');

select * from Curso;

set delimiter $$

create trigger tg_matricula
after insert on Aluno
for each row begin
insert into Matricula values(null,new.cod,new.curso);
end;

set delimiter ;

show triggers;

insert into Aluno values (null,'João Paulo',2,1);
select * from Aluno;
select * from Matricula;
insert into Aluno values(null, 'José Brito',4,1);
select*from Aluno;
select * from Matricula;


create table Aluno_Auditoria
(
id int not null auto_increment primary key,
cod int not null,
nome varchar(255) not null,
modificado_em datetime default null,
acao varchar(50) default null
)engine= InnoDB;

delimiter $$
create trigger antesDeUpdate_Alunos
before update on Aluno
for each row
begin
insert into Aluno_Auditoria
set acao = 'update',
cod = old.cod,
nome = old.nome,
modificado_em = now();
end$$

delimiter ;
show triggers;

update Aluno set nome = 'Pedro Afonso' where cod = 1;
select * from Aluno;
select * from Aluno_Auditoria;
update Aluno set nome = 'Maria Clara' where cod = 2;
select * from Aluno;
select * from Aluno_Auditoria;

create table Curso_Auditoria
(
id int not null auto_increment primary key,
cod int not null,
descricao varchar(255) not null,
modificado_em datetime default null,
acao varchar(50) default null
)engine= InnoDB;

delimiter $$
create trigger antesDeUpdate_Curso
before update on Curso
for each row
begin
insert into Curso_Auditoria
set acao = 'update',
cod = old.cod,
descricao = old.descricao,
modificado_em = now();
end$$

delimiter ;
show triggers;

update Curso set descricao = 'Direito' where cod = 3;
select * from Curso;
select* from Curso_Auditoria;