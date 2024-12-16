/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100432
 Source Host           : localhost:3306
 Source Schema         : capstone

 Target Server Type    : MySQL
 Target Server Version : 100432
 File Encoding         : 65001

 Date: 16/12/2024 23:45:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `barangay_id` int NOT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `barangay_id`(`barangay_id` ASC) USING BTREE,
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `addresses_ibfk_3` FOREIGN KEY (`barangay_id`) REFERENCES `barangays` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES (74, 96, 9, '123', '2024-12-16 07:20:19', '2024-12-16 07:20:19');
INSERT INTO `addresses` VALUES (75, 97, 10, '123 street', '2024-12-16 07:22:40', '2024-12-16 07:22:40');
INSERT INTO `addresses` VALUES (77, 99, 1, '12 Street', '2024-12-16 07:27:06', '2024-12-16 07:27:06');
INSERT INTO `addresses` VALUES (80, 102, 3, 'North Poblacion', '2024-12-16 09:13:31', '2024-12-16 09:13:31');
INSERT INTO `addresses` VALUES (81, 103, 9, '12 Street', '2024-12-16 09:15:44', '2024-12-16 09:15:44');
INSERT INTO `addresses` VALUES (82, 104, 10, '12 Street', '2024-12-16 09:16:37', '2024-12-16 09:16:37');
INSERT INTO `addresses` VALUES (83, 105, 1, 'North Poblacion', '2024-12-16 09:18:11', '2024-12-16 09:18:11');

-- ----------------------------
-- Table structure for animal_photos
-- ----------------------------
DROP TABLE IF EXISTS `animal_photos`;
CREATE TABLE `animal_photos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `animal_id` int UNSIGNED NOT NULL,
  `photo_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of animal_photos
-- ----------------------------

