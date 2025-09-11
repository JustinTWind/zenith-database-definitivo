CREATE OR ALTER PROCEDURE usp_CreateEvent
    @Title NVARCHAR(100),
    @Description NVARCHAR(500),
    @StartAt DATETIME,
    @EndAt DATETIME,
    @ModalityId NVARCHAR(10),
    @CreatorId NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO events (event_id, title, description, start_at, end_at, modality_id, creator_id, created_at, updated_at)
    VALUES (
        CONCAT('EVT', FORMAT(NEXT VALUE FOR seq_event_id, '000')),
        @Title,
        @Description,
        @StartAt,
        @EndAt,
        @ModalityId,
        @CreatorId,
        SYSDATETIME(),
        SYSDATETIME()
    );
END;
GO

CREATE OR ALTER PROCEDURE usp_GetEventById
    @EventId NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        event_id, 
        title, 
        description, 
        start_at, 
        end_at, 
        modality_id, 
        creator_id, 
        created_at, 
        updated_at
    FROM events
    WHERE event_id = @EventId;
END;
GO

CREATE OR ALTER PROCEDURE usp_GetAllEvents
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        event_id, 
        title, 
        description, 
        start_at, 
        end_at, 
        modality_id, 
        creator_id, 
        created_at, 
        updated_at
    FROM events
    ORDER BY start_at ASC;
END;
GO

CREATE OR ALTER PROCEDURE usp_UpdateEvent
    @EventId NVARCHAR(10),
    @Title NVARCHAR(100),
    @Description NVARCHAR(500),
    @StartAt DATETIME,
    @EndAt DATETIME,
    @ModalityId NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE events
    SET 
        title = @Title,
        description = @Description,
        start_at = @StartAt,
        end_at = @EndAt,
        modality_id = @ModalityId,
        updated_at = SYSDATETIME()
    WHERE event_id = @EventId;
END;
GO

CREATE OR ALTER PROCEDURE usp_DeleteEvent
    @EventId NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM events
    WHERE event_id = @EventId;
END;
GO