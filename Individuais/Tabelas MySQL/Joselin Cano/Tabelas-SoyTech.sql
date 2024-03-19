create database soytech;
use soytech;

create table hectare(
idHectare int primary key,
fk_idSensor int,
dtPlantacao date,
dtColheita date
);

create table sensor(
idSensor int primary key not null,
status varchar(10),
constraint statuschk check( status in ("vermelho","verde","laranja")),
umidade int,
registro datetime,
situacao varchar(9),
constraint situacaochk check ( situacao in ("LIGADO","DESLIGADO"))
);

create table cliente(
idClient int primary key auto_increment,
fk_idSensor int,
nome varchar (50),
cpf char(11),
celular varchar(14),
email varchar(50)
);

insert into hectare values
(4,1,'2024-03-23','2024-08-01'),
(5,2,'2025-01-01','2025-02-05'),
(6,3,'2024-08-29','2024-10-01'),
(7,4,'2012-10-03','2012-12-01'),
(8,5,'2022-12-31','2023-02-01');

insert into sensor values
(5,'verde',60, '2023-02-20 13:00:00','DESLIGADO'),
(4,'vermelho',20, '2025-11-23 12:30:00','LIGADO'),
(3,'verde',55, '2024-08-12 12:00:00','LIGADO'),
(2,'laranja',48, '2022-06-30 11:30:00','DESLIGADO'),
(1,'vermelho',10, '2024-12-09 10:00:00','LIGADO');

insert into cliente values 
(default,5,'Arnaldo Souza','43267727876','11 98784-5326','arnaldo_007@outlook.com'),
(default,4,'Lizeth Orellana','43212327985','11 95144-5382','liz.Orellana@gmail.com'),
(default,3,'Jorge Ignácio','97267727128','11 92834-9800','97_Jorge@outlook.com'),
(default,2,'Kleber João','01937727287','11 91936-5321','_KleberJ@gmail.com'),
(default,1,'Poliana Silva','23226772787','11 91198-1029','Poli.Poli@hotmail.com');

select * from hectare;
select * from sensor;
select * from cliente;

drop table hectare;
drop table sensor;
drop table cliente;
drop database soytech;