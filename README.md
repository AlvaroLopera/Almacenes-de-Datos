# Proyecto: Almacén de Datos para Ingresos en UCI

## Descripción
Este proyecto tiene como objetivo principal el diseño y desarrollo de un **almacén de datos** basado en información proveniente de ingresos a la Unidad de Cuidados Intensivos (UCI). La información original proviene de una base de datos detallada, que ha sido simplificada y reorganizada para optimizar consultas y análisis relacionados con pacientes, diagnósticos, tratamientos y resultados médicos.

## Estructura del Proyecto

### Archivos Principales
- **base de datos original.sql**: Script que define la estructura y los datos de la base de datos original.
- **almacen.sql**: Script que define el almacén de datos con tablas reorganizadas y simplificadas.
- **ETL Scripts** (opcional): Scripts que implementan la extracción, transformación y carga de datos desde la base de datos original hacia el almacén.
- **Documentación**: Explicación detallada de las decisiones tomadas durante el desarrollo del proyecto.

### Tablas Principales del Almacén
- **INGRESO_UCI**: Tabla de hechos principal que agrupa toda la información clave del ingreso.
- **PACIENTE**: Información demográfica y médica básica de los pacientes.
- **TIEMPO**: Dimensión temporal.
- **HOSPITAL**: Detalles sobre el hospital de ingreso.
- **DIAGNOSTICO**: Condiciones médicas y diagnósticos asociados.
- **LABORATORIO**: Pruebas y resultados de laboratorio.
- **SIGNOS_VITALES**: Registro de medidas clave como frecuencia cardíaca y presión arterial.

## Requisitos

### Software Necesario
- **SQL Server Management Studio (SSMS)**: Para ejecutar los scripts de creación y configuración de la base de datos.
- **Integration Services (opcional)**: Para procesos ETL.
- **Herramientas de Visualización**: Power BI, Tableau o Reporting Services para análisis y presentación.

### Configuración Requerida
1. Asegúrese de tener instalado **SQL Server** (versión 2017 o superior).
2. Configure una base de datos llamada `eICU_Almacen` para importar los scripts proporcionados.

## Instalación y Ejecución

### Paso 1: Restaurar la Base de Datos Original
1. Abra SQL Server Management Studio.
2. Ejecute el script `base de datos original.sql` para cargar la base de datos completa.
3. Asegúrese de que la base de datos se restaure correctamente, verificando la creación de tablas y datos.

### Paso 2: Crear el Almacén de Datos
1. Ejecute el script `almacen.sql` para crear las tablas del almacén de datos.
2. Verifique que las tablas y relaciones coincidan con la estructura descrita en la documentación.

### Paso 3: (Opcional) Ejecutar Proceso ETL
1. Utilice Integration Services o un script ETL personalizado para cargar los datos desde la base de datos original hacia el almacén.
2. Verifique que los datos en el almacén coincidan con los resultados esperados.

### Paso 4: Consultas y Análisis
1. Utilice SQL Server para realizar consultas personalizadas sobre las tablas del almacén.
2. Cargue los datos en herramientas de análisis como Power BI o Tableau para visualización avanzada.

## Notas Adicionales
- Si surgen problemas durante la ejecución de los scripts, verifique permisos y compatibilidad de la base de datos.
- Todas las claves primarias y foráneas han sido definidas para mantener la integridad referencial del almacén.

## Contacto
Para más información o soporte técnico, por favor contacte al desarrollador del proyecto o consulte la documentación adicional adjunta al repositorio.
