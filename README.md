### Autores
## Oscar Rene Peñaloza Ardila
## Andres Mauricio Quintero Rios. 
# Guía - Base de Datos Jardinería Staging

## ¿Qué es este proyecto?

Este documento explica cómo conectar dos bases de datos de jardinería:
- **Jardinería**: La base de datos completa con toda la información
- **Staging**: Una versión simplificada para análisis rápido

## Archivos del Proyecto

### Base de Datos Completa (Jardinería)
- **Dónde está**: `BD_jardineria_Scripts_modelo-20260325T110100Z-1-001/`
- **Tablas que tiene**:
  - `oficina` - Datos de las oficinas
  - `empleado` - Información de los trabajadores
  - `cliente` - Datos de los clientes
  - `pedido` - Pedidos realizados
  - `detalle_pedido` - Detalles de cada pedido
  - `producto` - Productos que se venden
  - `Categoria_producto` - Tipos de productos
  - `pago` - Pagos recibidos

### Base de Datos Simplificada (Staging)
- **Dónde está**: `BD_jardineria_staging_scripts_modelo-20260325T110457Z-1-001/`
- **Tablas que tiene**:
  - `cliente` - Solo los datos más importantes
  - `pedido` - Todos los datos de pedidos
  - `pago` - Todos los datos de pagos

## Archivos para Ejecutar

### 1. Script Principal
**Archivo**: `jardineria_staging.sql`
- Crea la base de datos simplificada
- Define las tablas más importantes
- Copia los datos automáticamente
- Verifica que todo esté bien

### 2. Scripts por Tabla
- `jardineria_staging_cliente.sql` - Datos de clientes
- `jardineria_staging_pedido.sql` - Datos de pedidos
- `jardineria_staging_pago.sql` - Datos de pagos

## ¿Qué contiene la base de datos Staging?

### Mejoras Realizadas
- **Búsquedas rápidas** para encontrar información al instante
- **Conexiones simples** entre las tablas
- **Datos esenciales** para tomar decisiones
- **Relaciones correctas** entre los datos

### Tabla Cliente (Versión Simplificada)
- **ID_cliente** - Número único del cliente
- **nombre** - Nombre del cliente o empresa
- **teléfono** - Teléfono de contacto
- **ciudad** - Ciudad donde vive
- **codigo_postal** - Código postal
- **limite_credito** - Cuánto puede comprar a crédito

### Tabla Pedido (Completa)
- **ID_pedido** - Número único del pedido
- **fecha_pedido** - Cuándo se hizo el pedido
- **fecha_esperada** - Cuándo debería llegar
- **fecha_entrega** - Cuándo llegó realmente
- **estado** - Si está entregado, pendiente o rechazado
- **comentarios** - Notas adicionales
- **ID_cliente** - Qué cliente lo pidió

### Tabla Pago (Completa)
- **ID_cliente** - Quién pagó
- **forma_pago** - Cómo pagó (tarjeta, transferencia, etc.)
- **id_transaccion** - Número de la transacción
- **fecha_pago** - Cuándo pagó
- **total** - Cuánto pagó

## ¿Cómo usarlo?

### Paso 1: Crear la base de datos Staging
```bash
mysql -u tu_usuario -p < jardineria_staging.sql
```

### Paso 2: Revisar que los datos se copiaron bien
```sql
USE jardineria_staging;
SELECT 'CLIENTES' AS tabla, COUNT(*) AS total FROM cliente
UNION ALL
SELECT 'PEDIDOS', COUNT(*) FROM pedido
UNION ALL
SELECT 'PAGOS', COUNT(*) FROM pago;
```

### Paso 3: Verificar que las conexiones funcionan
```sql
-- Ver cuántos pedidos tiene cada cliente
SELECT c.nombre, COUNT(p.ID_pedido) as pedidos
FROM cliente c
LEFT JOIN pedido p ON c.ID_cliente = p.ID_cliente
GROUP BY c.ID_cliente, c.nombre;
```

## Consultas Útiles para el Negocio

### 1. Ventas por Cliente
```sql
SELECT 
    c.nombre,
    COUNT(p.ID_pedido) as total_pedidos,
    SUM(pag.total) as total_pagado,
    c.limite_credito
FROM cliente c
LEFT JOIN pedido p ON c.ID_cliente = p.ID_cliente
LEFT JOIN pago pag ON c.ID_cliente = pag.ID_cliente
GROUP BY c.ID_cliente, c.nombre, c.limite_credito
ORDER BY total_pagado DESC;
```

### 2. Estados de los Pedidos
```sql
SELECT 
    estado,
    COUNT(*) as cantidad,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM pedido) as porcentaje
FROM pedido
GROUP BY estado;
```

### 3. Formas de Pago
```sql
SELECT 
    forma_pago,
    COUNT(*) as transacciones,
    SUM(total) as monto_total,
    AVG(total) as promedio_pago
FROM pago
GROUP BY forma_pago
ORDER BY monto_total DESC;
```

## ¿Cómo actualizar los datos?

### Para refrescar la información
```sql
-- Borrar todo y empezar de nuevo
DELETE FROM pedido;
DELETE FROM pago;
DELETE FROM cliente;

-- Volver a copiar los datos
INSERT INTO cliente SELECT ID_cliente, nombre_cliente, telefono, ciudad, codigo_postal, limite_credito FROM jardineria.cliente;
INSERT INTO pedido SELECT * FROM jardineria.pedido;
INSERT INTO pago SELECT * FROM jardineria.pago;
```

## Lista de Verificación

- [ ] La base de datos `jardineria` existe y tiene información
- [ ] La base de datos `jardineria_staging` se crea sin errores
- [ ] Todas las tablas se crean correctamente
- [ ] Los datos se copian bien
- [ ] Las búsquedas funcionan rápido
- [ ] Las relaciones entre tablas funcionan
- [ ] Las consultas de negocio dan resultados correctos

## Cosas Importantes

1. **Permisos**: Necesitas derechos para crear bases de datos
2. **Caracteres especiales**: Los scripts usan formato universal
3. **Respaldo**: Haz una copia de seguridad antes de empezar
4. **Pruebas**: Prueba primero en un entorno de prueba

## Problemas Comunes y Soluciones

### Errores Frecuentes
- **No puedo conectar**: Revisa tu usuario y contraseña de MySQL
- **Error de relaciones**: Inserta los datos en el orden correcto
- **Error de caracteres**: Verifica que el formato sea compatible

### Soluciones Rápidas
```sql
-- Desactivar temporalmente las reglas
SET FOREIGN_KEY_CHECKS = 0;
-- Ejecutar la migración
SET FOREIGN_KEY_CHECKS = 1;
```

## Ayuda y Soporte

Si tienes problemas:
1. Revisa los mensajes de error de MySQL
2. Verifica que las tablas originales existan
3. Confirma que los datos sean correctos
4. Busca ayuda en la documentación

---

**Creado**: 25/03/2026  
**Versión**: 1.0  
**Funciona con**: MySQL 8.0 o más reciente
