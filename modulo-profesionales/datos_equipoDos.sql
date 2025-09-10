--profesionales
INSERT INTO [professionals] 
([professional_id], [user_id], [Specialty], [biography], [years_experience])
VALUES
('PRF001', 'USR003', 'Psicología Clínica', 'Profesional enfocado en terapia individual y familiar.', 5),
('PRF002', 'USR007', 'Psiquiatría', 'Especialista en manejo de trastornos afectivos y ansiedad.', 8),
('PRF003', 'USR011', 'Psicología Infantil', 'Experiencia en procesos de desarrollo y aprendizaje en niños.', 4),
('PRF004', 'USR015', 'Psicología Infantil', 'Experiencia en procesos de desarrollo y aprendizaje en niños.', 6),
('PRF005', 'USR019', 'Psicología Educativa', 'Trabajo en orientación escolar y acompañamiento académico.', 3),
('PRF006', 'USR023', 'Psicología Clinica', 'Acompañamiento en procesos emocionales complejos.', 7),
('PRF007', 'USR027', 'Psicología Educativa', 'Trabajo en orientación escolar y acompañamiento académico.', 10),
('PRF008', 'USR031', 'Neuropsicología', 'Intervención en funciones cognitivas y rehabilitación.', 9),
('PRF009', 'USR035', 'Psicología Social', 'Experiencia en proyectos comunitarios y sociales.', 6),
('PRF010', 'USR039', 'Psicología Clínica', 'Acompañamiento en procesos emocionales complejos.', 12),
('PRF011', 'USR043', 'Terapia de Pareja', 'Especialista en resolución de conflictos de pareja.', 5),
('PRF012', 'USR047', 'Psicología de la Salud', 'Intervención en hábitos saludables y bienestar integral.', 8);

--HU044C5 crear proyectos
INSERT INTO [projects] 
([project_id], [professional_id], [name], [year], [description], [file_url], [created_at])
VALUES
('PRY001', 'PRF001', 'MindCare', 2024, 'Plataforma digital de apoyo en terapia individual y familiar.', 'https://example.com/files/mindcare.pdf', GETDATE()),
('PRY002', 'PRF002', 'Calma App', 2024, 'Aplicación móvil para manejo de trastornos afectivos y ansiedad.', 'https://example.com/files/calmaapp.pdf', GETDATE()),
('PRY003', 'PRF003', 'NeuroKids', 2025, 'Programa de intervención psicológica en niños con dificultades de aprendizaje.', 'https://example.com/files/neurokids.pdf', GETDATE()),
('PRY004', 'PRF004', 'Creciendo Juntos', 2025, 'Proyecto de acompañamiento emocional en la infancia.', 'https://example.com/files/creciendojuntos.pdf', GETDATE()),
('PRY005', 'PRF005', 'EducaMente', 2023, 'Estrategias de orientación escolar y acompañamiento académico.', 'https://example.com/files/educamente.pdf', GETDATE()),
('PRY006', 'PRF006', 'Clínica Virtual', 2024, 'Consultas psicológicas en línea para apoyo emocional complejo.', 'https://example.com/files/clinicavirtual.pdf', GETDATE()),
('PRY007', 'PRF007', 'Aula Sana', 2023, 'Programa de apoyo psicológico en instituciones educativas.', 'https://example.com/files/aulasa.pdf', GETDATE()),
('PRY008', 'PRF008', 'NeuroRehab', 2024, 'Plataforma de rehabilitación cognitiva y acompañamiento neuropsicológico.', 'https://example.com/files/neurorehab.pdf', GETDATE()),
('PRY009', 'PRF009', 'Comunidad Sana', 2025, 'Proyecto comunitario para promover la salud mental y social.', 'https://example.com/files/comunidadsana.pdf', GETDATE()),
('PRY010', 'PRF010', 'PsicoSalud Integral', 2024, 'Servicio de psicología clínica con enfoque en salud integral.', 'https://example.com/files/psicosalud.pdf', GETDATE()),
('PRY011', 'PRF011', 'Amor Consciente', 2025, 'Programa de terapia de pareja y fortalecimiento de relaciones.', 'https://example.com/files/amorconsciente.pdf', GETDATE()),
('PRY012', 'PRF011', 'Vida Sana', 2024, 'Proyecto de intervención en hábitos saludables y bienestar integral.', 'https://example.com/files/vidasana.pdf', GETDATE());


