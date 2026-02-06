
INSERT INTO PlanificacionActividades (actividad_id, fecha, hora_inicio, hora_fin, instalacion_id) VALUES
(1, '2023-10-01', '10:00:00', '20:00:00', 1),
(1, '2023-11-08', '18:00:00', '20:00:00', 1),
(2, '2023-11-15', '10:00:00', '19:00:00', 2),
(1, '2023-11-15', '10:00:00', '19:00:00', 1);

-- Configuración básica
INSERT INTO Configuracion (clave, valor, descripcion) VALUES
('antelacion_reserva', '15', 'Días máximos de antelación para reservar'),
('max_horas_dia', '4', 'Límite de horas diarias de reserva por socio'),
('max_horas_mes', '10', 'Límite de horas mensuales de reserva por socio'),
('dia_cierre', '25', 'Día del mes para generar recibos'),
('antelacion_cancelar_reserva', '24', 'Horas minimas para cancelar una reserva'),
('max_morosos', '2', 'Máximo de recibos impagos permitidos');

-- Socios de ejemplo
INSERT INTO Socios (nombre, email, contrasena, fecha_registro, moroso, telefono) VALUES
('Juan Pérez', 'juan@email.com', 'clave123', '2023-01-15', 0, '600111222'),
('María García', 'maria@email.com', 'clave456', '2023-02-20', 1, '600333444'),
('Pedro López', 'pedro@email.com', 'clave789', '2023-03-10', 0, '600555666'),
('Saul You', 'sulo@email.com', 'clave789', '2023-03-10', 0, '600555667');

-- Instalaciones
INSERT INTO Instalaciones (nombre, tipo, capacidad, en_cuarentena) VALUES
('Piscina Principal', 'piscina', 6, 0),
('Pista Tenis 1', 'tenis', 4, 0),
('Cancha Multiusos', 'multideportiva', 20, 1),
('Gimnasio', 'otro', 30, 0);

-- Horarios instalaciones
INSERT INTO InstalacionHorarios (instalacion_id, tipo_horario, hora_apertura, hora_cierre) VALUES
(1, 'verano', '08:00:00', '20:00:00'),
(1, 'invierno', '09:00:00', '19:00:00'),
(2, 'verano', '07:00:00', '22:00:00');

-- Reservas de ejemplo
INSERT INTO Reservas (socio_id, instalacion_id, fecha_hora_inicio, duracion, costo, pagado, estado) VALUES


(1, 2, '2023-10-15 10:00:00', 2, 15.00, 0, 'activa'),
(1, 1, '2023-10-20 16:00:00', 1, 10.00, 0, 'activa'),
(1, 1, '2023-11-15 16:00:00', 1, 10.00, 1, 'completada'),

(3, 2, '2023-10-18 11:00:00', 4, 12.50, 1, 'activa'),
(1, 2, '2023-10-22 09:00:00', 3, 22.50, 0, 'activa'),
(2, 2, '2025-03-06 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-03-07 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-05-20 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-06-24 09:00:00', 3, 22.50, 0, 'activa'),
(2, 2, '2025-07-06 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-08-07 09:00:00', 3, 22.50, 0, 'activa'),
(2, 2, '2024-03-16 12:00:00', 3, 22.50, 0, 'activa'),
(2, 3, '2024-03-07 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2024-03-07 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2023-10-22 09:00:00', 3, 22.50, 0, 'activa'),
(2, 2, '2025-03-06 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-03-07 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-04-21 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-04-20 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-09-15 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-10-07 09:00:00', 3, 22.50, 0, 'activa'),
(2, 2, '2025-12-06 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-11-09 10:00:00', 3, 22.50, 0, 'activa'),
(2, 2, '2025-12-08 09:00:00', 3, 22.50, 0, 'activa'),
(2, 3, '2025-11-07 09:00:00', 3, 22.50, 0, 'activa'),
(1, 2, '2025-10-07 12:00:00', 3, 22.50, 0, 'activa');





