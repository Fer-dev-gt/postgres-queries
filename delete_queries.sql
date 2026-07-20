-- Preparar datos de ejemplo
CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INTEGER PRIMARY KEY,
    nombre     TEXT NOT NULL,
    email      VARCHAR(100),
    activo     BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    fecha DATE
);

CREATE TABLE IF NOT EXISTS detalle_pedidos (
    detalle_id INTEGER PRIMARY KEY,
    pedido_id INTEGER,
    cantidad INTEGER
);

INSERT INTO clientes (cliente_id, nombre, email, activo) VALUES
    (1, 'María González', 'maria@email.cl', TRUE),
    (2, 'Carlos Rodríguez', 'carlos@email.cl', TRUE),
    (3, 'Ana Martínez', 'ana@email.ar', TRUE),
    (4, 'Luis Vargas', 'luis@email.co', TRUE),
    (5, 'Eva López', 'eva@email.cl', TRUE),
    (99, 'Temporal', 'temporal@email.cl', TRUE);

INSERT INTO pedidos (pedido_id, cliente_id, fecha) VALUES
    (1, 1, '2024-01-15'),
    (2, 2, '2024-02-10'),
    (100, 99, '2019-12-01');

INSERT INTO detalle_pedidos (detalle_id, pedido_id, cantidad) VALUES
    (1, 1, 2),
    (2, 1, 3),
    (3, 100, 1);


-- DELETE FÍSICO
-- DELETE básico (siempre con WHERE)

SELECT * FROM clientes;

DELETE FROM clientes
WHERE cliente_id = 99
RETURNING cliente_id, nombre, email, activo;

SELECT * FROM clientes;

-- DELETE con Returning - ver qué se borró
SELECT * FROM detalle_pedidos;

DELETE FROM detalle_pedidos
WHERE pedido_id = 100
RETURNING *;


-- BORRADO LÓGICO
-- Dar de baja un cliente (borrado lógico)
UPDATE clientes
SET activo = FALSE
WHERE cliente_id = 5;

SELECT * FROM clientes;



-- Consultar solo clientes activos (filtro estándar con borrado lógico)
SELECT nombre, email, activo
FROM clientes
WHERE activo = TRUE
LIMIT 10;

-- Consultar clinetes inactivos (para auditoría)
SELECT nombre, email, activo
FROM clientes
WHERE activo = FALSE;


-- Reactivar un cliente
UPDATE clientes
SET activo = TRUE
WHERE cliente_id = 5
RETURNING cliente_id, nombre, activo;


UPDATE clientes
SET activo = FALSE
WHERE cliente_id BETWEEN 1 AND 3
RETURNING *;

UPDATE clientes
SET activo = FALSE 
WHERE cliente_id = 5  ;
UPDATE clientes
SET activo = FALSE 
WHERE cliente_id = 3 ;
UPDATE clientes
SET activo = FALSE 
WHERE cliente_id =  1 ;


-- Limpieza
DROP TABLE IF EXISTS detalle_pedidos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

