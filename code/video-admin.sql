CREATE DATABASE  IF NOT EXISTS `video_admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `video_admin`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: video_admin
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
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Taipei');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0',_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0rht\�xt\00 0/30 * * * ?sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler','DESKTOP-PR412G01647744659536',1647780399036,15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1647781200000,1647779400000,5,'WAITING','CRON',1590919162000,0,NULL,2,_binary '�\�\0sr\0org.quartz.JobDataMap���迩�\�\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�\�\��\�](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap\�.�(v\n\�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap\��\�`\�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0rht\�xt\00 0/30 * * * ?sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0t\0\nfireflynayt\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job`
--

DROP TABLE IF EXISTS `schedule_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job`
--

LOCK TABLES `schedule_job` WRITE;
/*!40000 ALTER TABLE `schedule_job` DISABLE KEYS */;
INSERT INTO `schedule_job` VALUES (1,'testTask','fireflynay','0 0/30 * * * ?',0,'参数测试','2020-05-31 09:58:57');
/*!40000 ALTER TABLE `schedule_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_job_log`
--

DROP TABLE IF EXISTS `schedule_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_job_log`
--

LOCK TABLES `schedule_job_log` WRITE;
/*!40000 ALTER TABLE `schedule_job_log` DISABLE KEYS */;
INSERT INTO `schedule_job_log` VALUES (1,1,'testTask','renren',0,NULL,1,'2020-05-31 18:00:00'),(2,1,'testTask','renren',0,NULL,0,'2020-05-31 18:30:00'),(3,1,'testTask','renren',0,NULL,0,'2020-05-31 19:00:00'),(4,1,'testTask','renren',0,NULL,0,'2020-05-31 19:30:00'),(5,1,'testTask','renren',0,NULL,0,'2020-05-31 20:00:00'),(6,1,'testTask','renren',0,NULL,1,'2020-05-31 20:30:00'),(7,1,'testTask','renren',0,NULL,0,'2020-05-31 21:00:00'),(8,1,'testTask','renren',0,NULL,1,'2020-05-31 21:30:00'),(9,1,'testTask','renren',0,NULL,1,'2020-05-31 22:00:00'),(10,1,'testTask','renren',0,NULL,0,'2020-05-31 22:30:00'),(11,1,'testTask','renren',0,NULL,1,'2020-05-31 23:00:00'),(12,1,'testTask','renren',0,NULL,0,'2020-05-31 23:30:00'),(13,1,'testTask','renren',0,NULL,0,'2020-06-01 10:30:00'),(14,1,'testTask','renren',0,NULL,0,'2020-06-01 11:00:00'),(15,1,'testTask','renren',0,NULL,0,'2020-06-01 11:30:00'),(16,1,'testTask','renren',0,NULL,0,'2020-06-01 12:00:00'),(17,1,'testTask','renren',0,NULL,0,'2020-06-01 12:30:00'),(18,1,'testTask','renren',0,NULL,0,'2020-06-01 13:00:00'),(19,1,'testTask','renren',0,NULL,0,'2020-06-01 13:30:00'),(20,1,'testTask','renren',0,NULL,0,'2020-06-01 14:00:00'),(21,1,'testTask','renren',0,NULL,0,'2020-06-01 14:30:00'),(22,1,'testTask','renren',0,NULL,1,'2020-06-01 15:00:00'),(23,1,'testTask','renren',0,NULL,0,'2020-06-01 15:30:00'),(24,1,'testTask','renren',0,NULL,1,'2020-06-01 16:00:00'),(25,1,'testTask','renren',0,NULL,0,'2020-06-01 16:30:00'),(26,1,'testTask','renren',0,NULL,1,'2020-06-01 17:00:00'),(27,1,'testTask','renren',0,NULL,1,'2020-06-01 17:30:00'),(28,1,'testTask','renren',0,NULL,1,'2020-06-01 18:00:00'),(29,1,'testTask','renren',0,NULL,1,'2020-06-01 18:30:00'),(30,1,'testTask','renren',0,NULL,1,'2020-06-01 19:00:00'),(31,1,'testTask','renren',0,NULL,0,'2020-06-01 19:30:00'),(32,1,'testTask','renren',0,NULL,0,'2020-06-01 20:00:00'),(33,1,'testTask','renren',0,NULL,1,'2020-06-01 20:30:00'),(34,1,'testTask','renren',0,NULL,1,'2020-06-01 21:00:00'),(35,1,'testTask','renren',0,NULL,1,'2020-06-01 21:30:00'),(36,1,'testTask','renren',0,NULL,1,'2020-06-01 22:00:00'),(37,1,'testTask','renren',0,NULL,0,'2020-06-01 23:00:00'),(38,1,'testTask','renren',0,NULL,1,'2020-06-01 23:30:00'),(39,1,'testTask','renren',0,NULL,6,'2020-06-02 00:00:00'),(40,1,'testTask','renren',0,NULL,1,'2020-06-02 11:00:00'),(41,1,'testTask','renren',0,NULL,0,'2020-06-02 11:30:00'),(42,1,'testTask','renren',0,NULL,0,'2020-06-02 12:00:00'),(43,1,'testTask','renren',0,NULL,0,'2020-06-02 12:30:00'),(44,1,'testTask','renren',0,NULL,0,'2020-06-02 13:00:00'),(45,1,'testTask','renren',0,NULL,1,'2020-06-02 13:30:00'),(46,1,'testTask','renren',0,NULL,0,'2020-06-02 14:00:00'),(47,1,'testTask','renren',0,NULL,1,'2020-06-02 14:30:00'),(48,1,'testTask','renren',0,NULL,0,'2020-06-02 15:00:00'),(49,1,'testTask','renren',0,NULL,1,'2020-06-02 15:30:00'),(50,1,'testTask','renren',0,NULL,0,'2020-06-02 16:00:00'),(51,1,'testTask','renren',0,NULL,0,'2020-06-02 16:30:00'),(52,1,'testTask','renren',0,NULL,1,'2020-06-02 17:00:00'),(53,1,'testTask','renren',0,NULL,1,'2020-06-02 17:30:00'),(54,1,'testTask','renren',0,NULL,0,'2020-06-02 18:00:00'),(55,1,'testTask','renren',0,NULL,1,'2020-06-02 18:30:00'),(56,1,'testTask','renren',0,NULL,1,'2020-06-02 19:30:00'),(57,1,'testTask','renren',0,NULL,1,'2020-06-02 20:00:00'),(58,1,'testTask','renren',0,NULL,0,'2020-06-02 20:30:00'),(59,1,'testTask','renren',0,NULL,0,'2020-06-02 21:00:00'),(60,1,'testTask','renren',0,NULL,1,'2020-06-02 21:30:00'),(61,1,'testTask','renren',0,NULL,1,'2020-06-02 22:00:00'),(62,1,'testTask','renren',0,NULL,1,'2020-06-02 22:30:00'),(63,1,'testTask','renren',0,NULL,0,'2020-06-02 23:00:00'),(64,1,'testTask','renren',0,NULL,1,'2020-06-02 23:30:00'),(65,1,'testTask','fireflynay',0,NULL,1,'2020-06-03 15:00:00'),(66,1,'testTask','fireflynay',0,NULL,1,'2020-06-03 15:30:00'),(67,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 16:00:00'),(68,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 16:30:00'),(69,1,'testTask','fireflynay',0,NULL,1,'2020-06-03 17:00:00'),(70,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 17:30:00'),(71,1,'testTask','fireflynay',0,NULL,1,'2020-06-03 18:00:00'),(72,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 18:30:00'),(73,1,'testTask','fireflynay',0,NULL,1,'2020-06-03 19:00:00'),(74,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 19:30:00'),(75,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 20:00:00'),(76,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 20:30:00'),(77,1,'testTask','fireflynay',0,NULL,1,'2020-06-03 21:00:00'),(78,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 21:30:00'),(79,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 22:00:00'),(80,1,'testTask','fireflynay',0,NULL,1,'2020-06-03 23:00:00'),(81,1,'testTask','fireflynay',0,NULL,0,'2020-06-03 23:30:00'),(82,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 13:00:00'),(83,1,'testTask','fireflynay',0,NULL,1,'2020-06-04 13:30:00'),(84,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 14:00:00'),(85,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 14:30:00'),(86,1,'testTask','fireflynay',0,NULL,1,'2020-06-04 15:00:00'),(87,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 15:30:00'),(88,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 16:00:00'),(89,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 16:30:00'),(90,1,'testTask','fireflynay',0,NULL,1,'2020-06-04 17:00:00'),(91,1,'testTask','fireflynay',0,NULL,1,'2020-06-04 17:30:00'),(92,1,'testTask','fireflynay',0,NULL,1,'2020-06-04 18:00:00'),(93,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 18:30:00'),(94,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 19:30:00'),(95,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 20:00:00'),(96,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 20:30:00'),(97,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 21:00:00'),(98,1,'testTask','fireflynay',0,NULL,1,'2020-06-04 21:30:00'),(99,1,'testTask','fireflynay',0,NULL,1,'2020-06-04 22:00:00'),(100,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 22:30:00'),(101,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 23:00:00'),(102,1,'testTask','fireflynay',0,NULL,0,'2020-06-04 23:30:00'),(103,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 11:00:00'),(104,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 11:30:00'),(105,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 12:00:00'),(106,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 12:30:00'),(107,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 13:00:00'),(108,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 13:30:00'),(109,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 14:00:00'),(110,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 14:30:00'),(111,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 15:00:00'),(112,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 15:30:00'),(113,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 16:00:00'),(114,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 16:30:00'),(115,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 17:00:00'),(116,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 17:30:00'),(117,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 18:00:00'),(118,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 18:30:00'),(119,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 19:00:00'),(120,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 19:30:00'),(121,1,'testTask','fireflynay',0,NULL,1,'2020-06-05 20:00:00'),(122,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 20:30:00'),(123,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 21:00:00'),(124,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 21:30:00'),(125,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 22:30:00'),(126,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 23:00:00'),(127,1,'testTask','fireflynay',0,NULL,0,'2020-06-05 23:30:00'),(128,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 11:00:00'),(129,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 11:30:00'),(130,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 12:00:00'),(131,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 12:30:00'),(132,1,'testTask','fireflynay',0,NULL,1,'2020-06-06 13:00:00'),(133,1,'testTask','fireflynay',0,NULL,1,'2020-06-06 19:00:00'),(134,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 19:30:00'),(135,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 20:00:00'),(136,1,'testTask','fireflynay',0,NULL,1,'2020-06-06 20:30:00'),(137,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 21:00:00'),(138,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 21:30:00'),(139,1,'testTask','fireflynay',0,NULL,0,'2020-06-06 22:00:00'),(140,1,'testTask','fireflynay',0,NULL,1,'2020-06-06 23:30:00'),(141,1,'testTask','fireflynay',0,NULL,7,'2020-06-07 00:00:00'),(142,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 00:30:00'),(143,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 01:00:00'),(144,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 10:30:00'),(145,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 11:00:00'),(146,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 11:30:00'),(147,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 12:00:00'),(148,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 12:30:00'),(149,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 13:00:00'),(150,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 13:30:00'),(151,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 14:00:00'),(152,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 14:30:00'),(153,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 15:00:00'),(154,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 15:30:00'),(155,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 16:00:00'),(156,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 16:30:00'),(157,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 17:00:00'),(158,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 17:30:00'),(159,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 18:00:00'),(160,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 19:30:00'),(161,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 20:00:00'),(162,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 20:30:00'),(163,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 21:00:00'),(164,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 21:30:00'),(165,1,'testTask','fireflynay',0,NULL,0,'2020-06-07 22:00:00'),(166,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 22:30:00'),(167,1,'testTask','fireflynay',0,NULL,1,'2020-06-07 23:00:00'),(168,1,'testTask','fireflynay',0,NULL,0,'2020-06-08 17:00:00'),(169,1,'testTask','fireflynay',0,NULL,1,'2020-06-08 17:30:00'),(170,1,'testTask','fireflynay',0,NULL,0,'2020-06-08 18:00:00'),(171,1,'testTask','fireflynay',0,NULL,1,'2020-06-08 18:30:00'),(172,1,'testTask','fireflynay',0,NULL,0,'2020-06-08 19:00:00'),(173,1,'testTask','fireflynay',0,NULL,1,'2020-06-08 19:30:00'),(174,1,'testTask','fireflynay',0,NULL,1,'2020-06-08 20:00:00'),(175,1,'testTask','fireflynay',0,NULL,1,'2020-06-08 20:30:00'),(176,1,'testTask','fireflynay',0,NULL,1,'2020-06-08 21:00:00'),(177,1,'testTask','fireflynay',0,NULL,1,'2020-06-08 21:30:00'),(178,1,'testTask','fireflynay',0,NULL,0,'2020-06-08 22:00:00'),(179,1,'testTask','fireflynay',0,NULL,0,'2020-06-08 22:30:00'),(180,1,'testTask','fireflynay',0,NULL,0,'2020-06-08 23:00:00'),(181,1,'testTask','fireflynay',0,NULL,1,'2020-06-08 23:30:00'),(182,1,'testTask','fireflynay',0,NULL,5,'2020-06-09 00:00:00'),(183,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 00:30:00'),(184,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 01:00:00'),(185,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 13:00:00'),(186,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 13:30:00'),(187,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 14:00:00'),(188,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 14:30:00'),(189,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 15:00:00'),(190,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 15:30:00'),(191,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 16:00:00'),(192,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 16:30:00'),(193,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 17:00:00'),(194,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 17:30:00'),(195,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 18:00:00'),(196,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 18:30:00'),(197,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 19:00:00'),(198,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 19:30:00'),(199,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 20:00:00'),(200,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 20:30:00'),(201,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 21:00:00'),(202,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 21:30:00'),(203,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 22:00:00'),(204,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 22:30:00'),(205,1,'testTask','fireflynay',0,NULL,1,'2020-06-09 23:00:00'),(206,1,'testTask','fireflynay',0,NULL,0,'2020-06-09 23:30:00'),(207,1,'testTask','fireflynay',0,NULL,5,'2020-06-10 00:00:00'),(208,1,'testTask','fireflynay',0,NULL,1,'2020-06-10 16:00:00'),(209,1,'testTask','fireflynay',0,NULL,0,'2020-06-12 18:30:00'),(210,1,'testTask','fireflynay',0,NULL,0,'2020-06-12 19:00:00'),(211,1,'testTask','fireflynay',0,NULL,1,'2020-06-12 19:30:00'),(212,1,'testTask','fireflynay',0,NULL,0,'2020-06-12 20:00:00'),(213,1,'testTask','fireflynay',0,NULL,0,'2020-06-12 20:30:00'),(214,1,'testTask','fireflynay',0,NULL,0,'2020-06-12 21:00:00'),(215,1,'testTask','fireflynay',0,NULL,1,'2020-06-12 21:30:00'),(216,1,'testTask','fireflynay',0,NULL,0,'2020-06-12 22:00:00'),(217,1,'testTask','fireflynay',0,NULL,0,'2020-06-12 22:30:00'),(218,1,'testTask','fireflynay',0,NULL,0,'2020-06-12 23:30:00'),(219,1,'testTask','fireflynay',0,NULL,1,'2020-06-13 11:30:00'),(220,1,'testTask','fireflynay',0,NULL,1,'2020-06-13 12:30:00'),(221,1,'testTask','fireflynay',0,NULL,1,'2020-06-13 13:00:00'),(222,1,'testTask','fireflynay',0,NULL,3,'2020-06-15 00:00:00'),(223,1,'testTask','fireflynay',0,NULL,0,'2020-06-15 10:30:00'),(224,1,'testTask','fireflynay',0,NULL,1,'2020-06-15 11:00:00'),(225,1,'testTask','fireflynay',0,NULL,1,'2020-06-15 11:30:00'),(226,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 13:30:00'),(227,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 14:00:00'),(228,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 14:30:00'),(229,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 15:00:00'),(230,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 15:30:00'),(231,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 16:00:00'),(232,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 16:30:00'),(233,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 17:00:00'),(234,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 17:30:00'),(235,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 18:00:00'),(236,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 18:30:00'),(237,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 19:00:00'),(238,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 19:30:00'),(239,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 20:30:00'),(240,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 21:00:00'),(241,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 21:30:00'),(242,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 22:00:00'),(243,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 22:30:00'),(244,1,'testTask','fireflynay',0,NULL,0,'2020-06-22 23:00:00'),(245,1,'testTask','fireflynay',0,NULL,1,'2020-06-22 23:30:00'),(246,1,'testTask','fireflynay',0,NULL,1,'2020-06-23 13:30:00'),(247,1,'testTask','fireflynay',0,NULL,0,'2020-06-23 15:30:00'),(248,1,'testTask','fireflynay',0,NULL,0,'2020-07-06 15:30:00'),(249,1,'testTask','fireflynay',0,NULL,0,'2020-07-06 16:00:00'),(250,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 16:30:00'),(251,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 17:00:00'),(252,1,'testTask','fireflynay',0,NULL,0,'2020-07-06 17:30:00'),(253,1,'testTask','fireflynay',0,NULL,0,'2020-07-06 18:00:00'),(254,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 18:30:00'),(255,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 19:00:00'),(256,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 19:30:00'),(257,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 20:00:00'),(258,1,'testTask','fireflynay',0,NULL,0,'2020-07-06 20:30:00'),(259,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 21:00:00'),(260,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 21:30:00'),(261,1,'testTask','fireflynay',0,NULL,0,'2020-07-06 22:00:00'),(262,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 22:30:00'),(263,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 23:00:00'),(264,1,'testTask','fireflynay',0,NULL,1,'2020-07-06 23:30:00'),(265,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 13:00:00'),(266,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 13:30:00'),(267,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 14:00:00'),(268,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 14:30:00'),(269,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 15:00:00'),(270,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 15:30:00'),(271,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 16:00:00'),(272,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 16:30:00'),(273,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 17:00:00'),(274,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 17:30:00'),(275,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 18:00:00'),(276,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 18:30:00'),(277,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 19:00:00'),(278,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 19:30:00'),(279,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 20:00:00'),(280,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 20:30:00'),(281,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 21:00:00'),(282,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 21:30:00'),(283,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 22:00:00'),(284,1,'testTask','fireflynay',0,NULL,0,'2020-07-09 22:30:00'),(285,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 23:00:00'),(286,1,'testTask','fireflynay',0,NULL,1,'2020-07-09 23:30:00'),(287,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 11:00:00'),(288,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 12:00:00'),(289,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 12:30:00'),(290,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 13:00:00'),(291,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 13:30:00'),(292,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 14:00:00'),(293,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 14:30:00'),(294,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 15:00:00'),(295,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 15:30:00'),(296,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 16:00:00'),(297,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 16:30:00'),(298,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 17:00:00'),(299,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 17:30:00'),(300,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 18:00:00'),(301,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 18:30:00'),(302,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 19:00:00'),(303,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 19:30:00'),(304,1,'testTask','fireflynay',0,NULL,2,'2020-07-10 20:00:00'),(305,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 20:30:00'),(306,1,'testTask','fireflynay',0,NULL,1,'2020-07-10 21:00:00'),(307,1,'testTask','fireflynay',0,NULL,0,'2020-07-10 21:30:00'),(308,1,'testTask','fireflynay',0,NULL,1,'2022-03-20 10:30:00'),(309,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 11:00:00'),(310,1,'testTask','fireflynay',0,NULL,1,'2022-03-20 11:30:00'),(311,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 12:00:00'),(312,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 12:30:00'),(313,1,'testTask','fireflynay',0,NULL,1,'2022-03-20 13:00:00'),(314,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 13:30:00'),(315,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 14:00:00'),(316,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 14:30:00'),(317,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 15:00:00'),(318,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 15:30:00'),(319,1,'testTask','fireflynay',0,NULL,1,'2022-03-20 16:00:00'),(320,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 16:30:00'),(321,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 17:00:00'),(322,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 17:30:00'),(323,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 18:00:00'),(324,1,'testTask','fireflynay',0,NULL,1,'2022-03-20 18:30:00'),(325,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 19:00:00'),(326,1,'testTask','fireflynay',0,NULL,0,'2022-03-20 19:30:00'),(327,1,'testTask','fireflynay',0,NULL,1,'2022-03-20 20:00:00'),(328,1,'testTask','fireflynay',0,NULL,1,'2022-03-20 20:30:00');
/*!40000 ALTER TABLE `schedule_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_captcha`
--

DROP TABLE IF EXISTS `sys_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_captcha`
--

LOCK TABLES `sys_captcha` WRITE;
/*!40000 ALTER TABLE `sys_captcha` DISABLE KEYS */;
INSERT INTO `sys_captcha` VALUES ('027ea200-df77-4fd4-8eea-cf78f7fb2023','pwexg','2020-06-04 18:34:49'),('03324fa8-36af-439e-840b-30fcad65f6b1','e568f','2020-05-31 19:33:35'),('0c159600-76da-49c7-8313-872d6d2802b7','7wyxw','2020-06-04 12:52:51'),('1341f11a-9044-4a17-8e10-6200c1a6c4f9','3wym7','2020-05-31 19:54:24'),('142702cc-b370-4ee3-83de-9c10cdefe938','wwdng','2020-06-23 15:56:11'),('14fd5939-5b26-4489-8d56-c46a2e4b28f9','xwnp2','2020-06-23 15:34:57'),('1b10ff7f-d12e-4381-8cc9-79febd353970','7n7gm','2020-05-31 19:33:27'),('1d406841-28f0-4ad0-8042-07417a62e1fd','c8axn','2020-06-04 18:34:15'),('294b1c97-f8df-4244-88c4-47141c8d56af','bgcyw','2020-07-09 13:18:19'),('3c82fc6b-31f5-48a5-83a4-ceca5f598179','6w52n','2020-06-23 15:56:14'),('42f6f840-fc40-4e8a-8528-b79a4a2b8f2a','654ed','2020-06-04 18:34:33'),('43cd5131-d40b-4a0e-8ba8-f7f68df6f849','4dem4','2020-06-04 18:34:49'),('55779b39-e638-4a2f-8462-c20297531925','x3bpb','2020-06-02 22:50:47'),('640dbcfb-f3cd-421c-8d81-eeac7b11bb87','27n4g','2020-05-31 19:55:20'),('73031619-e44a-40f7-8ac8-baf960e8df6d','gcawe','2020-06-04 12:55:50'),('737d045c-d156-46f9-899a-83aec5846c69','gdaxy','2020-06-22 13:39:52'),('7bdfb155-9e27-446c-8e0d-89bc1ff519ed','54dfb','2020-05-31 20:27:33'),('9b2990ef-98c2-4865-83d3-c04286488498','npec2','2020-06-03 15:05:49'),('a0c259cd-9a98-4e6f-893b-f0d203803548','xbm2n','2020-06-04 18:34:49'),('a3ae36dd-0cc3-434c-870e-692785911564','c664y','2020-06-13 12:31:03'),('a6819c8e-3e7e-44de-8721-0db9d915fbf1','7n246','2020-06-04 18:34:49'),('ac99ae8c-ec94-4c23-8cce-550570983503','fe7en','2020-06-04 18:34:46'),('b8ffa0df-2964-4929-8cec-b7c20f3117fe','y6e73','2020-05-31 18:04:52'),('bc588733-8369-4fe0-84d3-ec536a3304a4','n5cbf','2020-05-31 19:53:44'),('c2b49735-63aa-4d13-8a8f-f3f325e94f38','dbmb8','2020-06-03 15:05:42'),('c79c06bf-1724-4c16-8172-b78106fb86bf','f8db4','2020-06-13 11:06:43'),('dd3ab546-a671-4fcc-8b9c-11c0d6254b72','8g5f6','2020-06-23 13:39:27'),('f4c57fb0-a2cb-4355-8198-3d4ba215c575','ancc5','2020-06-12 18:30:33'),('f69bd42b-4f2a-4d96-8176-6701e3621b13','6g237','2020-05-31 19:55:17'),('ff8267ba-eb4b-49f1-8fe5-62188f93b8cb','abxcn','2020-06-09 00:30:58');
/*!40000 ALTER TABLE `sys_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `param_key` (`param_key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统配置信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'CLOUD_STORAGE_CONFIG_KEY','{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}',0,'云存储配置信息');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES (1,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":31,\"parentId\":0,\"name\":\"商品系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"zhedie\",\"orderNum\":0}]',16,'0:0:0:0:0:0:0:1','2020-05-31 18:33:19'),(2,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":32,\"parentId\":31,\"name\":\"分类维护\",\"url\":\"product/category\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]',15,'0:0:0:0:0:0:0:1','2020-05-31 18:34:36'),(3,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":33,\"parentId\":31,\"name\":\"品牌管理\",\"url\":\"product/brand\",\"perms\":\"\",\"type\":1,\"icon\":\"system\",\"orderNum\":0}]',18,'0:0:0:0:0:0:0:1','2020-06-01 14:23:02'),(4,'admin','保存用户','io.renren.modules.sys.controller.SysUserController.save()','[{\"userId\":2,\"username\":\"fireflynay\",\"password\":\"f35b148a296ded29376259f9e7e57650a606be557973c67e7e6807a612d3fdfd\",\"salt\":\"18lAY9Gul41yGzBkSTpT\",\"email\":\"1046762075s@gmail.com\",\"mobile\":\"18156475879\",\"status\":1,\"roleIdList\":[],\"createUserId\":1,\"createTime\":\"Jun 6, 2020 11:17:16 PM\"}]',127,'0:0:0:0:0:0:0:1','2020-06-06 23:17:16'),(5,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":31,\"parentId\":0,\"name\":\"設備系统\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"editor\",\"orderNum\":0,\"list\":[]}]',9,'0:0:0:0:0:0:0:1','2022-03-20 13:33:06'),(6,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":41,\"parentId\":31,\"name\":\"設備維護\",\"url\":\"product/spu\",\"perms\":\"\",\"type\":0,\"icon\":\"zonghe\",\"orderNum\":0,\"list\":[]}]',9,'0:0:0:0:0:0:0:1','2022-03-20 13:35:49'),(7,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','[73]',21,'0:0:0:0:0:0:0:1','2022-03-20 13:36:01'),(8,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":41,\"name\":\"監視器管理\",\"url\":\"product/spu\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2022-03-20 13:36:28'),(9,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','[69]',10,'0:0:0:0:0:0:0:1','2022-03-20 13:37:15'),(10,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":41,\"name\":\"監視器管理\",\"url\":\"product/camera\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]',8,'0:0:0:0:0:0:0:1','2022-03-20 13:37:43'),(11,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":68,\"parentId\":41,\"name\":\"監視器管理\",\"url\":\"product/camerainfo\",\"perms\":\"\",\"type\":1,\"icon\":\"config\",\"orderNum\":0,\"list\":[]}]',7,'0:0:0:0:0:0:0:1','2022-03-20 13:39:30'),(12,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','[68]',11,'0:0:0:0:0:0:0:1','2022-03-20 13:40:38'),(13,'admin','删除菜单','io.renren.modules.sys.controller.SysMenuController.delete()','[41]',10,'0:0:0:0:0:0:0:1','2022-03-20 13:40:44'),(14,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":76,\"parentId\":31,\"name\":\"監視器管理\",\"url\":\"product/camerainfo\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0,\"list\":[]}]',13,'0:0:0:0:0:0:0:1','2022-03-20 13:41:55');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,0,'系统管理',NULL,NULL,0,'system',0),(2,1,'管理员列表','sys/user',NULL,1,'admin',1),(3,1,'角色管理','sys/role',NULL,1,'role',2),(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),(5,1,'SQL监控','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4),(6,1,'定时任务','job/schedule',NULL,1,'job',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),(30,1,'文件上传','oss/oss','sys:oss:all',1,'oss',6),(31,0,'設備系统','','',0,'editor',0),(32,31,'分类维护','product/category','',1,'menu',0),(76,31,'監視器管理','product/camerainfo','',1,'bianji',0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oss`
--

DROP TABLE IF EXISTS `sys_oss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='文件上传';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oss`
--

LOCK TABLES `sys_oss` WRITE;
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色与菜单对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','1046762075@qq.com','18173516309',1,1,'2020-05-20 05:20:00'),(2,'fireflynay','f35b148a296ded29376259f9e7e57650a606be557973c67e7e6807a612d3fdfd','18lAY9Gul41yGzBkSTpT','1046762075s@gmail.com','18156475879',1,1,'2020-06-06 23:17:16');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户与角色对应关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_token`
--

DROP TABLE IF EXISTS `sys_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统用户Token';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_token`
--

LOCK TABLES `sys_user_token` WRITE;
/*!40000 ALTER TABLE `sys_user_token` DISABLE KEYS */;
INSERT INTO `sys_user_token` VALUES (1,'a3adf13c1b8b926274e00c6f3ecd2fc1','2022-03-20 23:14:49','2022-03-20 11:14:49');
/*!40000 ALTER TABLE `sys_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-20 20:46:51
