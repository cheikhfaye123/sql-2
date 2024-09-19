/* Relación tipo 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
);
INSERT INTO usuarios (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28);
-- PASO 2
-- Tu código aquí
CREATE TABLE roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) NOT NULL
);

INSERT INTO roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');

-- PASO 3
-- Tu código aquí
ALTER TABLE usuarios ADD COLUMN id_rol INT;
ALTER TABLE usuarios ADD FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

-- PASO 4
-- Tu código aquí
SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol;

/* Relación tipo 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL
);

INSERT INTO categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Música y Películas');

-- PASO 2
-- Tu código aquí
ALTER TABLE usuarios ADD COLUMN id_categoria INT

-- PASO 3
-- Tu código aquí
UPDATE usuarios SET id_categoria = 1 WHERE id_usuario IN (1, 5, 9, 13, 17);

-- PASO 4
-- Tu código aquí
SELECT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol, c.nombre_categoria
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol
JOIN categorias c ON u.id_categoria = c.id_categoria;
/* Relación tipo N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE usuarios_categorias (
    id_usuario_categoria INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_categoria INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)

-- PASO 2
-- Tu código aquí
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);

-- PASO 3
-- Tu código aquí
SELECT DISTINCT u.id_usuario, u.nombre, u.apellido, u.email, u.edad, r.nombre_rol, c.nombre_categoria
FROM usuarios u
JOIN roles r ON u.id_rol = r.id_rol
JOIN usuarios_categorias uc ON u.id_usuario = uc.id_usuario
JOIN categorias c ON uc.id_categoria = c.id_categoria;