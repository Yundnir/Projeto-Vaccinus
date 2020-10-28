create database dbVacina;
use dbVacina;

create table tbUsuario (
	idUsuario int primary key auto_increment,
	nome varchar (50),
	email varchar (40),
	telefone char (12),
	cnpj char (18),
	senha varchar (100)
);

 insert into tbUsuario (nome, email, telefone, cnpj, senha) values 
('Renato Paulino', 'renato.paulino@bandtec.com.br', '1199999-9990', '92.754.738/0001-62', 'qualquercoisa0' ),
('Priscila Choi', 'priscila.choi@bandtec.com.br', '1199999-9991', '31.435.813/0001-38', 'qualquercoisa1'),
('Nicolas Carvalho', 'nicolas.carvalho@bandtec.com.br', '1199999-9992', '78.654.450/0001-95', 'qualquercoisa2'),
('Andre Santos', 'andre.santos@bandtec.com.br', '1199999-9993', '88.823.133/0001-09', 'qualquercoisa3'),
('Matheus Daniel', 'matheus.boaventura@bandtec.com.br', '1199999-9994', '72.330.495/0001-28', 'qualquercoisa4'),
('Guilherme Santos', 'guilherme.santos@bandtec.com.br', '1199999-9995', '92.754.738/0001-62', 'qualquercoisa5');
                            
-- Tabela de transporte/destino para onde a vacina está sendo encaminhada
create table tbDestino (
idDestino int primary key auto_increment,
partida varchar (50),
destino varchar (50)
);
insert into tbDestino (partida, destino) values 
('São Paulo/SP', 'Rio Grande/AC'),
('Rio de Janeiro/RJ', 'Porto Alegre/RS'),
('São Paulo/SP', 'Osasco/SP'),
('Campina Grande/PB', 'Belem/PA');

create table tbControleTemp (
idControleTemp int primary key auto_increment,
sobre_temperatura varchar (8),
abaixo_temperatura varchar (8)	
						
);
insert into tbControleTemp values (null,'10°C', '-6°C'),
								  (null,'9°C', '-3°C'),
								  (null,'12°C', '-3,5°C'),
								  (null,'8°C', '-7°C');

create table tbContainerTemp (  -- ACRESCENTAR A CHAVE ESTRANGEIRA
idContainer int primary key auto_increment,
datahora varchar (30),
temperatura varchar (7),
fkUsuario int,
fkControleTemp int,
foreign key (fkUsuario) references tbUsuario (idUsuario),
foreign key (fkControleTemp) references tbControleTemp (idControleTemp)
);

insert into tbContainerTemp (datahora, temperatura, fkUsuario, fkControleTemp) values 
('01/10/2020 12:00', '3ºC', 1, 3),
('02/10/2020 13:00', '4ºC', 2, 2),
('03/10/2020 14:00', '2,5ºC', 3, 4),
('04/10/2020 14:30', '3,25ºC', 5, 1);

create table tbVacinas (
	idVacina int primary key auto_increment,
    nomeVacina varchar(60),
    datahora date,
    loteVacina varchar(20),
    fkDestino int,
    fkContainerTemp int,
    foreign key (FkDestino) references tbDestino (idDestino),
    foreign key (fkContainerTemp) references tbContainerTemp (idContainer)
);

insert into tbVacinas(nomeVacina, datahora, loteVacina, fkDestino, fkContainerTemp) values
	('Febre Amarela', '2020/10/09', '149VPOO', 2, 3),
	('H1N1', '2020/10/12', '150VPOO', 3, 1),
	('Sarampo', '2020/01/09', '151VPOO', 4, 2);
    
select * from tbVacinas;

-- Tabela de Relatório - Registro (máxima e mínima)


-- Tabela de temperatura no tempo real dentro do Container




select * from tbContainerTemp;
					
select * from tbUsuario;
select * from tbContainerTemp;
select * from tbControleTemp;
select * from tbDestino;
 
desc tbDestino;



 
 
 

 