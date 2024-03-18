CREATE DATABASE sprint1;
USE sprint1;
CREATE TABLE Hectars (
    IdHectar INT PRIMARY KEY AUTO_INCREMENT,
    AreaMetrosQuadrados INT,
    TipoSolo VARCHAR(50),
    DataPlantio DATE,
    DataColheita DATE,
    ProducaoEstimada int,
    PrecoEstimado decimal (4, 2),
    ResponsavelPlantio VARCHAR(100)
);

INSERT INTO Hectars (AreaMetrosQuadrados, TipoSolo, DataPlantio, DataColheita, ProducaoEstimada, PrecoEstimado, ResponsavelPlantio) VALUES
('5000', 'Argiloso', '2023-04-15', '2023-10-20', 7000, 10, 'João da Silva'),
('3000', 'Arenoso', '2023-05-10', '2023-09-25', 4500, 12, 'Maria Oliveira'),
('7000', 'Arenoso', '2023-06-01', '2023-11-15', 8500, 18, 'Carlos Santos'),
('4500', 'Argiloso', '2023-07-20', '2023-12-10', 6000, 14, 'Ana Souza');
SELECT * FROM hectars;


--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------


USE sprint1;
CREATE TABLE sensor(
idSensor int primary key auto_increment,
Setor char(4),
QtdSensores int,
Status varchar(40));

ALTER TABLE sensor ADD CONSTRAINT chksensores CHECK(Status in ('desligado', 'ligado', 'em manutenção'));
INSERT INTO sensor (Setor, QtdSensores, Status) VALUES
 ('A1', 1, 'ligado'),
 ('B1', 2, 'desligado'),
 ('C1', 2, 'em manutenção'),
 ( 'A2', 3, 'desligado');
 
 SELECT * FROM sensor;
 
 -----------------------------------------------------------------------------------------------------------
 -----------------------------------------------------------------------------------------------------------
 USE sprint1;
 CREATE TABLE cliente(
 idCliente int primary key auto_increment,
 nome varchar(30),
 email varchar(70),
 telefone char(11),
 endereco varchar(70),
 qtdSensores int);
 SELECT * FROM cliente;
 INSERT INTO cliente (nome, email, telefone, endereco, qtdSensores) VALUES
('João', 'joao.silva@example.com', '1234-5678', 'Rua das Flores, 123', 9),
('Maria', 'maria.oliveira@example.com', '9876-5432', 'Avenida Central, 456', 5),
('Carlos', 'carlos.santos@example.com', '5555-5555', 'Travessa das Árvores, 789', 6),
('Ana', 'ana.souza@example.com', '1111-1111', 'Praça Principal, 321', 5);

 SELECT * FROM cliente;

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------


USE sprint1;
CREATE TABLE controle(
idControle int primary key auto_increment,
responsavelInstalaçao varchar(20),
dataInstalaçao DATETIME,
endereco varchar(70),
qtdSnsoresUsados int);

SELECT * FROM controle;
INSERT INTO controle (responsavelInstalaçao, dataInstalaçao, endereco, qtdSnsoresUsados) VALUES
('João', '2023-05-10 09:00:00', 'Rua das Flores, 123', 5),
('Maria', '2023-05-15 10:30:00', 'Avenida Central, 456', 8),
('Carlos', '2023-05-20 11:45:00', 'Travessa das Árvores, 789', 6),
('Ana', '2023-05-25 13:15:00', 'Praça Principal, 321', 4);
SELECT * FROM controle;

 



