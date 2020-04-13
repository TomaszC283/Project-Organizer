DROP DATABASE IF EXISTS `project_organizer`;
CREATE DATABASE `project_organizer`;

use project_organizer;
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `amount` INT(64) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `offer_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY(`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `order_from_client`;
CREATE TABLE `order_from_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` VARCHAR(255),
  `amount` INT(11) NOT NULL,
  `offer_status` INT(11) NOT NULL,
  `client_id` INT(11) NOT NULL,
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `clientOrder_id` INT(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `responsible` INT(11) NOT NULL,
  `status` INT(11) NOT NULL,
  `dateoforder` varchar(255) NOT NULL,
  `deadline` varchar(255) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `amount` INT(255) NOT NULL,
  `price` INT(255) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO `orders` VALUES (1, 1, 'description' , 1 , 2 , CONVERT(NOW(), DATE), CONVERT(date_add(NOW(), INTERVAL 14 DAY), DATE), 1, 15, 15000);
INSERT INTO `orders` VALUES (2, 2, 'description' , 1 , 3 , CONVERT(date_add(NOW(), INTERVAL -2 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 12 DAY), DATE), 2, 2, 20000);
INSERT INTO `orders` VALUES (3, 3, 'description' , 1 , 4 , CONVERT(date_add(NOW(), INTERVAL -3 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 11 DAY), DATE), 3, 3, 6000);
INSERT INTO `orders` VALUES (4, 4, 'description' , 1 , 5 , CONVERT(date_add(NOW(), INTERVAL -4 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 10 DAY), DATE), 3, 5, 70000);
INSERT INTO `orders` VALUES (5, 5, 'description' , 1 , 6 , CONVERT(date_add(NOW(), INTERVAL -5 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 9 DAY), DATE), 4, 7, 21000);
INSERT INTO `orders` VALUES (6, 6, 'special_order_desc' , 1 , 7 , CONVERT(date_add(NOW(), INTERVAL -6 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 8 DAY), DATE), 5, 12, 23000);
INSERT INTO `orders` VALUES (7, 7, 'description' , 1 , 8 , CONVERT(date_add(NOW(), INTERVAL -7 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 7 DAY), DATE), 2, 1, 6000);
INSERT INTO `orders` VALUES (8, 8, 'description' , 1 , 9 , CONVERT(date_add(NOW(), INTERVAL -8 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 6 DAY), DATE), 3, 2, 12000);
INSERT INTO `orders` VALUES (9, 9, 'description' , 1 , 10 , CONVERT(date_add(NOW(), INTERVAL -9 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 5 DAY), DATE), 2, 25, 200000);
INSERT INTO `orders` VALUES (10, 10, 'description' , 1 , 11 , CONVERT(date_add(NOW(), INTERVAL -10 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 4 DAY), DATE), 3, 10, 110000);
INSERT INTO `orders` VALUES (11, 11, 'description' , 1 , 12 , CONVERT(date_add(NOW(), INTERVAL -11 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 3 DAY), DATE), 4, 5, 50000);
INSERT INTO `orders` VALUES (12, 12, 'special_order_desc' , 1 , 13 , CONVERT(date_add(NOW(), INTERVAL -12 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 2 DAY), DATE), 5, 6, 45000);
INSERT INTO `orders` VALUES (13, 13, 'description' , 1 , 14 , CONVERT(date_add(NOW(), INTERVAL -13 DAY), DATE), CONVERT(date_add(NOW(), INTERVAL 1 DAY), DATE), 1, 10, 75000);

INSERT INTO `order_from_client` VALUES (1, 'message' , 15 , 1 , 14);
INSERT INTO `order_from_client` VALUES (2, 'message' , 2 , 1 , 14);
INSERT INTO `order_from_client` VALUES (3, 'message' , 3 , 1 , 14);
INSERT INTO `order_from_client` VALUES (4, 'message' , 5 , 1 , 14);
INSERT INTO `order_from_client` VALUES (5, 'message' , 7 , 1 , 14);
INSERT INTO `order_from_client` VALUES (6, 'message' , 12 , 1 , 14);
INSERT INTO `order_from_client` VALUES (7, 'message' , 1 , 1 , 14);
INSERT INTO `order_from_client` VALUES (8, 'message' , 2 , 1 , 14);
INSERT INTO `order_from_client` VALUES (9, 'message' , 25 , 1 , 14);
INSERT INTO `order_from_client` VALUES (10, 'message', 10 , 1 , 14);
INSERT INTO `order_from_client` VALUES (11, 'message', 5 , 1 , 14);
INSERT INTO `order_from_client` VALUES (12, 'message', 6 , 1 , 14);
INSERT INTO `order_from_client` VALUES (13, 'message', 10 , 3 , 14);
INSERT INTO `order_from_client` VALUES (14, 'message', 100 , 0 , 14);

INSERT INTO `store` VALUES (1, 'tin cabinet');
INSERT INTO `store` VALUES (2, 'steel structures');
INSERT INTO `store` VALUES (3,'garage');
INSERT INTO `store` VALUES (4,'metal housings');
INSERT INTO `store` VALUES (5,'Special order');

INSERT INTO `orderstatus` VALUES (1, 'ORDER');
INSERT INTO `orderstatus` VALUES (2, 'ADOPTED');
INSERT INTO `orderstatus` VALUES (3, 'DESIGN');
INSERT INTO `orderstatus` VALUES (4, 'IMPLEMENTATION');
INSERT INTO `orderstatus` VALUES (5, 'QUEUE');
INSERT INTO `orderstatus` VALUES (6, 'WAREHOUSE');
INSERT INTO `orderstatus` VALUES (7, 'PUNCHING');
INSERT INTO `orderstatus` VALUES (8, 'BENDING');
INSERT INTO `orderstatus` VALUES (9, 'WELDING');
INSERT INTO `orderstatus` VALUES (10, 'PRINTING');
INSERT INTO `orderstatus` VALUES (11, 'FITTING');
INSERT INTO `orderstatus` VALUES (12, 'QUALITY');
INSERT INTO `orderstatus` VALUES (13, 'READY');
INSERT INTO `orderstatus` VALUES (14, 'ARCHIVIZED');

INSERT INTO `role` VALUES (1,'ROLE_ADMIN');
INSERT INTO `role` VALUES (2,'ROLE_PRODUCTION_MANAGER');
INSERT INTO `role` VALUES (3, 'ROLE_FOREMAN');
INSERT INTO `role` VALUES (4, 'ROLE_CONSTRUCTOR');
INSERT INTO `role` VALUES (5, 'ROLE_TECHNOLOGIST');
INSERT INTO `role` VALUES (6, 'ROLE_STOREKEEPER');
INSERT INTO `role` VALUES (7, 'ROLE_LOCKSMITH_PUNCHING');
INSERT INTO `role` VALUES (8, 'ROLE_LOCKSMITH_BENDING');
INSERT INTO `role` VALUES (9, 'ROLE_LOCKSMITH_WELDER');
INSERT INTO `role` VALUES (10, 'ROLE_LOCKSMITH_PRINTER');
INSERT INTO `role` VALUES (11, 'ROLE_LOCKSMITH_FITTER');
INSERT INTO `role` VALUES (12, 'ROLE_QUALITY_CONTROL');
INSERT INTO `role` VALUES (13, 'ROLE_LOGISTICIAN');
INSERT INTO `role` VALUES (14, 'ROLE_CLIENT');


INSERT INTO `user` VALUES (1,'admin@projectorganizer.pl','Czopur','Tomasz','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (2,'manager@projectorganizer.pl','Manager','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (3,'foreman@projectorganizer.pl','Foreman','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (4,'constructor@projectorganizer.pl','Constructor','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (5,'technologist@projectorganizer.pl','Technologist','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (6,'storekeeper@projectorganizer.pl','Storage','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (7,'punching@projectorganizer.pl','Punching','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (8,'bending@projectorganizer.pl','Bending','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (9,'welder@projectorganizer.pl','Welder','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (10,'printer@projectorganizer.pl','Printer','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (11,'fitter@projectorganizer.pl','Fitter','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (12,'quality@projectorganizer.pl','Quality','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (13,'logistician@projectorganizer.pl','Logistician','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');
INSERT INTO `user` VALUES (14,'client@projectorganizer.pl','Client','Test','$2a$10$Jmr7H/PRy65K5YG4jFEXwOFy3N/ALdogBnLTAKLDXfhrLbYiQU4.C');

INSERT INTO `user_role` VALUES(1,1);
INSERT INTO `user_role` VALUES(2,2);
INSERT INTO `user_role` VALUES(3,3);
INSERT INTO `user_role` VALUES(4,4);
INSERT INTO `user_role` VALUES(5,5);
INSERT INTO `user_role` VALUES(6,6);
INSERT INTO `user_role` VALUES(7,7);
INSERT INTO `user_role` VALUES(8,8);
INSERT INTO `user_role` VALUES(9,9);
INSERT INTO `user_role` VALUES(10,10);
INSERT INTO `user_role` VALUES(11,11);
INSERT INTO `user_role` VALUES(12,12);
INSERT INTO `user_role` VALUES(13,13);
INSERT INTO `user_role` VALUES(14,14);

INSERT INTO `products` VALUES(1,'Inox',6432);
INSERT INTO `products` VALUES(2,'Zincor',13152);
INSERT INTO `products` VALUES(3,'Aluminium',5332);
INSERT INTO `products` VALUES(4,'Steel',26943);
INSERT INTO `products` VALUES(5,'Aluminium Profile',543);