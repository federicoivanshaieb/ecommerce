📊 Sistema de Gestión de Ventas para E-commerce

📄 Resumen del Proyecto
Este proyecto es un sistema de gestión de bases de datos relacionales diseñado para un negocio de comercio electrónico. Su objetivo principal es centralizar y gestionar de manera eficiente la información de productos, clientes, pedidos, inventario y ventas. La base de datos está optimizada para la toma de decisiones, permitiendo a los administradores identificar los productos más vendidos, analizar el comportamiento del cliente y controlar el inventario en tiempo real.

🚀 Características Principales
Centralización de la Información: Consolidación de todos los datos en un único sistema.

Gestión de Inventario: Control detallado del stock de productos para evitar quiebres de inventario.

Seguimiento de Ventas: Monitoreo de las transacciones y el rendimiento de las ventas por usuario y producto.

Automatización de Procesos: Uso de TRIGGERS y STORED PROCEDURES para la actualización automática de datos, garantizando la integridad y consistencia de la base de datos.

Análisis de Datos: Consultas avanzadas y vistas para obtener información valiosa del negocio, como ingresos promedio, clientes frecuentes y productos de mayor venta.

🛠️ Tecnologías Utilizadas
Base de Datos: MySQL

Lenguaje: SQL

📈 Estructura de la Base de Datos
El diseño de la base de datos se basa en un modelo relacional, con tablas interconectadas para una gestión eficiente de los datos.

Tablas Principales
Usuarios: Almacena información de los usuarios.

Ubicaciones: Registra las direcciones de los usuarios.

Categorías: Agrupa los productos.

Productos: Contiene la información de los productos, su precio y stock.

Órdenes: Registra los pedidos realizados por los usuarios.

Detalles_Orden: Contiene los productos y cantidades de cada orden.

📦 Archivos del Proyecto
ecommerce.sql: Script SQL completo para la creación del esquema de la base de datos, incluyendo la definición de tablas, vistas, triggers, funciones y procedimientos almacenados.

usuarios.csv: Archivo CSV con datos de muestra para la tabla Usuarios.

categorias.csv: Archivo CSV con datos de muestra para la tabla Categorías.

shaieb-tpf.pptx: Presentación original del proyecto.

⚙️ Guía de Instalación y Uso
Instala MySQL: Asegúrate de tener un servidor MySQL instalado en tu máquina.

Crea la base de datos: Ejecuta el siguiente comando en tu cliente de MySQL:

CREATE DATABASE ventas_ecommerce;
USE ventas_ecommerce;

Ejecuta el script SQL: Carga y ejecuta el archivo ecommerce.sql en tu servidor MySQL para crear todas las tablas, vistas y automatizaciones.

Importa los datos de muestra: Utiliza la herramienta de importación de tu cliente de MySQL (por ejemplo, el asistente de importación en MySQL Workbench) para cargar los datos de los archivos usuarios.csv y categorias.csv en sus respectivas tablas.

💡 Código Relevante
Aquí se destacan algunos de los componentes más importantes que demuestran la funcionalidad del sistema.

Funciones y Vistas Clave
vista_clientes_frecuentes: Una vista que identifica a los clientes que han realizado más de 3 órdenes, calculando el total gastado.

CREATE OR REPLACE VIEW vista_clientes_frecuentes AS
SELECT
    u.ID_Usuario,
    u.Nombre,
    COUNT(o.ID_Orden) AS Total_Ordenes,
    SUM(o.Total_Orden) AS Gasto_Total
FROM
    Usuarios u
JOIN
    Órdenes o ON u.ID_Usuario = o.ID_Usuario
GROUP BY
    u.ID_Usuario, u.Nombre
HAVING
    Total_Ordenes > 3
ORDER BY
    Total_Ordenes DESC;

vista_ingresos_mensuales_por_categoria: Una vista que muestra los ingresos totales por mes para cada categoría de producto.

CREATE OR REPLACE VIEW vista_ingresos_mensuales_por_categoria AS
SELECT
    c.Nombre_Categoría,
    DATE_FORMAT(o.Fecha_Orden, '%Y-%m') AS Mes,
    SUM(o.Total_Orden) AS Ingreso_Total_Mensual
FROM
    Categorías c
JOIN
    Productos p ON c.ID_Categoría = p.ID_Categoría
JOIN
    Detalles_Orden do ON p.ID_Producto = do.ID_Producto
JOIN
    Órdenes o ON do.ID_Orden = o.ID_Orden
GROUP BY
    c.Nombre_Categoría, Mes
ORDER BY
    Mes, Ingreso_Total_Mensual DESC;

Consultas Avanzadas
Consulta para encontrar el producto más vendido por categoría:

SELECT 
    c.Nombre_Categoría,
    sub.Nombre_Producto,
    sub.Total_Vendido
FROM 
    Categorías c
JOIN (
    SELECT 
        p.Nombre_Producto,
        p.ID_Categoría,
        SUM(do.Cantidad) AS Total_Vendido
    FROM 
        Productos p
    JOIN 
        Detalles_Orden do ON p.ID_Producto = do.ID_Producto
    GROUP BY 
        p.ID_Producto, p.Nombre_Producto
    ORDER BY 
        Total_Vendido DESC
) AS sub ON c.ID_Categoría = sub.ID_Categoría
GROUP BY 
    c.ID_Categoría
ORDER BY 
    sub.Total_Vendido DESC;

🔮 Mejoras Futuras
Módulos de Logística y Marketing: Expandir el esquema para incluir la gestión de envíos, campañas de marketing y proveedores.

Dashboard de Análisis: Conectar la base de datos a una herramienta de BI para visualizaciones interactivas.

API REST: Desarrollar una API para permitir que otras aplicaciones interactúen con la base de datos.
