use master;
create database myPark_Server2;

use myPark_Server2;

-- ESTADO
create TABLE Estado(
  IdEstado INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(50)
)

-- MUNICIPIO
create TABLE Municipio(
  IdMunicipio INT NOT NULL PRIMARY KEY,
  Nombre VARCHAR(50),
  IdEstado INT,
  FOREIGN KEY (IdEstado) REFERENCES Estado (IdEstado)
)

-- LOCALIZACION
create table Localizacion(
  IdLocalizacion INT NOT NULL PRIMARY KEY,
  Calle VARCHAR(50),
  Numero INT,
  Colonia VARCHAR(50),
  CP VARCHAR(10),
  IdMunicipio INT,
  FOREIGN KEY (IdMunicipio) REFERENCES Municipio (IdMunicipio)
)

-- SUCURSAL
create table Sucursal(
  IdSucursal INT NOT NULL PRIMARY KEY,
  NombreSucursal VARCHAR(30) not null,
  IdLocalizacion INT,
  FOREIGN KEY (IdLocalizacion) REFERENCES Localizacion (IdLocalizacion)
)

-- PUESTO
create table Puesto(
  IdPuesto INT NOT NULL PRIMARY KEY,
  Puesto VARCHAR(50),
  Salario decimal(15,2)
)

-- TURNO
create table Turno(
  IdTurno INT NOT NULL PRIMARY KEY,
  Turno VARCHAR(15),
)

-- EMPLEADOS
create table Empleados(
  IdEmpleado INT NOT NULL PRIMARY KEY,
  RFC VARCHAR(15),
  Nombres VARCHAR(80),
  Ap_Paterno VARCHAR(40),
  Ap_Materno VARCHAR(40),
  FechaNacimiento date,
  Correo VARCHAR(40),
  Telefono VARCHAR(10),
  IdPuesto INT,
  IdTurno INT,
  IdSucursal INT,
  FOREIGN KEY(IdSucursal) REFERENCES Sucursal(IdSucursal),
  FOREIGN KEY(IdPuesto) REFERENCES Puesto(IdPuesto),
  FOREIGN KEY(IdTurno) REFERENCES Turno(IdTurno)
)


-- USUARIOS
create table Usuarios(
  IdUsuario INT NOT NULL PRIMARY KEY,
  Nombres VARCHAR(80),
  Ap_Paterno VARCHAR(40),
  Ap_Materno VARCHAR(40),
  FechaNacimiento date,
  Correo VARCHAR(40),
  Telefono VARCHAR(10),
  Puntos INT,
  Saldo FLOAT,
  IdSucursal INT,
  FOREIGN KEY(IdSucursal) REFERENCES Sucursal(IdSucursal)
)

-- JUEGOS
create table Juegos(
  IdJuego INT NOT NULL PRIMARY KEY,
  NombreJuego VARCHAR(30),
  PrecioJuego decimal(5,2),
  IdSucursal INT,
  FOREIGN KEY(IdSucursal) REFERENCES Sucursal(IdSucursal)
)

-- POBLANDO BASE DE DATOS
-- ESTADOS
INSERT INTO Estado VALUES (12, 'Aguascalientes');
INSERT INTO Estado VALUES (13, 'Colima');
INSERT INTO Estado VALUES (14, 'Ciudad de Mexico');
INSERT INTO Estado VALUES (15, 'Estado de México');
INSERT INTO Estado VALUES (16, 'Guanajuato');
INSERT INTO Estado VALUES (17, 'Hidalgo');
INSERT INTO Estado VALUES (18, 'Jalisco');
INSERT INTO Estado VALUES (19, 'Michoacán de Ocampo');
INSERT INTO Estado VALUES (20, 'Morelos');
INSERT INTO Estado VALUES (21, 'Nayarit');
INSERT INTO Estado VALUES (22, 'Puebla');
INSERT INTO Estado VALUES (23, 'Querétaro');
INSERT INTO Estado VALUES (24, 'Tlaxcala');

-- SELECT * FROM Estado;

-- MUNICIPIOS
INSERT INTO Municipio VALUES (6, 'Acala', 12);
INSERT INTO Municipio VALUES (7, 'Allende', 13);
INSERT INTO Municipio VALUES (8, 'Miguel Hidalgo', 14);
INSERT INTO Municipio VALUES (9, 'Ecatepec de Morelos', 15);
-- SELECT * FROM Municipio;

-- LOCALIZACION
INSERT INTO Localizacion VALUES (6, 'Morelos', 32, 'Villas', '55120', 6);
INSERT INTO Localizacion VALUES (7, 'Santa Ana', 32, 'Guadalupana', '12564', 7);
INSERT INTO Localizacion VALUES (8, 'Polonia', 32, 'Polanco', '15652', 8);
INSERT INTO Localizacion VALUES (9, 'Marruecos', 32, 'Rinconada de Aragon', '10254', 9);
-- SELECT * FROM Localizacion;

-- SUCURSAL
INSERT INTO Sucursal VALUES(6, 'Parque Plaza Aguascalientes', 6);
INSERT INTO Sucursal VALUES(7, 'Plaza Farias', 7);
INSERT INTO Sucursal VALUES(8, 'Antara', 8);
INSERT INTO Sucursal VALUES(9, 'Plaza Aragon', 9);

-- SELECT * FROM Sucursal;

-- USUARIOS
INSERT INTO Usuarios VALUES (8, 'Camilo', 'Rojas', 'Miranda', '1994-08-06', 'askdf113@gmail.com', '55123456', 3457, 1299, 6);
INSERT INTO Usuarios VALUES (9, 'Nicolas', 'Arenas', 'Gonzalez', '1998-01-12', 'mlkg89@gmail.com', '55123456', 3734, 2333, 7);
INSERT INTO Usuarios VALUES (10, 'Carlos', 'Ceron', 'Flores', '1998-07-02', 'hsk43@gmail.com', '55123456', 1234, 2788, 8);
INSERT INTO Usuarios VALUES (11, 'Alondra', 'Bonilla', 'Loyo', '1994-08-12', 'skdfmj2@gmail.com', '55123456', 1879, 8425, 9);
INSERT INTO Usuarios VALUES (12, 'Daniela', 'Ceron', 'Gomez', '1995-02-11', 'f32@gmail.com', '55973829', 3405, 2000, 9);
INSERT INTO Usuarios VALUES (13, 'Diana', 'Arenas', 'Saldana', '1996-01-10', 'dga2@gmail.com', '55947293', 1074, 2030, 9);

-- SELECT * FROM Usuarios;


-- CONSULTA EXTERNA

SELECT [IdEstado]
      ,[Nombre]
  FROM [PC1.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Estado]
GO

SELECT [IdEstado]
      ,[Nombre]
  FROM [PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Estado]
GO

SELECT u.Ap_Paterno,u.Ap_Materno, u.Nombres, u.Correo, u.Saldo
FROM Usuarios u