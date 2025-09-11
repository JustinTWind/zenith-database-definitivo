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

-- @ = Par�metros. @@ = Funciones. --

-- dbo.table 1.  dbo = Esquema. --

-- usp = User Stored Procedure. = Convenciones est�ndar de nomenclatura. --

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
	-- Par�metros --
	@customerID INT 
AS
BEGIN
	-- Informaci�n que se muestra relacionada con el par�metro --
	SELECT Customer_id,
			first_name,
			last_name,
			email
	FROM TBL_CUSTOMERS
	-- Relacionar Dato con el Par�metro --
	WHERE customer_id = @customerID
END
GO;

-- Ejecutar el Procedimiento Modificado --

EXEC usp_ListCustomers 12
GO;

-- Segunda Modificaci�n del Procedimiento --

ALTER PROCEDURE [dbo].[usp_ListCustomers]
	-- Par�metros de *Entrada* --
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

-- Segunda Ejecuci�n del procedimiento Modificado

EXEC usp_ListCustomers 11,1
GO;

-- Conversi�n de tipos en SQL Server --

-- CAST (__ AS Type); --
-- CONVERT (__, Type, Type); --

-- No se pueden hacer conversiones de cadena a num�rico. --

-- Hacer un Nuevo Procedimiento --

CREATE PROCEDURE usp_CountInvoices
	@customerID INT,
	-- Definir par�metro de *Salida* --
	-- Para los par�metros de entrada no hay que colocar nada m�s. --
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
		PRINT 'Intenta de Nuevo. C�mprame m�s para darte el descuento.'
END

-- Ejecutar Procedimiento --

EXEC usp_SpecialDiscounts 8

