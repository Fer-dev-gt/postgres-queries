CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INTEGER PRIMARY KEY,
    nombre     TEXT NOT NULL,
    email      VARCHAR(100),
    activo     BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS productos (
    producto_id INTEGER PRIMARY KEY,
    nombre      TEXT NOT NULL,
    precio      NUMERIC(12,2),
    stock       INTEGER,
    categoria_id INTEGER
);

INSERT INTO clientes (cliente_id, nombre, email, activo) VALUES
    (1, 'María González', 'maria@email.cl', TRUE),
    (2, 'Carlos Rodríguez', 'carlos@email.cl', TRUE),
    (3, 'Ana Martínez', 'ana@email.ar', TRUE);

INSERT INTO productos (producto_id, nombre, precio, stock, categoria_id) VALUES
    (1, 'Laptop', 899.99, 5, 1),
    (2, 'Mouse', 25.50, 150, 1),
    (3, 'Teclado', 125.00, 8, 1),
    (4, 'Monitor', 299.99, 3, 1);

-- Revisando lo datos
SELECT cliente_id, nombre, email, activo
FROM clientes
WHERE cliente_id = 1;

-- UPDATE básico: modificar una columna
UPDATE clientes
SET activo = FALSE
WHERE cliente_id = 1
RETURNING *;

-- UPDATE con múltiples columnas
UPDATE clientes
SET nombre = 'María González Reyes', activo = TRUE
WHERE cliente_id = 1
RETURNING *;

-- UPDATE con calculos
UPDATE productos
SET precio = precio * 1.10
WHERE categoria_id = 1
RETURNING producto_id, nombre, precio;


UPDATE clientes
SET email = 'nuevo@email.com', nombre = 'nuevo nombre'
WHERE cliente_id = 3
RETURNING *;


-- Peligros de usar UPDATE sin especificar el WHERE
CREATE TABLE IF NOT EXISTS test_update(
    modelo_id INTEGER PRIMARY KEY,
    nombre_modelo TEXT NOT NULL,
    marca TEXT NOT NULL
);

INSERT INTO test_update(modelo_id, nombre_modelo, marca) VALUES
(1, 'SERATO', 'KIA'),
(2, 'PRADO', 'TOYOTA'),
(3, 'PICANTO', 'KIA');

SELECT * FROM test_update;

UPDATE test_update 
SET nombre_modelo = 'SPARK GT', marca = 'CHEVROLET'
RETURNING *;

-- Limpieza
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS detalle_pedidos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS test_update;
