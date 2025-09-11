CREATE PROCEDURE usp_GetEventsByEventType
    @EventTypeId NVARCHAR(10)
AS
BEGIN
    SELECT 
        e.event_id,
        e.title,
        e.description,
        e.start_at,
        e.end_at,
        e.modality_id,
        e.creator_id,
        e.created_at,
        e.updated_at,
        et.event_type_name
    FROM events e
    INNER JOIN event_type et ON e.event_type = et.event_type_id
    WHERE et.event_type_Id = @EventTypeId;
END;
GO

exec usp_GetEventsByEventType 'ETT001'