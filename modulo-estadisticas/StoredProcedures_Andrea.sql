CREATE PROCEDURE usp_CountEventsByModality
AS
BEGIN
	SELECT 
		m.modality_name AS Modality,
		COUNT(*) AS TotalEvents
	FROM events e
	INNER JOIN modalities m ON e.modality_id = m.modality_id
	GROUP BY m.modality_name
	ORDER BY TotalEvents DESC;
END;
GO;

CREATE PROCEDURE usp_CountMessagesByUser
AS
BEGIN
    SELECT 
        u.full_name as UserName,
        COUNT(m.message_id) AS TotalMessages
    FROM messages m
    INNER JOIN users u ON m.user_id = u.user_id
    GROUP BY u.full_name
    ORDER BY TotalMessages DESC;
END;