-- Insertar datos en la tabla Direccion
INSERT INTO Direccion (direccion, departamento, pais) VALUES
('Calle 10 #25-30', 'Ciudad de Guatemala', 'Guatemala'),
('Avenida Central 15', 'San Salvador', 'El Salvador'),
('Barrio Laureles 200', 'Managua', 'Nicaragua'),
('Colonia Las Mercedes', 'Tegucigalpa', 'Honduras'),
('Zona 4, 6ta Avenida', 'Ciudad de Guatemala', 'Guatemala');

-- Insertar datos en la tabla Cliente
INSERT INTO Cliente (nombre, apellido, direccion_id, telefono, email, nit) VALUES
('Juan', 'Pérez', 1, '+502 5555-1234', 'juan.perez@email.com', '1234567-8'),
('María', 'González', 2, '+503 7777-9876', 'maria.gonzalez@email.com', '9876543-2'),
('Carlos', 'Rodríguez', 3, '+505 8888-4321', 'carlos.rodriguez@email.com', '5432109-6'),
('Ana', 'Martínez', 4, '+504 9999-6543', 'ana.martinez@email.com', '6543210-1'),
('Luis', 'Hernández', 5, '+502 4444-7890', 'luis.hernandez@email.com', '7890123-4');

-- Insertar datos en la tabla Operadora
INSERT INTO Operadora (nombre, telefono, email, tipo) VALUES
('TransExpress', '+502 2222-3333', 'contacto@transexpress.com', 'Logística'),
('EnvíoRápido', '+503 4444-5555', 'info@enviorapido.com', 'Mensajería'),
('CargoNorte', '+505 6666-7777', 'servicio@cargonorte.com', 'Transporte');

-- Insertar datos en la tabla token
INSERT INTO token (token, usuario_solicitante, tarifa, descripcion) VALUES
(1001, 1, 50.75, 'Ruta Guatemala-El Salvador'),
(1002, 2, 45.50, 'Ruta El Salvador-Nicaragua'),
(1003, 3, 55.25, 'Ruta Nicaragua-Honduras');

-- Insertar datos en la tabla Sucursal
INSERT INTO Sucursal (nombre, direccion, telefono, zona, municipio, departamento, pais) VALUES
('Sucursal Guatemala Central', '5ta Avenida zona 1', '+502 2200-1100', 'Zona 1', 'Ciudad de Guatemala', 'Guatemala', 'Guatemala'),
('Sucursal San Salvador', 'Colón con Alameda', '+503 2233-4455', 'Centro', 'San Salvador', 'San Salvador', 'El Salvador'),
('Sucursal Managua Norte', 'Carretera Norte', '+505 2277-8899', 'Norte', 'Managua', 'Managua', 'Nicaragua');

-- Insertar datos en la tabla Ruta
INSERT INTO Ruta (token_id, idSucursal, zona, municipio, departamento, pais) VALUES
(1, 1, 'Zona 1', 'Ciudad de Guatemala', 'Guatemala', 'Guatemala'),
(2, 2, 'Centro', 'San Salvador', 'San Salvador', 'El Salvador'),
(3, 3, 'Norte', 'Managua', 'Managua', 'Nicaragua');

-- Insertar datos en la tabla Servicio
INSERT INTO Servicio (idRemitente, idDestinatario, tipo_paquete, piezas, recoge_oficina, fecha, hora, ipo_pago, codigo) VALUES
(1, 2, 'Caja', 2, true, '2024-03-24', '10:30:00', 'Tarjeta', 5001),
(2, 3, 'Sobres', 1, false, '2024-03-25', '14:45:00', 'Efectivo', 5002),
(3, 4, 'Paquete', 3, true, '2024-03-26', '09:15:00', 'Transferencia', 5003),
(4, 5, 'Otros', 1, false, '2024-03-27', '16:20:00', 'Otros', 5004);

-- Insertar datos en la tabla Servicio_Temporal
INSERT INTO Servicio_Temporal (idRemitente, idDestinatario, tipo_paquete, fecha, hora, ipo_pago, codigo) VALUES
(1, 2, 'Sobres', '2024-03-28', '11:00:00', 'Tarjeta', 6001),
(2, 3, 'Caja', '2024-03-29', '15:30:00', 'Efectivo', 6002);

-- Insertar datos en la tabla Asignacion_ruta
INSERT INTO Asignacion_ruta (idRuta, idServicio) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);

-- Insertar datos en la tabla Rendimiento
INSERT INTO Rendimiento (fecha, idOperadora) VALUES
('2024-03-24', 1),
('2024-03-25', 2),
('2024-03-26', 3);

SELECT * FROM Direccion;
SELECT * FROM Cliente;
SELECT * FROM Operadora;
SELECT * FROM token;
SELECT * FROM Sucursal;
SELECT * FROM Ruta;
SELECT * FROM Servicio;
SELECT * FROM Servicio_Temporal;
SELECT * FROM Asignacion_ruta;
SELECT * FROM Rendimiento;