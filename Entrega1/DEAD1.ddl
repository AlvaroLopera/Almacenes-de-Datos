-- Generado por Oracle SQL Developer Data Modeler 24.3.0.240.1210
--   en:        2024-10-23 13:30:39 CEST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE DIAGNOSTICO 
    (
     ID_Diagnostico NUMERIC (28) NOT NULL , 
     Tipo_Diagnostico NVARCHAR (50) NOT NULL , 
     Resultado NVARCHAR , 
     Descripcion_Diagnostico NVARCHAR (500) NOT NULL , 
     Prioridad NVARCHAR (50) NOT NULL , 
     Dia_Diagnostico DATE NOT NULL , 
     Hora_Diagnostico DATETIME NOT NULL , 
     ID_Medico_Responsable NVARCHAR (15) NOT NULL , 
     Nombre_Medico NVARCHAR (30) NOT NULL 
    )
GO

ALTER TABLE DIAGNOSTICO ADD CONSTRAINT DIAGNOSTICO_PK PRIMARY KEY CLUSTERED (ID_Diagnostico)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE HISTORIAL_MEDICO 
    (
     ID_Historial NUMERIC (28) NOT NULL , 
     Id_Ingresos NUMERIC (28) NOT NULL , 
     Descripcion NVARCHAR (500) NOT NULL , 
     Dia_Ingreso DATE NOT NULL , 
     Hora_Ingreso DATETIME NOT NULL , 
     Dia_Salida DATE , 
     Hora_Salida DATETIME , 
     Tipo_Ingreso NVARCHAR , 
     Medico_Tratante NVARCHAR NOT NULL 
    )
GO

ALTER TABLE HISTORIAL_MEDICO ADD CONSTRAINT HISTORIAL_MEDICO_PK PRIMARY KEY CLUSTERED (ID_Historial)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE HOSPITAL 
    (
     ID_Hospital NUMERIC (28) NOT NULL , 
     Nombre_Encargado NVARCHAR (50) NOT NULL , 
     Numeros_Contacto NVARCHAR (150) NOT NULL , 
     Numero_Emergencias NVARCHAR (150) NOT NULL , 
     Pais NVARCHAR (50) NOT NULL , 
     Region NVARCHAR (50) NOT NULL , 
     Ciudad NVARCHAR (50) NOT NULL , 
     Direccion NVARCHAR (50) NOT NULL , 
     Codigo_Postal NUMERIC (28) NOT NULL , 
     Coord_N NVARCHAR (20) NOT NULL , 
     Coord_S NVARCHAR (25) NOT NULL , 
     Tipo_Hospital NVARCHAR (100) NOT NULL , 
     Especialidades NVARCHAR (50) NOT NULL , 
     Num_Camas_Disp NUMERIC (28) NOT NULL , 
     Numero_Camas_Totales NUMERIC (28) NOT NULL , 
     Fecha_Fundacion DATE NOT NULL 
    )
GO

