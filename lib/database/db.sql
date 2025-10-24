

CREATE TABLE tbl_Usuario (
    ID_Usuario      VARCHAR(50) PRIMARY KEY,
    Nombre          VARCHAR(100) NOT NULL,
    Correo          VARCHAR(150) UNIQUE NOT NULL
);


CREATE TABLE tbl_Escaneo_Dispositivos (
    ID_Escaneo      VARCHAR(50) PRIMARY KEY,
    Ubicacion       POINT(255),
    ID_Usuario      VARCHAR(50),
    CONSTRAINT fk_usuario_escaneo FOREIGN KEY (ID_Usuario)
        REFERENCES tbl_Usuario (ID_Usuario)
        ON DELETE CASCADE
);

CREATE TABLE tbl_Reporte (
    ID_Reporte      VARCHAR(50) PRIMARY KEY,
    ID_Usuario      VARCHAR(50),
    Ubicacion       POINT(255),
    Fecha           DATE,
    Hora            TIME,
    Comentario      TEXT,
    CONSTRAINT fk_usuario_reporte FOREIGN KEY (ID_Usuario)
        REFERENCES tbl_Usuario (ID_Usuario)
        ON DELETE CASCADE
);

CREATE TABLE tbl_TipsSeguridad (
    ID_Tip          VARCHAR(50) PRIMARY KEY,
    Titulo          VARCHAR(200) NOT NULL,
    Descripcion     TEXT NOT NULL,
    Categoria       VARCHAR(100),
    FechaPublicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Activo          BOOLEAN DEFAULT TRUE
);

INSERT INTO tbl_Usuario (ID_Usuario, Nombre, Correo) VALUES
('U001', 'Juan Pérez', 'juanperez@example.com'),
('U002', 'María Gómez', 'maria.gomez@example.com'),
('U003', 'Carlos Ruiz', 'carlos.ruiz@example.com');

INSERT INTO tbl_Escaneo_Dispositivos (ID_Escaneo, Ubicacion, ID_Usuario) VALUES
('E001', '1,2', 'U001'),
('E002', '1,3', 'U002'),
('E003', '1,4', 'U001');

INSERT INTO tbl_Reporte (ID_Reporte, ID_Usuario, Ubicacion, Fecha, Hora, Comentario) VALUES
('R001', 'U001', '1,2', '2025-10-10', '14:35:00', 'Dispositivo sospechoso detectado en la red interna.'),
('R002', 'U002', '1,3', '2025-10-12', '09:10:00', 'Conexión desconocida en punto de acceso.'),
('R003', 'U003', '1,4', '2025-10-13', '17:20:00', 'Verificación de seguridad completada sin anomalías.');


INSERT INTO tbl_TipsSeguridad (ID_Tip, Titulo, Descripcion, Categoria) VALUES
('T001', 'Usa contraseñas seguras', 'Combina letras, números y símbolos. No reutilices contraseñas.', 'Contraseñas'),
('T002', 'Actualiza tu software', 'Mantén tus programas y sistemas actualizados para evitar vulnerabilidades.', 'Actualizaciones'),
('T003', 'Verifica redes Wi-Fi', 'Evita conectarte a redes públicas sin protección.', 'Conectividad'),
('T004', 'Usa autenticación de dos factores', 'Agrega una capa extra de seguridad a tus cuentas.', 'Autenticación');
