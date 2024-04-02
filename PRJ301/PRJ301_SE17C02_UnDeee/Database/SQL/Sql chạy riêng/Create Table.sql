CREATE TABLE `Categories`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'Current_timestamp'
);
ALTER TABLE
    `Categories` ADD PRIMARY KEY `categories_id_primary`(`id`);
ALTER TABLE
    `Categories` ADD UNIQUE `categories_name_unique`(`name`);
CREATE TABLE `Orders`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `address_id` INT UNSIGNED NOT NULL,
    `total_price` DOUBLE NOT NULL,
    `status` VARCHAR(45) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'current_timestamp'
);
ALTER TABLE
    `Orders` ADD PRIMARY KEY `orders_id_primary`(`id`);
CREATE TABLE `Users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(45) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `fullname` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(15) NOT NULL,
    `avatar` VARCHAR(255) NULL,
    `role` TINYINT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);
ALTER TABLE
    `Users` ADD PRIMARY KEY `users_id_primary`(`id`);
ALTER TABLE
    `Users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `Products`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `category_id` INT UNSIGNED NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `price` DOUBLE NOT NULL,
    `status` VARCHAR(45) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'current_timestamp'
);
ALTER TABLE
    `Products` ADD PRIMARY KEY `products_id_primary`(`id`);
ALTER TABLE
    `Products` ADD UNIQUE `products_name_unique`(`name`);
CREATE TABLE `BestSeller`(
    `product_id` INT UNSIGNED NOT NULL,
    `count` INT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'current_timestamp'
);
ALTER TABLE
    `BestSeller` ADD PRIMARY KEY `bestseller_product_id_primary`(`product_id`);
CREATE TABLE `Addresses`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT UNSIGNED NOT NULL,
    `address_detail` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);
ALTER TABLE
    `Addresses` ADD PRIMARY KEY `addresses_id_primary`(`id`);
CREATE TABLE `Sizes`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `category_id` INT UNSIGNED NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    `percent` DOUBLE NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'current_timestamp'
);
ALTER TABLE
    `Sizes` ADD PRIMARY KEY `sizes_id_primary`(`id`);
CREATE TABLE `OrderDetails`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `order_id` INT UNSIGNED NOT NULL,
    `product_id` INT UNSIGNED NOT NULL,
    `size_id` INT UNSIGNED NOT NULL,
    `quantity` INT UNSIGNED NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT 'current_timestamp'
);
ALTER TABLE
    `OrderDetails` ADD PRIMARY KEY `orderdetails_id_primary`(`id`);
ALTER TABLE
    `BestSeller` ADD CONSTRAINT `bestseller_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `Products`(`id`);
ALTER TABLE
    `OrderDetails` ADD CONSTRAINT `orderdetails_order_id_foreign` FOREIGN KEY(`order_id`) REFERENCES `Orders`(`id`);
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