ALTER TABLE HOSPITAL ADD CONSTRAINT HOSPITAL_PK PRIMARY KEY CLUSTERED (ID_Hospital)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE INGRESO_UCI 
    (
     ID_Ingreso NUMERIC (28) NOT NULL , 
     Dia_De_Admision DATE NOT NULL , 
     Hora_Admision DATETIME NOT NULL , 
     Dia_Salida DATE NOT NULL , 
     Hora_Salida DATETIME NOT NULL , 
     PACIENTE_NSS_Paciente NVARCHAR (30) NOT NULL , 
     INTERVENCION_ID_Intervencion NUMERIC (28) NOT NULL , 
     HOSPITAL_ID_Hospital NUMERIC (28) NOT NULL , 
     HISTORIAL_MEDICO_ID_Historial NUMERIC (28) NOT NULL , 
     DIAGNOSTICO_ID_Diagnostico NUMERIC (28) NOT NULL , 
     MEDICO_ID_Medico NVARCHAR (50) NOT NULL , 
     Estado_Ingreso NVARCHAR (50) NOT NULL , 
     Motivo_Ingreso NVARCHAR NOT NULL , 
     Tipo_Ingreso NVARCHAR (50) NOT NULL , 
     Unidad_UCI NVARCHAR NOT NULL , 
     TIEMPO_ID_Tiempo NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE INGRESO_UCI ADD CONSTRAINT INGRESO_UCI_PK PRIMARY KEY CLUSTERED (PACIENTE_NSS_Paciente, INTERVENCION_ID_Intervencion, HOSPITAL_ID_Hospital, HISTORIAL_MEDICO_ID_Historial, DIAGNOSTICO_ID_Diagnostico, TIEMPO_ID_Tiempo, MEDICO_ID_Medico)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE INGRESO_UCI ADD CONSTRAINT INGRESO_UCI_ID_Ingreso_UN UNIQUE NONCLUSTERED (ID_Ingreso)
GO

CREATE TABLE INTERVENCION 
    (
     ID_Intervencion NUMERIC (28) NOT NULL , 
     Tipo_Tratamiento NVARCHAR (50) NOT NULL , 
     Descripcion_Intervencion NVARCHAR (1000) NOT NULL , 
     Ref_Medicamento NVARCHAR (100) NOT NULL , 
     Hora_Intervencion DATETIME NOT NULL , 
     Dia_Intervencion DATE NOT NULL , 
     ID_MedicoRes NVARCHAR NOT NULL , 
     Resultado NVARCHAR (50) NOT NULL , 
     Motivo_Intervencion NVARCHAR NOT NULL , 
     Descripcion_Medicamento NVARCHAR (100) NOT NULL , 
     Dosis_Recomendada_Medicamento NVARCHAR (10) NOT NULL , 
     Resultado_Intervencion NVARCHAR (10) NOT NULL 
    )
GO

ALTER TABLE INTERVENCION ADD CONSTRAINT INTERVENCION_PK PRIMARY KEY CLUSTERED (ID_Intervencion)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE MEDICO 
    (
     ID_Medico NVARCHAR (50) NOT NULL , 
     Nombre_Medico NVARCHAR (100) NOT NULL , 
     Numero_Licencia NUMERIC (28) NOT NULL , 
     Especialidad NVARCHAR (50) NOT NULL , 
     Datos_Contacto NVARCHAR (100) NOT NULL , 
     Departamento NVARCHAR (50) NOT NULL , 
     Listado_Pacientes NVARCHAR (100) NOT NULL 
    )
GO

ALTER TABLE MEDICO ADD CONSTRAINT MEDICO_PK PRIMARY KEY CLUSTERED (ID_Medico)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PACIENTE 
    (
     NSS_Paciente NVARCHAR (30) NOT NULL , 
     Nombre_Paciente NVARCHAR (30) NOT NULL , 
     Apellidos_Paciente NVARCHAR (50) NOT NULL , 
     Edad_Paciente NUMERIC (28) NOT NULL , 
     Etnia_Paciente NVARCHAR (30) NOT NULL , 
     Peso_Ingreso NUMERIC (28) , 
     Peso_Salida NUMERIC (28) , 
     Estado_Paciente NVARCHAR (50) NOT NULL , 
     Direccion_Residencia NVARCHAR (100) NOT NULL , 
     Telefono_Contacto NVARCHAR (15) NOT NULL , 
     Estado_Civil NVARCHAR (20) NOT NULL , 
     Ocupacion NVARCHAR (20) NOT NULL , 
     Altura NVARCHAR (10) NOT NULL , 
     Alergias NVARCHAR (100) NOT NULL 
    )
GO

ALTER TABLE PACIENTE ADD CONSTRAINT PACIENTE_PK PRIMARY KEY CLUSTERED (NSS_Paciente)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE TIEMPO 
    (
     ID_Tiempo NUMERIC (28) NOT NULL , 
     Fecha_Ingreso DATE NOT NULL , 
     Hora_Ingreso DATETIME , 
     Fecha_Salida DATE , 
     Hora_Salida DATETIME , 
     Duracion_Estancia NVARCHAR (20) , 
     Tiempo_Traslado NVARCHAR (20) , 
     Hora_LLamadaEmergencias DATETIME , 
     Dia_LLamadaEmergencias DATE , 
     Dia_Ingreso_Quirofano DATE , 
     Hora_Ingreso_Quirofano DATETIME , 
     Dia_Salida_Quirofano DATE , 
     Hora_Salida_Quirofano DATETIME , 
     Duracion_Operacion NVARCHAR (10) 
    )
GO

ALTER TABLE TIEMPO ADD CONSTRAINT TIEMPO_PK PRIMARY KEY CLUSTERED (ID_Tiempo)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE INGRESO_UCI 
    ADD CONSTRAINT INGRESO_UCI_DIAGNOSTICO_FK FOREIGN KEY 
    ( 
     DIAGNOSTICO_ID_Diagnostico
    ) 
    REFERENCES DIAGNOSTICO 
    ( 
     ID_Diagnostico 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE INGRESO_UCI 
    ADD CONSTRAINT INGRESO_UCI_HISTORIAL_MEDICO_FK FOREIGN KEY 
    ( 
     HISTORIAL_MEDICO_ID_Historial
    ) 
    REFERENCES HISTORIAL_MEDICO 
    ( 
     ID_Historial 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE INGRESO_UCI 
    ADD CONSTRAINT INGRESO_UCI_HOSPITAL_FK FOREIGN KEY 
    ( 
     HOSPITAL_ID_Hospital
    ) 
    REFERENCES HOSPITAL 
    ( 
     ID_Hospital 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE INGRESO_UCI 
    ADD CONSTRAINT INGRESO_UCI_INTERVENCION_FK FOREIGN KEY 
    ( 
     INTERVENCION_ID_Intervencion
    ) 
    REFERENCES INTERVENCION 
    ( 
     ID_Intervencion 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE INGRESO_UCI 
    ADD CONSTRAINT INGRESO_UCI_MEDICO_FK FOREIGN KEY 
    ( 
     MEDICO_ID_Medico
    ) 
    REFERENCES MEDICO 
    ( 
     ID_Medico 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE INGRESO_UCI 
    ADD CONSTRAINT INGRESO_UCI_PACIENTE_FK FOREIGN KEY 
    ( 
     PACIENTE_NSS_Paciente
    ) 
    REFERENCES PACIENTE 
    ( 
     NSS_Paciente 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE INGRESO_UCI 
    ADD CONSTRAINT INGRESO_UCI_TIEMPO_FK FOREIGN KEY 
    ( 
     TIEMPO_ID_Tiempo
    ) 
    REFERENCES TIEMPO 
    ( 
     ID_Tiempo 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO
