DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE UNSIGNED NOT NULL,
  gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nif VARCHAR(9) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  id_departamento INT UNSIGNED,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);


-- act 1
SELECT nombre, apellido1, apellido2 FROM empleado;
-- act 2
SELECT DISTINCT apellido1 FROM empleado;
-- act 3
SELECT * FROM empleado;
-- act 4
SELECT id_departamento FROM empleado;
-- act 5
SELECT DISTINCT id_departamento FROM empleado;
-- act 6 
SELECT CONCAT_WS(' ', nombre, apellido1, apellido2) AS 'Nombre completo' FROM empleado;
-- act 7
SELECT LOWER(CONCAT_WS(' ', nombre,  apellido1, apellido2)) AS 'Nombre completo' FROM empleado;
-- act 8 
SELECT id, SUBSTR(nif, 1, 8) AS DNI ,SUBSTR(nif, 9, 1) AS letra FROM empleado;
-- act 9
SELECT nombre, (presupuesto - gastos) AS 'Presupuesto actual' FROM departamento;
-- act 10 
SELECT nombre, (presupuesto - gastos) AS 'Presupuesto actual' FROM departamento ORDER BY 'Presupuesto actual' ASC;
-- act 11
SELECT nombre FROM departamento ORDER BY nombre DESC;
-- act 12
SELECT apellido1, apellido2, nombre FROM empleado ORDER BY apellido1, apellido2, nombre;
-- act 13
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto DESC LIMIT 3;
-- act 14
SELECT nombre, presupuesto FROM departamento ORDER BY presupuesto ASC LIMIT 3;
-- act 15
SELECT nombre, gastos FROM departamento ORDER BY gastos DESC LIMIT 2;
-- act 16
SELECT nombre, gastos FROM departamento ORDER BY gastos ASC LIMIT 2;
-- act 17
SELECT * FROM empleado LIMIT 5 OFFSET 2;
-- act 18
SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 150000;
-- act 19
SELECT nombre, presupuesto FROM departamento WHERE presupuesto >= 100000 AND presupuesto <= 200000;
-- act 20
SELECT nombre, presupuesto FROM departamento WHERE presupuesto NOT BETWEEN 100000 AND 200000;
-- act 21
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos > presupuesto;

-- act 22
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos < presupuesto;

-- act 23
SELECT nombre, gastos, presupuesto FROM departamento WHERE gastos = presupuesto;

-- act 24
SELECT * FROM empleado WHERE apellido2 IS NULL;

-- act 25
SELECT * FROM empleado WHERE apellido2 IS NOT NULL;

-- act 26
SELECT * FROM empleado WHERE apellido2 = 'López';

-- act 27
SELECT * FROM empleado WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';

-- act 28
SELECT * FROM empleado WHERE apellido2 IN ('Díaz', 'Moreno');

-- act 29
SELECT nombre, apellido1, apellido2, nif FROM empleado WHERE id_departamento = 3;

-- act 30
SELECT nombre, apellido1, apellido2, nif FROM empleado WHERE id_departamento IN (2, 4, 5);

-- act 31
SELECT sum(presupuesto) AS 'SUMA DE PRESUPUESTOS' from departamento;

-- act 32
SELECT ROUND(avg(presupuesto),2) AS 'MEDIA DE PRESUPUESTOS', '€' AS 'MONEDA' from departamento;

-- act 33
SELECT min(presupuesto) AS 'VALOR MINIMO DE PRESUPUESTOS' from departamento;

-- act 34
SELECT nombre, presupuesto FROM departamento WHERE presupuesto = ( SELECT min(presupuesto) AS 'VALOR MINIMO DE PRESUPUESTOS' from departamento);

-- act 35
SELECT max(presupuesto) AS 'VALOR MAXIMO DE PRESUPUESTOS' from departamento;

-- act 36
SELECT nombre, presupuesto FROM departamento WHERE presupuesto = ( SELECT max(presupuesto) AS 'VALOR MAXIMO DE PRESUPUESTOS' from departamento);

-- act 37
SELECT count(*) AS 'TOTAL DE EMPLEADOS' FROM empleado;

-- act 38
SELECT count(*) AS 'TOTAL DE EMPLEADOS' FROM empleado WHERE apellido2 IS NOT NULL;

-- act 39




