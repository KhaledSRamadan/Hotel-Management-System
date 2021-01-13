/*
 Navicat MySQL Data Transfer

 Source Server         : hotel data
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : 127.0.0.1:3306
 Source Schema         : system data 2

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 13/01/2021 21:29:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for fine
-- ----------------------------
DROP TABLE IF EXISTS `fine`;
CREATE TABLE `fine`  (
  `Total` float NOT NULL,
  `Req_ID` int NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Req_ID`(`Req_ID`) USING BTREE,
  CONSTRAINT `fine_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `reservations` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of fine
-- ----------------------------

-- ----------------------------
-- Table structure for guest
-- ----------------------------
DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest`  (
  `ID` int NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `National_ID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Age` int NOT NULL,
  `Phone_No` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Creditcard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Credit_Pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of guest
-- ----------------------------

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hotel
-- ----------------------------

-- ----------------------------
-- Table structure for hotel account
-- ----------------------------
DROP TABLE IF EXISTS `hotel account`;
CREATE TABLE `hotel account`  (
  `Total` float NOT NULL,
  `Req_ID` int NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Req_ID`(`Req_ID`) USING BTREE,
  CONSTRAINT `hotel account_ibfk_1` FOREIGN KEY (`Req_ID`) REFERENCES `reservations` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of hotel account
-- ----------------------------

-- ----------------------------
-- Table structure for rate
-- ----------------------------
DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate`  (
  `ID` int NOT NULL,
  `Guest_ID` int NOT NULL,
  `Rate` int NOT NULL,
  `Hotel_ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Guest_ID`(`Guest_ID`) USING BTREE,
  INDEX `Hotel_ID`(`Hotel_ID`) USING BTREE,
  CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`Guest_ID`) REFERENCES `guest` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rate_ibfk_2` FOREIGN KEY (`Hotel_ID`) REFERENCES `hotel` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rate
-- ----------------------------

-- ----------------------------
-- Table structure for reservations
-- ----------------------------
DROP TABLE IF EXISTS `reservations`;
CREATE TABLE `reservations`  (
  `ID` int NOT NULL,
  `Guest_ID` int NOT NULL,
  `Room_ID` int NOT NULL,
  `Sevice_ID` int NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Guest_ID`(`Guest_ID`) USING BTREE,
  INDEX `Room_ID`(`Room_ID`) USING BTREE,
  INDEX `Sevice_ID`(`Sevice_ID`) USING BTREE,
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`Guest_ID`) REFERENCES `guest` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`Room_ID`) REFERENCES `room` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`Sevice_ID`) REFERENCES `services` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reservations
-- ----------------------------

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room`  (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Hotel_ID` int NOT NULL,
  `Price` float NOT NULL,
  `Room_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `View` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Hotel_ID`(`Hotel_ID`) USING BTREE,
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Hotel_ID`) REFERENCES `hotel` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of room
-- ----------------------------

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `ID` int NOT NULL,
  `Staff_ID` int NOT NULL,
  `Task` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Status` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Staff_ID`(`Staff_ID`) USING BTREE,
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schedule
-- ----------------------------

-- ----------------------------
-- Table structure for service request
-- ----------------------------
DROP TABLE IF EXISTS `service request`;
CREATE TABLE `service request`  (
  `Req_ID` int NOT NULL,
  `ID` int NOT NULL,
  `Service_ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Service_ID`(`Service_ID`) USING BTREE,
  INDEX `Req_ID`(`Req_ID`) USING BTREE,
  CONSTRAINT `service request_ibfk_1` FOREIGN KEY (`Service_ID`) REFERENCES `services` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `service request_ibfk_2` FOREIGN KEY (`Req_ID`) REFERENCES `reservations` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of service request
-- ----------------------------

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `ID` int NOT NULL,
  `Hotel_ID` int NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Price` float NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Hotel_ID`(`Hotel_ID`) USING BTREE,
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`Hotel_ID`) REFERENCES `hotel` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of services
-- ----------------------------

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `ID` int NOT NULL,
  `Hotel_ID` int NOT NULL,
  `Name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `National_ID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Age` int NOT NULL,
  `Phone_No` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Hotel_ID`(`Hotel_ID`) USING BTREE,
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Hotel_ID`) REFERENCES `hotel` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of staff
-- ----------------------------

-- ----------------------------
-- Table structure for statistics
-- ----------------------------
DROP TABLE IF EXISTS `statistics`;
CREATE TABLE `statistics`  (
  `Average rate` float NOT NULL,
  `Hotel Benefits` float NOT NULL,
  `Hotel_ID` int NOT NULL,
  `ID` int NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Hotel_ID`(`Hotel_ID`) USING BTREE,
  CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`Hotel_ID`) REFERENCES `hotel` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of statistics
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