-- ----------------------------
-- Table structure for animals
-- ----------------------------
DROP TABLE IF EXISTS `animals`;
CREATE TABLE `animals`  (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int NOT NULL,
  `breed_id` int NOT NULL,
  `species_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `medical_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo_front` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo_back` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo_left_side` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `photo_right_side` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`animal_id`) USING BTREE,
  INDEX `owner_id`(`owner_id` ASC) USING BTREE,
  CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of animals
-- ----------------------------

-- ----------------------------
-- Table structure for announcements
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `what` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `date` date NULL DEFAULT NULL,
  `time` time NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `approved_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of announcements
-- ----------------------------

-- ----------------------------
-- Table structure for barangays
-- ----------------------------
DROP TABLE IF EXISTS `barangays`;
CREATE TABLE `barangays`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `barangay_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of barangays
-- ----------------------------
INSERT INTO `barangays` VALUES (1, 'Barobo, Valencia City');
INSERT INTO `barangays` VALUES (2, 'Batangan, Valencia City');
INSERT INTO `barangays` VALUES (3, 'Catumbalon, Valencia City');
INSERT INTO `barangays` VALUES (4, 'Concepcion, Valencia City');
INSERT INTO `barangays` VALUES (5, 'Dagat-Kidavao, Valencia City');
INSERT INTO `barangays` VALUES (6, 'Guinoyuran, Valencia City');
INSERT INTO `barangays` VALUES (7, 'Kahapunan, Valencia City');
INSERT INTO `barangays` VALUES (8, ' Laligan, Valencia City');
INSERT INTO `barangays` VALUES (9, 'Lourdes, Valencia City');
INSERT INTO `barangays` VALUES (10, 'Lumbayao, Valencia City');

-- ----------------------------
-- Table structure for breeds
-- ----------------------------
DROP TABLE IF EXISTS `breeds`;
CREATE TABLE `breeds`  (
  `id` int UNSIGNED NOT NULL,
  `species_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `breeds_species_id_foreign`(`species_id` ASC) USING BTREE,
  CONSTRAINT `breeds_species_id_foreign` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of breeds
-- ----------------------------
INSERT INTO `breeds` VALUES (1, 1, 'Golden Retriever', NULL, NULL);
INSERT INTO `breeds` VALUES (2, 1, 'Bulldog', NULL, NULL);
INSERT INTO `breeds` VALUES (3, 1, 'Labrador', NULL, NULL);
INSERT INTO `breeds` VALUES (4, 1, 'Beagle', NULL, NULL);
INSERT INTO `breeds` VALUES (5, 1, 'Poodle', NULL, NULL);
INSERT INTO `breeds` VALUES (6, 2, 'Persian', NULL, NULL);
INSERT INTO `breeds` VALUES (7, 2, 'Maine Coon', NULL, NULL);
INSERT INTO `breeds` VALUES (8, 2, 'Siamese', NULL, NULL);
INSERT INTO `breeds` VALUES (9, 2, 'Bengal', NULL, NULL);
INSERT INTO `breeds` VALUES (10, 2, 'Ragdoll', NULL, NULL);
INSERT INTO `breeds` VALUES (11, 3, 'Canary', NULL, NULL);
INSERT INTO `breeds` VALUES (12, 3, 'Parrot', NULL, NULL);
INSERT INTO `breeds` VALUES (13, 3, 'Macaw', NULL, NULL);
INSERT INTO `breeds` VALUES (14, 3, 'Cockatiel', NULL, NULL);
INSERT INTO `breeds` VALUES (15, 3, 'Budgerigar', NULL, NULL);
INSERT INTO `breeds` VALUES (16, 4, 'Arabian', NULL, NULL);
INSERT INTO `breeds` VALUES (17, 4, 'Thoroughbred', NULL, NULL);
INSERT INTO `breeds` VALUES (18, 4, 'Quarter Horse', NULL, NULL);
INSERT INTO `breeds` VALUES (19, 4, 'Clydesdale', NULL, NULL);
INSERT INTO `breeds` VALUES (20, 4, 'Andalusian', NULL, NULL);
INSERT INTO `breeds` VALUES (21, 5, 'Himalayan', NULL, NULL);
INSERT INTO `breeds` VALUES (22, 5, 'Dutch', NULL, NULL);
INSERT INTO `breeds` VALUES (23, 5, 'Lop', NULL, NULL);
INSERT INTO `breeds` VALUES (24, 5, 'Holland Lop', NULL, NULL);
INSERT INTO `breeds` VALUES (25, 5, 'Mini Rex', NULL, NULL);

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cache
-- ----------------------------
INSERT INTO `cache` VALUES ('admin@gmail.com|127.0.0.1', 'i:5;', 1734333580);
INSERT INTO `cache` VALUES ('admin@gmail.com|127.0.0.1:timer', 'i:1734333580;', 1734333580);
INSERT INTO `cache` VALUES ('admin@mail.com|127.0.0.1', 'i:2;', 1734340938);
INSERT INTO `cache` VALUES ('admin@mail.com|127.0.0.1:timer', 'i:1734340938;', 1734340938);
INSERT INTO `cache` VALUES ('buldog@gmail.com|127.0.0.1', 'i:2;', 1734284887);
INSERT INTO `cache` VALUES ('buldog@gmail.com|127.0.0.1:timer', 'i:1734284887;', 1734284887);
INSERT INTO `cache` VALUES ('cdaveedward@gmail.com|127.0.0.1', 'i:1;', 1731936219);
INSERT INTO `cache` VALUES ('cdaveedward@gmail.com|127.0.0.1:timer', 'i:1731936219;', 1731936219);
INSERT INTO `cache` VALUES ('lbjasd@gmail.com|127.0.0.1', 'i:1;', 1732108924);
INSERT INTO `cache` VALUES ('lbjasd@gmail.com|127.0.0.1:timer', 'i:1732108924;', 1732108924);
INSERT INTO `cache` VALUES ('lbssasddj@gmail.com|127.0.0.1', 'i:2;', 1732827343);
INSERT INTO `cache` VALUES ('lbssasddj@gmail.com|127.0.0.1:timer', 'i:1732827343;', 1732827343);
INSERT INTO `cache` VALUES ('lbxxxsj@gmail.com|127.0.0.1', 'i:1;', 1732066087);
INSERT INTO `cache` VALUES ('lbxxxsj@gmail.com|127.0.0.1:timer', 'i:1732066087;', 1732066087);
INSERT INTO `cache` VALUES ('lzxcbj@gmail.com|127.0.0.1', 'i:1;', 1734284926);
INSERT INTO `cache` VALUES ('lzxcbj@gmail.com|127.0.0.1:timer', 'i:1734284926;', 1734284926);
INSERT INTO `cache` VALUES ('rishjane618@gmail.com|127.0.0.1', 'i:2;', 1732015667);
INSERT INTO `cache` VALUES ('rishjane618@gmail.com|127.0.0.1:timer', 'i:1732015667;', 1732015667);
INSERT INTO `cache` VALUES ('zazaza@gmail.com|127.0.0.1', 'i:4;', 1732199634);
INSERT INTO `cache` VALUES ('zazaza@gmail.com|127.0.0.1:timer', 'i:1732199634;', 1732199634);

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for checkup
-- ----------------------------
DROP TABLE IF EXISTS `checkup`;
CREATE TABLE `checkup`  (
  `checkup_id` int NOT NULL AUTO_INCREMENT,
  `date` date NULL DEFAULT NULL,
  `time` time NULL DEFAULT NULL,
  `product` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `veterinarian` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `animal_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `findings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`checkup_id`) USING BTREE,
  INDEX `animal_id`(`animal_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `checkup_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `checkup_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of checkup
-- ----------------------------

-- ----------------------------
-- Table structure for disease_investigation
-- ----------------------------
DROP TABLE IF EXISTS `disease_investigation`;
CREATE TABLE `disease_investigation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `disease_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `testing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `findings` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `animal_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `animal_id`(`animal_id` ASC) USING BTREE,
  CONSTRAINT `disease_investigation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `disease_investigation_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of disease_investigation
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2024_11_06_170917_add_role_column_in_users', 2);
INSERT INTO `migrations` VALUES (5, '2024_11_17_165649_add_timestamps_to_addresses_table', 3);
INSERT INTO `migrations` VALUES (6, '2024_11_21_015340_add_profile_image_to_users_table', 4);
INSERT INTO `migrations` VALUES (7, '2024_11_25_021158_create_species_table', 5);
INSERT INTO `migrations` VALUES (8, '2024_11_25_021316_create_breeds_table', 5);
INSERT INTO `migrations` VALUES (9, '2024_11_25_183938_change_ids_to_int_in_breeds_and_species', 6);
INSERT INTO `migrations` VALUES (10, '2024_11_27_135532_add_foreign_key_constraint_to_animal_id_in_transactions_table', 7);

-- ----------------------------
-- Table structure for owners
-- ----------------------------
DROP TABLE IF EXISTS `owners`;
CREATE TABLE `owners`  (
  `owner_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `civil_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permit` int NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`owner_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `owners_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of owners
-- ----------------------------
INSERT INTO `owners` VALUES (78, 99, 'Single', 'N/A', 1, '2024-12-16 07:27:06', '2024-12-16 07:27:06');
INSERT INTO `owners` VALUES (79, 102, 'Married', 'N/A', 1, '2024-12-16 09:13:31', '2024-12-16 09:13:31');
INSERT INTO `owners` VALUES (80, 104, NULL, NULL, 1, '2024-12-16 09:17:20', '2024-12-16 09:17:20');
INSERT INTO `owners` VALUES (81, 105, 'Married', 'N/A', 1, '2024-12-16 09:18:11', '2024-12-16 09:18:11');

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('7sKjavAJSsckbrfEIyi4txVfaJtq0IaoKG7zLc5t', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHBuczR3aGtpa0Y4cDNaVmpHOEROTThabmlwbTkzbnN5aTZTcmNxViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1734341247);
INSERT INTO `sessions` VALUES ('M1M2ormo1rkxBMiyrxmUt5wdi09Mky211g2lClLo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkE0cGN4Vzc5N25vT0t5TjBRR1NmcHk4NGdpWXYxNHBqOVk4U1Y3aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734341766);

-- ----------------------------
-- Table structure for species
-- ----------------------------
DROP TABLE IF EXISTS `species`;
CREATE TABLE `species`  (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `species_name_unique`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of species
-- ----------------------------
INSERT INTO `species` VALUES (1, 'Dog', NULL, NULL);
INSERT INTO `species` VALUES (2, 'Cat', NULL, NULL);
INSERT INTO `species` VALUES (3, 'Bird', NULL, NULL);
INSERT INTO `species` VALUES (4, 'Horse', NULL, NULL);
INSERT INTO `species` VALUES (5, 'Rabbit', NULL, NULL);

-- ----------------------------
-- Table structure for surveillance
-- ----------------------------
DROP TABLE IF EXISTS `surveillance`;
CREATE TABLE `surveillance`  (
  `surv_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `testing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `findings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `lot_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `animal_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`surv_id`) USING BTREE,
  INDEX `animal_id`(`animal_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `surveillance_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `surveillance_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of surveillance
-- ----------------------------

-- ----------------------------
-- Table structure for transaction_subtypes
-- ----------------------------
DROP TABLE IF EXISTS `transaction_subtypes`;
CREATE TABLE `transaction_subtypes`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaction_type_id` int NOT NULL,
  `subtype_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transaction_type_id`(`transaction_type_id` ASC) USING BTREE,
  CONSTRAINT `transaction_subtypes_ibfk_1` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_types` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction_subtypes
-- ----------------------------
INSERT INTO `transaction_subtypes` VALUES (1, 1, 'Pregnancy Diagnosis');
INSERT INTO `transaction_subtypes` VALUES (2, 1, 'Artificial Insemination');
INSERT INTO `transaction_subtypes` VALUES (3, 1, 'Technical Services');
INSERT INTO `transaction_subtypes` VALUES (4, 2, 'Surveillance and Investigation');
INSERT INTO `transaction_subtypes` VALUES (5, 2, 'Farm Visit');
INSERT INTO `transaction_subtypes` VALUES (8, 2, 'Vaccination');
INSERT INTO `transaction_subtypes` VALUES (9, 2, 'Treatment');
INSERT INTO `transaction_subtypes` VALUES (10, 2, 'Vitamin Supplementation');
INSERT INTO `transaction_subtypes` VALUES (11, 2, 'Deworming');
INSERT INTO `transaction_subtypes` VALUES (12, 2, 'Veterinary Health Certificate');

-- ----------------------------
-- Table structure for transaction_types
-- ----------------------------
DROP TABLE IF EXISTS `transaction_types`;
CREATE TABLE `transaction_types`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction_types
-- ----------------------------
INSERT INTO `transaction_types` VALUES (1, 'LPPD');
INSERT INTO `transaction_types` VALUES (2, 'AHWD');

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions`  (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type_id` int NULL DEFAULT NULL,
  `transaction_subtype_id` int NULL DEFAULT NULL,
  `owner_id` int NULL DEFAULT NULL,
  `animal_id` int NULL DEFAULT NULL,
  `vet_id` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp,
  `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`) USING BTREE,
  INDEX `owner_id`(`owner_id` ASC) USING BTREE,
  INDEX `animal_id`(`animal_id` ASC) USING BTREE,
  CONSTRAINT `fk_animal_id` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transactions_animal_id_foreign` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`owner_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transactions
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `complete_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` int NOT NULL DEFAULT 0,
  `contact_no` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `birth_date` date NULL DEFAULT NULL,
  `status` int NULL DEFAULT 0,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (96, NULL, 'admin', 0, '123', 'male', '2003-12-01', 1, 'ranes12@gmail.com', '$2y$12$Ftw5qbtZb272T88lQMPQC.hVmgML1QXVag60iNECQz9J/h3hDJymy', '2024-12-16 07:20:19', '2024-12-16 15:20:46');
INSERT INTO `users` VALUES (97, NULL, 'Arram', 2, '12313213', 'male', '2001-11-11', 1, 'arram@gmail.com', '$2y$12$CgnhORpjmIjxjjuAeT/TR.L2fr44.tHKvqbl4.OVVx0JN2KuoMn6C', '2024-12-16 07:22:40', '2024-12-16 07:22:40');
INSERT INTO `users` VALUES (99, NULL, 'Pamisa, Arram', 1, '123123', 'Male', '2003-01-12', 1, 'pamisa@gmail.com', '$2y$12$SLiGPgleBI5MCDLEPZWo0OqyDdJeb1aRXvKoz/oir6uZx4nptWynq', '2024-12-16 07:27:06', '2024-12-16 09:14:06');
INSERT INTO `users` VALUES (102, NULL, 'Mindel Rey Aguirre', 1, '09123456789', 'male', '2001-12-11', 1, 'agurie@gmail.com', '$2y$12$b5iCxu/r9kMKnWX8VnmSB.MO2Y.T5NlQhyci.iKT7OUUUHSmLytJG', '2024-12-16 09:13:31', '2024-12-16 09:13:31');
INSERT INTO `users` VALUES (103, NULL, 'user', 3, '123123', 'male', '2001-12-31', 1, 'user101@Gmail.com', '$2y$12$NvgfdIwhik91FasWuxo0gOgINoQGoFy689rk8ZysAqN1sRIf.7WsS', '2024-12-16 09:15:44', '2024-12-16 09:15:44');
INSERT INTO `users` VALUES (104, NULL, 'user101', 3, '123123', 'Male', '2002-12-22', 1, 'user100@gmail.com', '$2y$12$kaQ9dNIN7kJWsZiUBwEFXubLliwBoC7PjvoUYI7wcQ0iTTFVScjtq', '2024-12-16 09:16:37', '2024-12-16 09:17:19');
INSERT INTO `users` VALUES (105, NULL, 'sales manager', 1, '09123456789', 'male', '1002-12-12', 1, 'user11@gmail.com', '$2y$12$0bpBNjyJqNK5bhLFe6OmFeRtcZIY.qcMESKH5qUk6J9ue/I9ye5wq', '2024-12-16 09:18:11', '2024-12-16 09:18:11');

SET FOREIGN_KEY_CHECKS = 1;
