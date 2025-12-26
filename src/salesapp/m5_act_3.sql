-- Filename: m5_act_3.sql
-- Author: Colorado Online
-- Student Name: [Enter your full name here]

CREATE DATABASE m5act3db;
USE m5act3db;

CREATE TABLE `sales_summary` (
    `summary_date` DATE NOT NULL,
    `total_orders` INT NOT NULL,
    `total_revenue` DECIMAL(12,2) NOT NULL,
    `avg_order_value` DECIMAL(12,2) NOT NULL,
    `top_product_id` INT DEFAULT NULL,
    `top_product_qty` INT DEFAULT NULL,
    `region` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`summary_date`, `region`)
);

INSERT INTO `sales_summary` VALUES ('2025-12-01', 120, 14500.75, 120.84, 101, 35, 'North');
INSERT INTO `sales_summary` VALUES ('2025-12-02', 95, 11230.50, 118.21, 203, 28, 'South');
INSERT INTO `sales_summary` VALUES ('2025-12-03', 150, 18990.00, 126.60, 305, 42, 'East');
INSERT INTO `sales_summary` VALUES ('2025-12-04', 80, 9400.00, 117.50, 102, 20, 'West');
INSERT INTO `sales_summary` VALUES ('2025-12-05', 175, 21050.25, 120.29, 410, 50, 'North');
INSERT INTO `sales_summary` VALUES ('2025-12-06', 130, 15600.00, 120.00, 305, 33, 'South');
INSERT INTO `sales_summary` VALUES ('2025-12-07', 90, 10800.00, 120.00, 101, 25, 'East');
INSERT INTO `sales_summary` VALUES ('2025-12-08', 200, 24000.00, 120.00, 410, 55, 'West');
INSERT INTO `sales_summary` VALUES ('2025-12-09', 110, 13200.00, 120.00, 203, 30, 'North');
INSERT INTO `sales_summary` VALUES ('2025-12-10', 75, 9900.00, 50.10, 180, 20, 'East');

CREATE USER 'm5act3'@'%' IDENTIFIED BY 'easy123';
GRANT SELECT ON m5act3db.* TO 'm5act3'@'%';
