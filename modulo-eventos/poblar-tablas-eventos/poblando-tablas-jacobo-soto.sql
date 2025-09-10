INSERT INTO events (event_id, title, event_type, description, start_at, end_at, modality_id, creator_id, created_at)
VALUES
('EVT006', 'Taller de Mindfulness', 'ETT004', 'Aprender técnicas de atención plena para reducir el estrés.', 
 '2025-10-10 08:00:00', '2025-10-10 10:00:00', 'MTD002', 'USR008', SYSDATETIME()),

('EVT007', 'Foro de Salud Mental en el Trabajo', 'ETT003', 'Espacio con expertos sobre la importancia de la salud emocional en entornos laborales.', 
 '2025-10-15 14:00:00', '2025-10-15 17:00:00', 'MTD001', 'USR012', SYSDATETIME()),

('EVT008', 'Jornada de Resiliencia Personal', 'ETT007', 'Actividades prácticas para fortalecer la resiliencia frente a los retos de la vida.', 
 '2025-10-20 09:00:00', '2025-10-20 13:00:00', 'MTD002', 'USR018', SYSDATETIME()),

('EVT009', 'Clase Abierta de Yoga para la Ansiedad', 'ETT006', 'Sesión grupal para conectar cuerpo y mente a través del yoga.', 
 '2025-10-25 07:30:00', '2025-10-25 09:00:00', 'MTD002', 'USR022', SYSDATETIME()),

('EVT010', 'Conversatorio sobre Autocuidado Digital', 'ETT009', 'Reflexión sobre el uso saludable de la tecnología y redes sociales.', 
 '2025-11-01 16:00:00', '2025-11-01 18:00:00', 'MTD001', 'USR025', SYSDATETIME());

INSERT INTO events (event_id, title, event_type, description, start_at, end_at, modality_id, creator_id, created_at)
VALUES
('EVT011', 'Taller de Inteligencia Emocional', 'ETT002', 'Ejercicios para reconocer, comprender y gestionar emociones.', 
 '2025-11-10 10:00:00', '2025-11-10 12:00:00', 'MTD001', 'USR030', SYSDATETIME()),

('EVT012', 'Círculo de Conversación: Duelo y Pérdida', 'ETT004', 'Espacio seguro para compartir y trabajar procesos de duelo.', 
 '2025-11-15 15:00:00', '2025-11-15 17:00:00', 'MTD002', 'USR034', SYSDATETIME()),

('EVT013', 'Conferencia sobre Neurociencia y Bienestar', 'ETT003', 'Impacto de la neurociencia en hábitos saludables.', 
 '2025-11-20 09:00:00', '2025-11-20 11:00:00', 'MTD001', 'USR037', SYSDATETIME()),

('EVT014', 'Jornada de Salud Mental Comunitaria', 'ETT007', 'Actividades colectivas para sensibilizar sobre la importancia de la salud mental.', 
 '2025-12-05 08:30:00', '2025-12-05 12:30:00', 'MTD002', 'USR041', SYSDATETIME()),

('EVT015', 'Clase Especial de Meditación de Fin de Año', 'ETT006', 'Cierre del año con técnicas de meditación y relajación guiada.', 
 '2025-12-20 18:00:00', '2025-12-20 19:30:00', 'MTD002', 'USR045', SYSDATETIME());




INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT105', 'EVT006', 'USR041', 'ETR004', SYSDATETIME()),
('EAT106', 'EVT006', 'USR042', 'ETR003', SYSDATETIME()),
('EAT107', 'EVT006', 'USR043', 'ETR001', SYSDATETIME()),
('EAT108', 'EVT006', 'USR044', 'ETR002', SYSDATETIME()),
('EAT109', 'EVT006', 'USR045', 'ETR002', SYSDATETIME()),
('EAT110', 'EVT006', 'USR046', 'ETR002', SYSDATETIME());

INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT111', 'EVT007', 'USR047', 'ETR004', SYSDATETIME()),
('EAT112', 'EVT007', 'USR048', 'ETR003', SYSDATETIME()),
('EAT113', 'EVT007', 'USR049', 'ETR001', SYSDATETIME()),
('EAT114', 'EVT007', 'USR050', 'ETR002', SYSDATETIME()),
('EAT115', 'EVT007', 'USR051', 'ETR002', SYSDATETIME()),
('EAT116', 'EVT007', 'USR052', 'ETR002', SYSDATETIME());

INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT117', 'EVT008', 'USR053', 'ETR004', SYSDATETIME()),
('EAT118', 'EVT008', 'USR054', 'ETR003', SYSDATETIME()),
('EAT119', 'EVT008', 'USR055', 'ETR001', SYSDATETIME()),
('EAT120', 'EVT008', 'USR056', 'ETR002', SYSDATETIME()),
('EAT121', 'EVT008', 'USR057', 'ETR002', SYSDATETIME()),
('EAT122', 'EVT008', 'USR058', 'ETR002', SYSDATETIME());

INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT123', 'EVT009', 'USR059', 'ETR004', SYSDATETIME()),
('EAT124', 'EVT009', 'USR060', 'ETR003', SYSDATETIME()),
('EAT125', 'EVT009', 'USR061', 'ETR001', SYSDATETIME()),
('EAT126', 'EVT009', 'USR062', 'ETR002', SYSDATETIME()),
('EAT127', 'EVT009', 'USR063', 'ETR002', SYSDATETIME()),
('EAT128', 'EVT009', 'USR064', 'ETR002', SYSDATETIME());

INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT129', 'EVT010', 'USR065', 'ETR004', SYSDATETIME()),
('EAT130', 'EVT010', 'USR066', 'ETR003', SYSDATETIME()),
('EAT131', 'EVT010', 'USR067', 'ETR001', SYSDATETIME()),
('EAT132', 'EVT010', 'USR068', 'ETR002', SYSDATETIME()),
('EAT133', 'EVT010', 'USR069', 'ETR002', SYSDATETIME()),
('EAT134', 'EVT010', 'USR070', 'ETR002', SYSDATETIME());

INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT135', 'EVT011', 'USR071', 'ETR004', SYSDATETIME()),
('EAT136', 'EVT011', 'USR072', 'ETR003', SYSDATETIME()),
('EAT137', 'EVT011', 'USR073', 'ETR001', SYSDATETIME()),
('EAT138', 'EVT011', 'USR074', 'ETR002', SYSDATETIME()),
('EAT139', 'EVT011', 'USR075', 'ETR002', SYSDATETIME()),
('EAT140', 'EVT011', 'USR076', 'ETR002', SYSDATETIME());

-- ===========================
INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT141', 'EVT012', 'USR077', 'ETR004', SYSDATETIME()),
('EAT142', 'EVT012', 'USR078', 'ETR003', SYSDATETIME()),
('EAT143', 'EVT012', 'USR079', 'ETR001', SYSDATETIME()),
('EAT144', 'EVT012', 'USR080', 'ETR002', SYSDATETIME()),
('EAT145', 'EVT012', 'USR081', 'ETR002', SYSDATETIME()),
('EAT146', 'EVT012', 'USR082', 'ETR002', SYSDATETIME());

INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT147', 'EVT013', 'USR083', 'ETR004', SYSDATETIME()),
('EAT148', 'EVT013', 'USR084', 'ETR003', SYSDATETIME()),
('EAT149', 'EVT013', 'USR085', 'ETR001', SYSDATETIME()),
('EAT150', 'EVT013', 'USR086', 'ETR002', SYSDATETIME()),
('EAT151', 'EVT013', 'USR087', 'ETR002', SYSDATETIME()),
('EAT152', 'EVT013', 'USR088', 'ETR002', SYSDATETIME());

INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT153', 'EVT014', 'USR089', 'ETR004', SYSDATETIME()),
('EAT154', 'EVT014', 'USR090', 'ETR003', SYSDATETIME()),
('EAT155', 'EVT014', 'USR091', 'ETR001', SYSDATETIME()),
('EAT156', 'EVT014', 'USR092', 'ETR002', SYSDATETIME()),
('EAT157', 'EVT014', 'USR093', 'ETR002', SYSDATETIME()),
('EAT158', 'EVT014', 'USR094', 'ETR002', SYSDATETIME());

INSERT INTO event_attendees (attendee_id, event_id, user_id, attendeer_role, registered_at) VALUES
('EAT159', 'EVT015', 'USR095', 'ETR004', SYSDATETIME()),
('EAT160', 'EVT015', 'USR096', 'ETR003', SYSDATETIME()),
('EAT161', 'EVT015', 'USR097', 'ETR001', SYSDATETIME()),
('EAT162', 'EVT015', 'USR098', 'ETR002', SYSDATETIME()),
('EAT163', 'EVT015', 'USR099', 'ETR002', SYSDATETIME()),
('EAT164', 'EVT015', 'USR100', 'ETR002', SYSDATETIME());