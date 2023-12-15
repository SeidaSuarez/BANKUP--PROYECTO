DROP DATABASE IF EXISTS bankup;

CREATE DATABASE bankup;

USE bankup;

CREATE TABLE Usuario (
    ID INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
    pass VARCHAR(64) NOT NULL,
    DNI VARCHAR(9) UNIQUE NOT NULL,
    nombre VARCHAR(32) NOT NULL,
    apellido_uno VARCHAR (32) NOT NULL,
    apellido_dos VARCHAR(32) NOT NULL,
    fech_naci DATE NOT NULL,
    email VARCHAR(32) UNIQUE NOT NULL,
    ROL ENUM('Admin', 'Cliente') NOT NULL
);

CREATE TABLE Direccion (
    ID INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
    Direccion VARCHAR(32) NOT NULL,
    CodPostal INT(5) NOT NULL,
    Ciudad VARCHAR(16) NOT NULL,
    Provincia VARCHAR(16) NOT NULL,
    Pais VARCHAR(16) NOT NULL,
    UsuarioID INT,
    FOREIGN KEY (UsuarioID)
        REFERENCES Usuario (ID)
);

CREATE TABLE Cuenta (
    ID INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
    iban VARCHAR(20) UNIQUE NOT NULL,
    saldo DECIMAL(10 , 2 ) NOT NULL,
    fecha_aper DATE NOT NULL,
    ID_usuario_FK INT,
    FOREIGN KEY (ID_usuario_FK)
        REFERENCES USUARIO (ID)
);

CREATE TABLE Prestamo (
    ID INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
    motivo VARCHAR(32) NOT NULL,
    cant_pres DECIMAL(10,2) NOT NULL,
    interes DECIMAL(10,2) NOT NULL,
    fech_concedido DATE NOT NULL,
    mensualidad INT NOT NULL,
    ID_usuario_FK INT,
    ID_cuenta_FK INT,
    FOREIGN KEY (ID_usuario_FK)
        REFERENCES Usuario (ID),
    FOREIGN KEY (ID_cuenta_FK)
        REFERENCES Cuenta (ID)
);

CREATE TABLE Transac (
    ID INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
    ROL ENUM('INGRESO', 'COBRO', 'MENSUALIDAD') NOT NULL,
    cant_transac DECIMAL(10,2) NOT NULL,
    fecha_ing DATE NOT NULL,
    ID_cliente_RECEP_FK INT,
    ID_cliente_EMIS_FK INT,
    FOREIGN KEY (ID_cliente_RECEP_FK)
        REFERENCES Usuario (ID),
    FOREIGN KEY (ID_cliente_EMIS_FK)
        REFERENCES Usuario (ID)
);

CREATE TABLE Chat (
    ID INT UNSIGNED UNIQUE AUTO_INCREMENT NOT NULL,
    msg TEXT NOT NULL,
    fecha_hora DATE NOT NULL,
    fecha_hora_mensaje DATE NOT NULL,
    ID_usuario1 INT,
    ID_usuario2 INT,
    PRIMARY KEY (ID , ID_usuario1 , ID_usuario2),
    FOREIGN KEY (ID_usuario1)
        REFERENCES Usuario (ID),
    FOREIGN KEY (ID_usuario2)
        REFERENCES Usuario (ID)
); 





