CREATE DATABASE soytech;

USE soytech;

CREATE TABLE hectare(
	idHectare int primary key auto_increment not null,
    idSensor int not null,
	qtdPlantacoes int not null,
	area float,
	localizacao varchar(50)
);

INSERT INTO hectare VALUES 
	(default, 1, 50, 10000, 'oeste');
    
SELECT * FROM hectare;
DROP TABLE hectare;

CREATE TABLE sensor(
	idSensor int primary key auto_increment not null,
    idHectare int not null,
    id_leitura int not null,
	nome varchar(50) not null,
	tipo char(7)
);

ALTER TABLE sensor ADD CONSTRAINT chkSensor CHECK(tipo in ('umidade'));

INSERT INTO sensor VALUES 
	(default, 1, 1, 'beta', 'umidade');

SELECT * FROM sensor;
DROP TABLE sensor;

CREATE TABLE leitura_umidade (
    id_leitura int primary key auto_increment not null,
    idSensor int not null,
    umidade int not null,
    data_leitura date not null
);

DROP TABLE leitura_umidade;

INSERT INTO leitura_umidade VALUES 
	(default, 1, 60, '2024-03-12');

DESC leitura_umidade;

SELECT * FROM leitura_umidade;

CREATE TABLE cliente(
	idClient int primary key,
	nome varchar(100) not null,
	email varchar(100),
	telefone varchar(20)
)



