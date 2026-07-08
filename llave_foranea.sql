-- CREAR TABLAS
-- Claves foráneas e integirdad referencial
CREATE TABLE paises (
  pais_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre TEXT NOT NULL UNIQUE,
  codigo VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE categorias(
  categoria_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE tipos_cliente(
  tipo_cliente_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre TEXT NOT NULL UNIQUE
);

-- Luego tal tablas HIJA (con FK)
CREATE TABLE sucursales(
  sucursal_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre TEXT NOT NULL,
  ciudad  TEXT NOT NULL,
  pais_id INTEGER NOT NULL REFERENCES paises(pais_id)
);

CREATE TABLE productos(
  product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre  TEXT NOT NULL,
  precio  TEXT NOT NULL,
  categoria_id  INTEGER NOT NULL REFERENCES categorias(categoria_id)
);

CREATE TABLE empleados(
  empleado_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre  TEXT NOT NULL,
  cargo TEXT,
  sucursal_id INTEGER NOT NULL REFERENCES sucursales(sucursal_id)
);

CREATE TABLE clientes(
  cliente_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre  TEXT NOT NULL,
  apellido TEXT NOT NULL,
  email VARCHAR(30) NOT NULL UNIQUE,
  telefono INTEGER,
  pais_id INTEGER NOT NULL REFERENCES paises(pais_id),
  ciudad TEXT NOT NULL,
  fecha_registo DATE DEFAULT NOW(),
  activo BOOLEAN DEFAULT TRUE
);

-- Tabla con múltiples Foreign Keys
CREATE TABLE pedidos(
 pedido_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 fecha  DATE NOT NULL DEFAULT CURRENT_DATE,
 cliente_id INTEGER NOT NULL REFERENCES clientes(cliente_id),
 sucursal_id INTEGER NOT NULL REFERENCES sucursales(sucursal_id),
 empleado_id INTEGER NOT NULL REFERENCES empleados(empleado_id)
);

-- Tabla intermedia N:M con FK compuesta
CREATE TABLE detalla_dedidos(
  detalle_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  pedido_id INTEGER NOT NULL REFERENCES pedidos(pedido_id),
  product_id INTEGER NOT NULL REFERENCES productos(product_id),
  cantidad INTEGER NOT NULL DEFAULT 1,
  precio_unit NUMERIC(10,2) NOT NULL
);