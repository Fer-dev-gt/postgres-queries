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



--FUNCIONES DE FECHA
SELECT NOW() AS ahora;
SELECT CURRENT_DATE AS solo_fecha;
SELECT CURRENT_TIME AS solo_hora;

-- EXTRACT: obtenerpartes de una fecha (equivale a YEAR/MONTH/DAY de SQL Server)
SELECT fecha,
EXTRACT(YEAR FROM fecha) AS anio,
EXTRACT(MONTH FROM fecha) AS mes,
EXTRACT(DAY FROM fecha) AS dia
FROM pedidos
LIMIT 5;


-- Aritmética de fechas con INTERVAL (más natural que DATEADD)
SELECT CURRENT_DATE + INTERVAL '30 days'  AS en_un_mes;
SELECT CURRENT_DATE - INTERVAL '1 year'   AS hace_un_anio;
SELECT NOW() + INTERVAL '2 hours'         AS en_dos_horas;

-- Diferencia entre fechas (directa, sin función — equivale a DATEDIFF)
SELECT NOW()::DATE - fecha::DATE AS dias_desde_pedido
FROM pedidos
LIMIT 5;

-- TO_CHAR: formatear fecha (equivale a FORMAT de SQL Server)
SELECT TO_CHAR(fecha, 'DD/MM/YYYY')          AS fecha_formato_cl
FROM pedidos LIMIT 3;

SELECT TO_CHAR(NOW(), 'DD "de" Month YYYY')  AS fecha_larga;
SELECT TO_CHAR(NOW(), 'HH24:MI:SS')          AS hora_formato;

-- ===== FUNCIONES DE NÚMERO =====

-- Redondeo
SELECT ROUND(1234.5678, 2)  AS redondeado;    -- 1234.57
SELECT CEIL(4.1)            AS hacia_arriba;  -- 5
SELECT FLOOR(4.9)           AS hacia_abajo;   -- 4
SELECT ABS(-42)             AS absoluto;      -- 42

-- TO_CHAR para formato monetario
SELECT TO_CHAR(precio, 'FM$999,999.00') AS precio_formato
FROM productos
LIMIT 5;

-- ===== COALESCE — manejar NULLs =====
-- Equivale a ISNULL(x, y) de SQL Server

SELECT nombre,
       COALESCE(telefono, 'Sin teléfono') AS contacto
FROM clientes
LIMIT 10;

-- COALESCE con múltiples alternativas
SELECT nombre,
       COALESCE(telefono, email, 'Sin contacto') AS contacto_preferido
FROM clientes
LIMIT 10;


