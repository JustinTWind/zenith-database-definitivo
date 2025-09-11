CREATE PROCEDURE usp_CountAppointmentsBySessionType
AS
BEGIN
	SELECT st.name AS SessionType,
			COUNT(a.appt_id) AS TotalAppointments
	FROM appointments a
	INNER JOIN session_types st ON a.session_type_id = st.session_type_id
	GROUP BY st.name;
END;
GO;

CREATE PROCEDURE usp_GetReviewStats
    @ProfessionalId VARCHAR(10) = NULL,
    @MinRating INT = 1
AS
BEGIN
    SELECT 
        COUNT(*) AS TotalReviews,
        AVG(CAST(rating AS DECIMAL(3,2))) AS AverageRating,
        MIN(rating) AS MinRating,
        MAX(rating) AS MaxRating
    FROM reviews
    WHERE rating >= @MinRating
      AND (@ProfessionalId IS NULL OR professional_id = @ProfessionalId);
END;
GO;