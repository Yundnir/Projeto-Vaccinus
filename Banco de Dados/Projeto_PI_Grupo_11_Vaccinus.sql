create database dbVacina;
use dbVacina;

Create table tbEmpresa (
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar(50),
    Rua varchar(50),
    Numero int,
    Bairro varchar(50),
    CEP char(9),
    Tel_Comercial1 char(13),
    Tel_Comercial2 char(13),
    CNPJ char(18)    

);

insert into tbEmpresa(nomeEmpresa, Rua,Numero, Bairro, CEP, Tel_Comercial1, Tel_Comercial2, CNPJ) values
 ('SUS-SP', 'Haddock Lobo', 153, 'Paulista', '99999-098', '(11)2121-2121', '(11)2222-2222', '07.165.496/0001-00');



create table tbUsuario (
	idUsuario int primary key auto_increment,
	nome varchar (50),
	email varchar (40),
	Tel_Residencial char (13),
	Celular char (13),
	CPF char(14),
	senha varchar (100),
    fkEmpresa int,
    foreign key (fkEmpresa) references tbEmpresa (idEmpresa)
);



 insert into tbUsuario (nome, email, Tel_Residencial, Celular ,CPF, senha, fkEmpresa) values 
('Renato Paulino', 'renato.paulino@bandtec.com.br', '1199999-9990','11997677464' , '123.456.789-10', 'qualquercoisa0', 1),
('Priscila Choi', 'priscila.choi@bandtec.com.br', '1199999-9991','11998677464' , '321.456.789-10', 'qualquercoisa0', 1),
('Nicolas Carvalho', 'nicolas.carvalho@bandtec.com.br', '1199999-9992','11999677464' , '543.456.789-10', 'qualquercoisa0', 1),
('Andre Santos', 'andre.santos@bandtec.com.br', '1199999-9993','11990677464' , '224.456.789-10', 'qualquercoisa0', 1),
('Matheus Daniel', 'matheus.boaventura@bandtec.com.br', '1199999-9994','11997177464' , '113.456.789-10', 'qualquercoisa0', 1),
('Guilherme Santos', 'guilherme.santos@bandtec.com.br', '1199999-9995','11994677464' , '101.456.789-10', 'qualquercoisa0', 1);


create table tbVacinas (
	idVacina int primary key auto_increment,
    nomeVacina varchar(60),
    loteVacina varchar(20),
    temp_min decimal(4,2),
    temp_max decimal(4,2)

);

insert into tbVacinas(nomeVacina, loteVacina,temp_min, temp_max) values
	('Febre Amarela',  '149VPOO', 2.00, 8.00),
	('H1N1', '150VPOO', 2.00, 8.00),
	('Sarampo',  '151VPOO', 2.00, 8.00);


create table tbSensor (
	idSensor int primary key auto_increment,
	serialNumber char(8)
);

insert into tbSensor  values (null, 'sSRGTj2L'),
(null, '3BqUgr58');


create table tbContainer (
idContainer int primary key auto_increment,
nomeContainer varchar(50), -- Ex: CD1
fkEmpresa int,
fkVacina int,
fkSensor int,
foreign key (fkEmpresa) references tbEmpresa (idEmpresa),
foreign key (fkVacina) references tbVacinas (idVacina),
foreign key (fkSensor) references tbSensor (idSensor)
);

select * from tbContainer;

insert into tbContainer (nomeContainer, fkEmpresa, fkVacina, fkSensor) values 
('CD1', 1, 1, 1);
                            
-- Tabela de transporte/destino para onde a vacina está sendo encaminhada
create table tbRota (
idRota int primary key auto_increment,
hrInicio datetime,
hrFim datetime,
partida varchar (50),
destino varchar (50),
fkContainer int,
foreign key (fkContainer) references tbContainer (idContainer)

);
insert into tbRota (hrInicio, hrFim,partida, destino, fkContainer) values 
('2020/10/12 12:00:00', '2020/10/12 14:00:00', 'Vila Prudente', 'Av Paulista', 1);



create table tbLeitura (
idLeitura int primary key auto_increment,
temp_atual decimal (4,2),
hr_temp datetime,
fkSensor int,
foreign key (fkSensor) references tbSensor (idSensor)
						
);
insert into tbLeitura(temp_atual, hr_temp, fkSensor) values (10.00, '2020/10/12 12:00', 1);


    
select * from tbVacinas;

-- Tabela de Relatório - Registro (máxima e mínima)


-- Tabela de temperatura no tempo real dentro do Container



select * from tbSensor;
					
select * from tbUsuario;
select * from tbContainer;
select * from tbRota;
select * from tbEmpresa;

select idContainer, nomeContainer, nomeEmpresa, nomeVacina, serialNumber 
from tbContainer, tbEmpresa, tbVacinas, tbSensor
where idVacina = fkVacina and idSensor = fkSensor;


 
 
 

 