create database aluguel_carro;
use aluguel_carro;

create table cliente(
idCliente int,
nomerazaosocial varchar(255),
CPF char(11),
Endereco varchar(255),
Numero char(5),
UF char(3),
Estado char(3),
CEP int(11)
);

create table aluguel(
idAluguel int,
idCarro int,
Previsao_Volta date,
Quilometragem double
);

create table carro(
idCarro int,
Modelo varchar(20),
Ano char(4),
Automatico boolean,
Valor_Aluguel double
);

create table manutencao(
idManutencao int,
idCarro int,
ValorManutencao double,
Quilometragem_manutencao double
);


INSERT INTO cliente (idCliente, nomerazaosocial, CPF, Endereco, Numero, UF, Estado, CEP)
VALUES
  (1, 'Cliente 1', '12345678901', 'Rua A', '12345', 'SP', 'São Paulo', 123456),
  (2, 'Cliente 2', '98765432109', 'Avenida B', '54321', 'RJ', 'Rio de Janeiro', 987654),
  (3, 'Cliente 3', '45678901234', 'Praça C', '98765', 'MG', 'Minas Gerais', 456789);


INSERT INTO aluguel (idAluguel, idCarro, Previsao_Volta, Quilometragem)
VALUES
    (1, 101, '2023-09-10', 150.5),
    (2, 102, '2023-09-12', 200.0),
    (3, 103, '2023-09-14', 180.7),
    (4, 104, '2023-09-16', 220.2);


INSERT INTO carro (idCarro, Modelo, Ano, Automatico, Valor_Aluguel) 
VALUES 
    (1, 'Toyota Corolla', '2020', true, 50.0),
    (2, 'Honda Civic', '2021', false, 45.5),
    (3, 'Ford Mustang', '2019', true, 80.2),
    (4, 'Volkswagen Golf', '2022', true, 48.7),
    (5, 'Chevrolet Camaro', '2018', false, 75.3);

INSERT INTO manutencao (idManutencao, idCarro, ValorManutencao, Quilometragem_manutencao)
VALUES
    (1, 101, 150.50, 5000.00),
    (2, 102, 200.75, 7500.25),
    (3, 103, 75.20, 3200.75),
    (4, 104, 300.00, 10000.50);
    
    
-- Quais carros estão disponiveis para aluguel?
select carro.idCarro from carro where(carro.idCarro not in(select aluguel.idCarro from aluguel)) order by carro.idCarro;

-- Preciso saber os carros disponiveis, ordenando do mais barato para o mais caro
select carro.Modelo from carro order by carro.Valor_Aluguel asc;

 -- Me mostre apenas os carros com uma quilometragem de manutenção superior a 10000 
 -- e um valor total de manutenção superior a 500.
 SELECT idCarro, SUM(ValorManutencao) AS TotalManutencao FROM manutencao
GROUP BY idCarro
HAVING Quilometragem_manutencao > 10000 AND TotalManutencao > 500;
