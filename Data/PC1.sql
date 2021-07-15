use master;
create database myPark;

use myPark;

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


--POBLANDO BASE
-- ESTADOS
INSERT INTO Estado VALUES (1, 'Baja California');
INSERT INTO Estado VALUES (2, 'Baja California Sur');
INSERT INTO Estado VALUES (3, 'Chihuahua');
INSERT INTO Estado VALUES (4, 'Coahuila');
INSERT INTO Estado VALUES (5, 'Durango');
INSERT INTO Estado VALUES (6, 'Nuevo León');
INSERT INTO Estado VALUES (7, 'San Luis Potosí');
INSERT INTO Estado VALUES (8, 'Sonora');
INSERT INTO Estado VALUES (9, 'Sinaloa');
INSERT INTO Estado VALUES (10, 'Tamaulipas');
INSERT INTO Estado VALUES (11, 'Zacatecas');

-- SELECT * FROM Estado;

-- MUNICIPIOS

INSERT INTO Municipio VALUES (1, 'Ensenada', 1);
INSERT INTO Municipio VALUES (2, 'Mexicali', 2);
INSERT INTO Municipio VALUES (3, 'La paz', 2);
INSERT INTO Municipio VALUES (4, 'Amacuzac', 3);
INSERT INTO Municipio VALUES (5, 'Escárcega', 4);

-- SELECT * FROM Municipio;

-- LOCALIZACION

INSERT INTO Localizacion VALUES (1, 'Presidencia municipal de Amacuzac', 17, 'Aguila', '51521', 1);
INSERT INTO Localizacion VALUES (2, 'Tiburcio Grande', 32, 'CD Brillante', '15610', 2);
INSERT INTO Localizacion VALUES (3, 'Austria', 32, 'Victoria', '15610' , 3);
INSERT INTO Localizacion VALUES (4, 'Teocallis', 32, 'Malines', '55100', 4);
INSERT INTO Localizacion VALUES (5, 'Suterm', 32, 'Benavides', '55310', 5);

-- SELECT * FROM Localizacion;

-- SUCURSALES
INSERT INTO Sucursal VALUES(1, 'Plaza de la Independencia', 1);
INSERT INTO Sucursal VALUES(2, 'Jardín Guerrero', 2);
INSERT INTO Sucursal VALUES(3, 'Jardín Zenea', 3);
INSERT INTO Sucursal VALUES(4, 'Jardín Francisco I. Madero', 4);
INSERT INTO Sucursal VALUES(5, 'Parque De La Morelos', 5);

-- SELECT * FROM Sucursal;

INSERT INTO Usuarios VALUES (1, 'Miguel', 'Romero', 'Martinez', '1987-02-16', 'rom332@gmail.com', '55123456', 1234, 4000, 1);
INSERT INTO Usuarios VALUES (2, 'Ana', 'Mendez', 'Hernandez', '1978-05-21', 'rasm332@gmail.com', '55938475', 3489, 4567, 2);
INSERT INTO Usuarios VALUES (3, 'Gabriela', 'Hernandez', 'Diaz', '1984-02-08', 'rsdkjf4@gmail.com', '55039482', 3467, 7657, 3);
INSERT INTO Usuarios VALUES (4, 'Brenda', 'Perez', 'Perez', '1998-10-12', 'mol234@gmail.com', '55125938', 8352, 1399, 4);
INSERT INTO Usuarios VALUES (5, 'Bryan', 'Diaz', 'Mendoza', '1995-05-08', 'sdf4@gmail.com', '55781039', 1230, 1290, 4);
INSERT INTO Usuarios VALUES (6, 'Alejandro', 'Lopez', 'Romero', '1993-10-03', 'go94@gmail.com', '55620482', 4300, 1049, 5);
INSERT INTO Usuarios VALUES (7, 'Miranda', 'Ortencia', 'Miranda', '1992-12-01', 'dfsg34@gmail.com', '55928374', 5000, 1003, 5);
-- SELECT * FROM Usuarios;

INSERT INTO Puesto VALUES (1, 'Ayudante General', 4000);
INSERT INTO Puesto VALUES (2, 'Mecánico', 5000);
INSERT INTO Puesto VALUES (3, 'Limpieza', 3000);

INSERT INTO Turno Values (1, 'Matutino');
INSERT INTO Turno Values (2, 'Vespertino');

