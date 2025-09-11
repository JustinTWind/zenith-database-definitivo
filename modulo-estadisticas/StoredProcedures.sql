-- Procedimientos Almacenados --

-- CREATE PROCEDURE [Nombre] --

-- [@Parameter]

-- AS --

-- BEGIN --

--	Ejemplo (Select)...
--  Ejemplo (Update)...
--  Ejemplo (Delete)...

-- END --

--	Ejemplo (Propio) (exec usp.createUser)
--	Ejemplo (System) (exec sp.add.log)

-- @ = Parámetros. @@ = Funciones. --

-- dbo.table 1.  dbo = Esquema. --

-- usp = User Stored Procedure. = Convenciones estándar de nomenclatura. --

-- Usando base de datos TechStore_Plus --

-- Crear un Procedimiento --

CREATE PROCEDURE usp_ListCustomers
AS
BEGIN SELECT * FROM TBL_CUSTOMERS
END
GO

-- Ejecutar un Procedimiento --

EXEC usp_ListCustomers
GO;

-- Modificar un Procedimiento --

ALTER PROCEDURE [dbo].[usp_ListCustomers]
	-- Parámetros --
	@customerID INT 
AS
BEGIN
	-- Información que se muestra relacionada con el parámetro --
	SELECT Customer_id,
			first_name,
			last_name,
			email
	FROM TBL_CUSTOMERS
	-- Relacionar Dato con el Parámetro --
	WHERE customer_id = @customerID
END
GO;

-- Ejecutar el Procedimiento Modificado --

EXEC usp_ListCustomers 12
GO;

-- Segunda Modificación del Procedimiento --

ALTER PROCEDURE [dbo].[usp_ListCustomers]
	-- Parámetros de *Entrada* --
	@customerID INT,
	@active BIT
AS
BEGIN
	SELECT Customer_id,
			first_name,
			last_name,
			email
	FROM TBL_CUSTOMERS
	WHERE customer_id = @customerID And active = @active
END
GO;

-- Segunda Ejecución del procedimiento Modificado

EXEC usp_ListCustomers 11,1
GO;

-- Conversión de tipos en SQL Server --

-- CAST (__ AS Type); --
-- CONVERT (__, Type, Type); --

-- No se pueden hacer conversiones de cadena a numérico. --

-- Hacer un Nuevo Procedimiento --

CREATE PROCEDURE usp_CountInvoices
	@customerID INT,
	-- Definir parámetro de *Salida* --
	-- Para los parámetros de entrada no hay que colocar nada más. --
	@totalInvoices INT OUTPUT
AS
BEGIN
	SELECT
		@totalInvoices = COUNT(1)
		FROM TBL_INVOICES
		WHERE customer_id = @customerID
END
GO;

-- Ejecutar el Procedimiento --

-- Declarar Variable de Control --
DECLARE @Cantidad INT;
EXEC usp_CountInvoices
	-- Dato de Entrada --
	@customerID = 4,
	-- Dato de Salida --
	@totalInvoices = @Cantidad OUTPUT;
	-- Mostrarlo en Consola --
	PRINT 'Total de Facturas del Cliente es: '
		+ CAST(@Cantidad AS VARCHAR);
GO;

-- Nuevo Procedimiento --

CREATE PROCEDURE usp_SpecialDiscounts
	@Costumer_id INT
AS
BEGIN
	DECLARE @Cantidad INT;
	EXEC usp_CountInvoices
	@customerID = @Costumer_id,
	@totalInvoices = @Cantidad OUTPUT;
	IF @Cantidad >= 2
		PRINT 'Crear un Registro de Descuento en la Tabla TBL_DISCOUNT'
	ELSE 
		PRINT 'Intenta de Nuevo. Cómprame más para darte el descuento.'
END

-- Ejecutar Procedimiento --

EXEC usp_SpecialDiscounts 8

