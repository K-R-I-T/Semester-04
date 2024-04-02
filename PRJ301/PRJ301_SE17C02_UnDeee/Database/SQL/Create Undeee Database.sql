Create database undeee;
use undeee;

CREATE TABLE `Categories`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Categories` ADD UNIQUE `categories_name_unique`(`name`);
CREATE TABLE `Orders`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT UNSIGNED NOT NULL,
    `address_id` INT UNSIGNED NOT NULL,
    `total_price` DOUBLE NOT NULL,
    `status` VARCHAR(45) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `Users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email` VARCHAR(45) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `fullname` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(15) NOT NULL,
    `avatar` VARCHAR(255) NULL,
    `role` TINYINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `Products`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `category_id` INT UNSIGNED NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `price` DOUBLE NOT NULL,
    `status` VARCHAR(45) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `Products` ADD UNIQUE `products_name_unique`(`name`);
CREATE TABLE `BestSeller`(
    `product_id` INT UNSIGNED NOT NULL PRIMARY KEY,
    `count` INT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `Addresses`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT UNSIGNED NOT NULL,
    `address_detail` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `Sizes`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` INT UNSIGNED NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    `percent` DOUBLE NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE `OrderDetails`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT UNSIGNED NOT NULL,
    `product_id` INT UNSIGNED NOT NULL,
    `size_id` INT UNSIGNED NOT NULL,
    `quantity` INT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE
    `OrderDetails` ADD CONSTRAINT `orderdetails_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `Orders`(`id`);
ALTER TABLE
    `BestSeller` ADD CONSTRAINT `products_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Products`(`id`);
ALTER TABLE
    `Sizes` ADD CONSTRAINT `sizes_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `Categories`(`id`);
