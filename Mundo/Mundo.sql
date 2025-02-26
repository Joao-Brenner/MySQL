create schema if not exists Mundo default character set utf8;
use Mundo;

create table Pais
(
id_pais int not null auto_increment primary key,
nome varchar (200) not null
) Engine = InnoDB;

insert into Pais values
(null,'Brasil'),
(null,'Chile'),
(null,'Argentina'),
(null,'Bolívia'),
(null,'Uruguai'),
(null,'Portugal'),
(null,'EUA'),
(null,'China'),
(null,'Paraguai'),
(null,'Alemanha');

select * from Pais;

delimiter $$ 
create procedure `Listar Países` (in id int)
begin
if(id is null) then
select * from Pais;
else
select * from Pais where id_pais = id;
end if;
end $$

delimiter ;

call `Listar Países` (null);
call `Listar Países` (1);
call `Listar Países` (2);
call `Listar Países` (3);

delimiter $$ 
create procedure `Verificar_Quantidade_País`  (out quantidade int)
begin
select count(*) from Pais;
end $$

delimiter ;

call `Verificar_Quantidade_País` (@total);

delimiter $$ 
create procedure `Selecionar Países`  (in quantidade int)   --  (in id int)
begin
select * from Pais limit quantidade;
-- ou select * from Pais where id >= id_pais;
end $$

delimiter ;

call `Selecionar Países`(2); 
call `Selecionar Países`(5);
call `Selecionar Países`(3);  

delimiter $$ 
create procedure `Selecionar_Países_Em_Odem_Alfabética`  (in letra char)
begin
select * from Pais where nome like concat (letra,'%') order by nome asc;
end $$

delimiter ;

call `Selecionar_Países_Em_Odem_Alfabética`('B');
call `Selecionar_Países_Em_Odem_Alfabética`('C');
call `Selecionar_Países_Em_Odem_Alfabética`('A');