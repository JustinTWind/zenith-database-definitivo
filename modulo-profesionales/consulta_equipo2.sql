--HU045C5
SELECT 
    p.project_id,
    p.name AS ProjectName,
    p.Description AS ProjectDescription,
    pr.specialty, 
    u.full_name
FROM projects p
INNER JOIN professionals pr ON p.professional_id = pr.professional_id
INNER JOIN users u ON pr.user_id = u.user_id
WHERE pr.professional_id = 'PRF004';

--HU048C5 LISTAR PROFESIONALES Y SUS PROYECTOS
select p.professional_id as Id_Professional, u.full_name as [Name], 
count(pj.project_id) as Cant_Projects
from professionals p
inner join users u on  p.user_id = u.user_id
inner join projects pj on pj.professional_id = p.professional_id
GROUP BY p.professional_id, u.full_name
order by Cant_Projects asc;

--HU046C5
BEGIN TRANSACTION;
-- Verificaci�n previa
SELECT professional_id, biography
FROM professionals
WHERE professional_id = 'PRF002';

-- Actualizaci�n
UPDATE professionals
SET biography = 'Nueva biograf�a aqu�'
WHERE professional_id = 'PRF002';

-- Verificaci�n posterior
SELECT professional_id, biography
FROM professionals
WHERE professional_id = 'PRF002';

-- Luego:
--COMMIT TRANSACTION;
-- O bien, si algo no est� bien:
--ROLLBACK�TRANSACTION;

--HU049C5 
INSERT INTO [projects] 
([project_id], [professional_id], [name], [year], [description], [file_url], [created_at])
VALUES
(1, 'PRF001', 'MindCare', 2024, 'Plataforma digital de apoyo en terapia individual y familiar.', 'https://example.com/files/mindcare.pdf', GETDATE()),


CREATE PROCEDURE insertar_proyecto(
 @project_id VARCHAR (10),
 @professional_id VARCHAR (10),
 @nombre VARCHAR (200),
 @a�o INT,
 @descripcion TEXT,
 @url VARCHAR (255)
)
AS
BEGIN
    INSERT INTO [projects] 
    ([project_id], [professional_id], [name], [year], [description], [file_url], [created_at])
    VALUES
    (@project_id, @professional_id, @nombre, @a�o, @descripcion, @url, GETDATE());
END;

SELECT * FROM  projects
EXEC insertar_proyecto 
    'PRY013', 
    'PRF001', 
    'Equilibrio Emocional', 
    2025, 
    'Programa de psicolog�a cl�nica enfocado en la prevenci�n y tratamiento de ansiedad y depresi�n mediante sesiones virtuales y presenciales.', 
    'https://example.com/files/equilibrioemocional.pdf';

    select * from projects