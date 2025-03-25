CREATE TABLE Direccion (
    idDireccion SERIAL PRIMARY KEY,
    direccion TEXT NOT NULL,
    departamento VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

CREATE TABLE Cliente (
    idCliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    direccion_id INT REFERENCES Direccion(idDireccion),
    telefono VARCHAR(20),
    email VARCHAR(100),
    nit VARCHAR(20)
);

CREATE TYPE PAQUETE AS ENUM ('Paquete', 'Sobres', 'Caja', 'Otros');
CREATE TYPE PAGO AS ENUM ('Tarjeta', 'Efectivo', 'Transferencia', 'Otros');

CREATE TABLE Pedido (
    idPedido SERIAL PRIMARY KEY,
    idRemitente INT REFERENCES Cliente(idCliente),
    idDestinatario INT REFERENCES Cliente(idCliente),
    tipo_paquete PAQUETE NOT NULL,
    piezas INT NOT NULL,
    recoge_oficina BOOLEAN NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    tipo_pago PAGO NOT NULL,
    codigo INT NOT NULL
);

CREATE TABLE Pedido_Temporal (
    idPedido SERIAL PRIMARY KEY,
    idRemitente INT REFERENCES Cliente(idCliente),
    idDestinatario INT REFERENCES Cliente(idCliente),
    tipo_paquete PAQUETE NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    ipo_pago PAGO NOT NULL,
    codigo INT NOT NULL
);

CREATE TABLE Operadora (
    idOperadora SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    tipo VARCHAR(50)
);

CREATE TABLE token (
    idToken SERIAL PRIMARY KEY,
    token INT NOT NULL,
    usuario_solicitante INT REFERENCES Operadora(idOperadora),
    tarifa FLOAT NOT NULL,
    descripcion TEXT
);

CREATE TABLE Sucursal (
    idSucursal SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(20),
    zona VARCHAR(50),
    municipio VARCHAR(100),
    departamento VARCHAR(100),
    pais VARCHAR(100)
);

CREATE TABLE Ruta (
    idRuta SERIAL PRIMARY KEY,
    token_id INT REFERENCES token(idToken),
    idSucursal INT REFERENCES Sucursal(idSucursal),
    zona VARCHAR(50),
    municipio VARCHAR(100),
    departamento VARCHAR(100),
    pais VARCHAR(100)
);

CREATE TABLE Asignacion_ruta (
    idAsignacion SERIAL PRIMARY KEY,
    idRuta INT REFERENCES Ruta(idRuta),
    idPedido INT REFERENCES Pedido(idPedido)
);

CREATE TABLE Rendimiento (
    idRendimiento SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    idOperadora INT REFERENCES Operadora(idOperadora)
);