INSERT INTO Empleados VALUES(1, 'MORA960105', 'Abraham Azael', 'Molleda ', 'Rivera', '05/01/1996', 'aamol.riv@gmail.com', '5543446210', 1, 1, 1);

INSERT INTO Juegos VALUES(1, 'Tirolesa', '15', 1);

CREATE VIEW GetSucursales
AS SELECT suc.IdSucursal, suc.NombreSucursal, loc.Calle, loc.Numero, loc.Colonia, es.Nombre AS Estado, mun.Nombre AS Municipio, loc.CP
FROM Sucursal suc, Localizacion loc, Estado es, Municipio mun
WHERE suc.IdLocalizacion = loc.IdLocalizacion AND loc.IdMunicipio = mun.IdMunicipio AND mun.IdEstado = es.IdEstado

Select * FROM GetSucursales

-- CONSULTAS EXTERNAS
SELECT [IdUsuario]
      ,[Nombres]
  FROM [PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios]
GO

SELECT [IdUsuario]
      ,[Nombres]
      ,[Ap_Paterno]
      ,[Ap_Materno]
      ,[Puntos]
      ,[Saldo]
  FROM [PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios]
GO

SELECT u.Ap_Paterno,u.Ap_Materno, u.Nombres, u.Correo, u.Saldo
FROM Usuarios u

SELECT suc.NombreSucursal, est.Nombre, mun.Nombre, loc.Calle, loc.Numero, loc.Colonia, loc.CP
FROM Localizacion loc, Sucursal suc, Estado est, Municipio mun
WHERE suc.IdLocalizacion = loc.IdLocalizacion AND loc.IdMunicipio = mun.IdMunicipio AND est.IdEstado = mun.IdEstado
UNION ALL
SELECT suc.NombreSucursal, est.Nombre, mun.Nombre, loc.Calle, loc.Numero, loc.Colonia, loc.CP
FROM 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Localizacion] loc, 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Estado] est, 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Municipio] mun
WHERE suc.IdLocalizacion = loc.IdLocalizacion AND loc.IdMunicipio = mun.IdMunicipio AND est.IdEstado = mun.IdEstado
UNION ALL
SELECT suc.NombreSucursal, est.Nombre, mun.Nombre, loc.Calle, loc.Numero, loc.Colonia, loc.CP
FROM 
[PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Localizacion] loc, 
[PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Estado] est, 
[PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Municipio] mun
WHERE suc.IdLocalizacion = loc.IdLocalizacion AND loc.IdMunicipio = mun.IdMunicipio AND est.IdEstado = mun.IdEstado


use  myPark
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM Usuarios us, Sucursal suc
WHERE suc.IdSucursal = us.IdSucursal
UNION ALL
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios] us
WHERE suc.IdSucursal = us.IdSucursal
UNION ALL
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios] us
WHERE suc.IdSucursal = us.IdSucursal

use  myPark
------------------------------------------------------------------------------
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM Usuarios us, Sucursal suc
WHERE suc.IdSucursal = us.IdSucursal
UNION ALL
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios] us
WHERE suc.IdSucursal = us.IdSucursal
UNION ALL
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM
[PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios] us
WHERE suc.IdSucursal = us.IdSucursal


------------------------------------------------------------------------
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM Usuarios us, Sucursal suc
WHERE suc.IdSucursal = us.IdSucursal
UNION ALL
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM 
[PC1.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC1.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios] us
WHERE suc.IdSucursal = us.IdSucursal
UNION ALL
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM
[PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC31.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios] us
WHERE suc.IdSucursal = us.IdSucursal


----------------------------------------------------------------------------
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM Usuarios us, Sucursal suc
WHERE suc.IdSucursal = us.IdSucursal
UNION ALL
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM 
[PC1.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC1.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios] us
WHERE suc.IdSucursal = us.IdSucursal
UNION ALL
SELECT suc.NombreSucursal, us.Ap_Paterno, us.Ap_Materno, us.Nombres, us.Puntos, us.Saldo
FROM
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Sucursal] suc, 
[PC2.CENTRALUS.CLOUDAPP.AZURE.COM].[myPark].[dbo].[Usuarios] us
WHERE suc.IdSucursal = us.IdSucursal