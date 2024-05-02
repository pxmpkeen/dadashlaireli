CREATE DATABASE IF NOT EXISTS `silkway`;
USE `silkway`;
CREATE TABLE IF NOT EXISTS `admins`(`id` VARCHAR(36) PRIMARY KEY, `name` VARCHAR(30) NOT NULL, `surname` VARCHAR(30) NOT NULL, `mail` VARCHAR(64) NOT NULL, `password` VARCHAR(30) NOT NULL, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS `users`(`id` VARCHAR(36) PRIMARY KEY, `name` VARCHAR(30) NOT NULL, `surname` VARCHAR(30) NOT NULL, `mail` VARCHAR(64) NOT NULL, `password` VARCHAR(30) NOT NULL, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS `companies` (`id` VARCHAR(36) PRIMARY KEY, `name` VARCHAR(30) NOT NULL, `mail` VARCHAR(64) NOT NULL, `owner_id` VARCHAR(36) NOT NULL, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (`owner_id`) REFERENCES `users`(`id`));
CREATE TABLE IF NOT EXISTS `goods`(`id` VARCHAR(36) PRIMARY KEY, `name` VARCHAR(30) NOT NULL, `description` TEXT NOT NULL, `rate` FLOAT NOT NULL DEFAULT 0.0, `company_id` VARCHAR(36) NOT NULL, `left` INT NOT NULL DEFAULT 0, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`));
CREATE TABLE IF NOT EXISTS `purchases`(`id` VARCHAR(36) PRIMARY KEY, `name` VARCHAR(30) NOT NULL, `description` TEXT NOT NULL, `user_id` VARCHAR(36) NOT NULL, `company_id` VARCHAR(36) NOT NULL, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`), FOREIGN KEY (`user_id`) REFERENCES `users`(`id`))
CREATE TABLE IF NOT EXISTS `blacklist_companies`(`id` VARCHAR(36) PRIMARY KEY, `name` VARCHAR(30) NOT NULL, `purpose` TEXT NOT NULL, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS `waitlist_companies`(`id` VARCHAR(36) PRIMARY KEY, `name` VARCHAR(30) NOT NULL, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS `problems` (`id` VARCHAR(36) PRIMARY KEY, `title` VARCHAR(30) NOT NULL, `description` TEXT NOT NULL, `user_id` VARCHAR(36) NOT NULL, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (`user_id`) REFERENCES `users`(`id`));
CREATE TABLE IF NOT EXISTS `solutions` (`id` VARCHAR(36) PRIMARY KEY, `title` VARCHAR(30) NOT NULL, `description` TEXT NOT NULL, `problem_id` VARCHAR(36) NOT NULL, `admin_id` VARCHAR(36) NOT NULL, `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (`user_id`) REFERENCES `users`(`id`), FOREIGN KEY (`problem_id`) REFERENCES `problems`(`id`), FOREIGN KEY (`admin_id`) REFERENCES `admins`(`id`));