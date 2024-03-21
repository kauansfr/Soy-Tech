create database sprint1;

use sprint1;

create table hectar (
idHectar int primary key auto_increment,
fkCliente varchar(40), -- Simula chave externa da tabela cliente (ainda não aprendido)
umidade varchar(50) not null,
cep varchar(9),
ultimaVisita date
);

insert into hectar (fkCliente, umidade, cep, ultimaVisita) values
	('Cleiton Vieira', 'Adequado!', '05202-101', '2024-02-29'),
    ('Manuela Amarantes', 'Adequado!', '04102-100', '2024-02-20'),
    ('Anderson Silva', 'Atenção! Umidade está abaixo do adequado.', '05212-002', '2024-02-15'),
	('Chris Bumpstead', 'Adequado!', '05100-020', '2024-03-05'),
    ('Ramon Dino', 'Adequado!', '05202-200', '2024-03-01'),
    ('Kyrie Irving', 'Atenção! Umidade está acima do adequado.', '05101-300', '2024-03-08'),
    ('Giovanna Peixoto', 'Adequado!', '05100-200', '2024-02-28');

-- -------------------------------------------------------- (SELECTS HECTAR)

-- EXIBIR TABELA CLIENTE --
select fkCliente as Cliente,
	umidade as 'Umidade do Hectar',
    ultimaVisita as 'Última Visita',
    cep as CEP from hectar;

-- LOCALIZAR IDs COM UMIDADE EM "ATENÇÃO" --
select idHectar, fkCliente, ultimaVisita from hectar
	where umidade like '%Atenção!%';

-- ATUALIZAR STATUS DE UMIDADE --
update hectar set umidade = 'Adequado!'
	where idHectar = 3 or idHectar = 6;

-- -----------------------------------------------------------------------------------------------------------------------------

create table sensor (
idSensor int primary key auto_increment,
fkHectar int not null,
dataInstalação date
);

insert into sensor (fkHectar, dataInstalação) values
	('1', '2023-11-20'),
    ('2', '2023-12-02'),
    ('3', '2023-11-29'),
    ('4', '2024-01-03'),
    ('5', '2024-02-03'),
    ('6', '2024-01-20'),
    ('7', '2023-12-03');

-- -------------------------------------------------------- (SELECTS SENSOR)

-- EXIBIR TABELA SENSOR --
select fkHectar as 'ID do Hectar Instalado',
	dataInstalação as 'Data de Instalação'
    from sensor;

-- EXIBIR SENSORES INSTALADOS NO ANO PASSADO (DETERMINADA DATA) --
select * from sensor
	where dataInstalação like '%2023%';

-- -----------------------------------------------------------------------------------------------------------------------------

create table cliente (
idCliente int primary key auto_increment,
nome varchar(40),
safras int not null,
cpf char(14),
endereco varchar (50),
emailContato varchar(60) not null,
telefone char(13)
);

	insert into cliente (nome, safras, cpf, endereco, emailContato, telefone) values
    ('Cleiton Vieira', '2', '012.132.122-07', 'Rua Marone Guimarães, 322', 'amoSoja123@outlook.com', '11 92301-0123'),
    ('Manuela Amarantes', '4', '123.303.321-92', 'Rua Pedro Sales, 901', 'soja_porAmor@hotmail.com', '11 91693-6549'),
    ('Anderson Silva', '1', '313.223.255-91', 'Av. Bezerra da Silva, 445', 'SojaSilva@outlook.com', '11 92215-5900'),
	('Chris Bumpstead', '2', '661.621.901-10', 'Rua Almirante Batista, 20', 'sojaBuilding@gmail.com', '11 91695-9679'),
    ('Ramon Dino', '3', '725.019.022-11', 'Av. Domingos de Sandro, 35', 'SojaDino@hotmail.com', '12 91220-2122'),
    ('Kyrie Irving', '2', '882-890-301-90', 'Rua José Correia, 200', 'sojaNBA@gmail.com', '13 91292-9299'),
    ('Giovanna Peixoto', '1', '790.709.117-87', 'Rua Santo Antônio', 'PeixotoINC@gmail.com', '11 98764-0467');
    
-- -------------------------------------------------------- (SELECTS CLIENTE)

-- EXIBIR TABELA CLIENTE --
select nome as Nome,
	safras as 'Safras Monitoradas',
    cpf as CPF,
    endereco as Endereço,
    emailContato as 'Email de Contato',
    telefone as Telefone
		from cliente;

-- CLIENTE SAFRA EM ANDAMENTO
select concat(nome, ' - ', safras, ' Em monitoramento') as 'Nome e Safras' from cliente
	where idCliente in(3, 6, 7);

-- CLIENTE SAFRA COLHIDA
select concat(nome, ' - ', safras, ' Colhidas') as 'Nome e Safras' from cliente
	where idCliente in (1, 2);