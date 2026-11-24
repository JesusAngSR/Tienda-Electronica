CREATE DATABASE TiendaElectronica;
GO

USE TiendaElectronica;
GO

-- Entidad Usuario
CREATE TABLE Usuario (
    Id_Usuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    Correo VARCHAR(150) NOT NULL UNIQUE
);
GO

-- Entidad Dirección
CREATE TABLE Direccion (
    Codigo_Postal VARCHAR(10) NOT NULL,
    Calle VARCHAR(150) NOT NULL,
    Colonia VARCHAR(100) NOT NULL,
    Id_Usuario INT NOT NULL,
    CONSTRAINT FK_Direccion_Usuario FOREIGN KEY (Id_Usuario) 
        REFERENCES Usuario(Id_Usuario) ON DELETE CASCADE
);
GO

-- Entidad Contraseña
CREATE TABLE Contrasena (
    Contrasena VARCHAR(255) NOT NULL,
    Id_Usuario INT NOT NULL,
    CONSTRAINT FK_Contrasena_Usuario FOREIGN KEY (Id_Usuario) 
        REFERENCES Usuario(Id_Usuario) ON DELETE CASCADE
);
GO

-- Entidad Categoría
CREATE TABLE Categoria (
    Id_Categoria INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL
);
GO

-- Entidad Producto
CREATE TABLE Producto (
    Id_Producto INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Fecha_Registro DATETIME DEFAULT GETDATE(),
    Id_Categoria INT NOT NULL,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (Id_Categoria) 
        REFERENCES Categoria(Id_Categoria)
);
GO

-- Entidad Carrito
CREATE TABLE Carrito (
    Id_Carrito INT IDENTITY(1,1) PRIMARY KEY,
    Vigencia DATETIME NOT NULL,
    Fecha DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10, 2) NOT NULL,
    Id_Usuario INT NOT NULL,
    CONSTRAINT FK_Carrito_Usuario FOREIGN KEY (Id_Usuario) 
        REFERENCES Usuario(Id_Usuario) ON DELETE CASCADE
);
GO

-- Entidad Detalle
CREATE TABLE Detalle (
    Id_Detalle INT IDENTITY(1,1) PRIMARY KEY,
    Id_Carrito INT NOT NULL,
    Id_Producto INT NOT NULL,
    CONSTRAINT FK_Detalle_Carrito FOREIGN KEY (Id_Carrito) 
        REFERENCES Carrito(Id_Carrito) ON DELETE CASCADE,
    CONSTRAINT FK_Detalle_Producto FOREIGN KEY (Id_Producto) 
        REFERENCES Producto(Id_Producto)
);
GO

-- 3. Agregar 3 usuarios
INSERT INTO Usuario (Nombre, Apellidos, Correo) VALUES
('Andrés', 'Gastélum Díaz', 'andres.gastelum@gmail.com'),
('José Carlos', 'Loaiza Osuna', 'carlos.loaiza@gmail.com'),
('José Roberto', 'Neriz Sánchez', 'roberto.neriz@gmail.com');
GO

-- Insertar las contraseñas
INSERT INTO Contrasena (Contrasena, Id_Usuario) VALUES
('Hash_Andres2026', 1),
('Hash_Carlos2026', 2),
('Hash_Roberto2026', 3);
GO