-- Actividades
INSERT INTO Actividades (nombre, descripcion, instalacion_id, aforo, costo_socio, costo_no_socio, fecha_inicio, fecha_fin) VALUES
('Clase Natación', 'Clases para adultos', 1, 15, 30.00, 50.00, '2023-11-01', '2023-11-30'),
('Torneo Tenis', 'Torneo mensual', 2, 16, 20.00, 35.00, '2023-11-05', '2023-11-05'),
('Clase Natacion 2025', 'Clases para adultos', 1, 20, 15.00, 25.00, '2025-03-06', '2025-08-01');

-- Periodos de inscripción
INSERT INTO ActividadInscripcionPeriodos (actividad_id,  nombre, descripcion, tipo, fecha_inicio, fecha_fin) VALUES
(1,'Primer periodo','primera inscripcion primer periodo', 'socio', '2023-10-01', '2023-10-15'),
(1,'Segunda periodo','segunda inscripcion primer periodo',  'no_socio', '2025-03-01', '2025-03-29'),
(2, 'segundo periodo','primera inscripcion segundo periodo', 'socio', '2023-10-10', '2023-10-20');

-- Sesiones de actividades
INSERT INTO ActividadSesiones (actividad_id, fecha, hora_inicio, hora_fin, instalacion_id) VALUES
(1, '2023-11-01', '18:00:00', '20:00:00', 1),
(1, '2023-11-08', '18:00:00', '20:00:00', 1),
(2, '2023-11-05', '10:00:00', '14:00:00', 2),
(1, '2025-03-06', '10:00:00', '14:00:00', 1);

-- Inscripciones a actividades
INSERT INTO Inscripciones (actividad_id, socio_id, no_socio_nombre, fecha_inscripcion, estado, pagado, tipo) VALUES
(1, 1, NULL, '2023-10-02 10:00:00', 'admitido', 1, 'socio'),
(3, 1, NULL, '2025-10-01 10:00:00', 'admitido', 1, 'socio'),
(1, NULL, 'Ana Ruiz', '2023-10-17 11:30:00', 'lista_espera', 0, 'no_socio'),
(3, 3, NULL, '2023-10-12 09:15:00', 'admitido', 0, 'socio'),
(1, 2, NULL, '2025-03-02 10:00:00', 'admitido', 1, 'socio'),
(2, 2, NULL, '2025-05-02 10:00:00', 'admitido', 1, 'socio'),
(3, 2, NULL, '2025-06-02 10:00:00', 'admitido', 1, 'socio');

-- Recibos
INSERT INTO Recibos (socio_id, mes, anho, total, pagado, fecha_emision, fecha_vencimiento) VALUES
(1, 10, 2023, 75.50, 0, '2023-10-25', '2023-11-05'),
(2, 10, 2023, 120.00, 0, '2023-10-25', '2023-11-05'),
(3, 10, 2023, 45.00, 1, '2023-10-25', '2023-11-05');

-- Pagos
INSERT INTO Pagos (monto, fecha_pago, metodo, recibo_id, reserva_id, inscripcion_id) VALUES
(30.00, '2023-10-05', 'tarjeta', NULL, NULL, 1),
(10, '2023-10-25', 'tarjeta', NULL, 3, NULL),
(12.50, '2023-10-25', 'recibo', 3, 4, NULL),
(15.00, '2025-10-02', 'tarjeta', NULL, NULL, 2),
(30.00, '2025-03-03', 'tarjeta', NULL, NULL, 5),
(20.00, '2025-05-03', 'tarjeta', NULL, NULL, 6),
(20.00, '2025-06-03', 'tarjeta', NULL, NULL, 7);

-- Créditos
INSERT INTO Creditos (socio_id, monto, fecha_generacion, fecha_aplicacion, descripcion) VALUES
(1, 22.50, '2023-10-23', NULL, 'Cancelación reserva 4');

