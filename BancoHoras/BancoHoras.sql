drop database `Banco de Horas`;
create schema if not exists `Banco de Horas` default character set utf8;
use `Banco de Horas`;
show databases; 

create table Horas
(
data_d date not null,
credito_horas_trabalhadas decimal(4,2),
debito_horas_utilizadas decimal(4,2),
nome  varchar(255) not null
)engine=InnoDB;

show tables;
insert into Horas (data_d,credito_horas_trabalhadas,debito_horas_utilizadas,nome) values ('2017-05-02',2,null,'Pedro');
insert into Horas (data_d,credito_horas_trabalhadas,debito_horas_utilizadas,nome) values ('2017-05-02',2,null,'Amanda');
insert into Horas (data_d,credito_horas_trabalhadas,debito_horas_utilizadas,nome) values ('2017-05-02',2,null,'Lucas');

select * from Horas;
drop table Horas;

create table Pessoas
(
nome varchar(255) not null,
hora_crédito decimal(4,2),
horas_debito decimal(4,2),
saldo_horas decimal(4,2)
)engine=InnoDB;

insert into Pessoas (nome,hora_crédito,horas_debito,saldo_horas) values ('Pedro',5,4,1);
insert into Pessoas (nome,hora_crédito,horas_debito,saldo_horas) values ('Amanda',5,2,3);
insert into Pessoas (nome,hora_crédito,horas_debito,saldo_horas) values ('Lucas',5,4,1);
insert into Pessoas (nome,hora_crédito,horas_debito,saldo_horas) values ('Total ',15,10,5);
select * from Pessoas;

drop table Pessoas;