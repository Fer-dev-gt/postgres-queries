-- CREAR TABLAS 
-- TABLA SIMPLE SIN LLAVE PRIMARIA SOLO CON TIPOS DE DATOS
CREATE TABLE demo_tipos(
  id  integer,
  nombre  TEXT,
  precio NUMERIC(10,2),
  activo BOOLEAN,
  fecha_ingreso DATE,
  creado_en timestamp
);

INSERT INTO demo_tipos VALUES (
  1,
  'Producto Demo',
  29.99,
  TRUE,
  '2024-01-01',
  now()
);

SELECT * FROM demo_tipos;

-- Forma 1: SERIAL (clásica, muy usada)
CREATE TABLE ejemplo_serial(
  id  SERIAL PRIMARY KEY,
  nombre TEXT NOT NULL
);

-- Forma 2: GENERATED ALWAYS AS IDENTITY (estándar moderno - recomendado)
CREATE TABLE ejemplo_identity (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre TEXT NOT NULL
);

CREATE TABLE clientes (
  cliente_id  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre  TEXT NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  telefono VARCHAR(20),
  fecha_ingreso DATE NOT NULL DEFAULT CURRENT_DATE,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  tipo_cliente_id INTEGER NOT NULL
);


CREATE TABLE categorias(
  categoria_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre TEXT NOT NULL UNIQUE,
  descripcion TEXT
);

CREATE TABLE productos(
  product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre TEXT NOT NULL,
  descripcion TEXT,
  precio NUMERIC(10,2) NOT NULL,
  stock INTEGER NOT NULL DEFAULT 0,
  categoria_id INTEGER NOT NULL
);

-- Verificar tablas creadas
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- Ver estructura de una tablas
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'clientes'
ORDER BY ordinal_position;


