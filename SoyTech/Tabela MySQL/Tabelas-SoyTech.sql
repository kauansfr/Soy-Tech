create database Soytech;

use Soytech;

-- ------------------------------------------------------- Criando Tabela Cliente ---------------------------------------------------------------------
create table Cliente(
IdCliente int primary key auto_increment,
fkFazenda int not null,
Nome varchar(50) not null,
telefone char(9),
Email_para_contato varchar(60) not null,
Email_Cadastrado varchar(60) not null,
Senha_Cadastrada varchar(40) not null
);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Criando Tabela Fazenda ---------------------------------------------------------------------
create table Fazenda(
IdFazenda int primary key auto_increment,
fkCliente int not null,
Nome_Fazenda varchar(40),
CEP_rural char(8),
Qnt_Hectares int not null
);


-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Criando Tabela Hectare ---------------------------------------------------------------------
create table Hectare(
IdHectare int primary key auto_increment,
fkSensor int not null,
fkFazenda int not null,
Umidade decimal(4,2),
constraint chkUmidade check (Umidade < 100 and Umidade >= 0),
Estado_Hectare varchar(30) not null,
constraint chkEstado_Hectare check (Estado_Hectare in('Atenção! Umidade Media!', 'Umidade Ideal!', 'ALERTA! Umidade Baixa!')),
Ultima_Leitura datetime not null
);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Criando Tabela Sensor ----------------------------------------------------------------------
create table Sensor(
IdSensor int primary key auto_increment,
fkHectare int not null, 
Dados_De_Umidade decimal(4,2) constraint chkDados_Umidade check (Dados_de_Umidade < 100 and Dados_de_Umidade >= 0),
Ultima_Leitura datetime not null
);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Insert Cliente ----------------------------------------------------------------------------
insert into Cliente Values
(default,'1','João Paulo','123456789','JoãoPaulo@outlook.com','FazendasPuras@outlook.com','JoãoPaulo!Fazendo2024'),
(default,'2','Ana Julia','234567890','AnaJulia@outlook.com','FazendasSeuLar@outlook.com','124#fazenda'),
(default,'3','Carlos Duval','345678901','CarlosD@outlook.com','SuperFazenda@outlook.com','C4RL05@2024'),
(default,'4','Fernanda Rodrigues','456789012','FefeR@outlook.com','FazendaFlorDoCampo@outlook.com','Fergatinhos@#'),
(default,'5','Henrique Gomes','567890123','HenriGomes@outlook.com','FazendaRioVerde@outlook.com','Soja654321&&'),
(default,'6','Carlos Duval','345678901','CarlinhosDudu','MegaFazendas@outlook.com','M3G4!322003');

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Insert Fazendas ----------------------------------------------------------------------------
insert into Fazenda Values
(default,'1','Fazenda Pura','05020466','55'),
(default,'2','Fazenda Seu Lar!','05089466','100'),
(default,'3','Super Fazendas','05260466','241'),
(default,'4','Fazendo Flor Do Campo','05020036','20'),
(default,'5','Fazenda Rio Verde','05028466','324'),
(default,'6','Mega Fazenda','05282466', '500');

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Insert Hectares ----------------------------------------------------------------------------
insert into Hectare Values
(default,'1','1','50.12','Atenção! Umidade Media!','2024-03-11 06:30:00'),
(default,'2','1','82.90','Umidade Ideal!','2024-03-10 19:45:30'),
(default,'3','1','40.90','ALERTA! Umidade Baixa!','2024-03-09 10:22:47'),
(default,'4','1','60.30','Atenção! Umidade Media!','2024-03-11 21:57:23'),
(default,'5','1','90.22','Umidade Ideal!','2024-03-13 17:34:32'),
(default,'6','1','94.90','Umidade Ideal!','2024-03-10 02:58:00'),
(default,'7','1','14.79','ALERTA! Umidade Baixa!','2024-03-08 03:20:15'),
(default,'8','1','24.90','ALERTA! Umidade Baixa!','2024-03-07 14:45:21'),
(default,'9','1','59.00','Atenção! Umidade Media!','2024-03-10 11:55:40'),
(default,'10','1','50.10','Atenção! Umidade Media!','2024-03-14 15:30:00');

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Insert Sensores ----------------------------------------------------------------------------
insert into Sensor Values
(default,'1','50.12', '2024-03-11 06:30:00'),
(default,'2','82.90', '2024-03-10 19:45:30'),
(default,'3','40.90','2024-03-09 10:22:47'),
(default,'4','60.30','2024-03-11 21:57:23'),
(default,'5','90.22','2024-03-13 17:34:32'),
(default,'6','94.90','2024-03-10 02:58:00'),
(default,'7','14.79','2024-03-08 03:20:15'),
(default,'8','24.90','2024-03-07 14:45:21'),
(default,'9','59.00','2024-03-10 11:55:40'),
(default,'10','50.10','2024-03-14 15:30:00');

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Selects Clientes ---------------------------------------------------------------------------
-- Mostra Todos os dados dos Clientes.
SELECT * FROM Cliente;

