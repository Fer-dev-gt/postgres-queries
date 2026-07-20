-- FUNCIONES DE TEXTO
-- UPPER / LOWER / TRIM
SELECT UPPER('hola mundo') AS mayusculas;
SELECT LOWER('HOLA MUNDO') AS minusculas;
SELECT TRIM('  espacios. ') AS sin_espacios;
SELECT LTRIM('  izquierda') AS sin_espacio_izq;
SELECT RTRIM('derecha. ') AS sin_espacio_der;

-- LENGHT
SELECT LENGTH('nombre de mi clase') AS largo_nombre;

-- CONCAT y operador ||
SELECT 'Walter Cacagno' || ' - ' || 'walter@inegocios' AS info_cliente;

-- Crear tablas
CREATE TABLE IF NOT EXISTS personas (
  nombre VARCHAR(50),
  apellido VARCHAR(50)
);

-- Insertar datos
INSERT INTO personas (nombre, apellido) VALUES
('Walter', 'Calcagno'),
('María', 'González'),
('Juan', 'Pérez');

-- Consulta donde usamos CONCAT
SELECT nombre || ' ' || apellido AS nombre_completo
FROM personas;

-- SUBSTRING
SELECT SUBSTRING('PostgreSQL' FROM 2 FOR 5) AS parte; --'ostgr'
SELECT LEFT('PostgresSQL', 4) AS primeros; -- 'Post'
SELECT RIGHT('PostgreSQL', 3) AS ultimos; --'SQL'

-- Replace
SELECT REPLACE('walter@wedate.cl', '@', ' [arroba] ') AS email_seguro;

