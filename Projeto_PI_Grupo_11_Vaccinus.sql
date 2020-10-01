create database vacina;
use vacina;
create table usuario (
id int primary key,
nome varchar (50),
email varchar (40),
telefone char (12),
cnpj char (18),
senha varchar (100)
);
 insert into usuario values (000, 'Renato Paulino', 'renato.paulino@bandtec.com.br', '1199999-9990', '92.754.738/0001-62', 'qualquercoisa0' ),
						    (001, 'Priscila Choi', 'priscila.choi@bandtec.com.br', '1199999-9991', '31.435.813/0001-38', 'qualquercoisa1'),
                            (002, 'Nicolas Carvalho', 'nicolas.carvalho@bandtec.com.br', '1199999-9992', '78.654.450/0001-95', 'qualquercoisa2'),
                            (003, 'Andre Santos', 'andre.santos@bandtec.com.br', '1199999-9993', '88.823.133/0001-09', 'qualquercoisa3'),
							(004, 'Matheus Daniel', 'matheus.boaventura@bandtec.com.br', '1199999-9994', '72.330.495/0001-28', 'qualquercoisa4'),
							(005, 'Guilherme Santos', 'guilherme.santos@bandtec.com.br', '1199999-9995', '92.754.738/0001-62', 'qualquercoisa5');
                            
create table containerTemp (
idContainer int primary key,
datahora varchar (30),
temperatura varchar (7),
lotevacina varchar (20)
);
insert into containerTemp values (000, '01/10/2020 12:00', '3ºC', '149VPOO'),
								 (001, '02/10/2020 13:00', '4ºC', '150VPOO'),
								 (002, '03/10/2020 14:00', '2,5ºC', '151VPOO'),
								 (003, '04/10/2020 14:30', '3,25ºC', '152VPOO');
                                 
create table controleTemp (
id int primary key,
sobre_temperatura varchar (8),
abaixo_temperatura varchar (8)							
);
insert into controleTemp values (000, '10°C', '-6°C'),
								(001, '9°C', '-3°C'),
								(002, '12°C', '-3,5°C'),
								(003, '8°C', '-7°C');

create table destino (
id int primary key,
partida varchar (50),
destino varchar (50),
lotevacina varchar (20)
);
insert into destino values (000, 'São Paulo/SP', 'Rio Grande/AC', '149VPOO'),
					       (001, 'Rio de Janeiro/RJ', 'Porto Alegre/RS', '150VPOO'),
					       (002, 'São Paulo/SP', 'Osasco/SP', '151VPOO'),
					       (003, 'Campina Grande/PB', 'Belem/PA', '152VPOO');
					
                           
                            
 