CREATE PROCEDURE usp_GetAppointmentsByPatient
    @PatientId VARCHAR(10)
AS
BEGIN
    SELECT 
        appt_id,
        appt_at,
        session_type_id,
        [location]
    FROM appointments
    WHERE patient_id = @PatientId;
END;
GO;

CREATE PROCEDURE usp_GetProfessionalsBySpecialty
    @Specialty VARCHAR(50)
AS
BEGIN
    SELECT 
        p.professional_id,
        u.full_name,
        p.specialty
    FROM professionals p
    INNER JOIN users u
        ON p.user_id = u.user_id
    WHERE p.specialty = @Specialty;
END;
GO;

