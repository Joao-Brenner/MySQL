create schema if not exists ACID default character set utf8;
use ACID;

create table if not exists tb_titulacao
(
id int not null auto_increment,
descricao varchar
(50) null,
primary key(id)
)engine = InnoDB;

create table if not exists tb_instrutor
(
id int not null auto_increment,
rg varchar(20) null,
nome varchar(100) null,
data_nascimento date null,
titulacao_id int not null,
primary key(id),
index fk_tb_instrutor_tb_titulacao1_idx(titulacao_id asc),
unique index rg_UNIQUE(rg asc),
constraint fk_tb_instrutor_tb_titulacao1
foreign key (titulacao_id)
references tb_titulacao(id)
on delete no action
on update no action
) engine = InnoDB;

create table if not exists tb_telefone_instrutor
(
id int not null auto_increment,
numero varchar(45) null,
tipo varchar(45) null,
instrutor_id int not null,
primary key(id),
index fk_tb_telefone_instrutor_tb_instrutor_idx (instrutor_id asc),
constraint fk_tb_telefone_instrutor_tb_instrutor
foreign key(instrutor_id)references tb_instrutor(id)
on delete no action
on update no action
) engine = InnoDB;

insert into tb_titulacao(descricao) values
('Graduado'), ('Especialista'), ('Mestrado'), ('Doutorado');
select * from tb_titulacao;

insert into tb_instrutor (rg, nome, data_nascimento, titulacao_id) values
('1234567', 'Instrutor Um de Araujo', '1990-10-15', 2),
('4321567', 'Instrutor Dois da Silva', '1997-08-12', 1),
('4545454', 'Instrutor Beltrano Três', '1990-07-02', 3),
('7677873', 'Instrutor Quatro Atilano', '1989-06-23', 3),
('3224566', 'Instrutor Cinco Souza', '1992-05-28', 2),
('1265789', 'Instrutor Sousa Seis', '1993-04-30', 1),
('5978567', 'Instrutor Sousa Sete', '1976-04-30', 4);

select * from tb_instrutor;

 insert into tb_telefone_instrutor (numero, tipo, instrutor_id) values
('99881013', 'Celular', '1'),
('30302013', 'Fixo', '2'),
('98763010', 'Celular', '3'),
('90304011', 'Celular', '4'),
('99975025', 'Celular', '5'),
('30306036', 'Fixo', '6'),
('99887047', 'Celular', '7');
select * from tb_telefone_instrutor;

select i.id,i.rg, i.nome, t.descricao as `titulação`, tf.numero as `telefone` from tb_instrutor i inner join tb_titulacao t 
on i.titulacao_id = t.id inner join tb_telefone_instrutor tf on tf.instrutor_id = i.id order  by i.id asc, i.nome asc;

drop database ACID;