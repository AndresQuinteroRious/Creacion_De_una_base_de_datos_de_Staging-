
-- ============================================================================
-- SCRIPT PARA CREAR BASE DE DATOS STAGING - JARDINERIA
-- ============================================================================
-- Descripción: Script para crear una base de datos staging con las tablas
--              pedido (todos los campos), cliente (campos nombre, telefono, ciudad , codigo postal y limite de credito) y 
--              pago (todos los campos)
-- ============================================================================

-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS jardineria_staging;

-- Crear la base de datos staging
CREATE DATABASE jardineria_staging CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Usar la base de datos
USE jardineria_staging;

-- ============================================================================
-- TABLA: CLIENTE (Solo campos solicitados)
-- ============================================================================
CREATE TABLE cliente (
  ID_cliente INTEGER AUTO_INCREMENT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  limite_credito NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (ID_cliente),
  KEY idx_ciudad (ciudad),
  KEY idx_nombre (nombre)
);

-- ============================================================================
-- TABLA: PEDIDO (Con todos los campos)
-- ============================================================================
CREATE TABLE pedido (
  ID_pedido INT AUTO_INCREMENT NOT NULL,
  fecha_pedido DATE NOT NULL,
  fecha_esperada DATE NOT NULL,
  fecha_entrega DATE DEFAULT NULL,
  estado VARCHAR(15) NOT NULL,
  comentarios TEXT,
  ID_cliente INTEGER NOT NULL,
  PRIMARY KEY (ID_pedido),
  KEY idx_id_cliente (ID_cliente),
  KEY idx_estado (estado),
  KEY idx_fecha_pedido (fecha_pedido),
  FOREIGN KEY (ID_cliente) REFERENCES cliente (ID_cliente)
);

-- ============================================================================
-- TABLA: PAGO (Con todos los campos)
-- ============================================================================
CREATE TABLE pago (
  ID_cliente INTEGER NOT NULL,
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago DATE NOT NULL,
  total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (ID_cliente, id_transaccion),
  FOREIGN KEY (ID_cliente) REFERENCES cliente (ID_cliente),
  KEY idx_fecha_pago (fecha_pago),
  KEY idx_forma_pago (forma_pago),
  KEY idx_pago_total (total)
);

-- ============================================================================
-- INSERTAR DATOS DESDE LA BASE DE DATOS ORIGINAL - JARDINERIA
-- ============================================================================

-- Insertar datos en la tabla CLIENTE
-- Se extraen solo los campos solicitados: nombre, telefono, ciudad, codigo_postal, limite_credito
INSERT INTO cliente (ID_cliente, nombre, telefono, ciudad, codigo_postal, limite_credito)
SELECT 
  ID_cliente,
  nombre_cliente AS nombre,
  telefono,
  ciudad,
  codigo_postal,
  limite_credito
FROM jardineria.cliente;

-- Insertar datos en la tabla PEDIDO
-- Se extraen todos los campos disponibles
INSERT INTO pedido (ID_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente)
SELECT 
  ID_pedido,
  fecha_pedido,
  fecha_esperada,
  fecha_entrega,
  estado,
  comentarios,
  ID_cliente
FROM jardineria.pedido;

-- Insertar datos en la tabla PAGO
-- Se extraen todos los campos disponibles
INSERT INTO pago (ID_cliente, forma_pago, id_transaccion, fecha_pago, total)
SELECT 
  ID_cliente,
  forma_pago,
  id_transaccion,
  fecha_pago,
  total
FROM jardineria.pago;

-- ============================================================================
-- VERIFICAR LOS DATOS INSERTADOS
-- ============================================================================

-- Ver cantidad de registros en cada tabla
SELECT 'CLIENTE' AS tabla, COUNT(*) AS total_registros FROM cliente
UNION ALL
SELECT 'PEDIDO', COUNT(*) FROM pedido
UNION ALL
SELECT 'PAGO', COUNT(*) FROM pago;

-- ============================================================================
-- FIN DEL SCRIPT
-- ============================================================================
