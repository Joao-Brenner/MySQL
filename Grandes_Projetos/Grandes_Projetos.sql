drop database `Grandes Projetos`;
create schema if not exists `Grandes Projetos` default character set utf8;
use `Grandes Projetos`;

create table if not exists Projetos
(
id int not null auto_increment primary key,
titulo varchar(45) not null,
data_ date not null,
url varchar(100) not null
)Engine = InnoDB;

create table if not exists Usuario
(
id int not null auto_increment primary key,
nome varchar(45) not null,
email varchar(45) not null,
senha varchar(45) not null
)Engine = InnoDB;

create table if not exists Comentario
(
id int not null auto_increment,
comentario text not null,
data_ date not null,
id_usuario int not null,
id_projeto int not null,
primary key(id),
foreign key(id_usuario) references Usuario(id),
foreign key(id_projeto) references Projetos(id)
)Engine = InnoDB;

create table if not exists Likes_por_Projeto
(
id_projeto int not null,
id_usuario int not null,
primary key(id_projeto, id_usuario),
foreign key(id_projeto) references Projetos(id),
foreign key(id_usuario) references Usuario(id)
)Engine = InnoDB;

create table if not exists Likes_por_Comentario
(
id_usuario int not null,
id_comentario int not null,
primary key(id_usuario, id_comentario),
foreign key(id_usuario) references Usuario(id),
foreign key(id_comentario) references Comentario(id)
)Engine = InnoDB;

insert into Projetos values 
(null,'Aplicação C#','2018-04-01','www.aplicacaocsharp.com.br'),
(null,'Aplicação Ionic','2018-05-07','www.aplicacaoionic.com.br'),
(null,'Aplicação Java','2018-08-05','www.aplicacaojava.com.br');

select * from Projetos;

insert into Usuario values 
(null,'Bruna Luiza','bruninha@gmail.com','abc123'),
(null,'Thiago Braga','thiagobraga@hotmail.com','pena093'),
(null,'Osvaldo Justino','osvaltino@yahoo.com.br','666'),
(null,'Gabriel Fernando','grabriel_fnd@gmail.com','gabss34');

select*from Usuario;

insert into Comentario values 
(null,'A microsoft acertou com essa linguagem!','2018-05-01',1,1),
(null,'Parabéns pelo projeto, bem top!','2018-12-01',3,1),
(null,'Super Interessante! Fácil e rápido','2017-08-09',4,2),
(null,'Cara, que simples fazer um APP assim!','2015-01-01',1,2),
(null,'Linguagem muito diferente.','2018-11-01',3,3),
(null,'Adorei aprender Java! Parabéns','2019-05-01',2,3),
(null,'Muito maneiro esse framework!','2012-04-05',2,2);

select * from Comentario;

insert into Likes_por_Projeto values 
(1,1),
(1,3),
(2,1),
(2,2),
(2,3),
(2,4),
(3,2);

select * from Likes_por_Projeto;

insert into Likes_por_Comentario values 
(1,7),
(2,7),
(4,7);

select * from Likes_por_Comentario;

select P.titulo,
(select count(C.id_projeto) 
from 
comentario C 
where C.id_projeto = P.id) as Quantidade_Comentarios
from
Projetos  P group by
P.id;

select P.titulo,(Select count(C.id_projeto)
from
comentario C
where
C.id_projeto = P.id) as Quantidade_Comentarios,
(select count(LP.id_projeto)
from
Likes_por_Projeto LP
where
LP.id_projeto = P.id) as Quantidade_Likes
from projetos P group by
P.id;

SELECT P.id,P.titulo,P.data_
from
Projetos P 
where
P.id in
(SELECT C.id_projeto
from 
comentario C where 
P.id = C.id_projeto);