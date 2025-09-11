-- consultar todos los eventos con modalidad 'Presencial'.
CREATE OR ALTER PROCEDURE usp_GetInPersonEvents
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        e.event_id,
        e.title,
        e.description,
        e.start_at,
        e.end_at,
        m.modality_name AS modality
    FROM
        events AS e
    INNER JOIN
        modalities AS m ON e.modality_id = m.modality_id
    WHERE
        m.modality_name = 'Presencial';
END;
GO

EXEC usp_GetInPersonEvents;
GO

--consultar únicamente a los asistentes de un evento específico.
CREATE OR ALTER PROCEDURE usp_GetAttendeesPerEvent
    @EventId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        u.user_id,
        u.full_name,
        u.email,
        r.event_role_name AS role
    FROM
        event_attendees AS ea
    INNER JOIN
        users AS u ON ea.user_id = u.user_id
    INNER JOIN
        event_role AS r ON ea.attendeer_role = r.event_role_id
    WHERE
        ea.event_id = @EventId AND r.event_role_name = 'Asistente';
END;
GO


EXEC usp_GetAttendeesPerEvent 'EVT001';
GO


--contar el número total de participantes por cada evento.
CREATE OR ALTER PROCEDURE usp_CountAllParticipantsPerEvent
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        e.event_id,
        e.title,
        COUNT(ea.attendee_id) AS TotalParticipants
    FROM
        events AS e
    LEFT JOIN
        event_attendees AS ea ON e.event_id = ea.event_id
    GROUP BY
        e.event_id,
        e.title
    ORDER BY
        TotalParticipants DESC;
END;
GO


EXEC usp_CountAllParticipantsPerEvent;
GO


--obtener una lista de eventos futuros.
CREATE OR ALTER PROCEDURE usp_GetUpcomingEvents
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        e.title,
        e.start_at,
        e.description,
        u.full_name AS creator_name,
        et.event_type_name AS event_type
    FROM
        events AS e
    INNER JOIN
        users AS u ON e.creator_id = u.user_id
    INNER JOIN
        event_type AS et ON e.event_type = et.event_type_id
    WHERE
        e.start_at > SYSDATETIME();
END;
GO

EXEC usp_GetUpcomingEvents;
GO


--contar los participantes por cada rol en un evento específico.
CREATE OR ALTER PROCEDURE usp_CountRolesPerEvent
    @EventId VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        er.event_role_name AS role,
        COUNT(ea.attendee_id) AS TotalCount
    FROM
        event_attendees AS ea
    INNER JOIN
        event_role AS er ON ea.attendeer_role = er.event_role_id
    WHERE
        ea.event_id = @EventId
    GROUP BY
        er.event_role_name;
END;
GO


EXEC usp_CountRolesPerEvent 'EVT001';
GO