ALTER TABLE
    `Products` ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `Categories`(`id`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY(`address_id`) REFERENCES `Addresses`(`id`);
ALTER TABLE
    `OrderDetails` ADD CONSTRAINT `orderdetails_size_id_foreign` FOREIGN KEY(`size_id`) REFERENCES `Sizes`(`id`);
ALTER TABLE
    `OrderDetails` ADD CONSTRAINT `orderdetails_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Products`(`id`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Addresses` ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`);
    
insert into Users (email, password, fullname, phone, avatar, role) 
values
	('datnhse170330@fpt.edu.vn', '123', 'Nguyễn Hoàng Đạt', '0966548257', 'dat.jpg', 2),
    ('hanntnse171332@fpt.edu.vn', '123', 'Nguyễn Thị Ngọc Hân', '0707315613','han.jpg', 2),
    ('hienntss171243@fpt.edu.vn', '123', 'Nguyễn Thế Hiển', '0373023099','hien.jpg', 2),
    ('phongntse173162@fpt.edu.vn', '123', 'Nguyễn Thượng Phong', '0966548257','phong.jpg', 2),
    ('john@gmail.com', '123', 'John Doe', '1112223333', 'john_avatar.jpg', 1),
	('jane@gmail.com', '123', 'Jane Smith', '4445556666', 'jane_avatar.jpg', 1),
	('bob@gmail.com', '123', 'Bob Johnson', '7778889999', 'bob_avatar.jpg', 1),
	('alice@gmail.com', '123', 'Alice Williams', '3334445555', 'alice_avatar.jpg', 1),
	('charlie@gmail.com', '123', 'Charlie Brown', '6667778888', 'charlie_avatar.jpg', 1),
	('eva@gmail.com', '123', 'Eva Davis', '9990001111', 'eva_avatar.jpg', 1),
	('frank@gmail.com', '123', 'Frank Miller', '5551234567', 'frank_avatar.jpg', 1),
	('grace@gmail.com', '123', 'Grace Wilson', '1234567890', 'grace_avatar.jpg', 1),
	('henry@gmail.com', '123', 'Henry Taylor', '9876543210', 'henry_avatar.jpg', 1),
	('ivy@gmail.com', '123', 'Ivy Lee', '2223334444', 'ivy_avatar.jpg', 1);
    
insert into Addresses (user_id, address_detail)
values
	(5, '127 Phù Cát, Quy Nhơn'),
	(6, '3010 Nguyễn Ái Quốc, Quy Nhơn'),
	(7, '789 Lê Lợi, Quy Nhơn'),
	(8, '101 Trần Hưng Đạo, Quy Nhơn'),
	(9, '202 Trần Phú, Quy Nhơn'),
	(10, '303 Hoàng Diệu, Quy Nhơn'),
	(11, '404 Phạm Văn Đồng, Quy Nhơn'),
	(12, '505 Lê Duẩn, Quy Nhơn'),
	(13, '606 Bùi Thị Xuân, Quy Nhơn'),
	(14, '707 Ngô Mây, Quy Nhơn');
    
insert into Categories (name) 
VALUES
	('Coffee'),
	('Milk Tea'),
	('Iced Cream'),
	('Fruit Tea'),
	('Macchiato Cream Cheese'),
	('Instant Tea');
    
insert into Products (name, category_id, image, price, status)
VALUES
	('Grass Jelly Milk Coffee', 1, 'Grass-Jelly-Milk-Coffee.jpg', 2.99, 'Active'),
	('Cà phê sữa đá', 1, 'ca-phe-sua-da.jpg', 3.99, 'Active'),
	('Cà phê đen đá', 1, 'ca-phe-den-da.jpg', 4.49, 'Active'),
	('Jelly Coffee', 1, 'Jelly-coffee.jpg', 2.49, 'Active'),
	('Trà Sữa Truyền Thống', 2, 'Tra-Sua-Truyen -Thong-copy.jpg', 3.99, 'Active'),
	('Trà Sữa Okinawa', 2, 'tra-sua-okinawa.jpg', 4.49, 'Active'),
	('Kem Trân Châu Hoàng Kim', 3, 'kem-tran-chau-hoang-kim.jpg', 3.49, 'Active'),
	('Kem Dâu Tây', 3, 'kem-dau-tay.jpg', 3.99, 'Active'),
	('Trà Dâu Pha Lê Tuyết', 4, 'Tra-Dau-Tam-Pha-Le-Tuyet-2-copy.jpg', 2.99, 'Active'),
	('Ô Long Mận Chanh Leo', 4, 'O-Long-Man-Chanh-Leo.jpg', 4.99, 'Active');
    
insert into BestSeller (product_id, count)
VALUES
	(1, 120),
	(2, 90),
	(3, 80),
	(4, 150),
	(5, 100),
	(6, 70),
	(7, 110),
	(8, 130),
	(9, 85),
	(10, 95);
    
insert into Sizes (category_id, name, percent)
VALUES
	(1, 'Small', 1),
	(1, 'Medium', 1.25),
	(1, 'Large', 1.5),
	(2, 'Small', 1),
	(2, 'Medium', 1.25),
	(2, 'Large', 1.5),
	(3, 'Small', 1),
	(3, 'Medium', 1.25),
	(3, 'Large', 1.5),
	(4, 'Medium', 1.25),
	(4, 'Large', 1.5),
	(5, 'Medium', 1.25),
	(5, 'Large', 1.5),
	(6, 'Medium', 1.25),
	(6, 'Large', 1.5);
    
insert into Orders (user_id, address_id, total_price, status)
VALUES
	(5, 1, 12.99, 'Pending'),
	(6, 2, 15.99, 'Success'),
	(7, 3, 22.99, 'Success'),
	(8, 4, 18.99, 'Pending'),
	(9, 5, 25.99, 'Success'),
	(10, 6, 14.99, 'Success'),
	(11, 7, 20.99, 'Pending'),
	(12, 8, 19.99, 'Success'),
	(13, 9, 16.99, 'Success'),
	(14, 10, 23.99, 'Pending');
    
insert into OrderDetails (order_id, product_id, size_id, quantity)
VALUES
	(1, 1, 1, 2),
	(2, 2, 2, 1),
	(3, 1, 3, 3),
	(4, 3, 2, 2),
	(5, 2, 1, 1),
	(6, 3, 3, 2),
	(7, 4, 2, 1),
	(8, 5, 4, 3),
	(9, 6, 6, 1),
	(10, 7, 8, 2);

-- Tạo hoặc thay đổi trigger cho INSERT
DELIMITER //

CREATE TRIGGER after_order_detail_insert
AFTER INSERT ON orderdetails
FOR EACH ROW
BEGIN
    -- Cập nhật hoặc chèn vào bảng bestseller
    INSERT INTO bestseller (product_id, count)
    VALUES (NEW.product_id, NEW.quantity)
    ON DUPLICATE KEY UPDATE count = count + NEW.quantity;
END;
//

DELIMITER ;


-- Tạo hoặc thay đổi trigger cho UPDATE
DELIMITER //

CREATE TRIGGER after_order_detail_update
AFTER UPDATE ON orderdetails
FOR EACH ROW
BEGIN
    -- Cập nhật bảng bestseller
    UPDATE bestseller
    SET count = count + (NEW.quantity - OLD.quantity)
    WHERE product_id = NEW.product_id;
END;
//

DELIMITER ;


-- Tạo hoặc thay đổi trigger cho DELETE
DELIMITER //

CREATE TRIGGER after_order_detail_delete
AFTER DELETE ON orderdetails
FOR EACH ROW
BEGIN
    -- Cập nhật bảng bestseller
    UPDATE bestseller
    SET count = count - OLD.quantity
    WHERE product_id = OLD.product_id;
END;
//

DELIMITER ;
