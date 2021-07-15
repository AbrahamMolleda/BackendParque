CREATE DATABASE Pruebas
USE Pruebas

CREATE TABLE Alumno (
  IdAlumno INT PRIMARY KEY NOT NULL,
  Nombre VARCHAR(50),
  Matricula VARCHAR(9),
  IdMateria INT NOT NULL,
  FOREIGN KEY (IdMateria) REFERENCES Materia (IdMateria)
)

CREATE TABLE Materia (
  IdMateria INT PRIMARY KEY NOT NULL,
  Nombre VARCHAR(50)
)

INSERT INTO Materia values(1, 'English')

CREATE PROCEDURE NewAlumno 
(
  @id INT,
  @Nombre VARCHAR(50),
  @Folio VARCHAR(9),
  @Materia VARCHAR(15)
)
AS 
  DECLARE @IdMateria INT
  IF @Materia = 'English'
    BEGIN
      SET @IdMateria = 1
      INSERT INTO Alumno values
        (
          @id, @Nombre, @Folio, @IdMateria
        )
    END

EXEC NewAlumno @id = 1, @Nombre = 'Abraham Molleda', @Folio = 201721732, @Materia = 'English'

SELECT * FROM Alumno;
SELECT * FROM Materia;

