CREATE DATABASE universidad;
CREATE TABLE estudiantes (
    rut SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    fecha_nacimiento DATE
);

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INT NOT NULL
);



-----------------POBLAR TABLAS-----------------

INSERT INTO estudiantes (nombre, apellido, email, fecha_nacimiento) VALUES
('María', 'González', 'maria.gonzalez@uni.cl', '1998-04-12'),
('Andrés', 'Vargas', 'andres.vargas@uni.cl', '1997-11-03'),
('Camila', 'Rojas', 'camila.rojas@uni.cl', '2000-06-21'),
('Diego', 'Soto', 'diego.soto@uni.cl', '1996-02-14'),
('Fernanda', 'López', 'fernanda.lopez@uni.cl', '1999-09-30'),
('Javier', 'Martínez', 'javier.martinez@uni.cl', '1995-12-05'),
('Patricia', 'Ortiz', 'patricia.ortiz@uni.cl', '2001-01-17'),
('Sergio', 'Castillo', 'sergio.castillo@uni.cl', '1994-07-08'),
('Natalia', 'Fuentes', 'natalia.fuentes@uni.cl', '1998-03-25'),
('Pablo', 'Vega', 'pablo.vega@uni.cl', '1997-05-19'),
('Lucía', 'Herrera', 'lucia.herrera@uni.cl', '2000-10-02'),
('Ricardo', 'Cruz', 'ricardo.cruz@uni.cl', '1996-08-11'),
('Sofía', 'Mendez', 'sofia.mendez@uni.cl', '1999-04-04'),
('Mateo', 'Silva', 'mateo.silva@uni.cl', '1998-12-22'),
('Valentina', 'Paredes', 'valentina.paredes@uni.cl', '2001-02-09'),
('Esteban', 'Rivas', 'esteban.rivas@uni.cl', '1995-06-30'),
('Carla', 'Navarro', 'carla.navarro@uni.cl', '1997-09-14'),
('Gonzalo', 'Ibarra', 'gonzalo.ibarra@uni.cl', '1994-11-28'),
('Isabel', 'Bravo', 'isabel.bravo@uni.cl', '2000-01-05'),
('Héctor', 'Acuña', 'hector.acuna@uni.cl', '1996-03-16');

-- Tabla: cursos
-- Campos: id (SERIAL PK), nombre, creditos

INSERT INTO cursos ( nombre, creditos) VALUES
('Bases de Datos', 5),
('Programación Web', 4),
('Estructuras de Datos', 5),
('Sistemas Operativos', 4),
('Redes de Computadores', 4),
('Ingeniería de Software', 5),
('Matemáticas Discretas', 4),
('Inteligencia Artificial', 3);