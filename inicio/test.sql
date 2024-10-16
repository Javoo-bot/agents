-- Crear una base de datos llamada 'mydatabase'
CREATE DATABASE mydatabase;
-- Conectar a la base de datos 'mydatabase'
\ c mydatabase;
-- Crear una tabla de ejemplo 'users'
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Crear una tabla de ejemplo 'products'
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Insertar datos de ejemplo en la tabla 'users'
INSERT INTO users (username, email, password)
VALUES ('user1', 'user1@example.com', 'password123'),
    ('user2', 'user2@example.com', 'password123');
-- Insertar datos de ejemplo en la tabla 'products'
INSERT INTO products (name, description, price)
VALUES ('Product 1', 'Description for product 1', 19.99),
    ('Product 2', 'Description for product 2', 29.99);
-- Consultar los datos de la tabla 'users'
SELECT *
FROM users;
-- Consultar los datos de la tabla 'products'
SELECT *
FROM products;