create database bd_st;
use bd_st;

create table hectar(idHectar int primary key auto_increment,  
umidade_status varchar(50), 
constraint chkumidade check(umidade_status in("Seco", "Moderado", "Úmido")));

insert into hectar values(default, 'Moderado'), (default, 'Seco'), (default, 'Úmido');

create table sensor(idSensor int primary key auto_increment, 
hectar_loc int, 
alcance_por_hec int, 
umidade_capitura float);

insert into sensor values(default, 2, 1, 20.7), (default, 1, 1, 60.5), (default, 3, 1, 80.0);

create table cliente(idCliente int primary key auto_increment, 
nome varchar(70),
local varchar(100), 
tamanho_local_hec int);

insert into cliente values(default, 'Joséria', 'Rio Grande do Sul', 100), (default, 'Mauricio', 'Goias', 80), (default, 'José', 'Mato grosso', 200);

select * from hectar, sensor, cliente;
select nome, local, tamanho_local_hec from cliente;