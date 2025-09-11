
-- Consultar todos los eventos de un creador
CREATE PROCEDURE usp_GetEventsByCreator
    @UserId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        ev.event_id,
        ev.title,
        ev.description,
        us.full_name,
        us.email,
        us.user_id

    FROM
       events as ev
       INNER JOIN users us on ev.creator_id = us.user_id
    WHERE
        ev.creator_id = @UserId
END;
GO

Exec usp_GetEventsByCreator 'USR003'
GO


-- Contar eventos por su tipo
CREATE OR ALTER PROCEDURE usp_CountEventsByType
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        et.event_type_id,
        et.event_type_name,
        COUNT(ev.event_id) AS TotalEvents
    FROM event_type et
    LEFT JOIN events ev ON et.event_type_id = ev.event_type
    GROUP BY et.event_type_id, et.event_type_name
    ORDER BY TotalEvents DESC;
END;
GO


exec usp_CountEventsByType
GO

Begin Transaction
GO

-- Contador de cuantos Guests hay por evento
CREATE PROCEDURE usp_CountGuestsPerEvent
    @EventId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ev.title,
        ev.event_id,
        COUNT(*) AS TotalGuests
    FROM events ev
    INNER JOIN event_attendees ea ON ev.event_id = ea.event_id
    INNER JOIN users us ON ea.user_id = us.user_id
    INNER JOIN roles ro ON us.user_role_id = ro.user_role_id
    WHERE
        ro.name = 'Guest' and ev.event_id = @EventId
    GROUP BY
        ev.title,
        ev.event_id
END;
GO

exec usp_CountGuestsPerEvent 'EVT001'

COMMIT TRANSACTION