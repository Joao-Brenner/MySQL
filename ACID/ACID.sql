DROP DATABASE ESTUDANTES;

CREATE SCHEMA IF NOT EXISTS ESTUDANTES DEFAULT CHARACTER SET utf8;
USE ESTUDANTES;
show databases;

CREATE TABLE IF NOT EXISTS ESTUDANTES . ALUNO (
nome VARCHAR(255) NOT NULL,
email VARCHAR(255),
altura DECIMAL(3,2),
aprovado TINYINT(1),
PRIMARY KEY (email)
) ENGINE = InnODB;
INSERT INTO ALUNO (nome, email, altura,aprovado) VALUES ('João', 'joao.top@gmail.com', 1.50, 1);
INSERT INTO ALUNO (nome, email, altura,aprovado) VALUES ('JOSUE', 'josue.jesus@gmail.com', 1.73, 1);
INSERT INTO ALUNO (nome, email, altura,aprovado) VALUES ('Amanda', 'madinha@gmail.com', 1.62, 0);
INSERT INTO ALUNO (nome, email, altura,aprovado) VALUES ('Sansão', 'cebelinho@gmail.com', 1.90, 0);
INSERT INTO ALUNO (nome, email, altura,aprovado) VALUES ('Felipe', 'felipe.fp@gmail.com', 1.70, 1);
SELECT * FROM ALUNO;
SELECT  AVG (altura)  FROM ALUNO WHERE aprovado = 0 ;
SELECT * FROM ALUNO WHERE altura > 1.70;
SELECT sum(altura) FROM ALUNO;
SELECT sum(altura) FROM ALUNO WHERE aprovado = 1 ;
SELECT max(altura) FROM ALUNO;
SELECT min(altura) FROM ALUNO;
