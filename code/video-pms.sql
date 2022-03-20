CREATE DATABASE  IF NOT EXISTS `video_pms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `video_pms`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: video_pms
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pms_camera_images`
--

DROP TABLE IF EXISTS `pms_camera_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_camera_images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `camera_id` bigint(20) DEFAULT NULL COMMENT 'spu_id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `default_img` tinyint(4) DEFAULT NULL COMMENT '是否默认图',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='攝像機图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_camera_images`
--

LOCK TABLES `pms_camera_images` WRITE;
/*!40000 ALTER TABLE `pms_camera_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_camera_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_camera_info`
--

DROP TABLE IF EXISTS `pms_camera_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_camera_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '攝像機id',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '攝像機名称',
  `hostname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '攝像機ip',
  `port` bigint(20) DEFAULT NULL COMMENT '攝像機阜口',
  `username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接入帳號',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '接入密碼',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '攝像機描述',
  `cat_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  `publish_status` tinyint(4) DEFAULT NULL COMMENT '上架状态[0 - 下架，1 - 上架]',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='攝像機資訊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_camera_info`
--

LOCK TABLES `pms_camera_info` WRITE;
/*!40000 ALTER TABLE `pms_camera_info` DISABLE KEYS */;
INSERT INTO `pms_camera_info` VALUES (4,'nfbCCTV-N1-N-99.78-M','127.0.0.1',5500,'admin','admin','國道1號(頭份交流道到新竹系統交流道)',5,1,NULL,NULL);
/*!40000 ALTER TABLE `pms_camera_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_camera_info_desc`
--

DROP TABLE IF EXISTS `pms_camera_info_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_camera_info_desc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '攝像機介紹id',
  `camera_id` bigint(20) NOT NULL COMMENT '攝像機id',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '攝像機介绍',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='攝像機資訊介绍';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_camera_info_desc`
--

LOCK TABLES `pms_camera_info_desc` WRITE;
/*!40000 ALTER TABLE `pms_camera_info_desc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pms_camera_info_desc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pms_category`
--

DROP TABLE IF EXISTS `pms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pms_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类名称',
  `title` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类標題',
  `subtitle` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分类子標題',
  `parent_cid` bigint(20) DEFAULT NULL COMMENT '父分类id',
  `cat_level` int(11) DEFAULT NULL COMMENT '层级',
  `show_status` tinyint(4) DEFAULT NULL COMMENT '是否显示[0-不显示，1显示]',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `icon` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标地址',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_cid` (`parent_cid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='攝像機三级分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pms_category`
--

LOCK TABLES `pms_category` WRITE;
/*!40000 ALTER TABLE `pms_category` DISABLE KEYS */;
INSERT INTO `pms_category` VALUES (1,'高公局國道路況影像','高公局國道路況影像','高公局國道路況影像',0,1,1,1,NULL,NULL,NULL),(2,'塞車路段','塞車路段','塞車路段',1,2,1,0,'',NULL,NULL),(3,'高港高架','高港高架','高港高架',1,2,1,0,'',NULL,NULL),(4,'國道六號','國道六號','國道六號',1,2,1,0,'',NULL,NULL),(5,'北上（新竹系統 - 基隆端）','北上（新竹系統 - 基隆端）','北上（新竹系統 - 基隆端）',4,3,1,0,'',NULL,NULL),(6,'北上（民雄 - 新竹系統）','北上（民雄 - 新竹系統）','北上（民雄 - 新竹系統）',4,3,1,0,'',NULL,NULL),(7,'北上（五甲 - 大林）','北上（五甲 - 大林）','北上（五甲 - 大林）',4,3,1,0,'',NULL,NULL);
/*!40000 ALTER TABLE `pms_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20 20:47:37
