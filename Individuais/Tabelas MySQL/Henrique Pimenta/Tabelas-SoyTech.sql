create database soytech;

create table hectar(
idHectar int primary key,
area int not null, 
localizacao varchar (255) not null
);

create table sensor(
idSensor int primary key,
modelo varchar,
dataInstalacao date
);

create table cliente(
idClient int primary key,
nome  varchar (100) not null, 
cnpj varchar (100) not null,
email varchar (254)
);
