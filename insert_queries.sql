CREATE TABLE paises (
    pais_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre  TEXT NOT NULL UNIQUE,
    codigo  VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE categorias (
    categoria_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre       TEXT NOT NULL UNIQUE
);

CREATE TABLE tipos_cliente (
    tipo_cliente_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre          TEXT NOT NULL UNIQUE
);

CREATE TABLE clientes (
    cliente_id      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre          TEXT         NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    activo          BOOLEAN      NOT NULL DEFAULT TRUE,
    tipo_cliente_id INTEGER      NOT NULL REFERENCES tipos_cliente(tipo_cliente_id)
);


-- Insert básico - siempre especificar columnas
-- INSERT INTO paises (nombre, codigo) VALUES ('Chile', 'CHL');
-- INSERT INTO paises (nombre, codigo) VALUES ('Argentina', 'ARG');


--Insert múltiple - varias filas en una sentencia
INSERT INTO paises (nombre, codigo) VALUES
    ('Argentina', 'ARG'),
    ('Chile', 'CHL'),
    ('Colombia', 'COL'),
    ('México', 'MEX'),
    ('Perú', 'PER'),
    ('Brasil', 'BRA'),
    ('Ecuador', 'ECU'),
    ('Bolivia', 'BOL'),
    ('Uruguay', 'URU'),
    ('Paraguay', 'PAR'),
    ('Venezuela', 'VEN'),
    ('Panamá', 'PAN');

SELECT * FROM paises;

-- INSERT con RETURNING - retorna el id generado
INSERT INTO categorias (nombre) VALUES
('Electrónica'),
('Muebles'),
('Ropa'),
('Accesorios'),
('Cocina')
RETURNING categoria_id, nombre;


-- RETURNING cualquier columnas
INSERT INTO tipos_cliente (nombre)
VALUES ('Premium')
RETURNING *;


INSERT INTO tipos_cliente (nombre) VALUES
    ('Estándar'),
    ('Corporativo'),
    ('Mayorista')
RETURNING tipo_cliente_id, nombre;


-- INSERT con KF, el tipo_cliente_id debe existir
INSERT INTO clientes (nombre, email, tipo_cliente_id)
VALUES ('María González', 'maria@email.cl', 1)
RETURNING cliente_id, nombre, email;


-- INSERT múltiple de clientes
INSERT INTO clientes (nombre, email, activo, tipo_cliente_id) VALUES
 ('Carlos Rodríguez', 'carlos@email.cl', TRUE, 2),
 ('Ana Martínez', 'ana@email.ar', TRUE, 1),
 ('Luis Vargas', 'luis@email.co', TRUE, 3)
 RETURNING *;



-- Limpieza
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS tipos_cliente;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS paises;



