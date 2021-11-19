CREATE DATABASE POSTO_ABC_2
GO

USE POSTO_ABC_2;
GO

CREATE TABLE TANQUES ( id_tanque int primary key,
					   combustivel varchar(10) not null);

INSERT INTO TANQUES VALUES (1,'GASOLINA');
INSERT INTO TANQUES VALUES (2,'DIESEL'); 
GO

CREATE TABLE BOMBAS ( id_bomba int primary key,
					  descricao varchar(10),
					  id_tanque int,
					  CONSTRAINT fk_id_tanque FOREIGN KEY(id_tanque) REFERENCES TANQUES(id_tanque));

INSERT INTO BOMBAS VALUES (1,'BOMBA-1',1);
INSERT INTO BOMBAS VALUES (2,'BOMBA-2',1);
INSERT INTO BOMBAS VALUES (3,'BOMBA-3',2);
INSERT INTO BOMBAS values (4,'BOMBA-4',2);
GO

CREATE TABLE ABASTECIMENTO ( id_abastecimento int primary key identity(1,1),
						     id_bomba_abastecimento int not null,
							 litros int not null,
							 valor money not null,
							 data_abastecimento datetime,
							 CONSTRAINT fk_bomba_abastecimento 
							 FOREIGN KEY(id_bomba_abastecimento) REFERENCES BOMBAS(id_bomba));

