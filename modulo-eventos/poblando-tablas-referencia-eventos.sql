-- Insertar modalidades
INSERT INTO modalities (modality_id, modality_name)
VALUES
    ('MTD001', 'Virtual'),
    ('MTD002', 'Presencial');

-- Insertar tipos de eventos
INSERT INTO event_type(event_type_id, event_type_name, event_type_description)
VALUES
    ('ETT001', 'Taller Emocional', 'Sesiones prácticas para trabajar la inteligencia emocional.'),
    ('ETT002', 'Webinar de Salud Mental', 'Conferencias virtuales con expertos en psicología y bienestar.'),
    ('ETT003', 'Charla', 'Encuentros informales para dialogar sobre temas de salud mental.'),
    ('ETT004', 'Grupo de Apoyo', 'Espacios para compartir experiencias y brindar acompañamiento.'),
    ('ETT005', 'Terapia Grupal', 'Sesiones guiadas por un profesional de la salud mental con varios participantes.'),
    ('ETT006', 'Meditación Guiada', 'Prácticas de meditación enfocadas en el manejo del estrés y la ansiedad.'),
    ('ETT007', 'Taller de Mindfulness', 'Entrenamiento en atención plena y reducción del estrés.'),
    ('ETT008', 'Jornada de Bienestar', 'Actividades integrales de promoción de la salud mental y autocuidado.'),
    ('ETT009', 'Seminario Académico', 'Exposición de investigaciones y avances en salud mental.'),
    ('ETT010', 'Conferencia Motivacional', 'Charlas inspiracionales enfocadas en resiliencia y crecimiento personal.');

-- Insertar roles de evento
INSERT INTO event_role (event_role_id, event_role_name, event_role_description)
VALUES
    ('ETR001', 'Speaker', 'Persona encargada de dar una charla, conferencia o presentación.'),
    ('ETR002', 'Asistente', 'Participante general del evento.'),
    ('ETR003', 'Moderador', 'Encargado de coordinar las intervenciones y mantener el orden del evento.'),
    ('ETR004', 'Organizador', 'Miembro del staff encargado de la logística y coordinación del evento.'),
    ('ETR005', 'VIP', 'Invitado especial con beneficios adicionales durante el evento.'),
    ('ETR006', 'Panelista', 'Persona que forma parte de una mesa de discusión o panel temático.'),
    ('ETR007', 'Facilitador', 'Guía en talleres prácticos o dinámicas grupales.'),
    ('ETR008', 'Patrocinador', 'Representante de una organización que apoya el evento.'),
    ('ETR009', 'Voluntario', 'Colaborador que apoya en actividades de soporte y asistencia.'),
    ('ETR010', 'Invitado Especial', 'Persona destacada en el campo de la salud mental invitada al evento.');

