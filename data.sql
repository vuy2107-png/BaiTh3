CREATE DATABASE shoponline;
USE shoponline;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL,
    quantity INT NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total DOUBLE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Thêm user mẫu
INSERT INTO users (name, email, password) VALUES
('Hành', 'onion@gmail.com', '123456');

-- Thêm sản phẩm mẫu
INSERT INTO products (name, description, price, quantity) VALUES
('Sản phẩm 1', 'Mô tả sản phẩm 1', 100000, 10),
('Sản phẩm 2', 'Mô tả sản phẩm 2', 200000, 15),
('Sản phẩm 3', 'Mô tả sản phẩm 3', 150000, 20),
('Sản phẩm 4', 'Mô tả sản phẩm 4', 250000, 5);


ALTER TABLE users ADD COLUMN role VARCHAR(20) DEFAULT 'user';

UPDATE users SET role = 'admin' WHERE email = 'onion@gmail.com';
