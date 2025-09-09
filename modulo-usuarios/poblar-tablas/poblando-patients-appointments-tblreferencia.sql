-- Poblando pacientes

INSERT INTO patients (patient_id, user_id, date_of_birth, gender, address)
VALUES
('PAT001', 'USR002', '1990-03-15', 'Femenino', 'Calle 10 #45-32, Bogotá'),
('PAT002', 'USR004', '1985-07-22', 'Masculino', 'Carrera 7 #120-15, Medellín'),
('PAT003', 'USR006', '1998-11-05', 'Femenino', 'Av. 30 de Agosto #25-60, Pereira'),
('PAT004', 'USR008', '1992-02-14', 'Masculino', 'Calle 5 #14-20, Cali'),
('PAT005', 'USR010', '2000-06-01', 'Femenino', 'Cra 45 #18-23, Bucaramanga'),
('PAT006', 'USR012', '1994-09-18', 'Masculino', 'Calle 80 #50-12, Barranquilla'),
('PAT007', 'USR014', '1988-12-30', 'Femenino', 'Carrera 15 #34-10, Cartagena'),
('PAT008', 'USR016', '1991-04-25', 'Masculino', 'Calle 9 #45-25, Manizales'),
('PAT009', 'USR018', '1999-10-09', 'Femenino', 'Av. Santander #67-12, Armenia'),
('PAT010', 'USR020', '1983-01-20', 'Masculino', 'Carrera 11 #22-08, Cúcuta'),
('PAT011', 'USR022', '1995-08-05', 'Femenino', 'Calle 13 #45-22, Ibagué'),
('PAT012', 'USR024', '1989-11-11', 'Masculino', 'Cra 23 #54-17, Santa Marta'),
('PAT013', 'USR026', '1997-07-19', 'Femenino', 'Av. Boyacá #102-30, Bogotá'),
('PAT014', 'USR028', '1993-05-03', 'Masculino', 'Calle 32 #45-29, Neiva'),
('PAT015', 'USR030', '2001-09-28', 'Femenino', 'Cra 7 #12-40, Pasto'),
('PAT016', 'USR032', '1987-02-09', 'Masculino', 'Calle 44 #21-56, Villavicencio'),
('PAT017', 'USR034', '1996-10-22', 'Femenino', 'Cra 19 #78-14, Montería'),
('PAT018', 'USR036', '1984-06-17', 'Masculino', 'Calle 8 #34-21, Popayán'),
('PAT019', 'USR038', '1992-12-05', 'Femenino', 'Av. Caracas #15-89, Bogotá'),
('PAT020', 'USR040', '1990-04-27', 'Masculino', 'Cra 11 #33-19, Tunja');


-- Se creó la tabla de session_types como tabla de referencia para mantener integridad estructural en Appointments

CREATE TABLE session_types (
    session_type_id VARCHAR(10) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    description NVARCHAR(255) NULL,
    created_at DATETIME2 DEFAULT SYSDATETIME(),
    updated_at DATETIME2 DEFAULT SYSDATETIME()
);

INSERT INTO session_types (session_type_id, name, description)
VALUES
('SST001', 'Inicial', 'Primera cita con el paciente, incluye historia clínica y evaluación inicial'),
('SST002', 'Seguimiento', 'Citas posteriores enfocadas en el progreso del paciente y ajustes en el tratamiento'),
('SST003', 'Evaluación', 'Sesiones de diagnóstico o evaluación especializada'),
('SST004', 'Emergencia', 'Atención inmediata en situaciones críticas');

ALTER TABLE appointments
DROP COLUMN session_type;

ALTER TABLE appointments
ADD session_type_id VARCHAR(10) NOT NULL
    CONSTRAINT FK_Appointments_SessionType
    FOREIGN KEY (session_type_id) REFERENCES session_types(session_type_id);

 -- Poblando Appointments con session_type_id como FK