-- Mostra Todos os dados dos Clientes cujo o nome começa de certa forma, esse por exemplo poderia retornar clientes chamados FERnando e FERnanda, mas poderia ser usado para outros tipos de nome.
SELECT * FROM Cliente WHERE Nome LIKE 'Fer%';


-- Mostra dados de Clientes que tem mais de uma fazenda cadastrada.
SELECT * FROM Cliente WHERE Nome = 'Carlos Duval';

-- Serve para gerar um mensagem personalizada para notificar um cliente sobre a contratação de serviços.
SELECT concat('Olá ',nome, "! Ficamos felizes em saber que contratou nossos serviços! Mandaremos avisos recorrentes para lhe manter informado para o email de contato fornecido que é o ",Email_para_contato) as Mensagem FROM Cliente
WHERE IdCliente = 4;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Selects Fazendas ---------------------------------------------------------------------------
-- Mostra Todas as fazendas e Seus Dados
SELECT * FROM Fazenda; 

 -- Mostra CEP e Nome da fazenda, facilitando entender a localização
SELECT CEP_rural, Nome_Fazenda from Fazenda;

 -- Mostra fazendas que tem a quantidade de Hectares á partir de certo numero, Isso pode ser útil para identificar as fazendas que têm uma área consideravel de terra.
SELECT Nome_Fazenda, Qnt_Hectares as Quantidade_de_Hectares from Fazenda WHERE Qnt_Hectares >= 100;

 -- Funciona da mesma forma que o SELECT acima, mas para mostrar fazendas com areas menores.
SELECT Nome_Fazenda, Qnt_Hectares as Quantidade_de_Hectares from Fazenda WHERE Qnt_Hectares <= 50;

-- Serve para gerar uma mensagem personalizada que descreve informações como nome, localização, tamanho e requisitos de monitoramento.
SELECT concat('A Fazenda com o nome de ', Nome_Fazenda, ' Localizada no CEP Rural ', CEP_RURAL, ' Possui ', Qnt_Hectares, ' Hectares, Portanto serão Necessarios 55 sensores para suprir a demanda de monitoramento da fazenda.') as Mensagem FROM Fazenda
WHERE IdFazenda = 1;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Selects Hectares ---------------------------------------------------------------------------
-- Mostra dados de todos os Hectares.
SELECT * FROM Hectare;

-- Mostra dados de um Hectar Especifico.
SELECT * FROM Hectare WHERE IdHectare = 1;

-- Mostra dados de Estado e Umidade dos Hectares que estão em certo Estado.
SELECT Estado_Hectare, Umidade, IdHectare FROM Hectare WHERE Estado_Hectare = 'ALERTA! Umidade Baixa!';

-- Serve para  gerar uma mensagem personalizada que descreve o estado e a umidade de um hectare específico, bem como a data da última leitura de umidade realizada nele
SELECT concat(Estado_Hectare,' A Umidade do Hectare se encontra em ',Umidade,'%. A Ultima Leitura de Umidade desse Hectare Foi realizada em ', Ultima_Leitura ) as Mensagem FROM Hectare
WHERE IdHectare = 9;
	
-- Mostra Dados de Hectares filtrando apenas as leituras de umidade e Estado do Hectare que foram feitas dentro do intervalo de datas especificado.
SELECT Estado_Hectare, Umidade FROM Hectare WHERE Ultima_Leitura >= '2024-03-11' AND Ultima_Leitura <= '2024-03-13';

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

-- ------------------------------------------------------- Selects Sensor -----------------------------------------------------------------------------
-- Mostra dados de Todos os sensores.
SELECT * FROM Sensor;

-- Mostra relação de Sensores com os Hectares que eles estão localizados.
Select fkHectare, IdSensor FROM Sensor; 

-- Mostra Dados de Humidade do Sensor
select IdSensor, Dados_De_Umidade FROM Sensor;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------