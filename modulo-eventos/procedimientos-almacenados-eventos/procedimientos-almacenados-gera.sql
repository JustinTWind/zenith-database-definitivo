--PROCEDIMIENTOS CON LA TABLA EVENT ATTENDEERS
--número de asistentes registrados al evento EVT002
CREATE PROCEDURE usp_CountAttendeesByEvent
    @EventId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        COUNT(*) AS TotalAttendees
    FROM 
        dbo.event_Attendees
    WHERE 
        event_id = @EventId;
END;
GO

EXEC usp_CountAttendeesByEvent @EventId = 'EVT002';


 --Ver los roles de los asistentes
 CREATE PROCEDURE usp_CountAttendeesByEventAndRoles
    @EventId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        attendeer_role,
        COUNT(*) AS TotalAttendees
    FROM 
        dbo.event_Attendees
    WHERE 
        event_id = @EventId
    GROUP BY 
        attendeer_role;
END;
GO

EXEC usp_CountAttendeesByEventAndRoles @EventId = 'EVT002';


--eventos en los que ha participado un usuario
CREATE PROCEDURE usp_CountEventsByUser
    @UserId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        COUNT(DISTINCT event_id) AS TotalEvents
    FROM 
        dbo.event_Attendees
    WHERE 
        user_id = @UserId;
END;
GO

EXEC usp_CountEventsByUser @UserId = 'USR008';
EXEC usp_CountEventsByUser @UserId = 'USR016';


--�ltimo evento al que asistió un usuario y en que fecha
CREATE PROCEDURE usp_LastEventByUser
    @UserId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP 1
        event_id,
        attendeer_role,
        registered_at
    FROM 
        dbo.event_Attendees
    WHERE 
        user_id = @UserId
    ORDER BY 
        registered_at DESC;
END;
GO


EXEC usp_LastEventByUser @UserId = 'USR012';


--Verificar si un usuario está inscrito a un evento
CREATE PROCEDURE usp_GetUserParticipationInEvent
    @UserId VARCHAR(10),
    @EventId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        attendee_id,
        user_id,
        event_id,
        attendeer_role,
        registered_at
    FROM 
        dbo.event_Attendees
    WHERE 
        user_id = @UserId
        AND event_id = @EventId;
END;
GO

EXEC usp_GetUserParticipationInEvent @UserId = 'USR042', @EventId = 'EVT006';


--PROCEDIMIENTOS CON LA TABLA MODALITIES
--Insertar una nueva modalidad
CREATE PROCEDURE usp_InsertModality
    @ModalityId VARCHAR(10),
    @ModalityName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.modalities (modality_id, modality_name, created_at)
    VALUES (@ModalityId, @ModalityName, GETDATE());
END;
GO

EXEC usp_InsertModality @ModalityId = 'MTD003', @ModalityName = 'Hibrido';
EXEC usp_InsertModality @ModalityId = 'MTD004', @ModalityName = 'Asincronico';

select * from dbo.modalities;

--Listar todas las modalidades
CREATE PROCEDURE usp_GetAllModalities
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        modality_id,
        modality_name,
        created_at
    FROM 
        dbo.modalities
    ORDER BY 
        created_at DESC;
END;
GO

EXEC usp_GetAllModalities;


--buscar modalidad por nombre
CREATE PROCEDURE usp_GetModalityByName
    @ModalityName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        modality_id,
        modality_name,
        created_at
    FROM 
        dbo.modalities
    WHERE 
        modality_name LIKE '%' + @ModalityName + '%';
END;
GO

EXEC usp_GetModalityByName @ModalityName = 'Virtual';


--Eliminar una modalidad
CREATE PROCEDURE usp_DeleteModality
    @ModalityId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.modalities
    WHERE modality_id = @ModalityId;
END;
GO

EXEC usp_DeleteModality @ModalityId = 'MTD004';


--Usuarios por modalidad
CREATE PROCEDURE sp_GetUsersByModality
    @ModalityName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ea.user_id,
        ea.attendeer_role,
        ea.registered_at,
        e.event_id,
        m.modality_name
    FROM 
        dbo.event_Attendees ea
        INNER JOIN dbo.events e ON ea.event_id = e.event_id
        INNER JOIN dbo.modalities m ON e.modality_id = m.modality_id
    WHERE 
        m.modality_name = @ModalityName
    ORDER BY 
        ea.registered_at;
END;
GO

EXEC sp_GetUsersByModality @ModalityName = 'Virtual';