INSERT INTO appointments (appt_id, patient_id, professional_id, appt_at, modality_id, session_type_id, location, created_at, updated_at)
VALUES
('APT001', 'PAT001', 'PRF001', '2025-09-15 10:00:00', 'MTD002', 'SST001', 'Consultorio 101 - Bogotá', SYSDATETIME(), SYSDATETIME()),
('APT002', 'PAT002', 'PRF002', '2025-09-16 14:00:00', 'MTD001', 'SST001', 'Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT003', 'PAT003', 'PRF003', '2025-09-17 09:00:00', 'MTD002', 'SST001', 'Consultorio 202 - Medellín', SYSDATETIME(), SYSDATETIME()),
('APT004', 'PAT004', 'PRF004', '2025-09-18 11:30:00', 'MTD002', 'SST001', 'Consultorio 305 - Cali / Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT005', 'PAT005', 'PRF005', '2025-09-19 16:00:00', 'MTD002', 'SST001', 'Consultorio 410 - Bucaramanga', SYSDATETIME(), SYSDATETIME()),
('APT006', 'PAT006', 'PRF006', '2025-09-20 08:30:00', 'MTD001', 'SST001', 'Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT007', 'PAT007', 'PRF007', '2025-09-20 15:00:00', 'MTD002', 'SST001', 'Consultorio 510 - Cartagena', SYSDATETIME(), SYSDATETIME()),
('APT008', 'PAT008', 'PRF008', '2025-09-21 09:30:00', 'MTD002', 'SST001', 'Consultorio 214 - Manizales / Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT009', 'PAT009', 'PRF009', '2025-09-22 13:00:00', 'MTD002', 'SST001', 'Consultorio 112 - Armenia', SYSDATETIME(), SYSDATETIME()),
('APT010', 'PAT010', 'PRF010', '2025-09-23 10:00:00', 'MTD001', 'SST001', 'Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT011', 'PAT011', 'PRF011', '2025-09-24 17:00:00', 'MTD002', 'SST001', 'Consultorio 320 - Ibagué', SYSDATETIME(), SYSDATETIME()),
('APT012', 'PAT012', 'PRF012', '2025-09-25 08:00:00', 'MTD002', 'SST001', 'Consultorio 405 - Santa Marta / Google Meet', SYSDATETIME(), SYSDATETIME()),

('APT013', 'PAT013', 'PRF001', '2025-09-26 09:00:00', 'MTD001', 'SST002', 'Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT014', 'PAT014', 'PRF002', '2025-09-27 15:30:00', 'MTD002', 'SST002', 'Consultorio 510 - Neiva', SYSDATETIME(), SYSDATETIME()),
('APT015', 'PAT015', 'PRF003', '2025-09-28 10:30:00', 'MTD002', 'SST001', 'Consultorio 210 - Pasto / Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT016', 'PAT016', 'PRF004', '2025-09-29 14:00:00', 'MTD002', 'SST001', 'Consultorio 118 - Villavicencio', SYSDATETIME(), SYSDATETIME()),
('APT017', 'PAT017', 'PRF005', '2025-09-30 09:00:00', 'MTD001', 'SST001', 'Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT018', 'PAT018', 'PRF006', '2025-10-01 11:00:00', 'MTD002', 'SST001', 'Consultorio 215 - Popayán', SYSDATETIME(), SYSDATETIME()),
('APT019', 'PAT019', 'PRF007', '2025-10-02 16:00:00', 'MTD002', 'SST001', 'Consultorio 320 - Bogotá / Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT020', 'PAT020', 'PRF008', '2025-10-03 08:00:00', 'MTD001', 'SST001', 'Google Meet', SYSDATETIME(), SYSDATETIME()),

('APT021', 'PAT001', 'PRF009', '2025-10-05 09:00:00', 'MTD002', 'SST002', 'Consultorio 102 - Bogotá', SYSDATETIME(), SYSDATETIME()),
('APT022', 'PAT002', 'PRF010', '2025-10-06 10:30:00', 'MTD001', 'SST002', 'Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT023', 'PAT003', 'PRF011', '2025-10-07 14:00:00', 'MTD002', 'SST002', 'Consultorio 315 - Medellín', SYSDATETIME(), SYSDATETIME()),
('APT024', 'PAT004', 'PRF012', '2025-10-08 16:30:00', 'MTD002', 'SST002', 'Consultorio 420 - Cali / Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT025', 'PAT005', 'PRF001', '2025-10-10 08:30:00', 'MTD001', 'SST002', 'Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT026', 'PAT006', 'PRF002', '2025-10-11 11:00:00', 'MTD002', 'SST002', 'Consultorio 230 - Barranquilla', SYSDATETIME(), SYSDATETIME()),
('APT027', 'PAT007', 'PRF003', '2025-10-12 15:00:00', 'MTD002', 'SST002', 'Consultorio 530 - Cartagena / Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT028', 'PAT008', 'PRF004', '2025-10-13 09:30:00', 'MTD002', 'SST002', 'Consultorio 240 - Manizales', SYSDATETIME(), SYSDATETIME()),
('APT029', 'PAT009', 'PRF005', '2025-10-14 13:00:00', 'MTD001', 'SST002', 'Google Meet', SYSDATETIME(), SYSDATETIME()),
('APT030', 'PAT010', 'PRF006', '2025-10-15 10:00:00', 'MTD002', 'SST002', 'Consultorio 330 - Cúcuta', SYSDATETIME(), SYSDATETIME());
