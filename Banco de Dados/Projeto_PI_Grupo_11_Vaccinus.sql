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

 insert into tbUsuario values (null,'Renato Paulino', 'renato.paulino@bandtec.com.br', '1199999-9990', '92.754.738/0001-62', 'qualquercoisa0' ),
						    (null,'Priscila Choi', 'priscila.choi@bandtec.com.br', '1199999-9991', '31.435.813/0001-38', 'qualquercoisa1'),
                            (null,'Nicolas Carvalho', 'nicolas.carvalho@bandtec.com.br', '1199999-9992', '78.654.450/0001-95', 'qualquercoisa2'),
                            (null,'Andre Santos', 'andre.santos@bandtec.com.br', '1199999-9993', '88.823.133/0001-09', 'qualquercoisa3'),
							(null,'Matheus Daniel', 'matheus.boaventura@bandtec.com.br', '1199999-9994', '72.330.495/0001-28', 'qualquercoisa4'),
							(null,'Guilherme Santos', 'guilherme.santos@bandtec.com.br', '1199999-9995', '92.754.738/0001-62', 'qualquercoisa5');
                            
create table tbContainerTemp (
idContainer int primary key auto_increment,
datahora varchar (30),
temperatura varchar (7),
lotevacina varchar (20)
);
insert into tbContainerTemp values (null,'01/10/2020 12:00', '3ºC', '149VPOO'),
								 (null,'02/10/2020 13:00', '4ºC', '150VPOO'),
								 (null,'03/10/2020 14:00', '2,5ºC', '151VPOO'),
								 (null,'04/10/2020 14:30', '3,25ºC', '152VPOO');
                                 
create table tbControleTemp (
idControleTemp int primary key auto_increment,
sobre_temperatura varchar (8),
abaixo_temperatura varchar (8)							
);
insert into tbControleTemp values (null,'10°C', '-6°C'),
								(null,'9°C', '-3°C'),
								(null,'12°C', '-3,5°C'),
								(null,'8°C', '-7°C');

create table tbDestino (
idDestino int primary key auto_increment,
partida varchar (50),
destino varchar (50),
lotevacina varchar (20)
);
insert into tbDestino values (null,'São Paulo/SP', 'Rio Grande/AC', '149VPOO'),
					       (null,'Rio de Janeiro/RJ', 'Porto Alegre/RS', '150VPOO'),
					       (null,'São Paulo/SP', 'Osasco/SP', '151VPOO'),
					       (null,'Campina Grande/PB', 'Belem/PA', '152VPOO');
     
 select * from tbUsuario;
 select * from tbContainerTemp;
 select * from tbControleTemp;
 select * from tbDestino;
 
 
 
 