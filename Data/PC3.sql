use master;
create database myPark_Server3;

use myPark_Server3;

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

-- POBLAR BASES DE DATOS
-- ESTADOS
INSERT INTO Estado VALUES (25, 'Campeche');
INSERT INTO Estado VALUES (26, 'Chiapas');
INSERT INTO Estado VALUES (27, 'Oaxaca');
INSERT INTO Estado VALUES (28, 'Quintana Roo');
INSERT INTO Estado VALUES (29, 'Guerrero');
INSERT INTO Estado VALUES (30, 'Tabasco');
INSERT INTO Estado VALUES (31, 'Veracruz');
INSERT INTO Estado VALUES (32, 'Yucatán');

-- SELECT * FROM Estado;

-- MUNICIPIOS
INSERT INTO Municipio VALUES (10, 'Hidalgo', 26);
INSERT INTO Municipio VALUES (11, 'Mezquital', 27);
INSERT INTO Municipio VALUES (12, 'Amatepec', 28);
INSERT INTO Municipio VALUES (13, 'Queretaro', 29);

-- SELECT * FROM Municipio;

-- LOCALIZACION
INSERT INTO Localizacion VALUES (10, 'Francia', 32, 'Guadalupana', '48319', 10);
INSERT INTO Localizacion VALUES (11, 'Lomas', 32, 'Comercial', '16324', 11);
INSERT INTO Localizacion VALUES (12, 'Granjas', 32, 'Bodega', '15648', 12);
INSERT INTO Localizacion VALUES (13, 'Estado', 42, 'Austria', '15638', 13);

-- SELECT * FROM Localizacion;

-- SUCURSAL
INSERT INTO Sucursal VALUES(10, 'Plaza Borda', 10);
INSERT INTO Sucursal VALUES(11, 'Plaza Mayor Torreon', 11);
INSERT INTO Sucursal VALUES(12, 'Plaza Romita', 12);

-- SELECT * FROM Sucursal;

-- USUARIOS
INSERT INTO Usuarios VALUES (14, 'Mateo', 'Santos', 'Rosalez', '1998-05-19', 'ldsjf4@gmail.com', '55123456', 2744, 1353, 10);
INSERT INTO Usuarios VALUES (15, 'Frida', 'Dominguez', 'Lopez', '1998-12-12', 'rom332@gmail.com', '55123456', 8234, 7358, 11);
INSERT INTO Usuarios VALUES (16, 'Paula', 'Cruz', 'Contreras', '1993-10-05', 'rom332@gmail.com', '55123456', 1287, 1000, 11);
INSERT INTO Usuarios VALUES (17, 'Roberto', 'Rangel', 'Escarcega', '1983-05-03', 'rober332@gmail.com', '55123456', 1200, 900, 12);
INSERT INTO Usuarios VALUES (18, 'Laura', 'Flores', 'Ruiz', '1984-12-05', 'rasdfas@gmail.com', '55093252', 1200, 900, 12);
INSERT INTO Usuarios VALUES (19, 'Hector', 'San juan', 'Cristal', '1986-10-06', 'asdf222@gmail.com', '55391043', 1200, 900, 12);
-- SELECT * FROM Usuarios;

-- CONSULTA EXTERNA
SELECT [IdEstado]
      ,[Nombre]
  FROM [PC1.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Estado]
GO

SELECT [IdEstado]
      ,[Nombre]
  FROM [PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Estado]
GO

SELECT u.Ap_Paterno,u.Ap_Materno, u.Nombres, u.Correo, u.Saldo
FROM Usuarios u