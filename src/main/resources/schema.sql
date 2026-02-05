drop table IF EXISTS Configuracion;
drop table IF EXISTS Socios;
drop table IF EXISTS Instalaciones;
drop table IF EXISTS InstalacionHorarios;
drop table IF EXISTS Reservas;
drop table IF EXISTS Actividades;
drop table IF EXISTS ActividadInscripcionPeriodos;
drop table IF EXISTS ActividadSesiones;
drop table IF EXISTS Inscripciones;
drop table IF EXISTS Recibos;
drop table IF EXISTS Pagos;
drop table IF EXISTS Creditos;
drop table IF EXISTS PlanificacionActividades;

-- Tabla de configuración (parámetros ajustables)
CREATE TABLE Configuracion (
    config_id INTEGER PRIMARY KEY AUTOINCREMENT,
    clave TEXT UNIQUE NOT NULL,
    valor TEXT NOT NULL,
    descripcion TEXT
);

-- Tabla de socios
CREATE TABLE Socios (
    socio_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    contrasena TEXT NOT NULL,
    fecha_registro DATE NOT NULL,
    moroso BOOLEAN DEFAULT 0,
    telefono TEXT,
    direccion TEXT
);

CREATE TABLE Instalaciones (
    instalacion_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    tipo TEXT NOT NULL CHECK(tipo IN ('piscina', 'tenis', 'multideportiva', 'otro')),
    capacidad INTEGER,
    en_cuarentena BOOLEAN DEFAULT 0,
    detalles TEXT
);

-- Tabla de horarios de instalaciones
CREATE TABLE InstalacionHorarios (
    horario_id INTEGER PRIMARY KEY AUTOINCREMENT,
    instalacion_id INTEGER NOT NULL,
    tipo_horario TEXT NOT NULL CHECK(tipo_horario IN ('verano', 'invierno')),
    hora_apertura TIME NOT NULL,
    hora_cierre TIME NOT NULL,
    FOREIGN KEY (instalacion_id) REFERENCES Instalaciones(instalacion_id)
);

-- Tabla de reservas
CREATE TABLE Reservas (
    reserva_id INTEGER PRIMARY KEY AUTOINCREMENT,
    socio_id INTEGER NOT NULL,
    instalacion_id INTEGER NOT NULL,
    fecha_hora_inicio DATETIME NOT NULL,
    duracion INTEGER NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    pagado BOOLEAN DEFAULT 0,
    estado TEXT DEFAULT 'activa' CHECK(estado IN ('activa', 'cancelada', 'completada', 'reembolsada')),
    motivo_cancelacion TEXT,
    FOREIGN KEY (socio_id) REFERENCES Socios(socio_id),
    FOREIGN KEY (instalacion_id) REFERENCES Instalaciones(instalacion_id)
);


-- Tabla de actividades
CREATE TABLE Actividades (
    actividad_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT,
    instalacion_id INTEGER NOT NULL,
    aforo INTEGER NOT NULL,
    costo_socio DECIMAL(10,2) NOT NULL,
    costo_no_socio DECIMAL(10,2) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (instalacion_id) REFERENCES Instalaciones(instalacion_id)
);

-- Tabla de periodos de inscripción
CREATE TABLE ActividadInscripcionPeriodos (
    periodo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    actividad_id INTEGER NOT NULL,
    nombre INTEGER NOT NULL,
    descripcion INTEGER NOT NULL,
    tipo TEXT NOT NULL CHECK(tipo IN ('socio', 'no_socio')),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (actividad_id) REFERENCES Actividades(actividad_id)
);

-- Tabla de sesiones de actividades
CREATE TABLE ActividadSesiones (
    sesion_id INTEGER PRIMARY KEY AUTOINCREMENT,
    actividad_id INTEGER NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    instalacion_id INTEGER NOT NULL,
    FOREIGN KEY (actividad_id) REFERENCES Actividades(actividad_id),
    FOREIGN KEY (instalacion_id) REFERENCES Instalaciones(instalacion_id)
);
---- Tabla planficacion de actividades
CREATE TABLE PlanificacionActividades (
    planificacion_id INTEGER PRIMARY KEY AUTOINCREMENT,
    actividad_id INTEGER NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    instalacion_id INTEGER NOT NULL,
    FOREIGN KEY (actividad_id) REFERENCES Actividades(actividad_id),
    FOREIGN KEY (instalacion_id) REFERENCES Instalaciones(instalacion_id)
);

-- Tabla de inscripciones a actividades
CREATE TABLE Inscripciones (
    inscripcion_id INTEGER PRIMARY KEY AUTOINCREMENT,
    actividad_id INTEGER NOT NULL,
    socio_id INTEGER, 
    no_socio_nombre TEXT, 
    fecha_inscripcion DATETIME NOT NULL,
    estado TEXT NOT NULL CHECK(estado IN ('admitido', 'lista_espera')),
    pagado BOOLEAN DEFAULT 0,
    tipo TEXT NOT NULL CHECK(tipo IN ('socio', 'no_socio')),
    FOREIGN KEY (actividad_id) REFERENCES Actividades(actividad_id),
    FOREIGN KEY (socio_id) REFERENCES Socios(socio_id)
);

-- Tabla de recibos
CREATE TABLE Recibos (
    recibo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    socio_id INTEGER NOT NULL,
    mes INTEGER NOT NULL,
    anho INTEGER NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    pagado BOOLEAN DEFAULT 0,
    fecha_emision DATE,
    fecha_vencimiento DATE,
    FOREIGN KEY (socio_id) REFERENCES Socios(socio_id)
);

-- Tabla de pagos
CREATE TABLE Pagos (
    pago_id INTEGER PRIMARY KEY AUTOINCREMENT,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo TEXT NOT NULL CHECK(metodo IN ('tarjeta', 'recibo')),
    recibo_id INTEGER,
    reserva_id INTEGER,
    inscripcion_id INTEGER,
    FOREIGN KEY (recibo_id) REFERENCES Recibos(recibo_id),
    FOREIGN KEY (reserva_id) REFERENCES Reservas(reserva_id),
    FOREIGN KEY (inscripcion_id) REFERENCES Inscripciones(inscripcion_id)
);

-- Tabla de créditos por cancelaciones
CREATE TABLE Creditos (
    credito_id INTEGER PRIMARY KEY AUTOINCREMENT,
    socio_id INTEGER,
    no_socio_nombre TEXT,
    monto DECIMAL(10,2) NOT NULL,
    fecha_generacion DATE NOT NULL,
    fecha_aplicacion DATE,
    descripcion TEXT,
    FOREIGN KEY (socio_id) REFERENCES Socios(socio_id)
);


