SELECT 
     {[Measures].[Frecuencia Cardiaca], [Measures].[Oxigenacion], [Measures].[Presion Sistolica], [Measures].[Temperatura]} ON COLUMNS,
     [SIGNOS VITALES].[NSS Paciente].CHILDREN ON ROWS
FROM [DEAD MOD]


SELECT
	[PACIENTE].[Jerarquía].[Pk Paciente] ON COLUMNS,
	[DIAGNOSTICO].[Pk Medicamento].CHILDREN ON ROWS
FROM [DEAD MOD]
WHERE [Measures].[NSS Paciente]


Los 5 hospitales con mayor número de camas UCI:
SELECT
	[Measures].[Camas UCI] ON COLUMNS,
	HEAD(ORDER([HOSPITAL].[Jerarquía].[Pk Hospital], [Measures].[Camas UCI], BDESC), 5) ON ROWS
FROM [DEAD MOD];


-- Mortalidad predicha de los hospitales
SELECT
	[Measures].[Float Mortalidad Predicha] ON COLUMNS,
	[HOSPITAL].[Jerarquía].CHILDREN ON ROWS
FROM [DEAD MOD];


Los 3 hospitales con mayor mortalidad predicha
WITH SET [Hospitales con mas mortalidad] AS
    TOPCOUNT(
        [HOSPITAL].[Jerarquía].[Pk Hospital].MEMBERS, 
        3, 
        [Measures].[Float Mortalidad Predicha]
    )
SELECT
    [Measures].[Float Mortalidad Predicha] ON COLUMNS,
    [Hospitales con mas mortalidad] ON ROWS
FROM [DEAD MOD];


5 pacientes con mayor peso de ingreso y su frecuencia cardiaca
WITH SET [Pacientes con mayor peso] AS
	TOPCOUNT(
		[SIGNOS VITALES].[NSS Paciente].CHILDREN,
		5,
		[Measures].[Peso Ingreso]
	)
SELECT
	{[Measures].[Peso Ingreso], [Measures].[Frecuencia Cardiaca]} ON COLUMNS,
	[Pacientes con mayor peso] ON ROWS
FROM [DEAD MOD]