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
  `count` INT(64) NOT NULL,
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
  PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `responsible` INT(11) NOT NULL,
  `status` INT(11) NOT NULL,
  `dateoforder` varchar(255) NOT NULL,
  `deadline` varchar(255) NOT NULL,
  `product_id` INT(11) NOT NULL,
  `amount` INT(255) NOT NULL,
  `price` INT(255) NOT NULL,
  PRIMARY KEY (`order_id`, `responsible`, `status`, `product_id`),
  FOREIGN KEY (`responsible`) REFERENCES `user` (`user_id`),
  FOREIGN KEY (`status`) REFERENCES `orderstatus` (`status_id`),
  FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

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