-- MySQL dump 10.13  Distrib 5.5.10, for AIX6.1 (powerpc)
--
-- Host: 10.41.192.66    Database: labs115
-- ------------------------------------------------------
-- Server version	5.5.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `labs115`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `labs115` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `labs115`;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('20150507108',1,'test_audit.bpmn20.xml','20150507107','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"test_audit\" name=\"æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹\" isExecutable=\"true\">\n    <startEvent id=\"start\" name=\"å¯åŠ¨å®¡æ‰¹\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\n    <endEvent id=\"end\" name=\"ç»“æŸå®¡æ‰¹\"/>\n    <userTask id=\"modify\" name=\"å‘˜å·¥è–ªé…¬æ¡£çº§ä¿®æ”¹\" activiti:assignee=\"${apply}\"/>\n    <userTask id=\"audit\" name=\"è–ªé…¬ä¸»ç®¡åˆå®¡\" activiti:assignee=\"system\"/>\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\n    <userTask id=\"audit2\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨éƒ¨é•¿å®¡æ ¸\" activiti:assignee=\"system\"/>\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\n    <userTask id=\"audit3\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨åˆ†ç®¡é¢†å¯¼å®¡æ ¸\" activiti:assignee=\"system\"/>\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\n    <userTask id=\"audit4\" name=\"é›†å›¢æ€»ç»ç†å®¡æ‰¹\" activiti:assignee=\"system\"/>\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\n    <userTask id=\"apply_end\" name=\"è–ªé…¬æ¡£çº§å…‘ç°\" activiti:assignee=\"system\"/>\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"æ˜¯\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"æ˜¯\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"å¦\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"æ˜¯\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"æ˜¯\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"å¦\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"å¦\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"å¦\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"é”€æ¯\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('20150507109',1,'test_audit.png','20150507107','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\Ü\0\0|\0\0\0=Ó³\Ú\0\0S\âIDATx\Ú\í\İ|TõÿÿS Š·¿h©Ë²ül\êeÕ®Z1†‹4–X \â­K]Š¬RVV©\"\ÔZ/À\"\Z1…c\nÄ€‘†šD.I\ácŒ1f¥˜E\Ä\Òc\ã÷>\ß9\ç03™I2I˜\ÌL^\Ï\Ç\ãó\È\\\Î\\2\çû>s>sÎœ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€\î§/\0\0\0\0\0+Á,eı\0\0\0\0\0 Ş¬/\ÌJ²ş\á%\0\0\0\0 sšm»É–-ÜŸ\Ñt\0\0\0\0\Ğy\Ívk—\0\0\0\0€V$´\ÒT\Û\×ón\0\0\0\0\0‚l¶[k¦\Ù\Ò\r\0\0\0\0@\ÅÁm¹vz\0\0\0\0\0ºm³=¦·«£\é\0\0\0\0 óš\íÎº=\0\0\0\0\0Q§µ¤…ú~\0\0\0\0\0ˆšf»³vgK7\0\0\0\0 \Ûó=\à\Ù÷Ìº\Óú\ß\Ûq 5\0\0\0\0@·o¶\Çx4\Í\Ë\ÌR\Öß¶6İnG\Ó\r\0\0\0\0\èöÍ¶¸\ÓjšUM·g³m\×D\ëùN7\0\0\0\0 \Û\Ôûk[jºıMŸ\êgz¾\Ó\r\0\0\0\0\è6\ÍvBM´¿¦»­Í¶o\Ó\Í\î\å\0\0\0\0€¨\ÓÖ¦·µ¦;\Øf\Ûóñ?3\Ø\Ò\r\0\0\0\0ˆ\Âf»­\Ín ¦»G;›m\ß\é\0\0\0\0t\Ûf»¥¦»ª\ÍvGŸ\0\0\0\0\0a££[”ı5\İi¶}›n¾\Ó\r\0\0\0\0],Î¬\Ç\Í\Ê6k§Õ¬)ªM•\ÔÁ\×^v#÷İ²]e]\ŞI\ÌŠ¢(Š¢(*ÊªÎ¬j³r\Íz\Æpoh\êE;‡p\Ô\×\Z¤ŸšUd\Ö³Æ™u±Y}xyÚ¤µ£’·¦¥-\Ümù\î@\Ø\Â\r\0\0€h$}\Ê Ã½‡©ô2[\Í:h¸76õ\ã\åA¸˜l5Ú‹Íº€—£C¤¹­3N\Ìw¸\Û\Ótón\0\0\0t\'\ÌJ¶Ögòr +\É\îo˜•o¸·d£óš\î`¶(ú\é/G)¦\é\æ(\å\0\0\0\è®d\Ëw¹\áşš\ì\é¼\è\n\Òlg|\Ï\áD6İ­5»­ı\Îvk¿\Ó\Èƒ\ß\á\0\0@÷\Ö\Ç\êw²\éyj²y>\ï„jmskÍ¶\ÑÎ¦\ÛŞ­}³\0\0\0\04\İzK÷#¼9@š|g›\İ\ÈO¼@[º\Û\Úl\ÛtÛG³\r\0\0\0¸\É\î\å²÷\'RCH\Èü’yB&Áh¾{÷Fğ¿³\í¯\é\èó8|g\0\0\0hNúŸ$^„‚l\İ\æh\ä¡oº=¤\æ\Ù<·¥\Ù6Z¹?ı\0\0\0&G/—Ÿ\ã+µ8¡\â÷\ïl#ô|w/—fy¢üO}ùŞ®£¿ÿ\r\0\0\0t[YgÆ‰ö”YsxÂ¦\é\î(»«\0\0\0hNú gxp\"\É!ñ9 Vt4İİ¼\0\0\0\ÑLÖ›syp\"\í48:y8\è\èn\à\ìF\0\0\0GV^\ÍË€Iš´>¼a\Õt»…š¤\0\0\0Á“>¨—\'’\â%+Á\î\În\ä\0\0\0\0ı`\è\ä&zˆ\áşD\ï\à\0\0\0ôC`€¡¬f:¡…\ë?£\Ù\0\0\0\è‡À\0Cğm\éf7r\0\0\0€~0tr\ÓM³\r\0\0\0\Ğ†Nnº“h¶\0\0\0ú!0ÀĞ¹¦YóŠŸş\0\0\0\è‡À\0C\'Ê²\æU/^\n\0\0\0€~0t8³\\[¸\0\0\0ú!0ÀĞ©2­ù$µ“—\0\0\0 7\Ä8¾u\Û.š\0\0\0\Ğ†\Êòi¶\í­\Ü|—\0\0\0 \í\äo\ë¶]\ãxy\0\0\0\0ú!0À\Ğ>\Ùšm©\"^\0\0\0€~0¯¥­\Û|—\0\0\0 \í”\ÕJ³\Í\Ë\0\0\0ú!0ÀÀ¼\0\0\0X\Ç\Ì+\0\0\0€ul€Æ¼\0\0\0À:6``^\0\0\0¬cƒ\æ\0\0\0À:6À\0c^\0\0\0`00¯\0\0\0\0Ö±Á\0ó\n\0\0\0``€1¯\0\0\0\0°\r˜W\0\0\0\0\ë\Ø`€y\0\0\0°\r0À˜W\0\0\0\0X\Ç\Ì+\0\0\0€ul0ÀÀ¼\0\0\0X\Ç`\Ì+\0\0\0\0¬cƒ\æ\0\0\0À:6``^\0\0\0¬c0\æ\0\0\0\0Ö±Á\0ó\n\0\0\0`00¯\0\0\0\0Ö±ó\n\0\0\0\0\ë\Ø`€y\0\0\0°\r˜W\0\0\0\0\ë\Ø\0Œy\0\0\0°\r0À˜W¼\0\0\0\0\ë\Ø`€y\0\0\0°\r˜W\0\0\0\0\ë\Ø\0Œy\0\0\0€ul0ÀÀ¼\0\0\0X\Ç\Ì+\0\0\0€ul€Æ¼\0\0\0À:6``^\0\0\0¬cƒ\æ\0\0\0À:6À\0c^\0\0\0`00¯\0\0\0\0Ö±Á\0ó\n\0\0\0``€1¯\0\0\0\0°\r˜W\0\0\0\0\ë\Ø`€y\0\0\0°\r0À˜W\0\0\0\0X\Ç,¤ÿ°R½SRRfNœ8qolllC\ïŞ½•õ:PP={öü\îüó\Ïÿløğ\áÍ¿#‰\0\0\0\è‡À\0\ë–-[v\ÏÈ‘#\ëcbbÔœ9³U~~jhø\Ê\ìÁ¿£:©\äõ,**T‰‰Ï©6ö\ï\ß¯ù\Ò_L\Ô\0\0\0@?X”JM}e}¿~ıTR\Ò\Ê\åj4›\Ã&*•œ¼Hõ\é\Ó\ç«SO=õ&\â\0\0\0ú!0À¢°Ù¾\à‚TQ\Ñv³	ü–\nq•——©¾}ûşÃœcˆ\0\0\0\è‡À\0‹Ë–-½G¶lm3›?—W-]ú’\Z3&A\Zu½ºşúk\Ô\rñ#Uò¢¤f\ÓQ¯òò½\ê”SNù\Â`÷r\0\0\0\ĞÿœR½G¼¦>)\éyó\ä7^µbùR5ú\ç£Ô­·Œ\Õ5vÌ*>şZ5t\èj‘nº¿¡:¹\çŞ«W¯<b\0\0\0ú!0À\"\\J\ÊÂ™11?R.W½\Ùğ5zUÂ¨x\İh\ßp\ÃH§~ö³\ë\ÔğaWšMwl³\é©Î©³\Ï>ûSs\Ö\Ä=\0\0\0\ĞÁ&Nœ°wÎœ\'\ÍF\ï\ëf5bxœzaÁ|•õV†Jy1IoÙ¾j\ÄP}¹œv¹¾ô{;ªc5mÚ½;\ÍY“Hô\0\0\0@?X‹ÒŸŸc6z\r\Í\ê\î»\'ªƒıTm\İò\Êş\Óµ\ê\ÕTµ>sú¸úCõ?S\'«o¿ı\Ò\ïí¨Õ»\ï\æ0g\ÍN¢\0\0\0ú!0À\"X\ïŞ½UC\Ã\çf£Wß¬›õ*.Ú¢voU»w•\è’\Ó;vlW=ö\ß\ÛP/™\æ¬q=\0\0\0\Ğ\áÿŸR_6+—\ë\ïjÖ¬™j\Êo&©’’BUş\Ş]»v\íP\Ó\îûo5\ãÁû\Ô\×_\î÷¶TÇ‹\0\0\0\è‡À\0‹Š†»Î«\Z?W\ëÖ½¦bcªª?ªTN¿Ï«JK‹Õ\Ë/U¯¯NU\r\rŸ5»=\ÕñbÁ\0\0\0ú!0À¢¢\áş‡S\ß}wL½µ!]\r\Z«jª«\Ô{e»U\î\æ*ó\Í?ª´\×Wª\ÔW^2›ñ4½{ù•W^®\Ò\ÓW¨o¿ı\Â\ë>¨6\0\0\0\Ğ\r÷1§¶nÙ¤k[šì¼¼\Í\êÍŒt\İh¯X¾D½¼x‘Jz\áYõÌ¼§õ\Ô¿´P]{\Íµñ\í5^÷Au¼X°\0\0€~°¨h¸ÿ\î\Ôc³~§D.õ²\ÔÅº–¼œ¬’-P\Ï\'\ÎSÿ;÷Iõ\Ä\ïQ3güV=ùÄ£f³©~7ó~¯û :^,\Ø\0\0\0@?XT4\Ü_8%\r·ü\Ø\í·İ¬\ŞH{U7\Ú\Ò|?;š;\ç	õÜ³su\Ó-Mø˜\Ñ	js\Î\ÛV\ÃıÕ‰Å‚\r\0\0\0ôC`€EE\Ã}Ô©½{·©G™¡~yû8\İPË®\äş*.nˆúõ„ñzkwi\é»^÷Au¼X°\0\0€~°¨h¸?÷*\×7S_~ù©J|\îi•0\ê:5bø•j\è\Ğ+TÜ•C\ÔP³Ñ¾\æ\ê\á\êû\ïQÇıEO\ë{{ª\ãÅ‚\r\0\0\0ôC`€EE\Ã}„\n³bÁ\0\0\0ú!0À¢¢\áşŒ\n³bÁ\0\0\0ú!0À¢¢\á>L…Y±`\0\0\0ı`Q\Ñpÿ\n³bÁ\0\0\0ú!0À¢¢\á>D…Y±`\0\0\0ı`Q\Ñp¤Â¬X°\0\0€~°¨h¸PaVmwO˜\Õ@<\0\0@?XX7\Ü¥Â¬Zw\Òhm]\Ï\Â\0\0\0ôC`€…w\Ã]\ë·äº…g«\Ä\Ä\Çu\í\ÛW¬/+)\Ùğ6Á–\Ü_ffªs:\'\çu}ººz[ÀÛ”—¿£ö\ì\Éñz¾\ÏK\ÎÏš5­\ÙcÍŸ?KŸ>th\×uUU[ôõG”7{¼\Ú\Ú\Òf—UV\è\ékj\nõù\r–«3\Î8½\İÿ»¿\ëZi´i¸\0\0@?Xø7ÜŸú­\ã\r¡÷eYY+¼.»ù\æ5yò¯Ì†¼H—œ¾÷\Ş;ór›¹sr¦\ïÙ³§JN\ã\\\çn\æİ§\Ë\Ëÿl6\Îo«3\Ï<CO[]½U?\İ`n\Üøª\Z?şjÂ„[ôi¹¬¶v§ş+\Óz>Ï•+_pN\ïß¿Cÿ­¬\ÌWkõiyL\Ï\égÏ©}_ÿ\Ïr~Ê”ÿtÃ¾/\Ï\éü·^\ç/¿ü\'zúÑ£¯\×\ÏÏ¾\î\ÆGª\é\Ó£\ï\ÜsÿEÍ˜1\Ålğ\ßÕ·©¨\Èø\Ú[óg\á\Şu\\(\0\0\0€~°ğm¸÷û-»©LL|L—\İoÙ².\àm¤.¼ğ\Ç*6ö\Ò§±\ï_š\ÏÃ‡÷\èó”\ê¿yy\éúºúú*}^[ÎŸrJo\İ|o6\Ãw˜\Í\íJ}ù±cX[¸³Ô¡C»Ë—,™¯ŸKF\Æµ`Á\ïõeuu•úoAÁ\Z\çyH.—55\í\Ó«ª\Ü[¯\åù¬Y³XmØ°\Ì\ëy\Û\Óeg¯R¥¥Unnš~\Îr^şû±ıı\Ïò?\È\ëw\Î9?PÃ†]®Ÿ«ı|÷\ï/özmÿ[´i¸\0\0@?X\ä4\ÜiVee›Ô=Ùª±ñc¯ª­İ¡D·±\ëx\Ã\íÿú‚‚?ªk¯S99¯©””9\ê´\ÓN5›\æ\nuò\É\'©;\î¸\Élb\ß6›\ÚOœ\é\í\æR¦­«û@¥§¿¨<O-\\ø”¾\\¦w7\Óx\İF¦—\Ó.W*/ß¬/KM}N?VEÅŸõu‡\íÒ—§¥-Rƒ_ ›yûööı\Ê\ë §\íû^µ*\É\Úú¿T\İ|ó(\çq\ìç“›ûzÀÿ]¶\Ü\Ëõ2¼\Æöc\É}yN×†F›¢(Š¢(wÕ™µÇ¬l³1+Ş¬^¬\ÂôC`€…IÃ½¯Y-Y2O]tÑ¿ª-[Ö¨Õ«ÿ ®»n˜š=ûA}^nSXø¦\ß\ÛI¹\îK^/e\è-\É\î-\Ëó\æ=¤\Ùc\í^¬¯—ó\Ó&%=¡øg³©®P\É\ÉO\ëË¦N`}Wû^½›º=}ccµó&\\]] ²²–©Wx•\\·m\Û:=}vö«ª¦f‹\×\ãz+øõmûö=[o–Ë-SkÖ¤\è†úô»U|ü}\ÙO~2H}¾oy.ò\á\\nß—L\'\×\Å\ÄP—\\2\ØlºW{=–\\\çûúXó\ç³¾5\Âsw³™5Æ¬\Ç\Í\Ê5\ë YIfõc\Ñ#i¶’#€÷#€~°¨j¸?iVrù]wıRŸNK[¨·B{^—™¹\Ä\ï\í¤.¼0\Æj¸›_W_ÿõ]\ç\åú~d‹¶œ.+\Ëv\î÷¬³\ÎÔ»\\\ï\ß_\è<4©\éºÙ–¦Uš\ÛU«^°¾‹½\Íù+Ó§¦Î·¶Lo´\Z\ëµ~ÿ?û8zt¯õ}\ê\Íú|mm‘ó\Ü\ìiW¯NÒ§\Ş\å\\&\Íø7^«O.[¸ğI\İh74|¨ÿO\Ï\Ç\Ê\ÈXìœ—\rššjœı\İõœf\Ï\Ïg>½\Z ñ7¬¦AVt\îañ´;G\Éf}a\ÖL^€÷#€~°ˆn¸ÿ¯Y¹\îÛ\ÓÓ§\ß\åu]f\æ\Ë~o\'u¼\áö}qñ›úöv#+»rWW»·v»\\\Õ\Í\î_\Î/^,»“¿¯(V\é\é‹Ì¦ıbUS\ãnV*±¾Ã½\Şld?V))³­¤\å\ê\ÛoØ°T7õ“&İ¦\Ënö\åú††J§y•\é\n×©‹.ºP7\é\î&<\Çj\æ·6{}Æ½^\İzk‚\Ù,o\Òÿó‘#»Tvö\n\ëh\ë¯zM\ën¸½_‡\Ä\ÄGõYY©~_ÿ\0ó\Ëw‹w¸’-\r²…a­Y§³Ú£rÃ½›,9x?\è‡À\0‹Ì†»¦Yú\'ÁPõõ\ï[JK7›\Ğ5fC[m6¬\Ëü\ŞÆ®\ã\r·ÿ\ëkk\Õò\å\ÏZ?\Óõ\Ùl\ç©ó\Îûj\î\Ü\Çv7\ÜÇŸKrò“º¡İ·o‹n¸\å²\Æ\Æ­­\Äy\Ö.\àif½\Ùl\Ú?²šù>\Ï\Ç8v¬\Ìy^rÿ†>`Z‘\ÙHg[\ß\Ú\ï\í¥\á¶ÿOy\\ù~öwüB\ßV®_°`–3­\\ô\ènu\Ùeÿ¦fÏ®/—\×\Ô\Ğ\ßù^\å÷ş[™oö\ïp&ßŸË²Vr\0´O+G\Ù\ßIx?\è‡À\0‹Ä†ûc¿u\äH©õ³]\èó›œ­Á\r\rú²Ã‡K\ÔM7\Å\ëš2e¼\Ù<¾ª·Ú{n}Z*--\É:\Ùz}CWz»\Õ,¿£ZC%ü#\çú\Ì\Ì\Å\ÎóóÃ†ı\ÔlôSUFFŠJM}F?†}Ü‡¡wñ^\êu›òò?©\ÂÂµº	–š4\éV]r?\î&8\Çl‚\İM\ë\×ï‡ª¬\Ì}´¼¼\Õ\Îó[¼x¶µõ{‰\×kc\è°=c6ı•ú¹\İ{\ïu\èP±š7o¦úş÷{\éûòœVjÕª\çÿQCS^û1}\ï?ŠVrd\Ë»ókºeK÷#¼\0\ïG\0ı`\×pW{UN\Î\nİ¼ö\ï\Ùt\ïlv½\ÜfÚ´‰\Îù††÷›M¨\Z?\Ğ\Ó\Ëı\Ëı>¼\Ãj8_óºwó|ü|II†>\ír}h\á;KŸojªr¦)(x\İ\ë6<ª§÷÷<\äú\â\âuúô¾}ú¯|w¼¦&O\ß\Ï\àÁ\ç;\Ó\Êc¹?0\Èôºı…úºm\Û\Ò\Õ\è\Ñ×ª[o\å÷ñ\ä¹Û—WTd««¯¾B7ò¾÷¿zõ¯û¢1&»ó}jp\à\Z £9úŒ¼ôC`€E\\\ÃıQDUSÓ‡2M¨K{¦\Âq\'®IbqtH29x?\è‡À\0‹¸†»Š\n³Š\Âq\'G‹•#\ÅòT€\ä ºS\Ãı!f¥\ãN¾;—À\"è­\ä\àı ,¢\Z\îJ*\Ì*J\Ç\İ\ã†{W>\0\í7‡¼ôC`€ET\Ãıf¥\ãnŒ\áşi#\0\ËQ./Àû@?X\Ä4\ÜT˜U”;9:\ì)@‡sT\Í\Ë\0ğ~\Ğ1\r÷ûT˜U”;ù-\á:)\09\È@?t£†»œ\n³Š\âq\Ç G\09\ÈĞ\Z\î÷¨0+\Zn\0\ä G\0y,*\Z\î2*ÌŠ†\09\È@^À\0‹Š†{/fE\Ã\r€\ä /`€EEÃ½‡\n³¢\á@\0r0À¢¢\á\ŞM…Y\Ñp G\09\È`\î\ä“Oú®¡¡\ÈlòvQaR_}U¸Ïœ5.ò€\ä /`€E°Áƒ|(?‰\Ù\è•RaR\ë\×?ÿ¶9kv’\'\0\ä G\0y,‚]u\Õe\ë\æÌ™J£F5v\ìUi\æ¬I$O\0\È@\0òX0\à±œóËµƒf7<\ê“=zT˜³&< G\09\È`®ÿ–&%=H³5f\ÌUK\ÍY’K\0#€\ä°\è0\è\Ì3O«/*ZA\ÓÛ…•Ÿ¿t½9/šu1y@\0r0À¢Gü9\çœıwš\î®k¶{ô\èQcÎ‡1\ä	\09\È@^À\0‹Â¦û¤“¾lŞ¼û>\ç;İ¡ûÎ¶µùÁn\Ğl³À\È@\0òt\ë6¨g\Ï\ï\åœ~ú©‡§L¹e÷¦M/lh(¤1\î\Äú\ê«\íûä§¿\äh\ä\Ö\Ò\ä;\Û“\'\0\ä G\0y¬{¸Ô¬9fm5«Áz¨\Î)—\áşmù\é¯8ò€\ä /`€!œeYóª/y\È\0r0À\Ğ9d+±ËšW	¼\ä	 G\0\È@^À\0C\ç\È4ï®½“—ƒ<\ä\09\È`\è¸!\Æñ­\Ûv\áe!O\09@\0ò:&\Ëh~P2\Ù\Ê\Íw¹\É@\0#€¼€†vò·uÛ®q¼<\ä	 G\0\È@^À\0Cûdz«ˆ—‡<\ä\09\È`^K[·ù.7y\È\0r0À\ĞNY­4\Û±œ<\ä\09\È``^1\0#€\ä00¯À<\È@\0ò0À˜W`\ä\09\È``^1\0#€\ä00¯À<\È@\0ò0À˜W`\ä\09\È``^1\0#€\ä00¯À<\È@\0ò0À˜W`\ä G\0\È``^1\0#€\ä00¯À<\È@\0ò0À˜W`\ä G\0\È``^1\0#€\ä00¯À<\È@\0ò0À˜W`\ä G\0\È``^1\0r€\ä00¯À<\È@\0ò0À˜W`\ä G\0\ÈNˆ,k@µT;y™X€y#€\ä\Î³\\­4\Ücx™X€y#€\ä^v\Ív‘Y½x‰X€y#€\äŞ\Z\îq¼<,À<\È@\0ò´Ÿ¿\ïr\Ëw·Ùº\Í\Â\0\Ì#€\ä /@øû.7\ß\İfa\0\æ@\0r d\Zl\İfa\0\æ@\0r \Ó\Åy4\Ü	¼,À<\È@\0òtû»\Ül\İfa\0\æ@\0r \ra€±0\0ó G\09\È\"g)\Õ;%%e\æÄ‰÷\Æ\Æ\Æ6ô\î\İ;\Ğ\ÏpQ-TÏ=¿;ÿüó?>|øFó\ïHF\æ@\0#€¼tcË–-»g\äÈ‘õ111jÎœ\Ù*??O54|eö\à\ßQA–¼nEE…*1ñ95p\àÀ\Æşıû\ï5_\â‹Y€y#\0\ä /\İLj\ê+\ëûõë§’’^P.W£\Ù46QX\ÉÉ‹TŸ>}¾:õ\ÔSoba\0\æ@\0#€¼t£fû‚.PEE\Û\Í\æğ[\êUyy™\êÛ·\ï?Œ\îù»\á,˜G\09@\0òÒ½,[¶ôÙ²]T´\Íl\n]^µt\éKjÌ˜5j\Ôõ\êú\ë¯Q7ÄTÉ‹’šMGµ½\Ê\Ë÷ªSN9\å£û\í^\ÎÂ€y#\0\ä /\İh\î(\Õ{\ä\Èkê“’7O~\ãU+–/U£>J\İz\ËX]c\ÇÜ¨\â\ã¯UC‡^¡\é¦ûª•˜8ÿó^½z\å±0\0ó G\0\È@^¢TJ\ÊÂ™11?R.W½\Ù6zUÂ¨x\İh\ßp\ÃH§~ö³\ë\ÔğaWšMwl³\é©\à\ê\ì³\ÏşÔœq,À<\È\0r—(4qâ„½s\æ<i6€_7«\Ã\ã\Ôæ«¬·2TÊ‹Iz\ËöU#†\ê\Ë\å´\Ëõ¥\ß\ÛQm«i\Ó\î\İiÎ‚D`\ä\09\ÈKŠÒŸŸc6€\r\Í\ê\î»\'ªƒıTm\İò\Êş\Óµ\ê\ÕTµ>sú¸úCõ?S\'«o¿ı\Ò\ïí¨¶Õ»\ï\æ0gÁN`\ä\09\ÈK\êİ»·jhø\Ül\0\ë›\Õc³R\ÅE[Ô\â­j÷®]rzÇ\í\ê±\Çò{ª\í%¯»9\\\İd¨%XƒR\Ç G\0\È@^º\ÍR\ê\Ëf\årı]Íš5SMù\Í$URR¨\Ê\ßÛ£k×®j\Ú}ÿ­f<xŸúú\ë\ÏıŞ–j{u“€Ä›%GeO²ş!v,°r€ä¥›4\Üu^\Õ\Øø¹Z·\î5ûSUıQ¥zpú}^UZZ¬†\\~©z}uªjhø¬\Ùí©¶W7H¼O“-[¸?£\éf\r#\0\ä /İ¤\áş‡S\ß}wL½µ!]\r\Z«jª«\Ô{e»U\î\æ*ó\Í?ª´\×Wª\ÔW^2›ñ4½{ù•W^®\Ò\ÓW¨o¿ı\Â\ë>¨¶W”Ä·\Ùn\ír°À\È\0r—hk¸9µu\Ë&ı[\Û\Òd\ç\åmVof¤\ëF{\Åò%\ê\åÅ‹T\ÒÏªg\æ=­ ¶ø¥…\ê\ÚkF¨o¯ñºª\í\ÅIh¥©¶¯\ç;\İ,°r€Qš—f\İg\ÖZ³ªÍª³pƒYŸ˜•i\ÖLkº(n¸ÿ\î\Ôc³~§D.õ²\ÔÅº–¼œ¬’-P\Ï\'\ÎSÿ;÷Iõ\Ä\ïQ3güV=ùÄ£f³©~7ó~¯û \Ú^Qú†\Ò\Öfš-\İ,°r€Q˜—qf\åZMö+f\İf\Ö ³N·®—¿1V#dM—oÖ„\èl¸¿pJ\Znù	°\Ûo»Y½‘öªn´¥ù~vş5w\Î\ê¹g\ç\ê¦[šğ1£\Ôæœ·­†ûª…o(ñFp[®ƒ¬\à\0\ä G\0\Â4/\ÒDg›Un5Ó½‚¸­4ò›\É[Íº º\Z\î£N\íİ»M=ú\Èõ\Ë\Û\Ç\é†Zv%÷WqqCÔ¯\'Œ\×[»KK\ßõºª\íeo(\í\İb-·«£\éf\r#\0\äˆÜ¼Œ7\ë \á\ŞE¼W\î\ç>\ë~¢ek·\Ùø}\îU®oş¦¾üòS•ø\Ü\Ó*a\Ôuj\Äğ+\ÕĞ¡W¨¸+‡¨¡f£}\Í\Õ\Ã\Õ÷ß£û‹\Ö÷öT\Û+Š\ŞP:º{8»—³À\È\0rDh^d%^¾“\×I÷w©u“££\á>BuQE\ÉJkHõı€€\ä /!2\Şjc:ù~c¬ûô-\İf\ã÷\ÕEo(}´q¶t³‚#\0\äˆ¼HS,»Ç û¿ÔºÿA‘\İp¦º¨\"ü\r\Å÷€g\ß3\ëN\ëo0|oÇ\ÔXÁ\È@\0D@^\äH\ä3Oğc\Èwº·Fv\Ãı7ª‹*‚\ßP|·DK³¼\Ìú–\ÑtºM7+8\09\È€0Î‹üô—¼wk¹»–›\ß!ª‹*B\ßPü\íö}§õ¿¨ šn\ÏfÛ®‰\×ónVp\0r#\0aš—\Ü®¨K©[¹\Í\Æ\ï \ÕEo(š`\ÍsKM·¿\éSıL\ÏwºYÁ\È@\0„Y^\îšõ\n\ácV`¶~\à0¢m\r÷ª‹ª‹\ÒÖ±¨\ÙN¢‰ö\×t·µ\ÙömºÙ½œ€\ä@\äE¾W½8Ä™hœø\ï‹û\Â+«¹Šk¹\áşk‡J\î#3s™s:\'\'MŸ®®\Şğ6\å\å\ï¨={6«’’^÷\ãyŞ®}ûv¨“O>©M\Ïcüø›š]¶f\Í¿\Ógg¯VgyF»ÿç””yòÚ…ñ\ØhO\Ó\ÛZ\Ól³\íùøŸl\éf G\09\Ğ\åyYk\Öm!~Li²Â°\á¶+\Ûğ¿U\Ólüjƒ®={ª\ä\ä9f3\\¬\ï?1ñq\ç´4\Ó\Ò8»›\ÙZ³ñŞ¦²²V:\Ïe\ã\ÆUº10\á}Z.«­-\ÕeZ\'×rJ\ï€\Ï\çĞ¡=zšşY\ßgÿşÿ¤\Ò\Ò^4›\âÿU]ô¯\Î\ã;V\Ù\ì~+*òTMM¡\æ\Ö[®&Oş•3}qq–®°pƒ¾lÒ¤_\ê¿ò8qq?Õ§¥6lX®\Î;\ïÜ _\Ç.n¸[¾\Ív[›\İ@Mwv6\Û6¾\Ó\Í\n@\0r ò\"»w_\âÇŒ1\ë\Ó0n¸=·jğn¸?mw\É\ígÌ˜¢Ş«\Ï8°Kÿ\Í\Ëû£¾®¾ş#}^\Zr»i\Î\ÊZ¡Æ½AM™òŸf³úª\Óz÷\Ûzúòò?\ë\æWJ¦‘\æ¹_¿\êÇ²o3q\âmzZ—\ë\İğ\Êii´×«k¯ª\æ\Í{\Øy\Òx\Û\ÏùÈ‘÷Ô°aCôı\Ø\Ï\Ë~Ş†\ŞZŸ\êœ\Î\ÈX\êœ^³f±s²\Å]nkŸÿş÷{©\Çÿm»^¿0\íi¶[jº«:\Ğlwôù€€\ä /¤Î¬\ÓCü˜òx\r\Ğp{nÕŒs7\Üûƒ®‚‚5º©\Í\ÉYm6³s\Õi§j6\Í\èFô;Æ©\ÒÒª©iŸ3½ı¸2m]]¥JOOQ¯.|Z_.\Ó\Ë_¹\Î\ß\ã]x\áUl\ì¥Ÿ<\î\è\Ñ×©I“n7\é•jñ\âyz´4\èöerÿii\É\Îm\äù\Ée••ùª¬,\Çl\ÜÿOŸ\Ï\Î^\å<gyrº¡¡Z•—\çš\Íz™.¹n\å\Êôéššmº\Ño\Ï\ëf\r·\ï\Ø\è\èeMwGšmß¦›\ït³‚#€\ä¥…TEb)õ—v•Ü¶ª*_ÿ7\ï!³ù\Ük\í¾C_/\ç=§MJzB\ïŠ]W÷JN­/›:õ\×ú\ï¬Y÷\é\İ\Ô=\Öñ†»ùuö\ã\î\ß_¤ÿ\ï4\ÙYY\Ëõ‡ûöªŠŠ?{\İ\î‰\'\î\×[\Üo¿}´Ú²e­ª®~W\ßşĞ¡]\Îs\Î\ÈX\âõ?¤¥-R[[Â—\ê\Ó\ÙÙ¯\ê\Çh\ïk\æ•\ÔÁL\Èn\ä¾[¶«¬\Ë;\"Éº¯>,cYÁ\È@\0òZl\á\Ü@\í4\Ü[,\í#¸›ß¾ ª¾¾R]~ùOÌ†v…¾\Ï;\î¸IŸ.+\Û\ä4¢gu¦:\çœ\è&Xn#—_r\É`UPğG³\Ù~Z\Å\Ä\Ğ[¤W­zA_·o\ßv\ç¯ı8Û¶­S“\'W¹¹«õ\î\äRò8Ë—\'\êi]®›=7ûñ\íó\Õú2¹\ß\é**r\×\å\è\Ñ2³¡¿D\ÅÇğš&#\ãe¯ó#F\\\áü\ßò\Ü\ä´lİ¾ù\æQA¿ö}†ñ\Øh\í¨\ä­iiw[~§;¶p³‚#€\èÂ¼ğ\îÖ›)\ãx\ÃıI\ĞU\\œi6¶Kô}¯^¤¾@UW8°»ñ]\âL/\ç/–\İ\É+Ô;Tzz²n\Úkj\ì­\Ê;­\ïpopn\Ó\Øø‘sú\ÂctC\Ü\Úó’û\é&Mº\Íl†—«¬¬e\êŒ3Nóšfß¾mú¾¥}TõU*//\Íjø·9m\è\İ\ËWzİ·ı?ú\ào\Ëõii\æ\İˆşu“†;\ĞØ°›\Û:\ã\Ä|‡»=M7\ß\áf G\09\Ğ\Åy\á(\åÇ›š\"³\Æ“\Ülüş/èª­-TË—?§cşü‡\Ìf;_¥{\î\Üúzwsú²3½œON~J9²\Ëlj·š\r÷\"}Ycc•utr÷®\éoø}¼\ã\rw\Ë\ÏK\î\ã\á‡\ïÑa—»q^\ÑlZû±kj\n\Ô\áÃ¥\Îóëªª\Şq®ó¼\ïøø\áº\Ñ6ô\îÿĞ§ûö=KÍ˜1¹]¯c7Ü­\r\ß&·­[”ıô—¿£”\Óts”rVp\0r#\0a~‡»å­–>\rwM\Ğe\è\ïjZMjJIqü¬©©Ú¹\Ş\İpŸ~\Ø0ù­e*#\ã%•šúŒ\Ş\åÜ¾N\îCşfe½\â÷ñ7\Ü\îó.\×GÖ®à»›=/\ÏÇµ/ów¿õõ\ï[[µ·X\ßß¦Ÿ‡\\.»¼\Ëóm\éÿ—ÿ¥=¯\ïı„ñ\Øğ\×t·\Ö\ì¶ö;Û­ıNw C~‡›€\ä@X\äe€YŸ\ÙPt”\ì\Æ‰3H©ƒª\Æ\ÆJ\Õ\ĞPa6±Ku\Ãtøp‰ş›—·Ú™\Æ\İ\ä.õ:_Rò¦>\ír¹·,—•½­\Ï75}\äLSPf6¼\å\ê\æ›¦\æ\Î}P%&>b6\Äïª©SÿSM›6QŸ–*,\\«N;\íu\ì\Ø^¯\çf8»”ßªk\ã\ÆT«¡§\ÙÿQW÷u\à¶ÿ\Ô\Ï\É~.òa€\ïÿ\ã[†\Şj¾<\è\×\Î\ßıD\ĞXimskÍ¶\ÑÎ¦\ÛŞ­}\ËSVp\0r#\0á‘—\\#t[Ã¤!\Ø\Z©3H©\êWSSUD\İ\ï‰zœ|C	´¥»­\Ív°M·ıx4Û¬\à\0\ä G\0\Â(/²‚^n„f+·\ì¢;!rî¨.ª}C‘-İ¾»w\ßiÿ;\Ûşš\î‰>\Ãw¶YÁ\È@\0„i^òÿ½jù¾øV#´»¯wr\Ã]EuQEğŠ\ïO†y6\Ïmi¶Vn\ÇO±‚#€ó¼Ä˜uĞ¬¸tÿ—Z÷?(’gRR]Tş†\â»{¹4\Ë\à\ê\Ë÷vııo°‚#€\ä%D\Æ\î¨Åœ€f^\îwB¤\Ï ¥*©.ª(xC\é\ì\ß\Åö·»:XÁ\È@\0„q^&Y\Íqgm\é¾Ôº¿G¢a)õ\ÕE%o(\ÕtwvóVp\0r#€¼„ˆl\é–-gò\î|\ßZ¾³}\Ğj\â£b)UAuQE\ÑJGwg7r\Ø\09@€\ÏKŒ\áş¹°òv¬\Ø\ËÖ·\"\Ã}€´A\Ñ4ƒ”zŸê¢Š²7”öUœ¤±À\È\0rDQ^n³\Zo\Ù-|±\áş	±\Ì:İºşt«9— Ñ¬j«ÑdD\î\Ñ\È[h¸Ë©.ª(|C	v·pv#g\r#\0\äˆÒ¼0\ë³\ÖZ\Íwƒõ„\å\ï§fe\î]\Ğc¢y)õ\ÕE¥o(mm¢‡˜Ug}\à\Ø\09@\0ò\rw\ÕE\ÅI°š\é„®ÿŒf›6@\0#€¼DyÃ½—ê¢Šò€\Ú\Ò\Ín\ä,°r€ä¥»4\Ü{¨.ªn\ß\æšf›6@\0#€¼t\'Ÿ|\Òw\r\r\Åfó·›\nq}õU\á>s¸ºÁ0³›\ì$šm\Ø\09@\0ò\Òmü\ãCùùK\Íp\âZ¿ş…·\ÍY°³›µkaÀO±À\È\0r—\îáª«.[7g\ÎT³,¥B\\c\Ç^•f¸v…˜G\09@\0òmøA\ì€\ç|\ãr\í 	m}Ò£G\nsÄ±0\0ó G\0\È@^¢Tÿş?,MJz&8„5f\ÌUKÍ—>—…˜G\09@\0ò\İy\æiõEE+h†CPùùK×›¯ùA³.fa\0\æ@\0#€¼D¿øs\Î9û\ï4\İ\'¾\Ù\îÑ£G\Ñ=\Ô\ÍÂ€y#\0\ä /İ·\é>\é¤\ï›7\ï¾\ÏùNw\çg\ÛÚü \Ñ}‹…ó G\0\È@^ºµA={~/\çô\ÓO=<e\Ê-»7mzñ`CC!\rs;ê«¯¶\ï[¿şù·\åh\ä\Ö\Ò\ä;\Û³0\0ó G\0\È@^º·KÍšc\ÖV³\Z¬IW.\Ãı;\Ûò\Ó_q)\Ì#€ G\0yÀÂ€y€\ä /\0X€y#€\ä\00\0r€\ä\0\æ\0r#€¼\0`a\0\æ@\0r\0,À<\È\0r\0,˜G\0\È@\0ò€…˜G\09\È@^\0°0\0ó G\0\È@^\0°0` G\09\È\0`\ä G\0yÀ\Â\0\Ì#€ G\0yÀÂ€y€\ä /\0X€y#€\ä\00\0r#\0\ä\0\æ\0r#€¼\0`a\0\æ@\0r\0,À<\È@\0\0,˜G\0\È@\0ò€…˜G\09\È@^\0°0\0ó G\09@^\0°0`\ä\09\È\0`\ä G\0yÀ\Â\0\Ì#€\ä\0yÀÂ€y#\0\ä /\0X0x	\0r#€¼\0`a\0\æ@\0r\0`aÀ<\È\0r\0,˜G\0\È@\0ò€…˜G\09\È@^\0°0\0ó G\0\È@^\0´[–ş–j\'/l€ G\0yœ!f¹Zi¸\Çğ2±À\È\0r\0Á\Ën¡\Ù.2«/l€ G\0y¼!-4\Ü\ãxyX`\ä\09\È€öó÷]nù\î6[·Y`\ä\09\È€ğ÷]n¾»\Í G\0\È@^\0t‚Lƒ­\Û,°r€\ä@§‹óh¸x9X`\ä\09\È€\Îc—›­\Û,°r€\ä@\'\Z\ÂÂ€6@\0#€¼\0\áŸ*¥z§¤¤Ìœ8q\â\Ş\Ø\ØØ†Ş½{úù-*ˆ\êÙ³\çw\çŸşgÃ‡\ßhş\É›Q\äˆ‘#rD\È9\"/@7²lÙ²{FY£\æÌ™­òóóTC\ÃW\æ²ú;ªƒ%¯cQQ¡JL|N\r8°±ÿş{Í—übVp\ÈE\È9\"G\äˆ‘#òD¹\Ô\ÔW\Ö÷\ë\×O%%½ \\®Fsa\ÒDÀJN^¤úô\éóÕ©§z+8\äˆ\"G\äˆ‘#rD\Èy¢x¡|Á¨¢¢\í\æB\ã[*DU^^¦úö\íû£{ü~¸\"G9\"G\äˆ‘#rD\ÈĞ­,[¶ôù´¨h›¹°py\ÕÒ¥/©1cÔ¨Q×«ë¯¿F\İ?R%/Jj6\Õş*/ß«N9\å”/Œ\èßO‘#rD\È9\"G\äˆ‘#òtr ‘#¯©OJz\Ş<ùW­X¾Tşù(u\ë-cus£Š¿V\rz…Z¤\Î\ßPT‰‰ó?\ïÕ«W+8\äˆ\"G\äˆ‘#rD\Èy¢DJ\ÊÂ™11?R.W½¹€hôª„Qñz|\Ã\r#ú\ÙÏ®SÃ‡]i.œc›MOu¬\Î>û\ìO\ÍY\Ç\n9¢\È9\"G\äˆ‘#rD^€(0qâ„½s\æ<i.¾nV#†Ç©\ÌWYoe¨”“ô\' Wª/—\Ó.×—~oGµ¯¦M»w§9KYÁ!G9\"G\äˆ‘#rD\Èbc‡4\ä\ç\ç˜††fu÷\İ\ÕÁ¿~ª¶nyGeÿiƒZõjªZŸ¹F}\\ı¡úŸ©“Õ·\ß~\é÷vTû\ê\İws˜³d\'+8\äˆ\"G\äˆ‘#rD\Èy¢@\ïŞ½UC\Ã\çæ‚¡¾Y=6\ë!U\\´E\í(Şªv\ï*\Ñ%§w\ìØ®{\ì!¿·¡\Ú_2\ÌY\âb‡Q\äˆ‘#rD\È9\"/@”¼\é(õe³r¹ş®fÍš©¦üf’*))T\å\ï\íÑµk\×5\í¾ÿV3¼O}ıõ\ç~oKµ¿¢|¡¦\È9\"G\äˆ‘#rD\ÈyºY\Ã]\çUŸ«u\ë^S±±?U\ÕUª§\ß\çU¥¥\Åj\Èå—ª\×W§ª††Ïšİj±‚C(rD\È9\"G\äˆ‘ ª\Ìÿp\ê»ï©·6¤«aCcUMu•z¯l·\Êİ¼Qe¾ùG•öúJ•ú\ÊK\æB;M\ï†tå•—«ôô\ê\Ûo¿ğºªı\Å\n9¢\È9\"G\äˆ‘#rD^€¨Z0sj\ë–Mú7eaœ—·Y½™‘®\È+–/Q//^¤’^xV=3\ïi} \Å/-T\×^3Bm|{\×}P\í/Vp\ÈE\È9\"G\äˆ‘#òDÕ‚ù\ïN=6\ëwúˆ•²\0^–ºX×’—“Uò¢\êù\Äy\ê\ç>©øı#j\æŒßª\'Ÿx\Ô\\(gª\ßÍ¼\ß\ë>¨ö+8\äˆ\"G\äˆ‘#rD\Èy¢jÁü…S²`–ŸŠ¸ı¶›\Õi¯\ê²,¤Ÿ?GÍó„z\îÙ¹z\á,\ë1£\Ôæœ·­óT\'+8\äˆ\"G\äˆ‘#rD\Èy¢jÁ|Ô©½{·©G™¡~yû8½\à•]üU\\\Üõ\ë	\ãõ§¢¥¥\ïz\İ\Õşb‡Q\äˆ‘#rD\È9\ê\"Y\Ösn©v\Z\0‚]0\îU®oş¦¾üòS•ø\Ü\Ó*a\Ôuj\Äğ+\ÕĞ¡W¨¸+‡¨¡\æùš«‡«\î¿G;ö=­\ï\í©ö+8\äˆ\"G\äˆ‘#rD\ÈQb¸;¼¥†{\íô‚ù&\Å\n9¢\È9¢\È9\"G\ä¨e·\Ğl™Õ‹ö	zÁü&\Å\n9¢\È9¢\È9\"G\ä¨\ri¡\áG\ë´kÁ|˜\n“Šâ•€\ëK G9\"G\äˆ‘#rDÂš¿\ïr\Ëw·Ùº\r´oÁü7*L*JWp\â\ÍúÂ¬$\ë\ïrD‘#rD\È9\"G\ä(lùû.7\ß\İÚ¿`>D…IE\á\nN¼\ÏJlQø,\nÚŒ_rD\È9\"GäˆŠ¦e\Zl\İ:kÁ|\n“Š²œø\0[\â£p\Ë\ã—‘#rD\È9¢¢)Gq\rw´~Õ‚ù\0&E+8	­¬\Ä\Ø\×\'#Š‘#rD\È9\"Ga\Éş.7[·-˜ÿJ…IE\É\nN[W^¢i\Ë\ã—‘#rD\È9¢\"=GÌºÏ¬µfU›Uoı\rf}b¸w3ŸiM \í\æZ*L*\nVp\âƒ\ÜR\ìô\äˆ\"G\äˆ\"G\äˆ‘£\Î%?÷•k5Öª•o\ÖZ) M\æO©0©_Ái\ï¹]]„¯\ä0~\É9\"G\äˆ‘#*\ÒrcVvM¶¿\Új\Ö´T@‹\æıT˜T¯\àttw¼HßñK\È9\"G\äˆQ‘”£ñ†ûHıÍ³\ËjÀ\'›u±Y}­iû˜5Èº\ìn\î»%\\>¨bk7xÁü*L*BWpZ; M¨\ï‡‘#rD(rD(r\Ø\Ãûw¶\åt¢\á\Ş\â\İı¬\é}«{2­\àwÁ¼\n“ŠÀœ\Î>ºk¤nY`ü’#rD\È9\"GT$\äh¼O£\\i¸·f·‡Ü®Ü§\éfK7\Ğ|ÁüI›K¦ß¶m­ª¬ü³>}\àÀ¿\Ó\åå¥©#†¨É“ÿCMšt›WmÜ¸\\ee-S-=¶\\7mÚm~^«W\'©ó\Î;7\àõ55\ï\êû¬¯ÿ@×†\r¯¨\Ïs®ß·o›\×ô%%TYY¶>-?jVr\éÍ÷ò\å\Ï9\ç\ë\ê*‚~}#h\ìø`\æ{f\İiı\r†\ï\í\"ñÀ5\äˆ‘£\çˆ:±E\È•9Š1¼w#—\ï_÷\í\à}\Ê\îæ¹†÷\î\åƒh±\0¯óÿµ©JK\ß\ÒAºù\æQze_N\ß{\ï¯õ\é3\Ï<C-\\ø„3­œ—\é<oß¿ÿ?©k¯Ó§«TK-\×\İt\Ó\rm~nıúıP]}ul‹\ÓHc \ÓTW\ç\ëûn6,©\Îÿ\â^Á÷~o\è¿\'Ş¢¶lù£F\Î?õ\Ôı\ê;~¡rs_\ÓÓ–”¬\×\×/Xğ˜¾^.\Ï\ÈX¬.º\èB}›}û¶\ê\Ë/\Ó\âsŒ \ßOşe\åd™õü—±’\èv‘¶’C\È9\na¨_\äˆQQ™#\ÏÆ¸²šmÏ¦»Ü§‘p|Á\\\Ój;V¦tù\å;—\Éù\ÌÌ—õ\é={²¼¦w7\n?óº,=}‘¹R¾\Ì\\i\Şb6\nª–[®“\Æ\"\ĞõMM\Õú>\ì:\ãŒ\Ó\Ô\è\Ñ#óG\îV……\ëœ\éKJ2u3Q\\œ¡.»\ì\ßô\í{ö\ì©W\ä\åù\Ô×¿\ïL\ër}¤ÿ\Êe2½<—Ã‡wª\Ô\Ôg\Ôi§ªÿ‡5k’UL\Ì\0\ç6r½¼ö\ã\Ëmö\ïß¦ÿ\Êôö\ë\çû:ùû¿#p\åÆ°¶x\îNÔ–•Ï•»&z\\Iß¡#G\äˆ…(GThŠ‘#*\êr4\Îğş\ÎöÅ|ÿŞ»ª³k9p|Áüq‹UW÷\Z0 Ÿ\Ê\ÊZªN9¥·züñ{Un\î«:L“&İªOŸ{n¯\Ûô\í{–\Ê\Î^®FºJM™2\Ş\\YN\ÕÓŸv\Ú)fÃ°PUW¿£=vS“{7Si6ZzN²«\íØ±\×9\ÏeÂ„›ôi©yófz\İi\ézk\å}«>Ÿ“³RŸ·#GJi+*6\é\Ëjk·«¼¼\Õ\Îõ\î\Æh±F\Ã÷ù\Éõw\İu»ª¬\ÌÑ§+õ\ß}ûÜ»\á\Êshíµ€œ@+şVVZZ\Éñ7}ªŸ\é#\å;t\äˆ‘£\äˆ\n]‘#rDE]<·n\' \Çx\Æ`+7\àoÁ\\\İb\ÕÕ•\é¿7¾¢‚œœ\æ\ÊoSa\á\ZU^¾Qw\Şÿóº\Íñ-s\îóyy¯Y»·\Æ\ëó¨@½g\Ï[Ö–¹sÌ¦¡ª\Õ\ç\'%Ó§§ÿÁ9¿a\Ã\Ë*&\æ_œó)j\àÀ«ªª\Í\ê’K©Ù³p®+.^§o/[\ì<\ï\ïw¿›l64¶š÷V¶Y³¦\êÿ=--É¹y}bcÿ]M›6\Ñl2õ\ã\È4©©ó\ÔYgi6;õm\í×±µÿ#D\ÜX¹Ib¥\Å\ßJN[Wn|Wrºbw¾¶¾V\äˆ‘£\äˆ\n]‘#rDEUÇ·>»¬ó\'‚½\Üó\'\Ãbhµ\0½`ş¨M•™ù’:ù\ä“tÃ°j\ÕszWÒ‡¢\Ïÿû½ô_{Zw£pƒ>½o_¾\Ó$\Ø\Ó46V¨@-—}­¹¿VŸnjú°\Å\çe\ße\å&\ç2Ù’8b\Ä\å^\Óee-Ñ»\ÌNŸş_jÒ¤[t\Éó‘\Ûfd¼\è÷y:T\èÜ·ü•†@n#MŒıÿI¹\\•\êÀ\í\Îù\Ò\Ò7õó¶\ïûÈ‘\ë\àX\Û[ü_B´`¶G\Ğqm¼M[W2Z[\É	v\å\Æóñ?\ë‚-m}­\È9\"G!\Ìu\â‹‘#*ªrtŸ\ÇtY\'øù¬õx¬™´Z€^0WµXlS¹¹+Ôµ\×Æªo¼ZŸ;÷¤yóTS¦ü‡¾LÎ—”¬Ó·±…\Ê\Êlke¿RoÉ’û\ë\ßWş[¦“\Ë\Ó\Ò\èórzÁ‚GZ|~2\Íüù3›]vû\í	^—mÜ¸T\×Ô¾şê«¯pNoØ°Ø™nÿş=­\\\Ş\Ğğş[U•£òòV9\Ï;1ñ!³‰\Ø\îÜ¦¾~¯¾\Ü~}\ì\Û\È\ß\ì\ìT\çq23SZı_B¸`¶+»•OFƒİ.\ĞJNv®\Üøn\Ñ\åJN[_+rD\ÈQr\ä9·m{\ÃÉ†\ä\Ë\ßt2\Ş\äC£É“ow> :şA\ÑR••õ²\ß\Õ\ÖnÑ·õ|<É©¿\Ç(/[_\ïr} \ê\êö8U]½Yh\Ô\Òÿ!\ãy^2PSó\çÿï””\'[}m~ø7\Îi\Ï\ì\ìÙ³>¨×˜Ew\Ú2\ìå­œ\Î\ÉY¦O\Ë\ØtÉƒŒ3û}Ì¾­\ïùY³\î	ø\äù¾ e¿9²£\Õ\Ù%\Ï\Õóy\Ê\í\å\ëS·¼O=ºS¦«-[^WÓ¦ıZÿ•=\ÏZ\Ëq„\äÈ³	t‚Ÿ\Ïø6÷@¤4\Ü¶XMM˜+\ÎyY\é-t7\İt½µğm~i\n.º\è½°;z´\Ä\\`¿h\í^z·¾¾±±\\ù{l¹l\ê\Ô_9ç«ª6y4\ÍGv;•\Çñw?«V=\ëu™¬Xı\ä\'ÿ\Ú\ìz÷\n\É+\Ín?l\Øe\æB6C_·¾µò\ï~>ıúõ\Õ\×\Ù\Ó\ÛÿOn\îr\çö••\Ò·lY­/—\Óyy¯¶øZwÑ‚\Ùó“\Ñ\\¹ii%§ª+7}>\'úµ\"G\äˆ… GR2f}¤ÿÌ¦y‰u¤ÿÿÔ§\İGúÌ™öø^\"\Ço/{V¸?´\nœ!{\Éc\Õ\Õí¶š\ÕÌ€\Ó=şøT}º¤d­:v¬Ô¹\Íøñ£\é)V\é\é/\èLH—/Ÿ§§±›ş)S~\éd\Ü^V\ÈÊ¿ü_“&İ¬ÿ\Ê^\'qq—\è\ÓR6¼d}\Åûù¬\\9\ß9½f\ÍšnK‘£\è\ÎQ ’½®’“¯ö\í\Ës>µO——g\é1\î>öÆ‡ú½\É¿†>¸\å=\æ\'Lø…“\Í\ÚZ÷ñ7\ÜÍ¯ÿ1j¿7\Èò¾ \à5\ë¸y^\ÓÏı[¯÷AÉ‹ıö}Ê°\Ü\Îı!]š\×õ’Ó²²\rúº\'¸Wÿo†şšWº^6\Ø\Ë\Ém{_\Ï0\ÊQµ\Ç\åŸ\à\ç3\È\ã±>¥\Õô‚¹²MU]\íş„±¢\âm½“\İBí…¤¬45U8ÓºWr\âó‡m³\Öo\éó\ï)\ß\Ç6ô›~\Ñ\ìq7lH±\ì|‘ª¯\ß\ã\\.\Ïá¬³ş?\çü‘#E\æ‚±¹°^e­”¯ôºy.\×û\æ\nG’nt\Ê\Ê\Ö\ëï¡}ª©\Ù\Üì¹¤¥=¯Zu\ì\ØN\ë\Ë\Ûõ\ã\Ëi™^ş&%=ª§oh\Økm\í\âñ&S`½i¼c¾<c6U©­¾\Æ]¼`öüd4®>Á÷·’Ó‘•ß•œ„0z­\È9\"G!È‘=d{\ÎoY	—\Óî¦¸2`†¤d\åYÆ—Œ)’1½zõsz\\\ËtrBù{\î¹ÿ¬\æÍ›\î5­dÑ¾½¡·>?¡OŸs\Î¬¯cøŸröiY\È_y\Ì¶X[òŠœ\ë%köm%s‰‰¿s\Î\Ë\×P\Ü\Í~¥^Ø¹¹\îº8•‘±\Èjtrœûª¬Ü¨ÿ¿¶,«\ÈQô¿µ6ÿg\Ìø/½Ì–ó26å¯¼\'\ÈuöûˆŒG9/•÷±cGz5\ÃvfKJ\Ö\è÷ûò%KV^ø#=N,x\Ø:F\Ç.\ë§$W9\ÏCÆ¬¡÷ğª°>°µ÷jÙ¢³!\ïm¾\Ï]\Ş[\är¹ûƒ\Ú\ì\ì¥:\Ër{ÿ«½±sb¿\ïØ·\í\È\ë&c\ã+ó}Oğó\é\ãñX\r´Z€^0\Ğb\Õ\Ö\æ\ë–©S\Ç;—m\Üø²¹22\Ğ9/+\nö\nƒ}^Vˆ¦O¿S7%·µWşe\ÚÃ‡·é•†\ÂÂ´€\ÏA®s¯|\ç›ù\İz\Ë\ßSO\İ\Ûlº\ÒÒµ\Î\'Ÿ———oPÛ¶­\Ö[\æ,x\È\ëº={\Şt\ŞX<§—µººRsee“¾\ìÀw­\ï\Ğ^§\ÏÛ—K54\Ø\rD>Ÿ›»Lÿ5ôwO¶ú\Z\ÛÕ†…f¨+©ƒã«‡Ÿ-	U\Ö\å‘n¯9\"G\ä\è\Ä\æH\ÆÑ€ÿd®Ô¿d\éÿ=F\ì«\ä´4Å·q\é©\Z5j„\Õ¼\ìq¤ÿzüù>®Üd\É÷ñ7\ï\îóû÷\ç9\r±\ì!?T_––¨O\Ë_yœC‡¶6Ÿò<\ZË¬­g<¶p\'\ë-ğ™9R¨Ë½5o>-9ñœ\Öóşe\Zû´| f/+\ì\×\Ëİ¤£\îú~\ÔR¼ª÷\0\É\ÉyE¥¤ü^\ác\ÇJô‡=w\Ü1F¿?45½\ßlœÈ´’QÏ²\×\ÔÂ…³¬-\Ìk­fº\Ô\ë62½œv¹\Êõ—\ËRS\ç\èÇª¨\È\Ò\×Iv\Ü\Ü&ªÁƒ\Ï\ÓÍ¼}{û~\å½GN{şò~\è\ŞR\ÖlL\Ëóó7\Ö/~\Òy²—ò<‚}ÿ‰€…\ê¨\é¡~< \ÜîŠ «©©¼]·£Z®.ş$t§µõ —5]kG\í\È…¶ü.j8oQğ}­\È9\"G\'8Guu;õß\ë\ÆZ\Z‚}ûr­\ë\×Í•öõ\ê¼óx\İ\æx“\ì>Ÿ—·\Â\ãŸ\n³\éİ«|777\Õj¸+Z¼¯\nôtösØ¿ÿk—öGi\Ê\Ê2­-v+õcefº·:/_>\×l8·\Z‘V\ãş‚\ÙHo·4¸\Åk<K\Ãa?W¹9\í\Şú\îoüK\Ãc?vi\é\Z\çò\Ë.Lx?jÓ¼¯ª\Úh»\àg\\\Ö\Ö\æ\é\ë\å¼\ç´II\ë\Ãd,\'\'?f}­i¼õ]\í)z7u{z{»\ÛlıšdÚ³½û÷j=½Œsùp\Éóñ\íL\Ém\åCµa\Ã.õzşöóµ\ï\Ãó¹º›\ç\ãË”ôô\çõ\å·\Şzƒ^†¸·»÷¬²3\äy›~?ªc7Ğ¥\r÷ûT˜T-˜}ß¬}W&\êŒó¹ö¬\ätõw\æ½VŒ_rDB”£\ÌÌ…Ö‘ş_R«V=c®\Ì÷P?|·>\ï>\ÒÿKÎ´gyº\Ù$_¯O\ïÛ·\Ùi¶\íi\Z÷(\ß\Ç\Í\Í}\Å\Ú\nœ¬\î¸c´ºë®›õô†>\Ù\İ^\Ó=Zh\í6[l®\ä\Ë\×-\Êô}Ú•“³\Ô\\y\Ïo6>\í\Çw7\Ğ­­ô\ãô\ém\Û^k6ıˆ?u\Ã\äÉ·\ê\Ó\î£ü_\ïLW\\œ¦&L\ã4#÷oŸ\Î\Èø9\"G«¾¾T]~ù¿9cMÆ¿œ.+{\ÓK²\Ç\Ä9çœ­ö\ïÿ³3NdO-s\ÉÉ³ôS£G_­³i\èİ²7;eú\Ô\Ô\ÙÖ–\éuVSüšß±g[;côyiº\í\çfO»zõ|¯\Û\×Ô¸·PË‡\0Ë—\Ï\Ñ_SZ²\äI\çq[z<C\ïR\åÜ¯¡¿Æ•\r\ïG|‡\èÚ†»<\ä\åş„s¾®nG«Ó¯Y³À9\ßØ¸\Û:Ò«­\Ş.%\å±V§‘*\ßû\Î\ÉY\Ò%¯K\ÌEf°bÓ‘OğıÔŠ¿£\Â³’Ó•G…m\íµ\ê\Ô1½XgBN=º=\àt\ã\Ç\ß\ØbN<\ëÀ<\çş\Ê\Ê2ôJÔ†\r‹ô§úö\ÊUFF’3ıµ\×^¡n¼q„¹’”£g\è’Ó¾\Ù\r\ÇÜ‘£\èÌ‘Œai†\í±)§\çÎfm…»_M™r›\Ó,—”¼¡oc7Ü••oY\ß-3‚şú><Ç\ç\ã\ÔÖ¾£W°÷\ï\Ï\ÕÍ¼3\É\Î\á\Ã[œ\é\ä¾\ä¶\Òü§§\'š+ù\ÙjÖ¬\ß8%+\ëGl5›˜\ÍÆ§Ü·ü?r\Ù=v¬H_\î;½»(÷h\Ö\Ëõÿ*ÿŸ=Ëµ\×Yn\Ø\Ë\ß\Û\Ês³“ñ~ä¯Š‹_w>’1,»rWWo´\æ·\×kL\Ù\ãdñ\â\ß\ë±\'cW² M»\äÁ\Ğ{k8™”±\'\ï\röX”\Û\ËûŒ\éI“n\Òe¿\Éõ\r\r¥\Îü‘\é\nW\ë¯olÛ¶\Êj\Â\×[\Í|\×ÿ`\ç\Î\Ğ[\Ñ7\ê\ïr\Ç\Ç\Ç9c_\î\×w¬\Ë\ã\És–½F\ä¹ÎŸ?\İ\Ú\Íı\éhy?\â(\å@\×6\Üï…¬JJ\Ò\Ì&y¥Z°`¦õ}²¥\æJş\æô|s%~¶¹\Ğ\Üd-¼÷º\\–œü¨>\ír¹·HÈ›€\ïı¾f.¬S¬…vŠşt3.\î\ßõi)Y`»w9ô¾oYñ¯«+\Ö\ÏM\ÊĞ»Cı\Ò9-×…\âõ	Ñ‚¹¥-ı$¿µ\ß5m\íwQbt\Íï¶õµ\ê”ù_U•e5/;ã¡´4½\Ùt‡\å;Ÿ\ŞË¸\î\ßÿ‡*-\íY½\"#Y’\Ë\Ü[\İ\n\Û$&>¨?»¦\æO\Îe2)\Ü\ßs‘-²‚\âoŒ¦§?Ö¹#GÑ™£¦¦½zùoŸŸ7\ï·Ö‘şG:™ñ-i®%\Õ\Õo›\ró6³Qøƒu¤ÿIúú\Æ\Æ]\Êóq÷\ìY£?ğ’†A¦‘\Çt7\rùfş¦¹ş€~L{zÏŒUTd\ê\é\í1(\ïm¾\ÏGòl\è­\ì#õs’Ç²ó*ù‘¬H\Ã\ã;%‹öt“\'ß¢O÷\í\ÛGÍ˜q§\ßñ¿r\å\\\ç´üOò\Şk\è]eß±v\Î\"G¼ù­\Ú\Ú?\ëõ1CÿL\×zœ\Êò[>Ü²Ç…\ä\Èwı\ìÈ‘-zN\Ş\ä2;[r{C\ïu±\Ülj78\ëp«W?\Ó\âØ³\ÃÎ˜</{QÆ±\äñø‡»\ïGóø‡l\Çß³\ìõIÉ û\ì¯üÚ™±SşFøû¿\Ã\rtm\Ã]²:|¸@¿ù76–\êrÒŸc}jÿ¢^°\Ú+·³~G¼kıLÅƒ~\ï\ßı\É~¢s\Ş}D\×\ãÓº\è:EŸnh(QYY\Éú6s\ç\Şg­\à™ñ\çñ\ì\ç\ÙÔ´\'$¯\Ş—h\íı\ÖVnŒv®\äØ»‹ö¹·\Ôı\Ö9/[¯¤õœ\Æ\å\Úm®”/Ô§¥\Ñ.,\\e®Hqn\ç^™\åu›úú^+™™Iú;°\'Õ—Ù—K\Ã`\ßFVšd\×Ai:oyx\ÑZÊ²l¹#GÑ#öx•1{±ó>\"\ã\ÔsÜ¸·p_\çœ?t\Èşy£}\Ş~’\ÓGnu\Ş\äÃ©\ÛoÿY³qe?¶œ¯­uw[²$yq7Ç§u7\Üe\Ö\Ñùœ\ÇŞ²eE‹\ï]öôÆ¶ü\Ïş®“Ç·jÉ¸¼†s­2\çÿ6ô®ñw‘#Ş\Îw{l\Ëx—÷C\ï²Ç¹^Æ—\çôòj—2\æSSŸ\Ò\ØúfF–û·‘±(\ï_w\Üñs]¾\ï3••\ëL\Ê\Ãeek­_\ÎHuŸlœ1ô\Ö\ï…~ÿ;\ÃÆ¨\Ë.\äu\İüù÷{ıŸr¹™»\î\Z\çL\'\Ï\ÃĞ»¾¿\Z\é\ïG\ÌrY\Ï\Çe?ú\î\ïm\Ûÿ{­ \Ì{CZöÂ¬²2\Óút§\Õd[[ô\Òü\Şfõ\êy\Öb\ßwC\Ãs!¾N7\ævs¾r\å}º¦\æmİ ø»\ï±c¯ñ:/÷!o\îŸü¾6a>^mYh\ë\ÊM°+9öã‹öú;i7ú½|ÄˆË¼.“†vô\è«Ì•“_è•“Å‹\Ó[”gÌ˜\è\\f\è-=\ã\ÜGY\Ù\ZsE\åsf‹\Ùüş\ÆúY—b=\Î\íi²²9![4|Wª©i·“-¹¯p\Ì9Š\Î\Õ\Ön\ÖÍ³ûC(÷e2\Ö/¹\ä_óò>a¿_\Ø\çekõô\ét6<Kn»a\Ã”¿Ç•÷£i\Ó~¥)w~ƒ\ß\çdŸ–\Çq\ï\Ù\á¾_ù+uõÕ—7{_“\ìH 9–i$ûò¾(§‡\r»D\å\æ.	8¶³³S¾Fr\çû¨»9?~İ¨Q\Ãôc¶%_\ä¨û½\Éú˜,\Ï\å½À^»›\ÜW¼Æ…\ç{…ûƒ\Ò\×õi—k—ó~c¿_\Ø\Ó,óºÍ‚3ôô\Æ^qñkN\å¯|\È+\ï\'r?ƒÿØ™V\Ëór’i°=s\"ÿ\Ç\Ãÿ—\Ş+Dê©§\îqŞ¿ìª¨x\Óy\Ï\ç±p\áC\Î\ß(x?\Êõ\ã‰\'\è1ñxŒ­´Y€³`\Ş’ª«Û®·DL›6^/e¸oßŸTj\ê“z!w\äHµµk»^\Î\ßz\ëõz\ZC\ïfû’^IZ²\äq•˜8]_—·\ÔZñ\×y»\Ñhl,±>‰}AŸ–…¯»a?şœ\\®\ã\ß’\ÛÈŠ•l-,.^e½©,\Ù\ëc?÷3²eÁwwº;\à\×\Ô\ßJ\Î\Ä ¶`DMrs_6W\Êª\ÇÛªUsu³;cÆ¯Í•e÷–`i\ì±l\çdÿşl§iu7\Éúö2\Æ%ú¾eºr½²aŸ¶?ô*/_\Ûl¼WU­wš}YI—œ\Æ\ÅıDÿ•Ú½`OX\æuŸ55\í\n\é2º«+”ÿ/9\ê\ïG¡£\á˜\Ûõœ\Â,G\ã<Æ·l\å\îìƒ§]lßŠ.56pÌ»CV.\×Ns\å³s¾´ôus!Wj\í~÷¼\ÙL\ä[\ß\Ï\Ù\ìu;÷\'¨¯™\ÄFkW¥À\ánd÷¦E\Ö÷\İnÖ§¥I¸ù\æ‘^Ó®^=\×ú\äõ³1xQß¿}{ö¼\á±\Õ14¯9¿W\èû-++mY¹1Z¹](j¥KsTW·M{ûü†\rI\Î·³QU•i6¯;ü—\Ì\Ì\Îy™\Æ\Ğ\ÇFX\ì5]m\í&³_§ª«7\èû–ñ\î\Şzñ\Õx¿\é\Ñ\è¶<>§L¹E\ßnË–ea›;r\ÔırDñ~D\È9j“|†¸\Òè¼Ÿ“Ÿ+7¼·n÷2\0\Ø\æ]!«úz÷o#\Şx\ãp³)x\Éj&Ş´v“K\Ö\Óo\"\ß\Î\Ğ\åx\È9=u\êm\Ãóö†ş¾\Û\"}Z\Ï}D\×\ã\Ó._ş¤\Ş}oŞ¼ûôù††\"\ëû<\ë\Í\æ\ã\ÖÁrrCöúD\Ğ\n\çJ\È••‰Fğ?­\â{»ş\ŞjD\ç\È\Ğ\ßmş}º®n«\Õ@¿p\Ú\ØØ‹Ô¤Icõ8—1{\Æ§¼\ï¦&û\ëo[ß]\ëŒwCN¶J«\Ë/¬\ï¯_¿¨û\ïÿ•sÿ2\Í\è\Ñ#t¾~ò“\Â6w\äˆQ¼‘#Šùc¸÷\nñlŒ;\ÚtK³í¹»º\ç`-\àµ`.\rY56y4¥\ÖÖµuÖd^qšğ¼¼—½nw¼\á.UGº<s\Ê)\'›\rÉ–fa\è#ºÆš+ü­-m\ãôi÷]\'8\Ó\Õ\ÖşI¹\\;ôÏ¾\È455¬£Ï–\ê\Æ\Ã\Ğ\ß!Z\Ò\×\'\ÂVpü­\ätÆ–Š®8úkX\ä\èÈ‘wœ,\ÈùmÛ–Y\Í\ç\æ€\ã\å\á‡\ï4\è,§\Ü^-jv¿«V\ÍV+W>¥\ê\ë·\é\Ë\n\n–š\ròóºA—LUWg6»yo\è²=ğ¹„K\î\ÈQ÷\Î\Åû9bü’£\É\Ïvy\îú-[ºÛ»{¹\Ü\Îs\Ë6»’]½`nhp…\\¾¯j¯˜\Ë\n¸{«[–nrr^ô»À’\ï\ÊÁq\ìf$#\ã9\'\Ül\n¸ “\Çima8a\ÂÏ\ç\'GT¾ıöx\ç:÷î°¬\à„`%§³W–\"*Gv6\Ò\Óç©¦¦}™\Û`Ø°oq¼H\Ó\ì{YVVR³i\Îõ\Øz^ª›h;;’;C\ïÎ\æ÷1,˜®uCÿ&\é\ï\Û4»2w\ä¨û\æˆ\âıˆ‘#r\Ô&“|šn9-R\ë\×\Æ\Û\Ët\ÏøÜ‡\Ô#´V@˜4Ü²UK\Î{n\é–\Ú\ßm¤ù\ë§Mû¿\×û\Û\Êí¹ ó\İ\Ú\ço\Zy²\Å\ï¼óşEo}ó\İ\"ª-\İº‚co	\è\Ènw‘¸\Û^§å¨´ô5ı\İj{\ì\É\ßY³\îr>ˆji¼Ø»”»wû^híš\éwzù°JKşø#¯\ë$2ş\å6)\éA\ë\0kl\Ó8\î\ÊÜ‘£\î™#Š÷#rD\ÈQP\Æ[c]ù4\ŞYVC.[¯\í\İ\Íe·ñA\Öm\Ş0Ü»{Ş®Îº\r€\î¶`¶·vt\Z\ÌA­¤»E \ÒH69\n§±N¹#G\äˆ\"G\äˆ\"Gmcxÿº=µ\Õ\à;\Û\0f\Ì!\ìnx‘¼\Û9\"G\äˆ‘#rD¨h\È\ÑmV\ã\í\n²Ñdp4r€3\æ°]\Éb¸wA\ZG(rD\È9\"G\äˆu¹f=`\ÖZ³>1«Áú\äï§†{wó™†{\Ë8\0\Ì,˜»P‚µò’\Ğ\ÂõŸE\É\Ê\r9\"G\äˆ‘#rD¨h\Î\0\Ì,˜#h\ËB´\ì¶G\È9\"G\äˆ‘#Š†\0f\Ìa³’+7\äˆ‘#rD\È9¢h¸°`fÁÜ¥+9IQºrC\È9\"G\äˆ‘#Š†\0f\Ì]&Áú\ß\ÈE\È9\"G\äˆ‘#\04\Ü\æ\ÎÕ‡Q\äˆ‘#rD\È9@\ÃM±`9\"G G\ä\äˆ\"G\0X0³`9¢\È9¢\È\È9À‚™bÁL(rrD@\È\0\Ìf#rrD@(r€3f#rD\ÈE\ÈE\0°`¦X0“#Š‘##r€3Å‚\äˆ‘##Š`ÁÌ‚\äˆQ\äˆQ\ä\0fŠ39¢\È¿\ä\äˆˆ.\'Ÿ|\Òw\r\r…,Ã ¾újû>s–¸•\äˆ\"G\äˆ\"G G\ä@<øÇ‡òó—°`ƒZ¿şù·\ÍY²“QI(rD(rrD\0D«®ºlİœ9SY0†A{Uš9K•\äˆ\"G\äˆ\"G G\ä@0\à±œóËµƒ…c\×\Ö\'=zô¨0gI£’Q\äˆ1\É\È9%ú÷ÿaiRÒƒ,»°ÆŒ¹j©9+r\äˆ\"G\äˆ‘##r º:ó\Ì\Óê‹ŠV°\ì‚\Ê\Ï_ºŞœÍº˜¡H(rD\È99\"G\0¢Oü9\çœıwÎ¡_(÷\èÑ£\Æ|ı\Ç0\ÉE@\È\È9\Å\ç“Núş±yó\îûœ\ïşœø\ïöX»d¡L(rrD@\È€\îaPÏ\ß\Ë9ıôSO™r\Ë\îM›^<\È\ï9v\Ş\ï1\ÊOD\ÈQ+­i\Èw{\ØİˆQ\ä\äˆ‘#\0\İÌ¥f\Í1k«Y\rf)ª\Ã\å2Ü¿\Ç(?ÁQ+\ÉE@\È\È9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¢\ßÿğ9‹­\æ6BX\0\0\0\0IEND®B`‚',0);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','1',1),('schema.history','create(5.15.1)',1),('schema.version','5.15.1',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
INSERT INTO `act_id_group` VALUES ('PRJ1_INSTMNG',1,'é¡¹ç›®ç»„A-ä»ªå™¨ç®¡ç†è§’è‰²','user'),('PROJECT1',8,'é¡¹ç›®ç»„A','assignment'),('a',1,'æœ¬å…¬å¸ç®¡ç†å‘˜','assignment'),('b',1,'éƒ¨é—¨ç®¡ç†å‘˜','assignment'),('c',1,'æœ¬éƒ¨é—¨ç®¡ç†å‘˜','assignment'),('d',8,'æ™®é€šç”¨æˆ·','assignment'),('dept',15,'ç³»ç»Ÿç®¡ç†å‘˜','assignment'),('hr',1,'å…¬å¸ç®¡ç†å‘˜','assignment'),('jjbf',2,'ä»ªå™¨é™çº§/æŠ¥åºŸäºº','assignment'),('jjbfsp',2,'ä»ªå™¨é™çº§/æŠ¥åºŸå®¡æ‰¹äºº','assignment'),('wjzlgl',7,'æ–‡ä»¶èµ„æ–™ç®¡ç†å²—','user'),('wjzljygh',8,'æ–‡ä»¶èµ„æ–™å€Ÿé˜…å½’è¿˜å²—','user'),('wjzlspg',7,'æ–‡ä»¶èµ„æ–™å€Ÿé˜…å®¡æ‰¹å²—','user'),('yqgl-gly',8,'ä»ªå™¨ç®¡ç†-ç®¡ç†å‘˜','user'),('yqgl-sp',4,'ä»ªå™¨ç®¡ç†-å®¡æ‰¹','user'),('yqgl-sqr',5,'ä»ªå™¨ç®¡ç†-å€Ÿç”¨ç”³è¯·è§’è‰²','user'),('yqwx-sp',3,'ä»ªå™¨ç»´ä¿®å®¡æ‰¹äºº','assignment'),('yqwx-sq',3,'ä»ªå™¨ç»´ä¿®äºº','assignment');
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
INSERT INTO `act_id_membership` VALUES ('gaojie','jjbf'),('chenghua','jjbfsp'),('lixiang','wjzlgl'),('lisi','wjzljygh'),('zhangsan','wjzljygh'),('mawu','wjzlspg'),('lijian','yqgl-gly'),('huaqiang','yqgl-sp'),('wangfeng','yqgl-sqr'),('zhaowei','yqwx-sp'),('zhangli','yqwx-sq');
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
INSERT INTO `act_id_user` VALUES ('001',1,'ä»ªå™¨ç®¡ç†å‘˜','','','',NULL),('002',1,'ä»ªå™¨ç®¡ç†-å®¡æ‰¹','','','',NULL),('003',1,'003','','','',NULL),('444',1,'44','','','',NULL),('admin',1,'ç®¡ç†å‘˜','','','',NULL),('chenghua',1,'ä»ªå™¨é™çº§/æŠ¥åºŸå®¡æ‰¹äºº','','','',NULL),('demo',3,'ç³»ç»Ÿç®¡ç†å‘˜','','','',NULL),('gaojie',1,'ä»ªå™¨é™çº§/æŠ¥åºŸäºº','','','',NULL),('huaqiang',1,'ä»ªå™¨å€Ÿç”¨ç”³è¯·å®¡æ‰¹äºº','','','',NULL),('jn_zhb',3,'æµå—ç»¼åˆéƒ¨','','','',NULL),('lijian',2,'ä»ªå™¨ç®¡ç†å‘˜','','','',NULL),('lisi',2,'æå››','','','',NULL),('lixiang',5,'ææ¹˜','','','',NULL),('ljhai',1,'æä¹…æµ·','','','',NULL),('mawu',1,'é©¬äº”','','','',NULL),('sa',1,'ç³»ç»Ÿç®¡ç†å‘˜','','','',NULL),('sd_admin',1,'ç®¡ç†å‘˜','',NULL,'',NULL),('sd_jsb',1,'æŠ€æœ¯éƒ¨','',NULL,'',NULL),('sd_scb',2,'å¸‚åœºéƒ¨','','','',NULL),('sd_yfb',1,'ç ”å‘éƒ¨','',NULL,'',NULL),('sd_zhb',1,'ç»¼åˆéƒ¨','',NULL,'',NULL),('thinkgem',3,'ç³»ç»Ÿç®¡ç†å‘˜','','ll@163.com','',NULL),('wangfeng',1,'ä»ªå™¨å€Ÿç”¨äºº','','','',NULL),('zhangli',1,'ä»ªå™¨ç»´ä¿®äºº','','','',NULL),('zhangsan',2,'å¼ ä¸‰','','','',NULL),('zhaowei',1,'ä»ªå™¨ç»´ä¿®å®¡æ‰¹äºº','','','',NULL);
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('20150507107','SpringAutoDeployment',NULL,'','2015-05-07 08:06:56');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('test_audit:1:20150507110',1,'http://www.activiti.org/test','æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹','test_audit',1,'20150507107','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,'');
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'æ ‡é¢˜',
  `link` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« é“¾æ¥',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« å›¾ç‰‡',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°ã€æ‘˜è¦',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™',
  `hits` int(11) DEFAULT '0' COMMENT 'ç‚¹å‡»æ•°',
  `posid` varchar(10) DEFAULT NULL COMMENT 'æ¨èä½ï¼Œå¤šé€‰',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰å†…å®¹è§†å›¾',
  `view_config` text COMMENT 'è§†å›¾é…ç½®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article_data`
--

DROP TABLE IF EXISTS `cms_article_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `content` text COMMENT 'æ–‡ç« å†…å®¹',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« æ¥æº',
  `relation` varchar(255) DEFAULT NULL COMMENT 'ç›¸å…³æ–‡ç« ',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¯¦è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article_data`
--

LOCK TABLES `cms_article_data` WRITE;
/*!40000 ALTER TABLE `cms_article_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_article_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `site_id` varchar(64) DEFAULT '1' COMMENT 'ç«™ç‚¹ç¼–å·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `module` varchar(20) DEFAULT NULL COMMENT 'æ ç›®æ¨¡å—',
  `name` varchar(100) NOT NULL COMMENT 'æ ç›®åç§°',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `sort` int(11) DEFAULT '30' COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `in_menu` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨å¯¼èˆªä¸­æ˜¾ç¤º',
  `in_list` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨åˆ†ç±»é¡µä¸­æ˜¾ç¤ºåˆ—è¡¨',
  `show_modes` char(1) DEFAULT '0' COMMENT 'å±•ç°æ–¹å¼',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  `is_audit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦éœ€è¦å®¡æ ¸',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰åˆ—è¡¨è§†å›¾',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰å†…å®¹è§†å›¾',
  `view_config` text COMMENT 'è§†å›¾é…ç½®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ç›®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment`
--

DROP TABLE IF EXISTS `cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `content_id` varchar(64) NOT NULL COMMENT 'æ ç›®å†…å®¹çš„ç¼–å·',
  `title` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å†…å®¹çš„æ ‡é¢˜',
  `content` varchar(255) DEFAULT NULL COMMENT 'è¯„è®ºå†…å®¹',
  `name` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºå§“å',
  `ip` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºIP',
  `create_date` datetime NOT NULL COMMENT 'è¯„è®ºæ—¶é—´',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `audit_date` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¶é—´',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯„è®ºè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment`
--

LOCK TABLES `cms_comment` WRITE;
/*!40000 ALTER TABLE `cms_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_guestbook`
--

DROP TABLE IF EXISTS `cms_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_guestbook` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) NOT NULL COMMENT 'ç•™è¨€åˆ†ç±»',
  `content` varchar(255) NOT NULL COMMENT 'ç•™è¨€å†…å®¹',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(100) NOT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(100) NOT NULL COMMENT 'ç”µè¯',
  `workunit` varchar(100) NOT NULL COMMENT 'å•ä½',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT 'ç•™è¨€æ—¶é—´',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT 'å›å¤äºº',
  `re_date` datetime DEFAULT NULL COMMENT 'å›å¤æ—¶é—´',
  `re_content` varchar(100) DEFAULT NULL COMMENT 'å›å¤å†…å®¹',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç•™è¨€æ¿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_guestbook`
--

LOCK TABLES `cms_guestbook` WRITE;
/*!40000 ALTER TABLE `cms_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_link`
--

DROP TABLE IF EXISTS `cms_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'é“¾æ¥åç§°',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²',
  `image` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥åœ°å€',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å‹æƒ…é“¾æ¥';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_link`
--

LOCK TABLES `cms_link` WRITE;
/*!40000 ALTER TABLE `cms_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_site`
--

DROP TABLE IF EXISTS `cms_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹åç§°',
  `title` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹æ ‡é¢˜',
  `logo` varchar(255) DEFAULT NULL COMMENT 'ç«™ç‚¹Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT 'ç«™ç‚¹åŸŸå',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `theme` varchar(255) DEFAULT 'default' COMMENT 'ä¸»é¢˜',
  `copyright` text COMMENT 'ç‰ˆæƒä¿¡æ¯',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰ç«™ç‚¹é¦–é¡µè§†å›¾',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç«™ç‚¹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_site`
--

LOCK TABLES `cms_site` WRITE;
/*!40000 ALTER TABLE `cms_site` DISABLE KEYS */;
INSERT INTO `cms_site` VALUES ('1','é»˜è®¤ç«™ç‚¹','Web','',NULL,'Site ','Site ','basic','<p>\r\n	Copyright &copy; 2012-2013 <a href=\"#\" target=\"_blank\">ThinkGem</a> - Powered By <a href=\"#\" target=\"_blank\">Site</a> V1.0</p>','','1','2013-05-27 08:00:00','1','2015-04-16 13:00:38',NULL,'0'),('2','å­ç«™ç‚¹æµ‹è¯•','Subsite','',NULL,'subsite','Site ','basic','<p>\r\n	Copyright &copy; 2012-2013 Powered By V1.0</p>','','1','2013-05-27 08:00:00','1','2015-04-16 12:56:51',NULL,'0');
/*!40000 ALTER TABLE `cms_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_scheme`
--

DROP TABLE IF EXISTS `gen_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `category` varchar(2000) DEFAULT NULL COMMENT 'åˆ†ç±»',
  `package_name` varchar(500) DEFAULT NULL COMMENT 'ç”ŸæˆåŒ…è·¯å¾„',
  `module_name` varchar(30) DEFAULT NULL COMMENT 'ç”Ÿæˆæ¨¡å—å',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT 'ç”Ÿæˆå­æ¨¡å—å',
  `function_name` varchar(500) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½å',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½åï¼ˆç®€å†™ï¼‰',
  `function_author` varchar(100) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½ä½œè€…',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT 'ç”Ÿæˆè¡¨ç¼–å·',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”Ÿæˆæ–¹æ¡ˆ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_scheme`
--

LOCK TABLES `gen_scheme` WRITE;
/*!40000 ALTER TABLE `gen_scheme` DISABLE KEYS */;
INSERT INTO `gen_scheme` VALUES ('08b3f80abe2647ae9e4f1db035f12c41','æ–‡ä»¶èµ„æ–™ä¸å€Ÿé˜…å•å·å…³è”','curd','labs.modules','files','','æ–‡ä»¶èµ„æ–™ä¸å€Ÿé˜…å•å·å…³è”','æ–‡ä»¶èµ„æ–™ä¸å€Ÿé˜…å•å·å…³è”','YL','cc1aea94e07946ae8520485e8b5fd79c','1','2015-05-30 16:33:57','1','2015-05-30 16:33:57','','0'),('12d07b15cadf4abd954e9971340184eb','ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','curd','labs.modules','yq','','ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','å€Ÿç”¨ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','yq','4fac809a15704ca8a7d778d6b12b85e0','1','2015-06-14 15:04:27','1','2015-06-14 15:04:27','','0'),('13415d399d8846fca006e2b09f4589f3','è®¾å¤‡ç»´ä¿®ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','curd','labs.modules','yq','','è®¾å¤‡ç»´ä¿®ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','è®¾å¤‡ç»´ä¿®ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','yq','31aa87eed12f41ec8a5f5c06522b3ff1','1','2015-06-16 15:58:21','1','2015-06-16 15:58:21','','0'),('20150511101','æ•°æ®å­—å…¸ç±»å‹','curd','labs.modules','sys','','æ•°æ®å­—å…¸ç±»å‹','æ•°æ®å­—å…¸ç±»å‹','æ•°æ®å­—å…¸ç±»å‹','20150511101','1','2015-05-11 13:41:36','1','2015-05-11 13:53:08','','0'),('35a13dc260284a728a270db3f382664b','æ ‘ç»“æ„','treeTable','com.thinkgem.jeesite.modules','test','sub','æ ‘ç»“æ„ç”Ÿæˆ','æ ‘ç»“æ„','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2015-05-08 17:30:14','','0'),('82ae3575be15490f8aa6595a8fc8dd08','æ–‡ä»¶èµ„æ–™ç®¡ç†','curd','labs.modules','files','','æ–‡ä»¶èµ„æ–™ç®¡ç†','æ–‡ä»¶èµ„æ–™ç®¡ç†','YL','b2201709121d48959d37bf782bb2a836','1','2015-05-30 16:32:46','1','2015-05-30 16:32:46','','0'),('9b6c5e1084c54daa87298797d7d36483','ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·','curd','labs.modules','yq','','ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·','ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·','labs','05bebfc3649e47b3b30898052568e047','1','2015-06-01 17:14:33','1','2015-06-01 17:14:33','','0'),('9c9de9db6da743bb899036c6546061ac','å•è¡¨','curd','com.thinkgem.jeesite.modules','test','','å•è¡¨ç”Ÿæˆ','å•è¡¨','ThinkGem','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2015-04-25 13:47:31','','0'),('9cdbee32d448475da5dd863c028d6183','ä»ªå™¨é™çº§/æŠ¥åºŸç®¡ç†','curd','labs.modules','yq','','ä»ªå™¨é™çº§/æŠ¥åºŸ','ä»ªå™¨é™çº§/æŠ¥åºŸ','ljh','e61380a6338745f493c2201947d3f2db','1','2015-06-15 10:51:51','1','2015-06-15 10:51:51','','0'),('bc251bbb48524e3ba0998e6883cd970e','æ–‡ä»¶èµ„æ–™å€Ÿé˜…è®°å½•','curd','labs.modules','files','','æ–‡ä»¶èµ„æ–™å€Ÿé˜…è®°å½•','æ–‡ä»¶èµ„æ–™å€Ÿé˜…è®°å½•','YL','79ea565269e94290811466e2009d2069','1','2015-05-30 16:33:09','1','2015-05-30 16:33:09','','0'),('bcd599e2405a4b37b2741542d1779113','ä»ªå™¨ä¿¡æ¯ç®¡ç†','curd','labs.modules','yq','','ä»ªå™¨ä¿¡æ¯ç®¡ç†','ä»ªå™¨ä¿¡æ¯','yq','f4a9dc141b664cf999a76180f4b1e688','1','2015-05-27 14:53:12','1','2015-05-27 14:53:12','','0'),('d7a9122dcc914c139d1e25075e954af8','ä»ªå™¨ç»´ä¿®','curd','labs.modules','yq','ä»ªå™¨ç»´ä¿®','ä»ªå™¨ç»´ä¿®','ä»ªå™¨ç»´ä¿®','ä»ªå™¨ç»´ä¿®','ea5412a0e8214a6cb467071d3a4e8826','1','2015-06-17 16:18:38','1','2015-06-17 16:18:38','','0'),('db8474f196f645ef8674632a59226496','è®¾å¤‡é™çº§/æŠ¥åºŸç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','curd','labs.modules','yq','','è®¾å¤‡é™çº§/æŠ¥åºŸç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','è®¾å¤‡é™çº§/æŠ¥åºŸç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','yq','417e2601a3f84d409920e61f1d52237a','1','2015-06-16 15:57:51','1','2015-06-16 15:57:51','','0'),('e6d905fd236b46d1af581dd32bdfb3b0','ä¸»å­è¡¨','curd_many','com.thinkgem.jeesite.modules','test','sub','ä¸»å­è¡¨ç”Ÿæˆ','ä¸»å­è¡¨','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2015-05-08 17:30:25','','0');
/*!40000 ALTER TABLE `gen_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `comments` varchar(500) DEFAULT NULL COMMENT 'æè¿°',
  `class_name` varchar(100) DEFAULT NULL COMMENT 'å®ä½“ç±»åç§°',
  `parent_table` varchar(200) DEFAULT NULL COMMENT 'å…³è”çˆ¶è¡¨',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT 'å…³è”çˆ¶è¡¨å¤–é”®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES ('05bebfc3649e47b3b30898052568e047','lab_borrow_request','ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·å•','LabBorrowRequest','','','1','2015-06-01 17:13:35','1','2015-06-01 17:13:35','','0'),('20150511101','sys_dict_type','æ•°æ®å­—å…¸ç±»å‹','SysDictType','','','1','2015-05-11 13:41:22','1','2015-05-25 13:25:06','','0'),('31aa87eed12f41ec8a5f5c06522b3ff1','lab_repair_request_and_baseinfo','è®¾å¤‡ç»´ä¿®ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','LabRepairRequestAndBaseinfo','','','1','2015-06-16 15:56:29','1','2015-06-16 15:56:29','','0'),('417e2601a3f84d409920e61f1d52237a','lab_scrap_apply_and_baseinfo','è®¾å¤‡é™çº§/æŠ¥åºŸç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','LabScrapApplyAndBaseinfo','','','1','2015-06-16 15:56:49','1','2015-06-16 15:56:49','','0'),('43d6d5acffa14c258340ce6765e46c6f','test_data_main','ä¸šåŠ¡æ•°æ®è¡¨','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4fac809a15704ca8a7d778d6b12b85e0','lab_borrow_request_and_baseinfo','ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨','LabBorrowRequestAndBaseinfo','','','1','2015-06-14 15:03:03','1','2015-06-14 15:03:03','','0'),('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','ä¸šåŠ¡æ•°æ®å­è¡¨','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('7786840d0d84431d935d1e473daa06d9','newtable','newtable','Newtable','','','1','2015-06-04 10:08:41','1','2015-06-04 10:08:41','','0'),('79ea565269e94290811466e2009d2069','lab_file_borrow','æ–‡ä»¶èµ„æ–™å€Ÿç”¨å½’è¿˜è®°å½•','LabFileBorrow','','','1','2015-05-30 16:28:31','1','2015-05-30 16:28:31','','0'),('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','ä¸šåŠ¡æ•°æ®è¡¨','TestData','','','1','2013-08-12 13:10:05','1','2015-05-27 09:32:17','','0'),('b2201709121d48959d37bf782bb2a836','lab_file_attributes','æ–‡ä»¶èµ„æ–™å±æ€§','LabFileAttributes','','','1','2015-05-30 16:25:37','1','2015-05-30 16:25:37','','0'),('cc1aea94e07946ae8520485e8b5fd79c','lab_file_borrow_relationship','æ–‡ä»¶èµ„æ–™ä¸å€Ÿç”¨è®°å½•ä¹‹é—´çš„å…³ç³»','LabFileBorrowRelationship','','','1','2015-05-30 16:29:40','1','2015-05-30 16:29:40','','0'),('e61380a6338745f493c2201947d3f2db','lab_scrap_apply','è®¾å¤‡é™çº§/æŠ¥åºŸç”³è¯·è¡¨','LabScrapApply','','','1','2015-06-15 10:50:07','1','2015-06-15 10:50:07','','0'),('ea5412a0e8214a6cb467071d3a4e8826','lab_repair_request','è®¾å¤‡ç»´ä¿®ç”³è¯·è¡¨','LabRepairRequest','','','1','2015-06-17 16:17:37','1','2015-06-17 16:17:37','','0'),('f4a9dc141b664cf999a76180f4b1e688','lab_equipment_baseinfo','ä»ªå™¨åŸºæœ¬ä¿¡æ¯','LabEquipmentBaseinfo','','','1','2015-05-27 14:52:05','1','2015-05-27 16:54:58','','0'),('f6e4dafaa72f4c509636484715f33a96','test_tree','æ ‘ç»“æ„è¡¨','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±è¡¨ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `comments` varchar(500) DEFAULT NULL COMMENT 'æè¿°',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT 'åˆ—çš„æ•°æ®ç±»å‹çš„å­—èŠ‚é•¿åº¦',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVAç±»å‹',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVAå­—æ®µå',
  `is_pk` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸»é”®',
  `is_null` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ä¸ºç©º',
  `is_insert` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸ºæ’å…¥å­—æ®µ',
  `is_edit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ç¼–è¾‘å­—æ®µ',
  `is_list` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦åˆ—è¡¨å­—æ®µ',
  `is_query` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦æŸ¥è¯¢å­—æ®µ',
  `query_type` varchar(200) DEFAULT NULL COMMENT 'æŸ¥è¯¢æ–¹å¼ï¼ˆç­‰äºã€ä¸ç­‰äºã€å¤§äºã€å°äºã€èŒƒå›´ã€å·¦LIKEã€å³LIKEã€å·¦å³LIKEï¼‰',
  `show_type` varchar(200) DEFAULT NULL COMMENT 'å­—æ®µç”Ÿæˆæ–¹æ¡ˆï¼ˆæ–‡æœ¬æ¡†ã€æ–‡æœ¬åŸŸã€ä¸‹æ‹‰æ¡†ã€å¤é€‰æ¡†ã€å•é€‰æ¡†ã€å­—å…¸é€‰æ‹©ã€äººå‘˜é€‰æ‹©ã€éƒ¨é—¨é€‰æ‹©ã€åŒºåŸŸé€‰æ‹©ï¼‰',
  `dict_type` varchar(200) DEFAULT NULL COMMENT 'å­—å…¸ç±»å‹',
  `settings` varchar(2000) DEFAULT NULL COMMENT 'å…¶å®ƒè®¾ç½®ï¼ˆæ‰©å±•å­—æ®µJSONï¼‰',
  `sort` decimal(10,0) DEFAULT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡è¡¨å­—æ®µ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES ('013476c4ae314d089dfe2be8a993cb1f','31aa87eed12f41ec8a5f5c06522b3ff1','wxsqdh','ä»ªå™¨ç»´ä¿®ç”³è¯·å•å·','varchar(20)','String','wxsqdh','0','0','1','1','1','1','=','input','',NULL,20,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('0424834d95f84f138a7faccb8bf0bdf1','05bebfc3649e47b3b30898052568e047','jcrq','å€Ÿå‡ºæ—¥æœŸ','date','java.util.Date','jcrq','0','1','1','1','1','0','=','dateselect','',NULL,160,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('0547db21fd1a4ba5ba496b9b5f289d30','cc1aea94e07946ae8520485e8b5fd79c','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,20,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('05df3da7ed9f4117b5e5472af2640770','ea5412a0e8214a6cb467071d3a4e8826','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,300,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('0637b22355f24b9ca26dca88cfb3d1f5','e61380a6338745f493c2201947d3f2db','amt','æ•°é‡','int(11)','Integer','amt','0','1','1','1','0','0','=','input','',NULL,60,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('07893aecbd824f279e2964c57d5b066e','05bebfc3649e47b3b30898052568e047','approved_by','å®¡æ‰¹äºº','varchar(20)','String','approvedBy','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('08329e2e691c440eb30f0c9059e0cb90','79ea565269e94290811466e2009d2069','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','æ€§åˆ«','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,6,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('09a7927e43ea4f1aa4f972b8e84e9db9','4fac809a15704ca8a7d778d6b12b85e0','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,40,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('0a032ad64a144ed3a99f1d548276459c','ea5412a0e8214a6cb467071d3a4e8826','yjfxfy','é¢„è®¡ç»´ä¿®è´¹ç”¨','varchar(100)','String','yjfxfy','0','1','1','1','1','0','=','input','',NULL,120,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('0b6b0d3766f64b3caa55ef9489c46716','e61380a6338745f493c2201947d3f2db','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,340,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('0c0cae906127482595b4247c42b1267d','e61380a6338745f493c2201947d3f2db','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,310,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('0c260625588043b6b50d33578cd3c2dd','f4a9dc141b664cf999a76180f4b1e688','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,230,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('0c99ce6b1ad34b8094a4aa398fa37c6d','79ea565269e94290811466e2009d2069','revertexecuter','å½’è¿˜ç»åŠäºº','varchar(64)','String','revertexecuter','0','1','1','1','0','0','=','input','',NULL,240,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('0d685bdcce0947078f1593e51c9a05b5','79ea565269e94290811466e2009d2069','approvename','å®¡æ‰¹äººå§“å','varchar(64)','String','approvename','0','1','1','1','0','0','=','input','',NULL,160,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('0e3cf308ca324b16b87c66a97b6040c6','ea5412a0e8214a6cb467071d3a4e8826','sbmc','ä»ªå™¨è®¾å¤‡åç§°','varchar(100)','String','sbmc','0','1','1','1','0','0','=','input','',NULL,180,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('0f136c0ae7424bf7a4336eb7ebde6e87','05bebfc3649e47b3b30898052568e047','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,220,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,9,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('10c0163633ee4cca9c74d039351e6bd6','b2201709121d48959d37bf782bb2a836','fileid','æ–‡ä»¶èµ„æ–™ID','varchar(64)','String','fileid','0','1','1','1','1','1','like','input','',NULL,110,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('12494ce5de7a4159b37a617244d1e6b0','ea5412a0e8214a6cb467071d3a4e8826','control_no','æ§åˆ¶ç¼–å·','varchar(30)','String','controlNo','0','1','1','1','0','0','=','input','',NULL,20,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('12da64c7c12f4c90af00451864472eae','b2201709121d48959d37bf782bb2a836','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,20,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('13a01dfcf5f149f391359508d88a61a9','f4a9dc141b664cf999a76180f4b1e688','factory_no','å‡ºå‚ç¼–å·','varchar(30)','String','factoryNo','0','1','1','1','0','0','=','input','',NULL,50,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('14680c956a7e44b3be543894cf6f0b60','f4a9dc141b664cf999a76180f4b1e688','use_date','æŠ•å…¥ä½¿ç”¨æ—¥æœŸ','date','java.util.Date','useDate','0','1','1','1','0','0','=','dateselect','',NULL,70,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('161a3e9b4a074796aec39302d455c0d0','b2201709121d48959d37bf782bb2a836','filename','æ–‡ä»¶èµ„æ–™åç§°','varchar(256)','String','filename','0','1','1','1','1','1','like','input','',NULL,120,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('17e05ac2836442ad98606e56e549ce05','4fac809a15704ca8a7d778d6b12b85e0','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,60,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('17fa9c4ce4054c48919a0cbe8208b830','4fac809a15704ca8a7d778d6b12b85e0','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('18b33c1366dd412cba6e681803063c10','e61380a6338745f493c2201947d3f2db','dqzt','å½“å‰çŠ¶æ€','varchar(30)','String','dqzt','0','0','1','1','1','0','=','input','',NULL,220,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('19485845ecf74aa9964b970a6d6df117','4fac809a15704ca8a7d778d6b12b85e0','yq_no','ä»ªå™¨ç¼–å·','varchar(30)','String','yqNo','0','0','1','1','1','0','=','input','',NULL,30,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('197d281596924c5c93bf99bef6a95250','f4a9dc141b664cf999a76180f4b1e688','sbmc','ä»ªå™¨è®¾å¤‡åç§°','varchar(200)','String','sbmc','0','0','1','1','1','1','=','input','',NULL,190,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('19bbdaa451774330bf73d790cce88fd4','05bebfc3649e47b3b30898052568e047','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,240,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','åŠ å…¥æ—¥æœŸ','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1b615745a8c1421bbe79d9237451c4f8','ea5412a0e8214a6cb467071d3a4e8826','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,260,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','åŠ å…¥æ—¥æœŸ','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect','',NULL,7,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('1c852652cc094159ad602cb9a4d109a7','b2201709121d48959d37bf782bb2a836','filetype','æ–‡ä»¶èµ„æ–™ç±»å‹','int(11)','Integer','filetype','0','1','1','1','0','0','=','input','',NULL,160,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('1cbfa86f409f46f98c71197706a130aa','b2201709121d48959d37bf782bb2a836','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','å½’å±ç”¨æˆ·','varchar2(64)','String','user.id|name','0','1','1','1','1','1','=','userselect','',NULL,2,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('1e0f2af040084ffebb8499474326b2bd','79ea565269e94290811466e2009d2069','approveopinion','å®¡æ‰¹äººæ„è§','varchar(256)','String','approveopinion','0','1','1','1','0','0','=','input','',NULL,170,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('1e19c26fa94b451c88800c1ae404f3ce','ea5412a0e8214a6cb467071d3a4e8826','equip_type','å‹å·','varchar(20)','String','equipType','0','1','1','1','0','0','=','input','',NULL,30,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('1e20cb7ffd9f4126a4b253cd82679a3d','b2201709121d48959d37bf782bb2a836','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,70,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('1e3ffe11096542f4acc4575801a09507','ea5412a0e8214a6cb467071d3a4e8826','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,310,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('1f0a326925334994b19c607dfdda241c','e61380a6338745f493c2201947d3f2db','jjbfly','é™çº§æŠ¥åºŸç†ç”±','varchar(200)','String','jjbfly','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('2007cf98379b4ee3a2076d65454ddfdc','79ea565269e94290811466e2009d2069','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('20150511101','20150511101','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511102','20150511101','code','ç±»å‹ä»£ç ','varchar(30)','String','code','0','0','1','1','1','1','=','input','',NULL,20,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511103','20150511101','name','ç±»åˆ«åç§°','varchar(64)','String','name','0','0','1','1','0','1','like','input','',NULL,30,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511104','20150511101','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,40,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511105','20150511101','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','1','0','=','dateselect','',NULL,50,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511106','20150511101','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,60,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511107','20150511101','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,70,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511108','20150511101','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511109','20150511101','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,90,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511110','20150511101','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','0','0','0','=','input','',NULL,100,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511111','20150511101','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','0','0','0','=','input','',NULL,110,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511112','20150511101','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','0','0','0','=','input','',NULL,120,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511113','20150511101','t3','å¤‡ç”¨3','decimal(10,0)','String','t3','0','1','1','0','0','0','=','input','',NULL,130,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('21630557f915453b8b7b3ccfbf89793f','f4a9dc141b664cf999a76180f4b1e688','sbshrq','è®¾å¤‡æ”¶è´§æ—¥æœŸ','date','java.util.Date','sbshrq','0','1','1','1','0','0','=','dateselect','',NULL,170,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('22dd4c098ae647d6b65bb2128a54c2df','e61380a6338745f493c2201947d3f2db','filled_by','ç”³è¯·äºº','varchar(20)','String','filledBy','0','1','1','1','1','0','=','input','',NULL,190,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('2358b714feca44dfa9735285699772fd','e61380a6338745f493c2201947d3f2db','id','ä¸»é”®','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','æ‰€æœ‰çˆ¶çº§ç¼–å·','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('250cafe9c3334cf5b5908e7f066f8e82','e61380a6338745f493c2201947d3f2db','approved_by','å®¡æ‰¹äºº','varchar(20)','String','approvedBy','0','1','1','1','0','0','=','input','',NULL,170,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('2708a9b66e2b4a25a24834ab6a6b9971','31aa87eed12f41ec8a5f5c06522b3ff1','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,60,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('279fb643714c4f01b8069462086808a4','79ea565269e94290811466e2009d2069','borrowrecheckdate','å€Ÿé˜…æ‰§è¡Œæ—¥æœŸ','date','java.util.Date','borrowrecheckdate','0','1','1','1','0','0','=','dateselect','',NULL,230,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('280891b414684ffda69bc0896487543c','79ea565269e94290811466e2009d2069','approvedate','å®¡æ‰¹çš„æ—¥æœŸ','date','java.util.Date','approvedate','0','1','1','1','0','0','=','dateselect','',NULL,200,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('28b3e529a39b47389cbb37cf13a88937','ea5412a0e8214a6cb467071d3a4e8826','wxly','ç»´ä¿®ç†ç”±','varchar(200)','String','wxly','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('2b3ec47a7a7d4b69a5c3181b5e77d252','cc1aea94e07946ae8520485e8b5fd79c','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,40,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('2c6adcfa3d13425da24f66983ef203f5','f4a9dc141b664cf999a76180f4b1e688','zcyz','è´¢äº§åŸå€¼','float','Float','zcyz','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('2c8da90517534232acd07e9a2e17a18f','05bebfc3649e47b3b30898052568e047','remarks','å¤‡æ³¨','varchar(100)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,250,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('2d814b12f4e546859e9c171fd66d734e','417e2601a3f84d409920e61f1d52237a','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,70,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('3035b6aa77c34e339a51c969e5006103','e61380a6338745f493c2201947d3f2db','equip_type','å‹å·','varchar(20)','String','equipType','0','1','1','1','1','0','=','input','',NULL,40,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('31e790f3a79f41aca8a195d09dd54f52','f4a9dc141b664cf999a76180f4b1e688','accepted_state','æ”¶è´§æ—¶çŠ¶æ€','varchar(10)','String','acceptedState','0','1','1','1','0','0','=','select','sys_office_type',NULL,90,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3324ef1a963a45f99c1a0bb1384adcd9','b2201709121d48959d37bf782bb2a836','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('34f7443214334cd7b18e6c2e3225cf2e','05bebfc3649e47b3b30898052568e047','jcfhr','å€Ÿå‡ºå¤æ ¸äºº','varchar(200)','String','jcfhr','0','1','1','1','0','0','=','input','',NULL,150,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('350100bed5e24cab999753f2aa39a709','e61380a6338745f493c2201947d3f2db','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,350,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('37b92cb7cd0a4368b099d23d6d68ca54','ea5412a0e8214a6cb467071d3a4e8826','sig_date','å®¡æ‰¹æ—¥æœŸ','date','java.util.Date','sigDate','0','1','1','1','0','0','=','dateselect','',NULL,130,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('39080d975f3343bcbca3baa7d993b88d','ea5412a0e8214a6cb467071d3a4e8826','zcyz','è´¢äº§åŸå€¼','float','Float','zcyz','0','1','1','1','1','0','=','input','',NULL,80,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('39487bf03d1143c49fbe22f19a91c678','e61380a6338745f493c2201947d3f2db','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,280,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('396a34cc22ff42448a99ec08047d132f','cc1aea94e07946ae8520485e8b5fd79c','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,110,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','åˆ›å»ºè€…','varchar2(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,8,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('39af03e4bc49431aa37f8316e7177a06','cc1aea94e07946ae8520485e8b5fd79c','fileid','æ–‡ä»¶èµ„æ–™ç¼–å·','varchar(64)','String','fileid','0','1','1','1','1','1','=','input','',NULL,120,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('3a715b18041e49158f3f84a68a3151f4','05bebfc3649e47b3b30898052568e047','syly','ä½¿ç”¨ç†ç”±','varchar(200)','String','syly','0','1','1','1','1','0','=','input','',NULL,60,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','å½’å±åŒºåŸŸ','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3a9a4d6205854e9ba06bca22769ab3e7','05bebfc3649e47b3b30898052568e047','jydh','ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·å•å·','varchar(20)','String','jydh','0','0','1','1','1','1','=','input','',NULL,100,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('3c630e396d994daeaa9123260c49dc1a','f4a9dc141b664cf999a76180f4b1e688','remarks','å¤‡æ³¨','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,240,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('3cf6fe6772ab4a999f83ac172aeaa766','ea5412a0e8214a6cb467071d3a4e8826','mcwxrq','æœ«æ¬¡ç»´ä¿®æ—¥æœŸ','date','java.util.Date','mcwxrq','0','1','1','1','0','0','=','dateselect','',NULL,100,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3e0c42f512624c47b2c76416b0a602ab','05bebfc3649e47b3b30898052568e047','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,270,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('3ee9bb42410b41e5bba20dfc43744bce','31aa87eed12f41ec8a5f5c06522b3ff1','remarks','å¤‡æ³¨','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('40159dee0b5a465ea96a00ac143e3625','b2201709121d48959d37bf782bb2a836','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('42b59ce4471b45268d87a52f6645984d','f4a9dc141b664cf999a76180f4b1e688','sno','åºå·','varchar(10)','String','sno','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('42edfe01dc69434b8e20ea2c6ee71759','b2201709121d48959d37bf782bb2a836','filestatus','å½“å‰çŠ¶æ€','int(11)','Integer','filestatus','0','1','1','1','1','0','=','input','',NULL,200,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('437695a3fd6047b3910c69d7c0fbb09f','f4a9dc141b664cf999a76180f4b1e688','zcjz','è´¢äº§å‡€å€¼','float','Float','zcjz','0','1','1','1','0','0','=','input','',NULL,150,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('4494156acd5541e69053a8316a0ae4e8','4fac809a15704ca8a7d778d6b12b85e0','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,50,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('460431c8225547db92f481806b004e61','31aa87eed12f41ec8a5f5c06522b3ff1','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,100,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('46eb5b7e4c194557b1094102b858d181','05bebfc3649e47b3b30898052568e047','sbjsl','å€Ÿç”¨ä»ªå™¨è®¾å¤‡åç§°åŠæ•°é‡','varchar(200)','String','sbjsl','0','1','1','1','1','1','like','input','',NULL,110,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('48f1fad24b85487d917f6e499f9c61a9','ea5412a0e8214a6cb467071d3a4e8826','factory_date','å‡ºå‚æ—¥æœŸ','date','java.util.Date','factoryDate','0','1','1','1','1','0','=','dateselect','',NULL,60,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input','',NULL,5,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('4a22d64765dc4e178739dce1dd1d1c3c','417e2601a3f84d409920e61f1d52237a','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('4bc24b6854e3445f89038f55a183df3b','cc1aea94e07946ae8520485e8b5fd79c','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('4c8d5fca0dde4c0f863404af5ba630a8','05bebfc3649e47b3b30898052568e047','jybm','å€Ÿç”¨éƒ¨é—¨','varchar(60)','String','jybm','0','1','1','1','1','0','=','input','',NULL,20,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4c9708a18cf04d5cb1e4a3a0c900c9e4','f4a9dc141b664cf999a76180f4b1e688','place','ç›®å‰æ”¾ç½®åœ°ç‚¹','varchar(60)','String','place','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('4e34dbf9122949bfbf6b7856a9cade4b','79ea565269e94290811466e2009d2069','borrowexecuter','å€Ÿé˜…ç»åŠäºº','varchar(64)','String','borrowexecuter','0','1','1','1','0','0','=','input','',NULL,210,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('4f72551508a74ac8844c5743621f0dbe','417e2601a3f84d409920e61f1d52237a','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,90,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('523fe9fc2db34d318136a48f4e9b2f96','e61380a6338745f493c2201947d3f2db','wxly','ç»´ä¿®ç†ç”±','varchar(200)','String','wxly','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('528ec67939a74da6a543f147e5797e8c','05bebfc3649e47b3b30898052568e047','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,210,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('529a50606c514df18cc2097d083b71e9','ea5412a0e8214a6cb467071d3a4e8826','applicant','ç”³è¯·äºº','varchar(20)','String','applicant','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('55af237190c942d493c90e345c61b127','e61380a6338745f493c2201947d3f2db','yjzccz','é¢„è®¡å‡€æ®‹å€¼','float','Float','yjzccz','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5898afacf61f47749af0f2efa8de7218','b2201709121d48959d37bf782bb2a836','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,60,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','æ›´æ–°è€…','varchar2(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,10,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('5ad4183b35a74344b8d2cafa4942713d','05bebfc3649e47b3b30898052568e047','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,300,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input','',NULL,1,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('5ebd1e5b10b84f5094f06d7825b71377','b2201709121d48959d37bf782bb2a836','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,40,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('5eef359a4e0643c9bf8ddd4763e8efe5','79ea565269e94290811466e2009d2069','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,30,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('5ef1e111624349d6966a450b0113857a','f4a9dc141b664cf999a76180f4b1e688','equip_type','å‹å·','varchar(20)','String','equipType','0','1','1','1','1','0','=','input','',NULL,40,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('5efd6293f1c54302928c8422585ff64a','31aa87eed12f41ec8a5f5c06522b3ff1','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,40,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('5f6573f4887e4566805f411a2bea2fa4','f4a9dc141b664cf999a76180f4b1e688','dqzt','å½“å‰çŠ¶æ€','varchar(30)','String','dqzt','0','0','1','1','1','0','=','input','',NULL,180,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('5ff4b587857447d484564e380d827a1a','e61380a6338745f493c2201947d3f2db','equip_name','è®¾å¤‡åç§°','varchar(60)','String','equipName','0','1','1','1','1','0','=','input','',NULL,30,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('6087acf0c0cb4e0e95b7a02be3e97794','79ea565269e94290811466e2009d2069','reqenddate','é¢„è®¡ç”³è¯·æˆªæ­¢æ—¥æœŸ','date','java.util.Date','reqenddate','0','1','1','1','1','0','=','dateselect','',NULL,150,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('61617f0dd34f4e4ba2c82c860ed75c60','f4a9dc141b664cf999a76180f4b1e688','fj','é™„ä»¶','varchar(200)','String','fj','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('62678a0088314cda8ee13d5d45288202','f4a9dc141b664cf999a76180f4b1e688','euip_no','è¡¨å·','varchar(30)','String','euipNo','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','åç§°','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('6361359aaa3c4c118449b73396da7cab','b2201709121d48959d37bf782bb2a836','usedate','æŠ•å…¥ä½¿ç”¨æ—¥æœŸ','date','java.util.Date','usedate','0','1','1','1','0','0','=','dateselect','',NULL,180,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('6459206248254e30941a669d864e29b4','417e2601a3f84d409920e61f1d52237a','remarks','å¤‡æ³¨','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('649df51124564b678eed071de14138db','79ea565269e94290811466e2009d2069','revertrecheck','å½’è¿˜å¤æ ¸äºº','varchar(64)','String','revertrecheck','0','1','1','1','0','0','=','input','',NULL,250,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('6580aa9069f24e0f83274287a305bc54','417e2601a3f84d409920e61f1d52237a','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,40,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('65c32ee57fcc417e827423202aa024e8','417e2601a3f84d409920e61f1d52237a','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('6665665fcce9423cabe3347da0f03ea8','79ea565269e94290811466e2009d2069','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,20,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('669737fa28374be68c7298e01329f5dd','f4a9dc141b664cf999a76180f4b1e688','yq_no','ä»ªå™¨ç¼–å·','varchar(30)','String','yqNo','0','0','1','1','1','1','=','input','',NULL,160,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','æ’åº','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','ä¸šåŠ¡ä¸»è¡¨','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('696ec920de0e4f6387decc4bf577900c','e61380a6338745f493c2201947d3f2db','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,260,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('6e43b2195ac946d4863f15dc0a97fa55','79ea565269e94290811466e2009d2069','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,60,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('6eb75a920785452789078c307f20d978','cc1aea94e07946ae8520485e8b5fd79c','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,70,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('705ba1bc2a304c3f8bd6d4d0690da89a','79ea565269e94290811466e2009d2069','reqcontentcount','ç”³è¯·æ–‡ä»¶èµ„æ–™åç§°åŠæ•°é‡','varchar(1024)','String','reqcontentcount','0','1','1','1','0','0','=','input','',NULL,280,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('716a39d0fd5448ad990ef33507c89ddf','ea5412a0e8214a6cb467071d3a4e8826','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,330,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','å½’å±åŒºåŸŸ','nvarchar2(64)','String','area.id|name','0','1','1','1','1','1','=','areaselect','',NULL,4,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('751704ce45ab48099296f6ef6b8a62f6','e61380a6338745f493c2201947d3f2db','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,270,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('7701199d82e4416eb0f5e4583352e9d7','79ea565269e94290811466e2009d2069','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,40,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('77a9893a57ee48cf88de9fe965644a3f','ea5412a0e8214a6cb467071d3a4e8826','zcjz','è´¢äº§å‡€å€¼','float','Float','zcjz','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('780bee8abd7c46038f5419c43ae170e6','05bebfc3649e47b3b30898052568e047','ydjbr','é¢„å®šç»åŠäºº','varchar(100)','String','ydjbr','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('79fb95c16eda4de285ae9be81fd8dab0','417e2601a3f84d409920e61f1d52237a','jjbfdh','ä»ªå™¨é™çº§/æŠ¥åºŸç”³è¯·å•å·','varchar(20)','String','jjbfdh','0','0','1','1','1','1','=','input','',NULL,20,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('7a13ae19f1c948dd91e13bc3cb9dea44','cc1aea94e07946ae8520485e8b5fd79c','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('7a1945ba6a7540d9816cfbf26f7ac94d','417e2601a3f84d409920e61f1d52237a','id','ä¸»é”®','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('7a3f6d2fe84b4300bad09b1b30f6bb4f','05bebfc3649e47b3b30898052568e047','yjjysj1','é¢„è®¡å€Ÿç”¨æ—¶é—´-å¼€å§‹','datetime','java.util.Date','yjjysj1','0','1','1','1','1','1','between','dateselect','',NULL,40,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('7c834e1efb184f90ae628739aaedd130','4fac809a15704ca8a7d778d6b12b85e0','remarks','å¤‡æ³¨','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('7e5db2df128f4eb0b51fde5cd7536a4e','05bebfc3649e47b3b30898052568e047','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,260,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('7fa17f6d135742e8aa86e73c7fdb97bd','f4a9dc141b664cf999a76180f4b1e688','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,220,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('813b5764cbac4b388d9c2d667d7a6612','b2201709121d48959d37bf782bb2a836','filearchivedate','æ–‡ä»¶èµ„æ–™å½’æ¡£æ—¥æœŸ','date','java.util.Date','filearchivedate','0','1','1','1','0','0','=','dateselect','',NULL,170,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('81cf15e588734ea4a4ea34f6f1932c8c','05bebfc3649e47b3b30898052568e047','approval_advice','å®¡æ‰¹æ„è§','varchar(200)','String','approvalAdvice','0','1','1','1','0','0','=','input','',NULL,70,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('8450c975f2e04da1a6a27cc92a7c1de9','f4a9dc141b664cf999a76180f4b1e688','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,210,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('849ef405385748d9a7d1e2baf8993780','ea5412a0e8214a6cb467071d3a4e8826','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,320,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('8556402e28b34ede8205aeb5635a6beb','31aa87eed12f41ec8a5f5c06522b3ff1','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('85874b2a4c59441f8803dca567fbc960','f4a9dc141b664cf999a76180f4b1e688','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,200,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('8646e48e322c475583ff4c22b966c65a','e61380a6338745f493c2201947d3f2db','wxsqdh','ä»ªå™¨ç»´ä¿®ç”³è¯·å•å·','varchar(20)','String','wxsqdh','0','0','1','1','1','1','=','input','',NULL,210,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('8713ae3250aa4197a16c585dbc52359b','79ea565269e94290811466e2009d2069','reqdepartment','ç”³è¯·å€Ÿé˜…éƒ¨é—¨','varchar(128)','String','reqdepartment','0','1','1','1','1','0','=','input','',NULL,130,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('873c6ddd0ca2469d9a087f55161fc346','417e2601a3f84d409920e61f1d52237a','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,60,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('87b370094d2f42918e770a214a1a4e99','417e2601a3f84d409920e61f1d52237a','yq_no','ä»ªå™¨ç¼–å·','varchar(30)','String','yqNo','0','0','1','1','1','1','=','input','',NULL,30,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('87c6e844307543029b3c9f3fc4511ae6','05bebfc3649e47b3b30898052568e047','yjjysj2','é¢„è®¡å€Ÿç”¨æ—¶é—´-ç»“æŸ','datetime','java.util.Date','yjjysj2','0','1','1','1','1','0','=','dateselect','',NULL,50,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('88431684da79426b99761e463970bc17','79ea565269e94290811466e2009d2069','reqname','ç”³è¯·äººå§“å','varchar(64)','String','reqname','0','1','1','1','1','1','like','input','',NULL,180,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('88f4ca21e3bc450097f159b5df4b4063','cc1aea94e07946ae8520485e8b5fd79c','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,30,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('89cb8ec0078e48c09864ffc3f6a15662','e61380a6338745f493c2201947d3f2db','yjsynx','é¢„è®¡ä½¿ç”¨å¹´é™','int(11)','Integer','yjsynx','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b4b5ab14ece45adac263ff3775c63c4','e61380a6338745f493c2201947d3f2db','control_no','æ§åˆ¶ç¼–å·','varchar(30)','String','controlNo','0','1','1','1','0','0','=','input','',NULL,20,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','å½’å±ç”¨æˆ·','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,12,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('8de218656ed7425ab3326ee8e23cb681','417e2601a3f84d409920e61f1d52237a','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,100,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('90454f858f59474c802b353343a7951b','79ea565269e94290811466e2009d2069','revertrecheckdate','å½’è¿˜æ‰§è¡Œæ—¥æœŸ','date','java.util.Date','revertrecheckdate','0','1','1','1','0','0','=','dateselect','',NULL,260,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('921872d40f4a40ec8830c546b1673553','b2201709121d48959d37bf782bb2a836','filestandard','å›¾ä¹¦æ ‡å‡†åç§°','varchar(128)','String','filestandard','0','1','1','1','1','1','like','input','',NULL,150,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9337f20ff3e04808868f7992287b1ad2','ea5412a0e8214a6cb467071d3a4e8826','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,340,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('9588b5ce8d584d6a80a308bf545aae96','ea5412a0e8214a6cb467071d3a4e8826','apply_date','ç”³è¯·æ—¥æœŸ','date','java.util.Date','applyDate','0','1','1','1','1','0','=','dateselect','',NULL,150,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('96b91f57ec464ad7b302d29bb348304c','ea5412a0e8214a6cb467071d3a4e8826','wxsqdh','ä»ªå™¨ç»´ä¿®ç”³è¯·å•å·','varchar(20)','String','wxsqdh','0','0','1','1','1','1','=','input','',NULL,160,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('976341acaf0443f1bdb5a0fa4da967ed','ea5412a0e8214a6cb467071d3a4e8826','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,350,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('9902c5cd8c494e2c9dfb293b16d6816e','b2201709121d48959d37bf782bb2a836','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,50,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('991a57079e2a4b8c9a09f226e65aac52','31aa87eed12f41ec8a5f5c06522b3ff1','id','ä¸»é”®','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','çˆ¶çº§ç¼–å·','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9ae29e090f4c48a48e3559b2dcf08e5f','f4a9dc141b664cf999a76180f4b1e688','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,260,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('9b819d448b3e4a2ea211ca50d1f17488','4fac809a15704ca8a7d778d6b12b85e0','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,70,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('9b81e899b99e4aef8be013a8dc8c5794','e61380a6338745f493c2201947d3f2db','remarks','å¤‡æ³¨','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,300,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('9c098cff934246728179616b3346c0a8','e61380a6338745f493c2201947d3f2db','factory','ç”Ÿäº§å‚å®¶','varchar(60)','String','factory','0','1','1','1','0','0','=','input','',NULL,70,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('9e3677ad93434c079c23b1bd39d41627','05bebfc3649e47b3b30898052568e047','ghrq','å½’è¿˜æ—¥æœŸ','date','java.util.Date','ghrq','0','1','1','1','1','0','=','dateselect','',NULL,190,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('9f0e2e52fb384b8b9f3d11f08a891c21','cc1aea94e07946ae8520485e8b5fd79c','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('a0572a24db1b48208a41bc2e3ccb083f','31aa87eed12f41ec8a5f5c06522b3ff1','yq_no','ä»ªå™¨ç¼–å·','varchar(30)','String','yqNo','0','0','1','1','1','1','=','input','',NULL,30,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('a228518927f04bedb8eb5a9f095fc769','79ea565269e94290811466e2009d2069','fileborrowstatus','æ–‡ä»¶èµ„æ–™å€Ÿé˜…çŠ¶æ€','int(11)','Integer','fileborrowstatus','0','1','1','1','1','0','=','input','',NULL,120,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('a3f01f8dc05f4976875bf80d3b3fb647','4fac809a15704ca8a7d778d6b12b85e0','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,100,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('a4cd15b9cc004b409e844583bb1a9009','e61380a6338745f493c2201947d3f2db','ytzj','å·²ææŠ˜æ—§','float','Float','ytzj','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('a526f5f55f484d3c8dbdcefc4007272b','7786840d0d84431d935d1e473daa06d9','id','id','int(11)','Integer','id','1','0','1','0','1','0','=','input','',NULL,20,'1','2015-06-04 10:08:41','1','2015-06-04 10:08:41',NULL,'0'),('a5bf757c291e4dbd9692a9d0c50dafe4','b2201709121d48959d37bf782bb2a836','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,130,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('a6546e0da9ec4788abaf142e1193dc07','ea5412a0e8214a6cb467071d3a4e8826','czrq','æ“ä½œæ—¥æœŸ','date','java.util.Date','czrq','0','1','1','1','0','0','=','dateselect','',NULL,220,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('a744b19b832a46a78f4506d7776e1cf7','e61380a6338745f493c2201947d3f2db','approval_advice','å®¡æ‰¹æ„è§','varchar(200)','String','approvalAdvice','0','1','1','1','0','0','=','input','',NULL,160,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('a7bf04e10d5d42adb15af256e9aecc16','ea5412a0e8214a6cb467071d3a4e8826','spr','å®¡æ‰¹äºº','varchar(30)','String','spr','0','1','1','1','0','0','=','input','',NULL,190,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('a916157372be4e93825a777e8c9341c9','ea5412a0e8214a6cb467071d3a4e8826','euip_no','è¡¨å·','varchar(30)','String','euipNo','0','1','1','1','1','0','=','input','',NULL,40,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('a9382e2c0fc84dd3a40f362b4c3a0021','79ea565269e94290811466e2009d2069','reqreason','ç”³è¯·å€Ÿé˜…åŸå› ','varchar(256)','String','reqreason','0','1','1','1','0','0','=','input','',NULL,190,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('aaac2740f7e64164b0c685a5d95f71e8','79ea565269e94290811466e2009d2069','borrowrecheck','å€Ÿé˜…å¤æ ¸äºº','varchar(64)','String','borrowrecheck','0','1','1','1','0','0','=','input','',NULL,220,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('aaf7bdfb98a04e4ba0a8a968b11753d6','05bebfc3649e47b3b30898052568e047','pzrq','æ‰¹å‡†æ—¥æœŸ','date','java.util.Date','pzrq','0','1','1','1','0','0','=','dateselect','',NULL,90,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('ac8143c8748c4638a76df57bb7b5831f','05bebfc3649e47b3b30898052568e047','jcjbr','å€Ÿå‡ºç»åŠäºº','varchar(200)','String','jcjbr','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('acca4749bfbc4a768adf42cc7292fb8f','4fac809a15704ca8a7d778d6b12b85e0','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('accf87fb39a04e8eba4bce7084e0ce5f','ea5412a0e8214a6cb467071d3a4e8826','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,270,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('ad2443b790884e489eec153eb579be44','417e2601a3f84d409920e61f1d52237a','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,50,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('ad2c679089ce4263a0374695185166f3','4fac809a15704ca8a7d778d6b12b85e0','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,90,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','å½’å±éƒ¨é—¨','varchar2(64)','String','office.id|name','0','1','1','1','1','1','=','officeselect','',NULL,3,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('ad813f722efd4a05887c88b5084d3ec9','cc1aea94e07946ae8520485e8b5fd79c','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,50,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('aedf8563248d4a92bdbee687052781b4','05bebfc3649e47b3b30898052568e047','ydrq','é¢„å®šæ—¥æœŸ','date','java.util.Date','ydrq','0','1','1','1','1','0','=','dateselect','',NULL,130,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('b0a3192ee11c4d3fb2fd2a39f2eebb10','4fac809a15704ca8a7d778d6b12b85e0','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('b3665bfd1b7d4724bd507c95a22b2562','e61380a6338745f493c2201947d3f2db','sig_date','å®¡æ‰¹æ—¥æœŸ','date','java.util.Date','sigDate','0','1','1','1','0','0','=','dateselect','',NULL,180,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('b45d2f567b994066a3cda453aeeba049','f4a9dc141b664cf999a76180f4b1e688','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,250,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('b467e85476f74358b249de3824d96228','f4a9dc141b664cf999a76180f4b1e688','id','ä¸»é”®','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('b577b0bc23dc4a96b03ac0875137cf40','ea5412a0e8214a6cb467071d3a4e8826','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,290,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('b643a16ce7d442d4a48bb1efd62fe9b2','b2201709121d48959d37bf782bb2a836','filecontrolid','æ–‡ä»¶èµ„æ–™æ§åˆ¶ç¼–å·','varchar(64)','String','filecontrolid','0','1','1','1','1','1','like','input','',NULL,140,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('b66aa05da4b64493bc1d9354e3eff2e7','05bebfc3649e47b3b30898052568e047','ghfhr','å½’è¿˜å¤æ ¸äºº','varchar(200)','String','ghfhr','0','1','1','1','0','0','=','input','',NULL,180,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('b71a3a12f48641dd89bc82a4b22cb440','ea5412a0e8214a6cb467071d3a4e8826','spyj','å®¡æ‰¹æ„è§','varchar(200)','String','spyj','0','1','1','1','0','0','=','input','',NULL,200,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('b856ad3fb2744e7683fce6775d2b7363','f4a9dc141b664cf999a76180f4b1e688','factory','ç”Ÿäº§å‚å®¶','varchar(60)','String','factory','0','1','1','1','1','0','=','input','',NULL,30,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('b95e2f94bc27409f9249e1980c261ea0','e61380a6338745f493c2201947d3f2db','czrq','æ“ä½œæ—¥æœŸ','date','java.util.Date','czrq','0','1','1','1','0','0','=','dateselect','',NULL,250,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('ba8219bc166b4aaf82fd67cf9140bd14','31aa87eed12f41ec8a5f5c06522b3ff1','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('bab5e859cc46491289c578ea24756225','b2201709121d48959d37bf782bb2a836','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,30,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('bb360419878f4ed79a110b84c03ee36e','417e2601a3f84d409920e61f1d52237a','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('bc4ca2c5c4ba4f9a9665acdff11fb256','05bebfc3649e47b3b30898052568e047','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,230,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('be9ffd4c861242db87b9836a8b94b517','ea5412a0e8214a6cb467071d3a4e8826','factory','ç”Ÿäº§å‚å®¶','varchar(60)','String','factory','0','1','1','1','1','0','=','input','',NULL,50,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('bf29eebdb1fe49e8a29432110fb5a453','e61380a6338745f493c2201947d3f2db','zcyz','è´¢äº§åŸå€¼','float','Float','zcyz','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('c5463da128354a45b7f4e3eeac31d4ab','e61380a6338745f493c2201947d3f2db','sjshnx','å®é™…ä½¿ç”¨å¹´é™','int(11)','Integer','sjshnx','0','1','1','1','0','0','=','input','',NULL,230,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('c6cb14246ca24469908977d52c71de24','ea5412a0e8214a6cb467071d3a4e8826','ghjbr','å½’è¿˜ç»åŠäºº','varchar(30)','String','ghjbr','0','1','1','1','0','0','=','input','',NULL,230,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('c6d63773858941cb891e67fdd0f6956a','e61380a6338745f493c2201947d3f2db','jbr','ç»åŠäºº','varchar(30)','String','jbr','0','1','1','1','0','0','=','input','',NULL,240,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('c7f7438374734768834895a474c68f89','4fac809a15704ca8a7d778d6b12b85e0','id','ä¸»é”®','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','å½’å±éƒ¨é—¨','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cb51d7c682f64b15b33c0c0b47c4f0ea','e61380a6338745f493c2201947d3f2db','made_date','ç”Ÿäº§æ—¥æœŸ','date','java.util.Date','madeDate','0','1','1','1','0','0','=','dateselect','',NULL,80,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cc73478365b647ff9a0111ae8229faca','ea5412a0e8214a6cb467071d3a4e8826','dqzt','å½“å‰çŠ¶æ€','varchar(30)','String','dqzt','0','0','1','1','0','1','=','input','',NULL,170,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('ccba1e24a04c4e11b3ee90f8b3c2e039','7786840d0d84431d935d1e473daa06d9','c1','c1','blob','String','c1','0','1','1','1','1','0','=','input','',NULL,10,'1','2015-06-04 10:08:41','1','2015-06-04 10:08:41',NULL,'0'),('cd111644c5564e74abbcadfa54232a39','05bebfc3649e47b3b30898052568e047','dqzt','å½“å‰çŠ¶æ€','varchar(30)','String','dqzt','0','0','1','1','0','0','=','input','',NULL,200,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('ce49b9a4380947ffb77562878f866ef5','f4a9dc141b664cf999a76180f4b1e688','ytzj','å·²ææŠ˜æ—§','float','Float','ytzj','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('d0db576beb3e44debc5d292be3df0f59','05bebfc3649e47b3b30898052568e047','id','ä¸»é”®','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('d1669e6f2e5c470e84ae9574af38e908','05bebfc3649e47b3b30898052568e047','ghjbr','å½’è¿˜ç»åŠäºº','varchar(200)','String','ghjbr','0','1','1','1','0','0','=','input','',NULL,170,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('d27c318d3c8c4a059a55f6cf77dcba33','ea5412a0e8214a6cb467071d3a4e8826','ghfhr','å½’è¿˜å¤æ ¸äºº','varchar(30)','String','ghfhr','0','1','1','1','0','0','=','input','',NULL,240,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('d546d5dba9ce4c4f9bda99a0ac40ba45','ea5412a0e8214a6cb467071d3a4e8826','update_by','æ›´æ–°è€…','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,280,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','æ€§åˆ«','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('d74c3f55edfd45dea37d3f69f741a048','f4a9dc141b664cf999a76180f4b1e688','control_no','æ§åˆ¶ç¼–å·','varchar(30)','String','controlNo','0','1','1','1','0','0','=','input','',NULL,20,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('d8c2f766498544d7a460d0892833d9b5','e61380a6338745f493c2201947d3f2db','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,330,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('d8c45d8dbc2843ea975a5024f44e5095','cc1aea94e07946ae8520485e8b5fd79c','borrowid','æ–‡ä»¶èµ„æ–™å€Ÿé˜…ç¼–å·','varchar(64)','String','borrowid','0','1','1','1','1','1','=','input','',NULL,130,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('d941b85de680482faec34cfbb8c1fc0e','79ea565269e94290811466e2009d2069','create_by','åˆ›å»ºè€…','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('e3ad58153cce4e4792121885690e9402','31aa87eed12f41ec8a5f5c06522b3ff1','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,70,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('e5687d12f4524fb6ba5cef91eedb7da6','31aa87eed12f41ec8a5f5c06522b3ff1','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,50,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('e5c6e728a64e4718a199bf4594592025','ea5412a0e8214a6cb467071d3a4e8826','jbr','ç»åŠäºº','varchar(30)','String','jbr','0','1','1','1','0','0','=','input','',NULL,210,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('e602ffde42b7457182e75479b6d55e3e','cc1aea94e07946ae8520485e8b5fd79c','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e6935c77bb1a4d16ae7f38078a22202d','79ea565269e94290811466e2009d2069','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,270,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('e84ff9e8d12241969dd71d9098f56a5b','31aa87eed12f41ec8a5f5c06522b3ff1','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('e8ace0e340b24628ad06700af7c4a82b','79ea565269e94290811466e2009d2069','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,50,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e976ae1d71894a85ac86d51f819c5270','b2201709121d48959d37bf782bb2a836','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('ea1d0bd4777a4cf8b580336347b08907','f4a9dc141b664cf999a76180f4b1e688','accepted_date','éªŒæ”¶æ—¥æœŸ','date','java.util.Date','acceptedDate','0','1','1','1','0','0','=','dateselect','',NULL,60,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('ea9ebf77931c4684b339647875a5ce28','e61380a6338745f493c2201947d3f2db','filled_date','ç”³è¯·æ—¥æœŸ','date','java.util.Date','filledDate','0','1','1','1','1','0','=','dateselect','',NULL,200,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('eaf58f49768c41f3ad83115424031a87','79ea565269e94290811466e2009d2069','reqstartdate','é¢„è®¡ç”³è¯·å¼€å§‹æ—¥æœŸ','date','java.util.Date','reqstartdate','0','1','1','1','1','0','=','dateselect','',NULL,140,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,11,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('ebe4bd9520314cfb9a8ae2bbd0dcf0ad','ea5412a0e8214a6cb467071d3a4e8826','use_date','æŠ•å…¥ä½¿ç”¨æ—¥æœŸ','date','java.util.Date','useDate','0','1','1','1','1','0','=','dateselect','',NULL,70,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('ed5204a9901a450dba875deb44a622d0','05bebfc3649e47b3b30898052568e047','applicant','ç”³è¯·äºº','varchar(20)','String','applicant','0','1','1','1','1','0','=','input','',NULL,30,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('ee8a465ef49d49e9acda74c622ea1e01','79ea565269e94290811466e2009d2069','fileborrowid','æ–‡ä»¶èµ„æ–™å€Ÿé˜…å•å·','varchar(64)','String','fileborrowid','0','1','1','1','1','1','like','input','',NULL,110,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('ef25413501c94a2c9519ad16f4db02f5','f4a9dc141b664cf999a76180f4b1e688','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,290,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('ef52c5c2fb55423fba10f65feeb823ae','05bebfc3649e47b3b30898052568e047','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,280,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('f281fe14652b48b4bde7cc48ef19de33','4fac809a15704ca8a7d778d6b12b85e0','jjbfdh','ä»ªå™¨é™çº§/æŠ¥åºŸç”³è¯·å•å·','varchar(20)','String','jjbfdh','0','0','1','1','1','0','=','input','',NULL,20,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('f3b18afdf19d4eab81af69355288a0ca','e61380a6338745f493c2201947d3f2db','factory_no','å‡ºå‚ç¼–å·','varchar(30)','String','factoryNo','0','1','1','1','0','0','=','input','',NULL,50,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('f5974f524d3c4d9d851ae9a67387eadd','31aa87eed12f41ec8a5f5c06522b3ff1','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,90,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('f5bcbf7cdeb64a9f891ce6472e799a69','cc1aea94e07946ae8520485e8b5fd79c','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,60,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('f8b0b2cccc79498fb10b4f4c4f8f49d7','ea5412a0e8214a6cb467071d3a4e8826','ghrq','å½’è¿˜æ—¥æœŸ','date','java.util.Date','ghrq','0','1','1','1','0','0','=','dateselect','',NULL,250,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('f90400186f0046578afc8ae0442019f3','ea5412a0e8214a6cb467071d3a4e8826','id','ä¸»é”®','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('f966aead5fae4a37b8ac6765a8574b50','e61380a6338745f493c2201947d3f2db','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,320,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('f9ff49fad9f541baa332224dac464abd','05bebfc3649e47b3b30898052568e047','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,290,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('fab66f75605c4c348e9f1206a76feefb','e61380a6338745f493c2201947d3f2db','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,290,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('fb3a8860c30343b4ad2a54e6343cde70','79ea565269e94290811466e2009d2069','t3','å¤‡ç”¨3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('fb5c524609324f61ba2f06cfce9c5301','b2201709121d48959d37bf782bb2a836','placeaddress','ç›®å‰å­˜åœ¨åœ°ç‚¹','varchar(256)','String','placeaddress','0','1','1','1','0','0','=','input','',NULL,190,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('fbb48d33ac8c4c758c7835e011d42a44','79ea565269e94290811466e2009d2069','stamp','æ—¶é—´æˆ³','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,70,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('fd00d99949a34a93a29e2eae8e2c9356','f4a9dc141b664cf999a76180f4b1e688','t2','å¤‡ç”¨2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,280,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('fe18236252454825b171cd6d2952c738','f4a9dc141b664cf999a76180f4b1e688','t1','å¤‡ç”¨1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,270,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('ff99786f0b074892b56a9734f132f512','e61380a6338745f493c2201947d3f2db','jdxzyj','é‰´å®šå°ç»„æ„è§','varchar(200)','String','jdxzyj','0','1','1','1','0','0','=','input','',NULL,150,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_template`
--

DROP TABLE IF EXISTS `gen_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `category` varchar(2000) DEFAULT NULL COMMENT 'åˆ†ç±»',
  `file_path` varchar(500) DEFAULT NULL COMMENT 'ç”Ÿæˆæ–‡ä»¶è·¯å¾„',
  `file_name` varchar(200) DEFAULT NULL COMMENT 'ç”Ÿæˆæ–‡ä»¶å',
  `content` text COMMENT 'å†…å®¹',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»£ç æ¨¡æ¿è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_template`
--

LOCK TABLES `gen_template` WRITE;
/*!40000 ALTER TABLE `gen_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_accept_record`
--

DROP TABLE IF EXISTS `lab_accept_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_accept_record` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) NOT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `equip_name` varchar(60) NOT NULL COMMENT 'è®¾å¤‡åç§°',
  `equip_type` varchar(20) NOT NULL COMMENT 'å‹å·',
  `factory_no` varchar(30) DEFAULT NULL COMMENT 'å‡ºå‚ç¼–å·',
  `factory_date` date DEFAULT NULL COMMENT 'å‡ºå‚æ—¥æœŸ',
  `supplier` varbinary(40) NOT NULL COMMENT 'ä¾›åº”å•†åç§°',
  `received_date` date DEFAULT NULL COMMENT 'åˆ°è´§æ—¥æœŸ',
  `accepted_date` date DEFAULT NULL COMMENT 'éªŒæ”¶æ—¥æœŸ',
  `accepted_state` varchar(10) DEFAULT NULL COMMENT 'æ”¶è´§æ—¶çŠ¶æ€',
  `yjsynx` int(11) DEFAULT NULL COMMENT 'é¢„è®¡ä½¿ç”¨å¹´é™',
  `zcyz` float DEFAULT NULL COMMENT 'è´¢äº§åŸå€¼',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `accept_advice` varbinary(200) DEFAULT NULL COMMENT 'éªŒæ”¶æ„è§',
  `accepter` varchar(20) DEFAULT NULL COMMENT 'éªŒæ”¶äºº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è®¾å¤‡æ¶ˆè€—æ€§ææ–™éªŒæ”¶è®°å½•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_accept_record`
--

LOCK TABLES `lab_accept_record` WRITE;
/*!40000 ALTER TABLE `lab_accept_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_accept_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_accept_record_detail`
--

DROP TABLE IF EXISTS `lab_accept_record_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_accept_record_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) DEFAULT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `accept_item` varchar(100) DEFAULT NULL COMMENT 'éªŒæ”¶å†…å®¹',
  `accept_doc` varchar(100) DEFAULT NULL COMMENT 'è£…ç®±å•/åˆåŒ',
  `accept_on_spot` varchar(100) DEFAULT NULL COMMENT 'ç°åœºéªŒæ”¶ ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è®¾å¤‡æ¶ˆè€—æ€§ææ–™éªŒæ”¶è®°å½•æ˜ç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_accept_record_detail`
--

LOCK TABLES `lab_accept_record_detail` WRITE;
/*!40000 ALTER TABLE `lab_accept_record_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_accept_record_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_borrow_request`
--

DROP TABLE IF EXISTS `lab_borrow_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_borrow_request` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `jybm` varchar(60) DEFAULT NULL COMMENT 'å€Ÿç”¨éƒ¨é—¨',
  `applicant` varchar(20) DEFAULT NULL COMMENT 'ç”³è¯·äºº',
  `yjjysj1` datetime DEFAULT NULL COMMENT 'é¢„è®¡å€Ÿç”¨æ—¶é—´-å¼€å§‹',
  `yjjysj2` datetime DEFAULT NULL COMMENT 'é¢„è®¡å€Ÿç”¨æ—¶é—´-ç»“æŸ',
  `syly` varchar(200) DEFAULT NULL COMMENT 'ä½¿ç”¨ç†ç”±',
  `approval_advice` varchar(200) DEFAULT NULL COMMENT 'å®¡æ‰¹æ„è§',
  `approved_by` varchar(20) DEFAULT NULL COMMENT 'å®¡æ‰¹äºº',
  `pzrq` date DEFAULT NULL COMMENT 'æ‰¹å‡†æ—¥æœŸ',
  `jydh` varchar(20) NOT NULL COMMENT 'ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·å•å·',
  `sbjsl` varchar(200) DEFAULT NULL COMMENT 'å€Ÿç”¨ä»ªå™¨è®¾å¤‡åç§°åŠæ•°é‡',
  `ydjbr` varchar(100) DEFAULT NULL COMMENT 'é¢„å®šç»åŠäºº',
  `ydrq` datetime DEFAULT NULL COMMENT 'é¢„å®šæ—¥æœŸ',
  `jcjbr` varchar(200) DEFAULT NULL COMMENT 'å€Ÿå‡ºç»åŠäºº',
  `jcfhr` varchar(200) DEFAULT NULL COMMENT 'å€Ÿå‡ºå¤æ ¸äºº',
  `jcrq` datetime DEFAULT NULL COMMENT 'å€Ÿå‡ºæ—¥æœŸ',
  `ghjbr` varchar(200) DEFAULT NULL COMMENT 'å½’è¿˜ç»åŠäºº',
  `ghfhr` varchar(200) DEFAULT NULL COMMENT 'å½’è¿˜å¤æ ¸äºº',
  `ghrq` datetime DEFAULT NULL COMMENT 'å½’è¿˜æ—¥æœŸ',
  `dqzt` varchar(30) NOT NULL COMMENT 'å½“å‰çŠ¶æ€',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jydh` (`jydh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·å•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_borrow_request`
--

LOCK TABLES `lab_borrow_request` WRITE;
/*!40000 ALTER TABLE `lab_borrow_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_borrow_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_borrow_request_and_baseinfo`
--

DROP TABLE IF EXISTS `lab_borrow_request_and_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_borrow_request_and_baseinfo` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `jjbfdh` varchar(20) NOT NULL COMMENT 'ä»ªå™¨é™çº§/æŠ¥åºŸç”³è¯·å•å·',
  `yq_no` varchar(30) NOT NULL COMMENT 'ä»ªå™¨ç¼–å·',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_borrow_request_and_baseinfo`
--

LOCK TABLES `lab_borrow_request_and_baseinfo` WRITE;
/*!40000 ALTER TABLE `lab_borrow_request_and_baseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_borrow_request_and_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_borrow_request_detail`
--

DROP TABLE IF EXISTS `lab_borrow_request_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_borrow_request_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `amt` int(11) DEFAULT NULL COMMENT 'æ•°é‡',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡å€Ÿç”¨ç”³è¯·å•æ˜ç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_borrow_request_detail`
--

LOCK TABLES `lab_borrow_request_detail` WRITE;
/*!40000 ALTER TABLE `lab_borrow_request_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_borrow_request_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_plan`
--

DROP TABLE IF EXISTS `lab_check_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_plan` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `jhhcts` int(11) DEFAULT NULL COMMENT 'è®¡åˆ’æ ¸æŸ¥å°æ•°',
  `filled_by` varchar(20) DEFAULT NULL COMMENT 'å¡«è¡¨äºº',
  `approved_by` varchar(20) DEFAULT NULL COMMENT 'æ‰¹å‡†äºº',
  `bzrq` date DEFAULT NULL COMMENT 'ç¼–åˆ¶æ—¥æœŸ',
  `final_appr_date` date DEFAULT NULL COMMENT 'å®¡æ‰¹æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡æœŸé—´æ ¸æŸ¥è®¡åˆ’';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_plan`
--

LOCK TABLES `lab_check_plan` WRITE;
/*!40000 ALTER TABLE `lab_check_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_plan_detail`
--

DROP TABLE IF EXISTS `lab_check_plan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_plan_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) DEFAULT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `sno` varchar(10) DEFAULT NULL COMMENT 'åºå·',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `scjdrq` date DEFAULT NULL COMMENT 'ä¸Šæ¬¡æ£€å®šæ—¥æœŸ',
  `jhjcrq` date DEFAULT NULL COMMENT 'è®¡åˆ’æ£€æŸ¥æ—¥æœŸ',
  `sjjcrq` date DEFAULT NULL COMMENT 'å®é™…æ£€æŸ¥æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡æœŸé—´æ ¸æŸ¥è®¡åˆ’æ˜ç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_plan_detail`
--

LOCK TABLES `lab_check_plan_detail` WRITE;
/*!40000 ALTER TABLE `lab_check_plan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_plan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_record`
--

DROP TABLE IF EXISTS `lab_check_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_record` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `check_date` date DEFAULT NULL COMMENT 'æ ¸æŸ¥æ—¥æœŸ',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `hcff` varchar(200) DEFAULT NULL COMMENT 'æœŸé—´æ ¸æŸ¥æ–¹æ³•',
  `hcjg` varchar(200) DEFAULT NULL COMMENT 'æ ¸æŸ¥ç»“æœ',
  `hcr` varchar(20) DEFAULT NULL COMMENT 'æ ¸æŸ¥äºº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡æœŸé—´æ ¸æŸ¥è®°å½•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_record`
--

LOCK TABLES `lab_check_record` WRITE;
/*!40000 ALTER TABLE `lab_check_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_result`
--

DROP TABLE IF EXISTS `lab_check_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_result` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `applicant` varchar(20) DEFAULT NULL COMMENT 'ç”³è¯·äºº',
  `apply_date` date DEFAULT NULL COMMENT 'ç”³è¯·æ—¥æœŸ',
  `approved_by` varchar(20) DEFAULT NULL COMMENT 'æ‰¹å‡†äºº',
  `pzrq` date DEFAULT NULL COMMENT 'æ‰¹å‡†æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡æ£€å®šã€æ ¡å‡†è®¡åˆ’ã€å®Œæˆè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_result`
--

LOCK TABLES `lab_check_result` WRITE;
/*!40000 ALTER TABLE `lab_check_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_result_detail`
--

DROP TABLE IF EXISTS `lab_check_result_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_result_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `sno` varchar(10) DEFAULT NULL COMMENT 'åºå·',
  `manage_no` varchar(30) DEFAULT NULL COMMENT 'ç®¡ç†å·',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `jdzq` varchar(6) DEFAULT NULL COMMENT 'æ£€å®šå‘¨æœŸ',
  `scjdrq` date DEFAULT NULL COMMENT 'ä¸Šæ¬¡æ£€å®šæ—¥æœŸ',
  `jhjcrq` date DEFAULT NULL COMMENT 'è®¡åˆ’æ£€æŸ¥æ—¥æœŸ',
  `sjjcrq` date DEFAULT NULL COMMENT 'å®é™…æ£€æŸ¥æ—¥æœŸ',
  `hcjg` varchar(200) DEFAULT NULL COMMENT 'æ ¸æŸ¥ç»“æœ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡æ£€å®šã€æ ¡å‡†è®¡åˆ’ã€å®Œæˆæ˜ç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_result_detail`
--

LOCK TABLES `lab_check_result_detail` WRITE;
/*!40000 ALTER TABLE `lab_check_result_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_result_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_review`
--

DROP TABLE IF EXISTS `lab_check_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_review` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `jhhcts` int(11) DEFAULT NULL COMMENT 'è®¡åˆ’æ ¸æŸ¥å°æ•°',
  `sjjcts` int(11) DEFAULT NULL COMMENT 'å®é™…æ ¸æŸ¥å°æ•°',
  `ssqk` varchar(200) DEFAULT NULL COMMENT 'å®æ–½æƒ…å†µ',
  `psjl` varchar(200) DEFAULT NULL COMMENT 'è¯„å®¡ç»“è®º',
  `psry` varchar(20) DEFAULT NULL COMMENT 'è¯„å®¡äººå‘˜',
  `psrq` date DEFAULT NULL COMMENT 'è¯„å®¡æ—¥æœŸ',
  `approval_advice` varchar(200) DEFAULT NULL COMMENT 'å®¡æ‰¹æ„è§',
  `signature` varchar(20) DEFAULT NULL COMMENT 'ä¸»ç®¡ç”Ÿäº§å‰¯æ€»ç»ç†ç­¾å­—',
  `sig_date` date DEFAULT NULL COMMENT 'ç­¾å­—æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡æœŸé—´æ ¸æŸ¥è¯„å®¡è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_review`
--

LOCK TABLES `lab_check_review` WRITE;
/*!40000 ALTER TABLE `lab_check_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_analyses`
--

DROP TABLE IF EXISTS `lab_equipment_analyses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_analyses` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `equip_name` varchar(60) NOT NULL COMMENT 'è®¾å¤‡åç§°',
  `equip_type` varchar(20) NOT NULL COMMENT 'å‹å·',
  `product_name` varchar(60) DEFAULT NULL COMMENT 'äº§å“åç§°',
  `standard_no` varchar(20) DEFAULT NULL COMMENT 'ä¾æ®æ ‡å‡†å·',
  `sno` varchar(10) DEFAULT NULL COMMENT 'åºå·',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `standard_clause` varchar(200) DEFAULT NULL COMMENT 'æ ‡å‡†æ¡æ¬¾',
  `tech_index` varchar(60) DEFAULT NULL COMMENT 'æŠ€æœ¯æŒ‡æ ‡',
  `ranges` varchar(60) DEFAULT NULL COMMENT 'æµ‹é‡èŒƒå›´',
  `precisions` varchar(60) DEFAULT NULL COMMENT 'æ‰©å±•ä¸ç¡®å®šåº¦/æœ€å¤§å…å·®/å‡†ç¡®åº¦',
  `is_match` varchar(10) DEFAULT NULL COMMENT 'ä»ªå™¨è®¾å¤‡ç¬¦åˆè§„èŒƒå¦',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡èƒ½åŠ›åˆ†æè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_analyses`
--

LOCK TABLES `lab_equipment_analyses` WRITE;
/*!40000 ALTER TABLE `lab_equipment_analyses` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_analyses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_baseinfo`
--

DROP TABLE IF EXISTS `lab_equipment_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_baseinfo` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `factory` varchar(60) DEFAULT NULL COMMENT 'ç”Ÿäº§å‚å®¶',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `factory_no` varchar(30) DEFAULT NULL COMMENT 'å‡ºå‚ç¼–å·',
  `accepted_date` datetime DEFAULT NULL COMMENT 'éªŒæ”¶æ—¥æœŸ',
  `use_date` datetime DEFAULT NULL COMMENT 'æŠ•å…¥ä½¿ç”¨æ—¥æœŸ',
  `place` varchar(60) DEFAULT NULL COMMENT 'ç›®å‰æ”¾ç½®åœ°ç‚¹',
  `accepted_state` varchar(10) DEFAULT NULL COMMENT 'æ”¶è´§æ—¶çŠ¶æ€',
  `fj` varchar(200) DEFAULT NULL COMMENT 'é™„ä»¶',
  `sno` varchar(10) DEFAULT NULL COMMENT 'åºå·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `zcyz` float DEFAULT NULL COMMENT 'è´¢äº§åŸå€¼',
  `ytzj` float DEFAULT NULL COMMENT 'å·²ææŠ˜æ—§',
  `zcjz` float DEFAULT NULL COMMENT 'è´¢äº§å‡€å€¼',
  `yq_no` varchar(30) NOT NULL COMMENT 'ä»ªå™¨ç¼–å·',
  `sbshrq` datetime DEFAULT NULL COMMENT 'è®¾å¤‡æ”¶è´§æ—¥æœŸ',
  `dqzt` varchar(30) NOT NULL COMMENT 'å½“å‰çŠ¶æ€',
  `sbmc` varchar(200) NOT NULL COMMENT 'ä»ªå™¨è®¾å¤‡åç§°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yq_no` (`yq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨åŸºæœ¬ä¿¡æ¯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_baseinfo`
--

LOCK TABLES `lab_equipment_baseinfo` WRITE;
/*!40000 ALTER TABLE `lab_equipment_baseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_borrow`
--

DROP TABLE IF EXISTS `lab_equipment_borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_borrow` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `jybm` varchar(60) DEFAULT NULL COMMENT 'å€Ÿç”¨éƒ¨é—¨',
  `sy` varchar(200) DEFAULT NULL COMMENT 'äº‹ç”±',
  `jbr` varchar(20) DEFAULT NULL COMMENT 'å€Ÿè¡¨äºº',
  `jsr` varchar(20) DEFAULT NULL COMMENT 'ç»æ‰‹äºº',
  `hbr` varchar(20) DEFAULT NULL COMMENT 'è¿˜è¡¨äºº',
  `accepter` varchar(20) DEFAULT NULL COMMENT 'éªŒæ”¶äºº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªè¡¨å·¥å…·å€Ÿç”¨æ¸…å•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_borrow`
--

LOCK TABLES `lab_equipment_borrow` WRITE;
/*!40000 ALTER TABLE `lab_equipment_borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_borrow_detail`
--

DROP TABLE IF EXISTS `lab_equipment_borrow_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_borrow_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `fj` varchar(200) DEFAULT NULL COMMENT 'é™„ä»¶',
  `lend_date` date DEFAULT NULL COMMENT 'å€Ÿå‡ºæ—¥æœŸ',
  `jczt` varchar(6) DEFAULT NULL COMMENT 'å€Ÿå‡ºçŠ¶æ€',
  `ghrq` date DEFAULT NULL COMMENT 'å½’è¿˜æ—¥æœŸ',
  `ghzt` varchar(6) DEFAULT NULL COMMENT 'å½’è¿˜çŠ¶æ€',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªè¡¨å·¥å…·å€Ÿç”¨æ¸…å•æ˜ç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_borrow_detail`
--

LOCK TABLES `lab_equipment_borrow_detail` WRITE;
/*!40000 ALTER TABLE `lab_equipment_borrow_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_borrow_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_exception`
--

DROP TABLE IF EXISTS `lab_equipment_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_exception` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `factory_no` varchar(30) DEFAULT NULL COMMENT 'å‡ºå‚ç¼–å·',
  `sydd` varchar(60) DEFAULT NULL COMMENT 'ä½¿ç”¨åœ°ç‚¹',
  `fxgzsj` datetime DEFAULT NULL COMMENT 'å‘ç°æ•…éšœæ—¶é—´',
  `gzgznr` varchar(200) DEFAULT NULL COMMENT 'å‘ç°æ•…éšœæ—¶æ­£è¿›è¡Œçš„å·¥ä½œå†…å®¹',
  `gzxx` varchar(200) DEFAULT NULL COMMENT 'æ•…éšœç°è±¡',
  `jbr` varchar(20) DEFAULT NULL COMMENT 'å€Ÿè¡¨äºº',
  `syrq` date DEFAULT NULL COMMENT 'ä½¿ç”¨æ—¥æœŸ',
  `gzhsqk` varchar(200) DEFAULT NULL COMMENT 'æ•…éšœæ ¸å®æƒ…å†µ',
  `xmfzr` varchar(20) DEFAULT NULL COMMENT 'é¡¹ç›®è´Ÿè´£äºº',
  `sig_date` date DEFAULT NULL COMMENT 'ç­¾å­—æ—¥æœŸ',
  `clyj` varchar(200) DEFAULT NULL COMMENT 'å¤„ç†æ„è§',
  `jsfzr` varchar(20) DEFAULT NULL COMMENT 'æŠ€æœ¯è´Ÿè´£äºº',
  `c_date` date DEFAULT NULL COMMENT 'æ—¥æœŸ',
  `jssj` datetime DEFAULT NULL COMMENT 'ä»ªè¡¨å®¤æ¥æ”¶æ—¶é—´',
  `ybgly` varchar(20) DEFAULT NULL COMMENT 'ä»ªè¡¨ç®¡ç†å‘˜',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡å¼‚å¸¸ç™»è®°è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_exception`
--

LOCK TABLES `lab_equipment_exception` WRITE;
/*!40000 ALTER TABLE `lab_equipment_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_resume`
--

DROP TABLE IF EXISTS `lab_equipment_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_resume` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `factory` varchar(60) DEFAULT NULL COMMENT 'ç”Ÿäº§å‚å®¶',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `factory_no` varchar(30) DEFAULT NULL COMMENT 'å‡ºå‚ç¼–å·',
  `accepted_date` date DEFAULT NULL COMMENT 'éªŒæ”¶æ—¥æœŸ',
  `use_date` date DEFAULT NULL COMMENT 'æŠ•å…¥ä½¿ç”¨æ—¥æœŸ',
  `place` varchar(60) DEFAULT NULL COMMENT 'ç›®å‰æ”¾ç½®åœ°ç‚¹',
  `accepted_state` varchar(10) DEFAULT NULL COMMENT 'æ”¶è´§æ—¶çŠ¶æ€',
  `fj` varchar(200) DEFAULT NULL COMMENT 'é™„ä»¶',
  `sno` varchar(10) DEFAULT NULL COMMENT 'åºå·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `zcyz` float DEFAULT NULL COMMENT 'è´¢äº§åŸå€¼',
  `ytzj` float DEFAULT NULL COMMENT 'å·²ææŠ˜æ—§',
  `zcjz` float DEFAULT NULL COMMENT 'è´¢äº§å‡€å€¼',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡å±¥å†å¡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_resume`
--

LOCK TABLES `lab_equipment_resume` WRITE;
/*!40000 ALTER TABLE `lab_equipment_resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_resume_detail`
--

DROP TABLE IF EXISTS `lab_equipment_resume_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_resume_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `lend_date` date DEFAULT NULL COMMENT 'å€Ÿå‡ºæ—¥æœŸ',
  `sydw` varchar(60) DEFAULT NULL COMMENT 'ä½¿ç”¨å•ä½',
  `jsr` varchar(20) DEFAULT NULL COMMENT 'ç»æ‰‹äºº',
  `syly` varchar(200) DEFAULT NULL COMMENT 'ä½¿ç”¨ç†ç”±',
  `ybs_jsr` varchar(20) DEFAULT NULL COMMENT 'ä»ªè¡¨å®¤ç»æ‰‹äºº',
  `ghrq` date DEFAULT NULL COMMENT 'å½’è¿˜æ—¥æœŸ',
  `ysjl` varchar(200) DEFAULT NULL COMMENT 'éªŒæ”¶è®°å½•',
  `accepter` varchar(20) DEFAULT NULL COMMENT 'éªŒæ”¶äºº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡å±¥å†å¡æ˜ç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_resume_detail`
--

LOCK TABLES `lab_equipment_resume_detail` WRITE;
/*!40000 ALTER TABLE `lab_equipment_resume_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_resume_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_transfer`
--

DROP TABLE IF EXISTS `lab_equipment_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_transfer` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `yjbm` varchar(60) DEFAULT NULL COMMENT 'ç§»äº¤éƒ¨é—¨',
  `yjr` varchar(20) DEFAULT NULL COMMENT 'ç§»äº¤äºº',
  `jsbm` varchar(200) DEFAULT NULL COMMENT 'æ¥æ”¶éƒ¨é—¨',
  `jsr` varchar(20) DEFAULT NULL COMMENT 'æ¥æ”¶äºº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡åŠå·¥å…·ç§»äº¤æ¸…å•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_transfer`
--

LOCK TABLES `lab_equipment_transfer` WRITE;
/*!40000 ALTER TABLE `lab_equipment_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_transfer_list`
--

DROP TABLE IF EXISTS `lab_equipment_transfer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_transfer_list` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `fj` varchar(200) DEFAULT NULL COMMENT 'é™„ä»¶',
  `yjrq` date DEFAULT NULL COMMENT 'ç§»äº¤æ—¥æœŸ',
  `yjzt` varchar(6) DEFAULT NULL COMMENT 'ç§»äº¤çŠ¶æ€',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡åŠå·¥å…·ç§»äº¤æ¸…å•æ˜ç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_transfer_list`
--

LOCK TABLES `lab_equipment_transfer_list` WRITE;
/*!40000 ALTER TABLE `lab_equipment_transfer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_transfer_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_examine_clause`
--

DROP TABLE IF EXISTS `lab_examine_clause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_examine_clause` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `filled_by` varchar(20) DEFAULT NULL COMMENT 'å¡«è¡¨äºº',
  `c_date` date DEFAULT NULL COMMENT 'æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡é€æ£€è¦æ±‚è¯´æ˜è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_examine_clause`
--

LOCK TABLES `lab_examine_clause` WRITE;
/*!40000 ALTER TABLE `lab_examine_clause` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_examine_clause` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_examine_clause_detail`
--

DROP TABLE IF EXISTS `lab_examine_clause_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_examine_clause_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) DEFAULT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `sno` varchar(10) DEFAULT NULL COMMENT 'åºå·',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `jzxm` varchar(200) DEFAULT NULL COMMENT 'æ ¡å‡†é¡¹ç›®',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡é€æ£€è¦æ±‚è¯´æ˜æ˜ç»†è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_examine_clause_detail`
--

LOCK TABLES `lab_examine_clause_detail` WRITE;
/*!40000 ALTER TABLE `lab_examine_clause_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_examine_clause_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_examine_reult`
--

DROP TABLE IF EXISTS `lab_examine_reult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_examine_reult` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `filled_by` varchar(20) DEFAULT NULL COMMENT 'å¡«è¡¨äºº',
  `c_date` date DEFAULT NULL COMMENT 'æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡å®Œæ£€ç»“æœç¡®è®¤è®°å½•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_examine_reult`
--

LOCK TABLES `lab_examine_reult` WRITE;
/*!40000 ALTER TABLE `lab_examine_reult` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_examine_reult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_examine_reult_detail`
--

DROP TABLE IF EXISTS `lab_examine_reult_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_examine_reult_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `parent_id` varchar(64) DEFAULT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `sno` varchar(10) DEFAULT NULL COMMENT 'åºå·',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `zslx` varchar(60) DEFAULT NULL COMMENT 'è¯ä¹¦ç±»å‹',
  `jbxxzqf` varchar(6) DEFAULT NULL COMMENT 'åŸºæœ¬ä¿¡æ¯æ­£ç¡®å¦',
  `ybgly` varchar(20) NOT NULL COMMENT 'ä»ªå™¨ç®¡ç†å‘˜',
  `c_date` date DEFAULT NULL COMMENT 'æ—¥æœŸ',
  `mzjcff` varchar(6) DEFAULT NULL COMMENT 'æ»¡è¶³æ£€æµ‹æ–¹æ³•çš„è¦æ±‚å¦',
  `ztbz` varchar(6) DEFAULT NULL COMMENT 'ç²˜è´´æ ‡è¯†',
  `check_manager` varchar(20) DEFAULT NULL COMMENT 'æ£€æµ‹éƒ¨é—¨ç»ç†',
  `sig_date` date DEFAULT NULL COMMENT 'ç­¾å­—æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»ªå™¨è®¾å¤‡å®Œæ£€ç»“æœç¡®è®¤è®°å½•æ˜ç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_examine_reult_detail`
--

LOCK TABLES `lab_examine_reult_detail` WRITE;
/*!40000 ALTER TABLE `lab_examine_reult_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_examine_reult_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_file_attributes`
--

DROP TABLE IF EXISTS `lab_file_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_file_attributes` (
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  `fileID` varchar(64) DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™ID',
  `fileName` varchar(256) DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™åç§°',
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `fileControlID` varchar(64) DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™æ§åˆ¶ç¼–å·',
  `fileStandard` varchar(128) DEFAULT NULL COMMENT 'å›¾ä¹¦æ ‡å‡†åç§°',
  `fileType` int(11) DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™ç±»å‹',
  `fileArchiveDate` date DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™å½’æ¡£æ—¥æœŸ',
  `useDate` date DEFAULT NULL COMMENT 'æŠ•å…¥ä½¿ç”¨æ—¥æœŸ',
  `placeAddress` varchar(256) DEFAULT NULL COMMENT 'ç›®å‰å­˜åœ¨åœ°ç‚¹',
  `fileStatus` int(11) DEFAULT NULL COMMENT 'å½“å‰çŠ¶æ€',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ä»¶èµ„æ–™å±æ€§';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_file_attributes`
--

LOCK TABLES `lab_file_attributes` WRITE;
/*!40000 ALTER TABLE `lab_file_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_file_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_file_borrow`
--

DROP TABLE IF EXISTS `lab_file_borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_file_borrow` (
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  `fileBorrowID` varchar(64) DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™å€Ÿé˜…å•å·',
  `fileBorrowStatus` int(11) DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™å€Ÿé˜…çŠ¶æ€',
  `reqDepartment` varchar(128) DEFAULT NULL COMMENT 'ç”³è¯·å€Ÿé˜…éƒ¨é—¨',
  `reqStartDate` date DEFAULT NULL COMMENT 'é¢„è®¡ç”³è¯·å¼€å§‹æ—¥æœŸ',
  `reqEndDate` date DEFAULT NULL COMMENT 'é¢„è®¡ç”³è¯·æˆªæ­¢æ—¥æœŸ',
  `approveName` varchar(64) DEFAULT NULL COMMENT 'å®¡æ‰¹äººå§“å',
  `approveOpinion` varchar(256) DEFAULT NULL COMMENT 'å®¡æ‰¹äººæ„è§',
  `reqName` varchar(64) DEFAULT NULL COMMENT 'ç”³è¯·äººå§“å',
  `reqReason` varchar(256) DEFAULT NULL COMMENT 'ç”³è¯·å€Ÿé˜…åŸå› ',
  `approveDate` date DEFAULT NULL COMMENT 'å®¡æ‰¹çš„æ—¥æœŸ',
  `borrowExecuter` varchar(64) DEFAULT NULL COMMENT 'å€Ÿé˜…ç»åŠäºº',
  `borrowRecheck` varchar(64) DEFAULT NULL COMMENT 'å€Ÿé˜…å¤æ ¸äºº',
  `borrowRecheckDate` date DEFAULT NULL COMMENT 'å€Ÿé˜…æ‰§è¡Œæ—¥æœŸ',
  `revertExecuter` varchar(64) DEFAULT NULL COMMENT 'å½’è¿˜ç»åŠäºº',
  `revertRecheck` varchar(64) DEFAULT NULL COMMENT 'å½’è¿˜å¤æ ¸äºº',
  `revertRecheckDate` date DEFAULT NULL COMMENT 'å½’è¿˜æ‰§è¡Œæ—¥æœŸ',
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `reqContentCount` varchar(1024) DEFAULT NULL COMMENT 'ç”³è¯·æ–‡ä»¶èµ„æ–™åç§°åŠæ•°é‡',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ä»¶èµ„æ–™å€Ÿç”¨å½’è¿˜è®°å½•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_file_borrow`
--

LOCK TABLES `lab_file_borrow` WRITE;
/*!40000 ALTER TABLE `lab_file_borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_file_borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_file_borrow_relationship`
--

DROP TABLE IF EXISTS `lab_file_borrow_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_file_borrow_relationship` (
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `fileID` varchar(64) DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™ç¼–å·',
  `borrowID` varchar(64) DEFAULT NULL COMMENT 'æ–‡ä»¶èµ„æ–™å€Ÿé˜…ç¼–å·',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ä»¶èµ„æ–™ä¸å€Ÿç”¨è®°å½•ä¹‹é—´çš„å…³ç³»';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_file_borrow_relationship`
--

LOCK TABLES `lab_file_borrow_relationship` WRITE;
/*!40000 ALTER TABLE `lab_file_borrow_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_file_borrow_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_provider_estimate`
--

DROP TABLE IF EXISTS `lab_provider_estimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_provider_estimate` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `supplier` varbinary(40) DEFAULT NULL COMMENT 'ä¾›åº”å•†åç§°',
  `address` varchar(100) DEFAULT NULL COMMENT 'åœ°å€',
  `tel` varchar(30) DEFAULT NULL COMMENT 'ç”µè¯',
  `zz` varchar(2) DEFAULT NULL COMMENT 'èµ„è´¨',
  `zlbztx` varchar(2) DEFAULT NULL COMMENT 'è´¨é‡ä¿è¯ä½“ç³»',
  `fwzl` varchar(2) DEFAULT NULL COMMENT 'æœåŠ¡è´¨é‡',
  `lxhtqk` varchar(2) DEFAULT NULL COMMENT 'å±¥è¡ŒåˆåŒæƒ…å†µ',
  `bzyszl` varchar(2) DEFAULT NULL COMMENT 'åŒ…è£…è¿è¾“è´¨é‡',
  `shfw` varchar(2) DEFAULT NULL COMMENT 'å”®åæœåŠ¡',
  `wxnl` varchar(2) DEFAULT NULL COMMENT 'ç»´ä¿®èƒ½åŠ›',
  `a1234` varchar(200) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `pjjl` varchar(600) DEFAULT NULL COMMENT 'è¯„ä»·ç»“è®º',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æœåŠ¡æ–¹ä¾›åº”å•†è¯„ä»·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_provider_estimate`
--

LOCK TABLES `lab_provider_estimate` WRITE;
/*!40000 ALTER TABLE `lab_provider_estimate` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_provider_estimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_purchase_plan`
--

DROP TABLE IF EXISTS `lab_purchase_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_purchase_plan` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) NOT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `apply_dept` varchar(20) NOT NULL COMMENT 'ç”³æŠ¥éƒ¨é—¨',
  `request_by` varchar(20) DEFAULT NULL COMMENT 'ç”³æŠ¥äºº',
  `request_desc` varchar(200) DEFAULT NULL COMMENT 'ç”³æŠ¥ç†ç”±',
  `tech_approval` varchar(200) DEFAULT NULL COMMENT 'æŠ€æœ¯ä¸»ç®¡å®¡æ ¸æ„è§',
  `tech_appr_date` date DEFAULT NULL COMMENT 'å®¡æ ¸æ—¥æœŸ',
  `final_approval` varchar(200) DEFAULT NULL COMMENT 'æœ€é«˜ç®¡ç†è€…å®¡æ‰¹',
  `final_appr_date` date DEFAULT NULL COMMENT 'å®¡æ‰¹æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è®¾å¤‡æ¶ˆè€—æ€§ææ–™é‡‡è´­è®¡åˆ’';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_purchase_plan`
--

LOCK TABLES `lab_purchase_plan` WRITE;
/*!40000 ALTER TABLE `lab_purchase_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_purchase_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_purchase_plan_detail`
--

DROP TABLE IF EXISTS `lab_purchase_plan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_purchase_plan_detail` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `plan_id` varchar(64) NOT NULL COMMENT 'é‡‡è´­è®¡åˆ’ID',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `amt` int(11) DEFAULT NULL COMMENT 'æ•°é‡',
  `price` float DEFAULT NULL COMMENT 'å•ä»·',
  `sum` float DEFAULT NULL COMMENT 'åˆä»·',
  `operate_clause` varchar(200) DEFAULT NULL COMMENT 'ä½¿ç”¨è¦æ±‚',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(100) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è®¾å¤‡æ¶ˆè€—æ€§ææ–™é‡‡è´­è®¡åˆ’æ˜ç»†';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_purchase_plan_detail`
--

LOCK TABLES `lab_purchase_plan_detail` WRITE;
/*!40000 ALTER TABLE `lab_purchase_plan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_purchase_plan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_repair_request`
--

DROP TABLE IF EXISTS `lab_repair_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_repair_request` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `euip_no` varchar(30) DEFAULT NULL COMMENT 'è¡¨å·',
  `factory` varchar(60) DEFAULT NULL COMMENT 'ç”Ÿäº§å‚å®¶',
  `factory_date` date DEFAULT NULL COMMENT 'å‡ºå‚æ—¥æœŸ',
  `use_date` date DEFAULT NULL COMMENT 'æŠ•å…¥ä½¿ç”¨æ—¥æœŸ',
  `zcyz` float DEFAULT NULL COMMENT 'è´¢äº§åŸå€¼',
  `zcjz` float DEFAULT NULL COMMENT 'è´¢äº§å‡€å€¼',
  `mcwxrq` date DEFAULT NULL COMMENT 'æœ«æ¬¡ç»´ä¿®æ—¥æœŸ',
  `wxly` varchar(200) DEFAULT NULL COMMENT 'ç»´ä¿®ç†ç”±',
  `yjfxfy` varchar(100) DEFAULT NULL COMMENT 'é¢„è®¡ç»´ä¿®è´¹ç”¨',
  `sig_date` date DEFAULT NULL COMMENT 'å®¡æ‰¹æ—¥æœŸ',
  `applicant` varchar(20) DEFAULT NULL COMMENT 'ç”³è¯·äºº',
  `apply_date` date DEFAULT NULL COMMENT 'ç”³è¯·æ—¥æœŸ',
  `wxsqdh` varchar(20) NOT NULL COMMENT 'ä»ªå™¨ç»´ä¿®ç”³è¯·å•å·',
  `dqzt` varchar(30) NOT NULL COMMENT 'å½“å‰çŠ¶æ€',
  `sbmc` varchar(100) DEFAULT NULL COMMENT 'ä»ªå™¨è®¾å¤‡åç§°',
  `spr` varchar(30) DEFAULT NULL COMMENT 'å®¡æ‰¹äºº',
  `spyj` varchar(200) DEFAULT NULL COMMENT 'å®¡æ‰¹æ„è§',
  `jbr` varchar(30) DEFAULT NULL COMMENT 'ç»åŠäºº',
  `czrq` date DEFAULT NULL COMMENT 'æ“ä½œæ—¥æœŸ',
  `ghjbr` varchar(30) DEFAULT NULL COMMENT 'å½’è¿˜ç»åŠäºº',
  `ghfhr` varchar(30) DEFAULT NULL COMMENT 'å½’è¿˜å¤æ ¸äºº',
  `ghrq` date DEFAULT NULL COMMENT 'å½’è¿˜æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wxsqdh` (`wxsqdh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è®¾å¤‡ç»´ä¿®ç”³è¯·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_repair_request`
--

LOCK TABLES `lab_repair_request` WRITE;
/*!40000 ALTER TABLE `lab_repair_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_repair_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_repair_request_and_baseinfo`
--

DROP TABLE IF EXISTS `lab_repair_request_and_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_repair_request_and_baseinfo` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `wxsqdh` varchar(20) NOT NULL COMMENT 'ä»ªå™¨ç»´ä¿®ç”³è¯·å•å·',
  `yq_no` varchar(30) NOT NULL COMMENT 'ä»ªå™¨ç¼–å·',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è®¾å¤‡ç»´ä¿®ç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_repair_request_and_baseinfo`
--

LOCK TABLES `lab_repair_request_and_baseinfo` WRITE;
/*!40000 ALTER TABLE `lab_repair_request_and_baseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_repair_request_and_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_scrap_apply`
--

DROP TABLE IF EXISTS `lab_scrap_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_scrap_apply` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `control_no` varchar(30) DEFAULT NULL COMMENT 'æ§åˆ¶ç¼–å·',
  `equip_name` varchar(60) DEFAULT NULL COMMENT 'è®¾å¤‡åç§°',
  `equip_type` varchar(20) DEFAULT NULL COMMENT 'å‹å·',
  `factory_no` varchar(30) DEFAULT NULL COMMENT 'å‡ºå‚ç¼–å·',
  `amt` int(11) DEFAULT NULL COMMENT 'æ•°é‡',
  `factory` varchar(60) DEFAULT NULL COMMENT 'ç”Ÿäº§å‚å®¶',
  `made_date` date DEFAULT NULL COMMENT 'ç”Ÿäº§æ—¥æœŸ',
  `yjsynx` int(11) DEFAULT NULL COMMENT 'é¢„è®¡ä½¿ç”¨å¹´é™',
  `zcyz` float DEFAULT NULL COMMENT 'è´¢äº§åŸå€¼',
  `ytzj` float DEFAULT NULL COMMENT 'å·²ææŠ˜æ—§',
  `yjzccz` float DEFAULT NULL COMMENT 'é¢„è®¡å‡€æ®‹å€¼',
  `wxly` varchar(200) DEFAULT NULL COMMENT 'ç»´ä¿®ç†ç”±',
  `jjbfly` varchar(200) DEFAULT NULL COMMENT 'é™çº§æŠ¥åºŸç†ç”±',
  `jdxzyj` varchar(200) DEFAULT NULL COMMENT 'é‰´å®šå°ç»„æ„è§',
  `approval_advice` varchar(200) DEFAULT NULL COMMENT 'å®¡æ‰¹æ„è§',
  `approved_by` varchar(20) DEFAULT NULL COMMENT 'å®¡æ‰¹äºº',
  `sig_date` date DEFAULT NULL COMMENT 'å®¡æ‰¹æ—¥æœŸ',
  `filled_by` varchar(20) DEFAULT NULL COMMENT 'ç”³è¯·äºº',
  `filled_date` date DEFAULT NULL COMMENT 'ç”³è¯·æ—¥æœŸ',
  `wxsqdh` varchar(20) NOT NULL COMMENT 'ä»ªå™¨ç»´ä¿®ç”³è¯·å•å·',
  `dqzt` varchar(30) NOT NULL COMMENT 'å½“å‰çŠ¶æ€',
  `sjshnx` int(11) DEFAULT NULL COMMENT 'å®é™…ä½¿ç”¨å¹´é™',
  `jbr` varchar(30) DEFAULT NULL COMMENT 'ç»åŠäºº',
  `czrq` date DEFAULT NULL COMMENT 'æ“ä½œæ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wxsqdh` (`wxsqdh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è®¾å¤‡é™çº§/æŠ¥åºŸç”³è¯·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_scrap_apply`
--

LOCK TABLES `lab_scrap_apply` WRITE;
/*!40000 ALTER TABLE `lab_scrap_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_scrap_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_scrap_apply_and_baseinfo`
--

DROP TABLE IF EXISTS `lab_scrap_apply_and_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_scrap_apply_and_baseinfo` (
  `id` varchar(64) NOT NULL COMMENT 'ä¸»é”®',
  `jjbfdh` varchar(20) NOT NULL COMMENT 'ä»ªå™¨é™çº§/æŠ¥åºŸç”³è¯·å•å·',
  `yq_no` varchar(30) NOT NULL COMMENT 'ä»ªå™¨ç¼–å·',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è®¾å¤‡é™çº§/æŠ¥åºŸç”³è¯·ä¸ä»ªå™¨åŸºç¡€ä¿¡æ¯å…³è”è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_scrap_apply_and_baseinfo`
--

LOCK TABLES `lab_scrap_apply_and_baseinfo` WRITE;
/*!40000 ALTER TABLE `lab_scrap_apply_and_baseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_scrap_apply_and_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_leave`
--

DROP TABLE IF EXISTS `oa_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ç¼–å·',
  `start_time` datetime DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `end_time` datetime DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  `leave_type` varchar(20) DEFAULT NULL COMMENT 'è¯·å‡ç±»å‹',
  `reason` varchar(255) DEFAULT NULL COMMENT 'è¯·å‡ç†ç”±',
  `apply_time` datetime DEFAULT NULL COMMENT 'ç”³è¯·æ—¶é—´',
  `reality_start_time` datetime DEFAULT NULL COMMENT 'å®é™…å¼€å§‹æ—¶é—´',
  `reality_end_time` datetime DEFAULT NULL COMMENT 'å®é™…ç»“æŸæ—¶é—´',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯·å‡æµç¨‹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_leave`
--

LOCK TABLES `oa_leave` WRITE;
/*!40000 ALTER TABLE `oa_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_notify`
--

DROP TABLE IF EXISTS `oa_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) DEFAULT NULL COMMENT 'ç±»å‹',
  `title` varchar(200) DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `content` varchar(2000) DEFAULT NULL COMMENT 'å†…å®¹',
  `files` varchar(2000) DEFAULT NULL COMMENT 'é™„ä»¶',
  `status` char(1) DEFAULT NULL COMMENT 'çŠ¶æ€',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é€šçŸ¥é€šå‘Š';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notify`
--

LOCK TABLES `oa_notify` WRITE;
/*!40000 ALTER TABLE `oa_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_notify_record`
--

DROP TABLE IF EXISTS `oa_notify_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT 'é€šçŸ¥é€šå‘ŠID',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'æ¥å—äºº',
  `read_flag` char(1) DEFAULT '0' COMMENT 'é˜…è¯»æ ‡è®°',
  `read_date` date DEFAULT NULL COMMENT 'é˜…è¯»æ—¶é—´',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é€šçŸ¥é€šå‘Šå‘é€è®°å½•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notify_record`
--

LOCK TABLES `oa_notify_record` WRITE;
/*!40000 ALTER TABLE `oa_notify_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_notify_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_test_audit`
--

DROP TABLE IF EXISTS `oa_test_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_test_audit` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT 'å˜åŠ¨ç”¨æˆ·',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `POST` varchar(255) DEFAULT NULL COMMENT 'å²—ä½',
  `AGE` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `EDU` varchar(255) DEFAULT NULL COMMENT 'å­¦å†',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åŸå› ',
  `OLDA` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† è–ªé…¬æ¡£çº§',
  `OLDB` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† æœˆå·¥èµ„é¢',
  `OLDC` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† å¹´è–ªæ€»é¢',
  `NEWA` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† è–ªé…¬æ¡£çº§',
  `NEWB` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† æœˆå·¥èµ„é¢',
  `NEWC` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† å¹´è–ªæ€»é¢',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT 'æœˆå¢èµ„',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT 'æ‰§è¡Œæ—¶é—´',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT 'äººåŠ›èµ„æºéƒ¨é—¨æ„è§',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT 'åˆ†ç®¡é¢†å¯¼æ„è§',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT 'é›†å›¢ä¸»è¦é¢†å¯¼æ„è§',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å®¡æ‰¹æµç¨‹æµ‹è¯•è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_test_audit`
--

LOCK TABLES `oa_test_audit` WRITE;
/*!40000 ALTER TABLE `oa_test_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_test_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `type` char(1) DEFAULT NULL COMMENT 'åŒºåŸŸç±»å‹',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŒºåŸŸè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES ('06230000000001','2','0,1,2,','æµ·æ·€åŒº',30,'110201','3','1','2015-06-23 15:34:19','1','2015-06-23 15:37:15','','0'),('1','0','0,','ä¸­å›½',10,'100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','åŒ—äº¬å¸‚',20,'110000','2','1','2013-05-27 08:00:00','1','2015-06-23 14:54:09','','0'),('3','2','0,1,2,','è¥¿åŸåŒº',30,'110101','3','1','2013-05-27 08:00:00','1','2015-06-23 15:02:01','','0'),('4','3','0,1,2,3,','é‡‘èè¡—è¡—é“',40,'110102','4','1','2013-05-27 08:00:00','1','2015-06-23 15:04:14','','0'),('5','3','0,1,2,3,','ä¸‰é‡Œæ²³è¡—é“',50,'110104','4','1','2013-05-27 08:00:00','1','2015-06-23 15:05:23','','0'),('6','3','0,1,2,3,','è¥¿é•¿å®‰è¡—',60,'110105','4','1','2013-05-27 08:00:00','1','2015-06-23 15:06:10','','0');
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'ç¼–å·',
  `value` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'æ•°æ®å€¼',
  `label` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'æ ‡ç­¾å',
  `type` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'ç±»å‹',
  `description` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'æè¿°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `parent_id` varchar(64) CHARACTER SET utf8 DEFAULT '0' COMMENT 'çˆ¶çº§ç¼–å·',
  `create_by` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='å­—å…¸è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('06030000006001','01','å¾…é¢„å®š','JYSQZT','å€Ÿç”¨ç”³è¯·å•çŠ¶æ€',10,'0','1','2015-06-03 14:47:08','1','2015-06-03 14:47:35','','0'),('06030000006002','02','å·²é¢„å®š','JYSQZT','å€Ÿç”¨ç”³è¯·å•çŠ¶æ€',20,'0','1','2015-06-03 14:47:57','1','2015-06-03 14:47:57','','0'),('06030000006003','03','å·²å€Ÿå‡º','JYSQZT','å€Ÿç”¨ç”³è¯·å•çŠ¶æ€',30,'0','1','2015-06-03 14:48:07','1','2015-06-03 14:48:07','','0'),('06030000006004','04','å·²å½’è¿˜','JYSQZT','å€Ÿç”¨ç”³è¯·å•çŠ¶æ€',40,'0','1','2015-06-03 14:48:15','1','2015-06-03 14:48:15','','0'),('06040000006101','05','å¾…å®¡æ‰¹','JYSQZT','å€Ÿç”¨ç”³è¯·å•çŠ¶æ€',50,'0','1','2015-06-04 11:40:29','1','2015-06-04 11:40:29','','0'),('06040000006102','06','å·²æ‹’ç»','JYSQZT','å€Ÿç”¨ç”³è¯·å•çŠ¶æ€',60,'0','1','2015-06-04 11:40:39','1','2015-06-04 11:40:39','','0'),('06090000007201','6','å·²æ‹’ç»','file_borrow_status','å·²æ‹’ç»',60,'0','1','2015-06-09 14:00:10','1','2015-06-09 14:00:10','å·²æ‹’ç»','0'),('06170000007301','01','å¾…å®¡æ‰¹','yq_repair_status','å¾…å®¡æ‰¹',10,'0','1','2015-06-17 14:43:08','1','2015-06-17 14:43:08','','0'),('06170000007302','02','å¾…ç»´ä¿®','yq_repair_status','å¾…ç»´ä¿®',20,'0','1','2015-06-17 14:44:18','1','2015-06-17 14:45:11','','0'),('06170000007303','03','ç»´ä¿®ä¸­','yq_repair_status','ç»´ä¿®ä¸­',30,'0','1','2015-06-17 14:45:47','1','2015-06-17 14:45:47','','0'),('06170000007304','04','å·²ç»´ä¿®','yq_repair_status','å·²ç»´ä¿®',40,'0','1','2015-06-17 14:46:17','1','2015-06-17 14:46:17','','0'),('06170000007305','05','å·²æ‹’ç»','yq_repair_status','å·²æ‹’ç»',50,'0','1','2015-06-17 14:46:38','1','2015-06-17 14:46:38','','0'),('06170000007306','01','å¾…å®¡æ‰¹','yq_scrap_status','å¾…å®¡æ‰¹',10,'0','1','2015-06-17 14:48:22','1','2015-06-17 14:48:22','','0'),('06170000007307','02','å¾…å¤„ç†','yq_scrap_status','å¾…å¤„ç†',20,'0','1','2015-06-17 14:48:45','1','2015-06-17 14:48:45','','0'),('06170000007308','03','å·²æŠ¥åºŸ','yq_scrap_status','å·²æŠ¥åºŸ',30,'0','1','2015-06-17 14:49:13','1','2015-06-17 14:49:13','','0'),('06170000007309','04','å·²æ‹’ç»','yq_scrap_status','å·²æ‹’ç»',40,'0','1','2015-06-17 14:49:39','1','2015-06-17 14:49:39','','0'),('1','0','æ­£å¸¸','del_flag','åˆ é™¤æ ‡è®°',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','yellow','é»„è‰²','color','é¢œè‰²å€¼',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('100','java.util.Date','Date','gen_java_type','Javaç±»å‹',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('101','labs.modules.sys.entity.User','User','gen_java_type','Javaç±»å‹',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('102','labs.modules.sys.entity.Office','Office','gen_java_type','Javaç±»å‹',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('103','labs.modules.sys.entity.Area','Area','gen_java_type','Javaç±»å‹',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('104','Custom','Custom','gen_java_type','Javaç±»å‹',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('105','1','ä¼šè®®é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('106','2','å¥–æƒ©é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('107','3','æ´»åŠ¨é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹',30,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('108','0','è‰ç¨¿','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('109','1','å‘å¸ƒ','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('11','orange','æ©™è‰²','color','é¢œè‰²å€¼',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('110','0','æœªè¯»','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('111','1','å·²è¯»','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('12','default','é»˜è®¤ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','cerulean','å¤©è“ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','readable','æ©™è‰²ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','united','çº¢è‰²ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','flat','Flatä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','1','å›½å®¶','sys_area_type','åŒºåŸŸç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','2','çœä»½ã€ç›´è¾–å¸‚','sys_area_type','åŒºåŸŸç±»å‹',20,'0','1','2013-05-27 08:00:00','1','2015-04-24 13:39:40','','0'),('19','3','åœ°å¸‚','sys_area_type','åŒºåŸŸç±»å‹',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','åˆ é™¤','del_flag','åˆ é™¤æ ‡è®°',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','4','åŒºå¿','sys_area_type','åŒºåŸŸç±»å‹',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('201505111','3','æµ‹è¯•','act_type','æµç¨‹ç±»å‹',30,'0','1','2015-05-11 13:19:20','1','2015-05-11 13:19:20','','1'),('201505120000001001','3','æœªçŸ¥','sex','æœªçŸ¥',10,'0','1','2015-05-12 17:28:53','1','2015-05-12 17:28:53','','0'),('201505250000002001','1','1','gen_java_type','1',10,'0','1','2015-05-25 16:48:12','1','2015-05-25 16:48:12','','1'),('201505270000003001','1','ç©ºé—²','file_borrow_status','ç©ºé—²',10,'0','1','2015-05-27 15:50:13','1','2015-05-27 17:01:06','ç©ºé—²','0'),('201505270000003002','2','å¾…å®¡æ‰¹','file_borrow_status','å¾…å®¡æ‰¹',20,'0','1','2015-05-27 15:50:35','1','2015-05-27 17:01:17','å¾…å®¡æ‰¹','0'),('201505270000004001','3','å·²å®¡æ‰¹','file_borrow_status','å·²å®¡æ‰¹',30,'0','1','2015-05-27 17:00:20','1','2015-05-27 17:01:27','å·²å®¡æ‰¹','0'),('201505270000004002','4','å·²å€Ÿå‡º','file_borrow_status','å·²å€Ÿå‡º',40,'0','1','2015-05-27 17:00:36','1','2015-05-27 17:01:34','å·²å€Ÿå‡º','0'),('201505270000004003','5','å·²å½’è¿˜','file_borrow_status','å·²å½’è¿˜',50,'0','1','2015-05-27 17:00:57','1','2015-05-27 17:00:57','å·²å½’è¿˜','0'),('201505280000005001','01','ç©ºé—²','SBZT','è®¾å¤‡çŠ¶æ€',1,'0','1','2015-05-28 10:57:59','1','2015-05-28 10:58:28','','0'),('201505280000005002','02','é¢„å®š','SBZT','è®¾å¤‡çŠ¶æ€',11,'0','1','2015-05-28 10:58:40','1','2015-05-28 10:58:40','','0'),('201505280000005003','03','å·²å€Ÿå‡º','SBZT','è®¾å¤‡çŠ¶æ€',21,'0','1','2015-05-28 10:58:58','1','2015-05-28 10:58:58','','0'),('201505280000005004','04','ç»´ä¿®ä¸­','SBZT','è®¾å¤‡çŠ¶æ€',31,'0','1','2015-05-28 10:59:14','1','2015-05-28 10:59:14','','0'),('201505280000005005','05','å·²æŠ¥åºŸ','SBZT','è®¾å¤‡çŠ¶æ€',41,'0','1','2015-05-28 10:59:28','1','2015-05-28 10:59:28','','0'),('201506040000006201','1','å›¾ä¹¦æ ‡å‡†','file_standard_type','å›¾ä¹¦æ ‡å‡†',10,'0','1','2015-06-04 13:53:16','1','2015-06-04 13:53:16','å›¾ä¹¦æ ‡å‡†','0'),('201506040000006202','2','å—æ§æ–‡ä»¶','file_standard_type','å—æ§æ–‡ä»¶',20,'0','1','2015-06-04 13:53:38','1','2015-06-04 13:53:38','å—æ§æ–‡ä»¶','0'),('21','1','å…¬å¸','sys_office_type','æœºæ„ç±»å‹',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','2','éƒ¨é—¨','sys_office_type','æœºæ„ç±»å‹',70,'0','1','2013-05-27 08:00:00','1','2015-05-20 16:03:23','','0'),('23','3','å°ç»„','sys_office_type','æœºæ„ç±»å‹',80,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','4','å…¶å®ƒ','sys_office_type','æœºæ„ç±»å‹',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','ç»¼åˆéƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','2','å¼€å‘éƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','3','äººåŠ›éƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','1','ä¸€çº§','sys_office_grade','æœºæ„ç­‰çº§',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','2','äºŒçº§','sys_office_grade','æœºæ„ç­‰çº§',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','æ˜¾ç¤º','show_hide','æ˜¾ç¤º/éšè—',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','3','ä¸‰çº§','sys_office_grade','æœºæ„ç­‰çº§',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','4','å››çº§','sys_office_grade','æœºæ„ç­‰çº§',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','1','æ‰€æœ‰æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','2','æ‰€åœ¨å…¬å¸åŠä»¥ä¸‹æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','3','æ‰€åœ¨å…¬å¸æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','4','æ‰€åœ¨éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35d4a7f0257a413996786e721921f2f6','zise','ç´«è‰²','color','é¢œè‰²å€¼',60,'0','1','2015-04-15 10:20:46','1','2015-04-15 10:20:46','ç´«è‰²','0'),('36','5','æ‰€åœ¨éƒ¨é—¨æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','8','ä»…æœ¬äººæ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','9','æŒ‰æ˜ç»†è®¾ç½®','sys_data_scope','æ•°æ®èŒƒå›´',100,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','1','ç³»ç»Ÿç®¡ç†','sys_user_type','ç”¨æˆ·ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','0','éšè—','show_hide','æ˜¾ç¤º/éšè—',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','2','éƒ¨é—¨ç»ç†','sys_user_type','ç”¨æˆ·ç±»å‹',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','3','æ™®é€šç”¨æˆ·','sys_user_type','ç”¨æˆ·ç±»å‹',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','basic','åŸºç¡€ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','blue','è“è‰²ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('43a110e160c9485aa5426635f2caabbc','weixin','å¨ä¿¡','cms_theme','ç«™ç‚¹ä¸»é¢˜',20,'0','1','2015-04-16 12:55:03','1','2015-04-16 12:55:03','','0'),('44','red','çº¢è‰²ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','article','æ–‡ç« æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','picture','å›¾ç‰‡æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','download','ä¸‹è½½æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','link','é“¾æ¥æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','special','ä¸“é¢˜æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','æ˜¯','yes_no','æ˜¯/å¦',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','0','é»˜è®¤å±•ç°æ–¹å¼','cms_show_modes','å±•ç°æ–¹å¼',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','1','é¦–æ ç›®å†…å®¹åˆ—è¡¨','cms_show_modes','å±•ç°æ–¹å¼',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','2','æ ç›®ç¬¬ä¸€æ¡å†…å®¹','cms_show_modes','å±•ç°æ–¹å¼',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','0','å‘å¸ƒ','cms_del_flag','å†…å®¹çŠ¶æ€',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','1','åˆ é™¤','cms_del_flag','å†…å®¹çŠ¶æ€',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','2','å®¡æ ¸','cms_del_flag','å†…å®¹çŠ¶æ€',15,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','1','é¦–é¡µç„¦ç‚¹å›¾','cms_posid','æ¨èä½',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','2','æ ç›®é¡µæ–‡ç« æ¨è','cms_posid','æ¨èä½',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','1','å’¨è¯¢','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','2','å»ºè®®','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','0','å¦','yes_no','æ˜¯/å¦',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','3','æŠ•è¯‰','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','4','å…¶å®ƒ','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','å…¬ä¼‘','oa_leave_type','è¯·å‡ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','2','ç—…å‡','oa_leave_type','è¯·å‡ç±»å‹',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','3','äº‹å‡','oa_leave_type','è¯·å‡ç±»å‹',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','4','è°ƒä¼‘','oa_leave_type','è¯·å‡ç±»å‹',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','5','å©šå‡','oa_leave_type','è¯·å‡ç±»å‹',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','1','æ¥å…¥æ—¥å¿—','sys_log_type','æ—¥å¿—ç±»å‹',30,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','2','å¼‚å¸¸æ—¥å¿—','sys_log_type','æ—¥å¿—ç±»å‹',40,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','leave','è¯·å‡æµç¨‹','act_type','æµç¨‹ç±»å‹',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','red','çº¢è‰²','color','é¢œè‰²å€¼',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','test_audit','å®¡æ‰¹æµ‹è¯•æµç¨‹','act_type','æµç¨‹ç±»å‹',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('71','1','åˆ†ç±»1','act_category','æµç¨‹åˆ†ç±»',10,'0','1','2013-06-03 08:00:00','1','2015-05-25 16:47:28','3','0'),('72','2','åˆ†ç±»2','act_category','æµç¨‹åˆ†ç±»',20,'0','1','2013-06-03 08:00:00','1','2015-05-18 13:30:26','','0'),('73','crud','å¢åˆ æ”¹æŸ¥','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('74','crud_many','å¢åˆ æ”¹æŸ¥ï¼ˆåŒ…å«ä»è¡¨ï¼‰','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75','tree','æ ‘ç»“æ„','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('76','=','=','gen_query_type','æŸ¥è¯¢æ–¹å¼',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('77','!=','!=','gen_query_type','æŸ¥è¯¢æ–¹å¼',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('78','&gt;','&gt;','gen_query_type','æŸ¥è¯¢æ–¹å¼',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('79','&lt;','&lt;','gen_query_type','æŸ¥è¯¢æ–¹å¼',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8','green','ç»¿è‰²','color','é¢œè‰²å€¼',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','between','Between','gen_query_type','æŸ¥è¯¢æ–¹å¼',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('81','like','Like','gen_query_type','æŸ¥è¯¢æ–¹å¼',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('82','left_like','Left Like','gen_query_type','æŸ¥è¯¢æ–¹å¼',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('83','right_like','Right Like','gen_query_type','æŸ¥è¯¢æ–¹å¼',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('84','input','æ–‡æœ¬æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('85','textarea','æ–‡æœ¬åŸŸ','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('86','select','ä¸‹æ‹‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('87','checkbox','å¤é€‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('88','radiobox','å•é€‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89','dateselect','æ—¥æœŸé€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('9','blue','è“è‰²','color','é¢œè‰²å€¼',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','userselect','äººå‘˜é€‰æ‹©\0','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('91','officeselect','éƒ¨é—¨é€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('92','areaselect','åŒºåŸŸé€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('93','String','String','gen_java_type','Javaç±»å‹',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('94','Long','Long','gen_java_type','Javaç±»å‹',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('95','dao','ä»…æŒä¹…å±‚','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('96','1','ç”·','sex','æ€§åˆ«',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('97','2','å¥³','sex','æ€§åˆ«',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('98','Integer','Integer','gen_java_type','Javaç±»å‹',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('99','Double','Double','gen_java_type','Javaç±»å‹',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('edc3538d74f84048a4da3f325b385404','heise','é»‘è‰²','color','é¢œè‰²å€¼',70,'0','1','2015-04-15 10:21:36','1','2015-04-15 10:21:36','é»‘è‰²','0');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `code` varchar(64) NOT NULL COMMENT 'ç±»å‹ä»£ç ',
  `name` varchar(64) NOT NULL COMMENT 'ç±»åˆ«åç§°',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'æ—¶é—´æˆ³',
  `t1` varchar(20) DEFAULT NULL COMMENT 'å¤‡ç”¨1',
  `t2` varchar(40) DEFAULT NULL COMMENT 'å¤‡ç”¨2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT 'å¤‡ç”¨3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_dict_type_uk` (`code`),
  KEY `sys_dict_type_code_IDX` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ•°æ®å­—å…¸ç±»å‹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES ('06030000127001','JYSQZT','å€Ÿç”¨ç”³è¯·å•çŠ¶æ€','1','2015-06-03 14:46:19','1','2015-06-03 14:46:19','å€Ÿç”¨ç”³è¯·å•çŠ¶æ€','0','2015-06-03 06:46:47','','',NULL),('06170000128101','yq_repair_status','ä»ªå™¨ç»´ä¿®çŠ¶æ€','1','2015-06-17 14:41:56','1','2015-06-17 14:41:56','ä»ªå™¨ç»´ä¿®çŠ¶æ€','0','2015-06-17 06:42:24','','',NULL),('06170000128102','yq_scrap_status','ä»ªå™¨é™çº§/æŠ¥åºŸçŠ¶æ€','1','2015-06-17 14:47:42','1','2015-06-17 14:47:42','ä»ªå™¨é™çº§/æŠ¥åºŸçŠ¶æ€','0','2015-06-17 06:48:10','','',NULL),('1','del_flag','åˆ é™¤æ ‡è®°','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('10','color','é¢œè‰²å€¼','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('100','gen_java_type','Javaç±»å‹','1','2013-10-28 09:00:00','1','2015-05-18 17:25:37','','0','2015-05-18 09:26:05','','',NULL),('105','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹','1','2013-11-08 09:00:00','1','2013-11-08 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('108','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€','1','2013-11-08 09:00:00','1','2013-11-08 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('110','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€','1','2013-11-08 09:00:00','1','2015-05-18 17:25:33','','0','2015-05-18 09:26:01','','',NULL),('12','theme','ä¸»é¢˜æ–¹æ¡ˆ','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('17','sys_area_type','åŒºåŸŸç±»å‹','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('2','act_type','æµç¨‹ç±»å‹','1','2015-05-11 14:19:20','1','2015-05-11 14:19:20',NULL,'0','2015-05-11 09:58:31',NULL,NULL,NULL),('201505270000125001','file_borrow_status','æ–‡ä»¶èµ„æ–™å€Ÿç”¨è®°å½•çŠ¶æ€','1','2015-05-27 15:49:14','1','2015-06-04 13:52:05','','0','2015-06-04 05:52:34','','',NULL),('201505280000126001','SBZT','è®¾å¤‡çŠ¶æ€','1','2015-05-28 10:56:06','1','2015-05-28 10:56:06','','0','2015-05-28 02:56:34','','',NULL),('201506040000127101','file_standard_type','æ–‡ä»¶èµ„æ–™æ ‡å‡†ç±»å‹','1','2015-06-04 13:52:37','1','2015-06-04 13:52:37','æ–‡ä»¶èµ„æ–™æ ‡å‡†ç±»å‹','0','2015-06-04 05:53:06','','',NULL),('21','sys_office_type','æœºæ„ç±»å‹','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('25','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('28','sys_office_grade','æœºæ„ç­‰çº§','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('3','show_hide','æ˜¾ç¤º/éšè—','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('32','sys_data_scope','æ•°æ®èŒƒå›´','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('39','sys_user_type','ç”¨æˆ·ç±»å‹','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('42','cms_theme','ç«™ç‚¹ä¸»é¢˜','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('45','cms_module','æ ç›®æ¨¡å‹','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('5','yes_no','æ˜¯/å¦','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('50','cms_show_modes','å±•ç°æ–¹å¼','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('53','cms_del_flag','å†…å®¹çŠ¶æ€','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('56','cms_posid','æ¨èä½','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('58','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('62','oa_leave_type','è¯·å‡ç±»å‹','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('67','sys_log_type','æ—¥å¿—ç±»å‹','1','2013-06-03 09:00:00','1','2013-06-03 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('71','act_category','æµç¨‹åˆ†ç±»','1','2013-06-03 09:00:00','1','2013-06-03 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('73','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»','1','2013-10-28 09:00:00','1','2013-10-28 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('76','gen_query_type','æŸ¥è¯¢æ–¹å¼','1','2013-10-28 09:00:00','1','2013-10-28 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('84','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','1','2013-10-28 09:00:00','1','2013-10-28 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('96','sex','æ€§åˆ«','1','2013-10-28 09:00:00','1','2013-10-28 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) DEFAULT '1' COMMENT 'æ—¥å¿—ç±»å‹',
  `title` varchar(255) DEFAULT '' COMMENT 'æ—¥å¿—æ ‡é¢˜',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT 'æ“ä½œIPåœ°å€',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ç”¨æˆ·ä»£ç†',
  `request_uri` varchar(255) DEFAULT NULL COMMENT 'è¯·æ±‚URI',
  `method` varchar(5) DEFAULT NULL COMMENT 'æ“ä½œæ–¹å¼',
  `params` text COMMENT 'æ“ä½œæäº¤çš„æ•°æ®',
  `exception` text COMMENT 'å¼‚å¸¸ä¿¡æ¯',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ—¥å¿—è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_mdict`
--

DROP TABLE IF EXISTS `sys_mdict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `description` varchar(100) DEFAULT NULL COMMENT 'æè¿°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å¤šçº§å­—å…¸è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_mdict`
--

LOCK TABLES `sys_mdict` WRITE;
/*!40000 ALTER TABLE `sys_mdict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_mdict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `href` varchar(2000) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡',
  `icon` varchar(100) DEFAULT NULL COMMENT 'å›¾æ ‡',
  `is_show` char(1) NOT NULL COMMENT 'æ˜¯å¦åœ¨èœå•ä¸­æ˜¾ç¤º',
  `permission` varchar(200) DEFAULT NULL COMMENT 'æƒé™æ ‡è¯†',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='èœå•è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('0680741fef2643ff9070f93ac64ad318','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','å€Ÿå‡º',120,'','','','0','yq:labBorrowRequest:lend','1','2015-06-10 10:53:55','1','2015-06-10 10:53:55','å€Ÿå‡ºæƒé™','0'),('1','0','0,','åŠŸèƒ½èœå•',0,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','å­—å…¸ç®¡ç†',60,'/sys/dict/',NULL,'icon-th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','æœºæ„ç”¨æˆ·',970,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','åŒºåŸŸç®¡ç†',50,'/sys/area/',NULL,'icon-th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','æœºæ„ç®¡ç†',40,'/sys/office/',NULL,'icon-th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('186552005fef485ab9004164e68460d5','8c24cbb7270b4c459859e8d2645faa86','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,','ä»ªå™¨ä¿¡æ¯ç®¡ç†',30,'/yq/labEquipmentBaseinfo','','icon-wrench','1','','1','2015-05-27 09:41:48','1','2015-06-02 14:17:58','','0'),('19','17','0,1,2,13,17,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('1aad42421be64487b3f59617a1414414','9e129245e0ce4acdb0c5bde2910c270a','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,','æ–‡ä»¶èµ„æ–™æŸ¥è¯¢',30,'/files/labFileAttributes','','','1','','1','2015-05-25 13:56:33','1','2015-05-25 13:56:33','','0'),('1cddfa10d23049c88d3a0bc38608bbfb','62073fd9426148a59e9a901d947542b2','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,62073fd9426148a59e9a901d947542b2,','ç¼–è¾‘',60,'','','','0','yq:labScrapApply:edit','1','2015-06-23 14:59:25','1','2015-06-23 15:00:48','','0'),('2','1','0,1,','ç³»ç»Ÿè®¾ç½®',900,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','ç”¨æˆ·ç®¡ç†',30,'/sys/user/index',NULL,'icon-user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','å…³äºå¸®åŠ©',990,NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23c823cd92004d16a1184a71fb0cf775','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','ç¼–è¾‘',60,'','','','0','yq:labEquipmentBaseinfo:edit','1','2015-05-27 09:42:16','1','2015-05-27 16:49:04','','0'),('27','1','0,1,','æˆ‘çš„é¢æ¿',100,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','ä¸ªäººä¿¡æ¯',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','ä¸ªäººä¿¡æ¯',30,'/sys/user/info',NULL,'icon-user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','ç³»ç»Ÿè®¾ç½®',980,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','ä¿®æ”¹å¯†ç ',40,'/sys/user/modifyPwd',NULL,'icon-lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','å†…å®¹ç®¡ç†',500,'','','','0','','1','2013-05-27 08:00:00','1','2015-06-23 14:50:31','','0'),('32','31','0,1,31,','æ ç›®è®¾ç½®',990,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','æ ç›®ç®¡ç†',30,'/cms/category/',NULL,'icon-align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','ç«™ç‚¹è®¾ç½®',40,'/cms/site/',NULL,'icon-certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','36','0,1,31,32,36,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','36','0,1,31,32,36,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','åˆ‡æ¢ç«™ç‚¹',50,'/cms/site/select',NULL,'icon-retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3bdbe6d4a8984606a95759b2fdf24021','3','0,1,2,3,','å­—å…¸ç±»å‹ç®¡ç†',55,'/sys/sysDictType','','icon-info-sign','1','','1','2015-05-13 14:03:40','1','2015-05-13 14:03:40','','0'),('4','3','0,1,2,3,','èœå•ç®¡ç†',30,'/sys/menu/',NULL,'icon-list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','å†…å®¹ç®¡ç†',500,NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','å†…å®¹å‘å¸ƒ',30,'/cms/',NULL,'icon-briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','41','0,1,31,40,41,','æ–‡ç« æ¨¡å‹',40,'/cms/article/',NULL,'icon-file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','42','0,1,31,40,41,42,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','å®¡æ ¸',50,NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45ff42fb8d024602816b9384813d2ede','f42c05c410624b7884de7d7357886e7a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,f42c05c410624b7884de7d7357886e7a,','å®¡æ‰¹',90,'','','','0','yq:labRepairRequest:approve','1','2015-06-19 11:16:55','1','2015-06-19 11:16:55','','0'),('46','41','0,1,31,40,41,','é“¾æ¥æ¨¡å‹',60,'/cms/link/',NULL,'icon-random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','46','0,1,31,40,41,46,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','46','0,1,31,40,41,46,','å®¡æ ¸',50,NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','4','0,1,2,3,4,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','è¯„è®ºç®¡ç†',40,'/cms/comment/?status=2',NULL,'icon-comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','50','0,1,31,40,50,','å®¡æ ¸',40,NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','40','0,1,31,40,','å…¬å…±ç•™è¨€',80,'/cms/guestbook/?status=2',NULL,'icon-glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('537a1b39122a4bdcac8aa3ab5a2f8cac','f42c05c410624b7884de7d7357886e7a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,f42c05c410624b7884de7d7357886e7a,','æŸ¥çœ‹',30,'','','','0','yq:labRepairRequest:view','1','2015-06-19 11:15:38','1','2015-06-19 11:15:38','','0'),('54','53','0,1,31,40,53,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','å®¡æ ¸',40,NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','71','0,1,27,71,','æ–‡ä»¶ç®¡ç†',90,'/../static/ckfinder/ckfinder.html',NULL,'icon-folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','56','0,1,27,40,56,','ä¸Šä¼ ',40,NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','56','0,1,27,40,56,','ä¿®æ”¹',50,NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','4','0,1,2,3,4,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','ç»Ÿè®¡åˆ†æ',600,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','ä¿¡æ¯é‡ç»Ÿè®¡',30,'/cms/stats/article',NULL,'icon-tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61537afe08ca4d459433cad959cc68fb','1aad42421be64487b3f59617a1414414','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,1aad42421be64487b3f59617a1414414,','æŸ¥çœ‹æƒé™',30,'','','','0','files:labFileAttributes:view','1','2015-05-26 13:49:21','1','2015-05-26 13:49:21','','0'),('62','1','0,1,','åœ¨çº¿åŠå…¬',200,'','','','0','','1','2013-05-27 08:00:00','1','2015-06-23 14:50:24','','0'),('62073fd9426148a59e9a901d947542b2','8c24cbb7270b4c459859e8d2645faa86','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,','ä»ªå™¨é™çº§/æŠ¥åºŸç®¡ç†',300,'/yq/labScrapApply','','icon-bolt','1','','1','2015-06-23 14:58:16','1','2015-06-23 15:14:05','','0'),('63','62','0,1,62,','ä¸ªäººåŠå…¬',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','63','0,1,62,63,','è¯·å‡åŠç†',300,'/oa/leave',NULL,'icon-leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','64','0,1,62,63,64,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6634019181464aec9c01b27c9b020d8e','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','å®¡æ‰¹',90,'','','','0','yq:labBorrowRequest:approve','1','2015-06-04 11:38:29','1','2015-06-04 11:38:29','','0'),('67','2','0,1,2,','æ—¥å¿—æŸ¥è¯¢',985,NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','67','0,1,2,67,','æ—¥å¿—æŸ¥è¯¢',30,'/sys/log',NULL,'icon-pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('680224ca70354f68be34c92e483b8743','1aad42421be64487b3f59617a1414414','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,1aad42421be64487b3f59617a1414414,','å€Ÿé˜…æƒé™',90,'','','','0','files:labFileAttributes:lend','1','2015-06-11 13:29:12','1','2015-06-15 14:20:18','å€Ÿé˜…æƒé™','0'),('69','62','0,1,62,','æµç¨‹ç®¡ç†',300,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6a51ba918617408988c6eba913e9ca51','bf32921976b34458b0d13a36d3ce7f5d','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,bf32921976b34458b0d13a36d3ce7f5d,','æŸ¥çœ‹æƒé™',30,'','','','0','files:labFileBorrow:view','1','2015-05-26 13:50:20','1','2015-05-27 09:36:36','','0'),('7','3','0,1,2,3,','è§’è‰²ç®¡ç†',50,'/sys/role/',NULL,'icon-lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','æµç¨‹ç®¡ç†',50,'/act/process',NULL,'icon-road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('71','27','0,1,27,','æ–‡ä»¶ç®¡ç†',90,'','','','0','','1','2013-05-27 08:00:00','1','2015-06-23 14:50:16','','0'),('7142b3a3946642e181a6a5d1e1e93e1a','1','0,1,','ä»ªå™¨ç®¡ç†',5060,'','','','1','','1','2015-05-22 08:56:32','1','2015-05-22 08:56:32','','0'),('72','69','0,1,62,69,','æ¨¡å‹ç®¡ç†',100,'/act/model',NULL,'icon-road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),('73','63','0,1,62,63,','æˆ‘çš„ä»»åŠ¡',50,'/act/task/todo/',NULL,'icon-tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('74','63','0,1,62,63,','å®¡æ‰¹æµ‹è¯•',100,'/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('77373185e4a54fd799fec170f7f395b0','62073fd9426148a59e9a901d947542b2','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,62073fd9426148a59e9a901d947542b2,','å®¡æ‰¹',90,'','','','0','yq:labScrapApply:approve','1','2015-06-23 14:59:42','1','2015-06-23 15:01:10','','0'),('79','1','0,1,','ä»£ç ç”Ÿæˆ',5000,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('79a6d9d5ae224a58ad4104f8ddad285a','8c24cbb7270b4c459859e8d2645faa86','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,','ä»ªå™¨å€Ÿç”¨ç®¡ç†',60,'/yq/labBorrowRequest','','icon-star-half','1','','1','2015-06-02 14:19:05','1','2015-06-02 14:20:55','','0'),('7a784723be7c476e99b0c34c4f85f26f','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','å½’è¿˜',150,'','','','0','yq:labBorrowRequest:return','1','2015-06-10 10:54:46','1','2015-06-10 10:54:46','','0'),('7ad9feb4b07d4df6894921817095830a','f42c05c410624b7884de7d7357886e7a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,f42c05c410624b7884de7d7357886e7a,','ç¼–è¾‘',60,'','','','0','yq:labRepairRequest:edit','1','2015-06-19 11:16:04','1','2015-06-19 11:16:04','','0'),('7ca622df322a4acaace7bbb576706a5c','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','ä»ªå™¨è®¾å¤‡é¢„è®¢',90,'','','','0','yq:labEquipmentBaseinfo:reserve','1','2015-05-28 15:00:42','1','2015-06-01 14:31:58','','0'),('7f07d3f9a04e4c858be9ee6a189b5f37','1','0,1,','æ–‡ä»¶èµ„æ–™ç®¡ç†',5090,'','','','1','','1','2015-05-22 10:58:44','1','2015-05-22 10:58:44','','0'),('8','7','0,1,2,3,7,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','ä»£ç ç”Ÿæˆ',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('81','80','0,1,79,80,','ç”Ÿæˆæ–¹æ¡ˆé…ç½®',30,'/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('811bcf4a6d234936a213bdb87539575f','bf32921976b34458b0d13a36d3ce7f5d','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,bf32921976b34458b0d13a36d3ce7f5d,','å€Ÿé˜…æƒé™',120,'','','','0','files:labFileBorrow:lend','1','2015-06-11 13:30:57','1','2015-06-15 14:20:27','å€Ÿé˜…æƒé™','0'),('82','80','0,1,79,80,','ä¸šåŠ¡è¡¨é…ç½®',20,'/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('84','67','0,1,2,67,','è¿æ¥æ± ç›‘è§†',40,'/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('88','62','0,1,62,','é€šçŸ¥é€šå‘Š',20,'','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('89','88','0,1,62,88,','æˆ‘çš„é€šå‘Š',30,'/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('8a208fdb0d2e4b0b9e97a7abae357c9c','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','ä»ªå™¨è®¾å¤‡é™çº§æŠ¥åºŸ',150,'','','','0','yq:labEquipmentBaseinfo:scrap','1','2015-06-01 14:33:05','1','2015-06-01 14:33:05','','0'),('8c24cbb7270b4c459859e8d2645faa86','7142b3a3946642e181a6a5d1e1e93e1a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,','ä»ªå™¨ç®¡ç†',30,'','','','1','','1','2015-05-22 10:31:56','1','2015-06-02 14:17:52','','0'),('8ccb8869530747eb97164e635d4e7be0','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','æŸ¥çœ‹',30,'','','','0','yq:labBorrowRequest:view','1','2015-06-02 14:21:35','1','2015-06-02 14:21:35','','0'),('9','7','0,1,2,3,7,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','é€šå‘Šç®¡ç†',50,'/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('92fc77d8ab4d4e18bd4889c57300ab72','62073fd9426148a59e9a901d947542b2','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,62073fd9426148a59e9a901d947542b2,','æŸ¥çœ‹',30,'','','','0','yq:labScrapApply:view','1','2015-06-23 14:59:03','1','2015-06-23 15:00:34','','0'),('93b1116630ad40b584bd6c455f526186','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','æŸ¥çœ‹',30,'','','','0','yq:labEquipmentBaseinfo:view','1','2015-05-27 09:42:06','1','2015-05-27 16:48:46','','0'),('9e129245e0ce4acdb0c5bde2910c270a','7f07d3f9a04e4c858be9ee6a189b5f37','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,','æ–‡ä»¶èµ„æ–™ç®¡ç†',30,'','','','1','','1','2015-05-22 14:44:06','1','2015-05-22 14:44:25','','0'),('9fcf821aa9dc4792b8b0edbf05356fb4','bf32921976b34458b0d13a36d3ce7f5d','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,bf32921976b34458b0d13a36d3ce7f5d,','ä¿®æ”¹æƒé™',60,'','','','0','files:labFileBorrow:edit','1','2015-05-26 13:50:41','1','2015-05-27 09:36:47','','0'),('b519acf461ef41b4a7515d1407248f58','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','ç¼–è¾‘',60,'','','','0','yq:labBorrowRequest:edit','1','2015-06-02 14:22:00','1','2015-06-02 14:22:20','','0'),('bf32921976b34458b0d13a36d3ce7f5d','9e129245e0ce4acdb0c5bde2910c270a','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,','æ–‡ä»¶èµ„æ–™å€Ÿé˜…æŸ¥è¯¢',60,'/files/labFileBorrow','','','1','','1','2015-05-26 13:43:25','1','2015-06-08 13:28:07','','0'),('c0e209a036d346c8b279eeabaf9705ce','3bdbe6d4a8984606a95759b2fdf24021','0,1,2,3,3bdbe6d4a8984606a95759b2fdf24021,','ç¼–è¾‘',60,'','','','0','sys:sysDictType:edit','1','2015-05-13 14:05:20','1','2015-05-13 14:05:28','','0'),('d4d9d8bf547848b6b274452a50005bc4','3bdbe6d4a8984606a95759b2fdf24021','0,1,2,3,3bdbe6d4a8984606a95759b2fdf24021,','æŸ¥çœ‹',30,'','','','0','sys:sysDictType:view','1','2015-05-13 14:04:59','1','2015-05-13 14:04:59','','0'),('e1ea756d50734459a96579bb7d09baa2','1aad42421be64487b3f59617a1414414','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,1aad42421be64487b3f59617a1414414,','ç¼–è¾‘æƒé™',60,'','','','0','files:labFileAttributes:edit','1','2015-05-26 13:49:46','1','2015-05-26 13:49:46','','0'),('eb4beaae012247fdb84e840e960a906e','f42c05c410624b7884de7d7357886e7a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,f42c05c410624b7884de7d7357886e7a,','ç®¡ç†',120,'','','','0','yq:labRepairRequest:manage','1','2015-06-19 11:17:18','1','2015-06-30 11:14:33','','0'),('ee399f542d0f4d5ab0710e451988a890','bf32921976b34458b0d13a36d3ce7f5d','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,bf32921976b34458b0d13a36d3ce7f5d,','å®¡æ‰¹æƒé™',90,'','','','0','files:labFileBorrow:approve','1','2015-05-26 13:54:26','1','2015-06-09 14:03:50','','0'),('f42526191fe440039b2feb260104ab60','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','ä»ªå™¨è®¾å¤‡ç»´ä¿®',120,'','','','0','yq:labEquipmentBaseinfo:maintain','1','2015-06-01 14:32:36','1','2015-06-01 14:32:36','','0'),('f42c05c410624b7884de7d7357886e7a','8c24cbb7270b4c459859e8d2645faa86','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,','ä»ªå™¨ç»´ä¿®ç®¡ç†',270,'/yq/labRepairRequest','','icon-wrench','1','','1','2015-06-19 11:15:10','1','2015-06-23 15:13:52','','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_office`
--

DROP TABLE IF EXISTS `sys_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `area_id` varchar(64) NOT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `type` char(1) NOT NULL COMMENT 'æœºæ„ç±»å‹',
  `grade` char(1) NOT NULL COMMENT 'æœºæ„ç­‰çº§',
  `address` varchar(255) DEFAULT NULL COMMENT 'è”ç³»åœ°å€',
  `zip_code` varchar(100) DEFAULT NULL COMMENT 'é‚®æ”¿ç¼–ç ',
  `master` varchar(100) DEFAULT NULL COMMENT 'è´Ÿè´£äºº',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `fax` varchar(200) DEFAULT NULL COMMENT 'ä¼ çœŸ',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç”¨',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT 'ä¸»è´Ÿè´£äºº',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT 'å‰¯è´Ÿè´£äºº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æœºæ„è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_office`
--

LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;
INSERT INTO `sys_office` VALUES ('1','0','0,','æ€»å…¬å¸',10,'2','100000','1','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2015-06-23 14:53:48','','0'),('2','1','0,1,','å…¬å¸é¢†å¯¼',10,'2','100001','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25412c1ef4c047868860b9859b36ae46','54ec081ed00a447a8c09961e0ce1acc8','0,54ec081ed00a447a8c09961e0ce1acc8,','é¡¹ç›®ç»„A',30,'2','2000001','2','1','','','','','','','1','','','1','2015-04-21 16:21:50','1','2015-04-21 16:21:50','','0'),('296b3712f737447db7d212513dd13cb7','54ec081ed00a447a8c09961e0ce1acc8','0,54ec081ed00a447a8c09961e0ce1acc8,','é¡¹ç›®ç»„B',30,'2','2000002','2','1','','','','','','','1','','','1','2015-04-21 16:22:14','1','2015-04-21 16:22:14','','0'),('3','1','0,1,','ç»¼åˆéƒ¨',20,'2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','0,1,','å¸‚åœºéƒ¨',30,'2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','1','0,1,','æŠ€æœ¯éƒ¨',40,'2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54ec081ed00a447a8c09961e0ce1acc8','0','0,','å…¬å¸é¡¹ç›®ç»„',30,'2','2000','1','1','','','','','','','1','','','1','2015-04-21 16:11:13','1','2015-04-21 16:17:28','','0'),('6','1','0,1,','ç ”å‘éƒ¨',50,'2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `name` varchar(100) NOT NULL COMMENT 'è§’è‰²åç§°',
  `enname` varchar(255) DEFAULT NULL COMMENT 'è‹±æ–‡åç§°',
  `role_type` varchar(255) DEFAULT NULL COMMENT 'è§’è‰²ç±»å‹',
  `data_scope` char(1) DEFAULT NULL COMMENT 'æ•°æ®èŒƒå›´',
  `is_sys` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦ç³»ç»Ÿæ•°æ®',
  `useable` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç”¨',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('0df038d9138a428ebb901367951edd4e','2','é¡¹ç›®ç»„A-ä»ªå™¨ç®¡ç†è§’è‰²','PRJ1_INSTMNG','user','1','1','1','1','2015-04-21 16:48:00','1','2015-04-27 15:14:25','','0'),('1','2','ç³»ç»Ÿç®¡ç†å‘˜','dept','assignment','1','1','1','1','2013-05-27 08:00:00','1','2015-06-23 13:47:38','','0'),('13d47db92fe74c4194fb13a181d9d1d0','2','æ–‡ä»¶èµ„æ–™å€Ÿé˜…å½’è¿˜å²—','wjzljygh','user','8','1','1','1','2015-06-08 13:19:10','1','2015-06-30 15:52:51','','0'),('2','1','å…¬å¸ç®¡ç†å‘˜','hr','assignment','2',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21ac2c5fb3554e44a210b072af968a6b','2','ä»ªå™¨ç»´ä¿®äºº','yqwx-sq','assignment','8','1','1','1','2015-07-01 14:50:41','1','2015-07-01 15:01:46','','0'),('3','1','æœ¬å…¬å¸ç®¡ç†å‘˜','a','assignment','3',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','éƒ¨é—¨ç®¡ç†å‘˜','b','assignment','4',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4ef5f5ec4fc64d0ba60b01ff715740ae','2','ä»ªå™¨ç»´ä¿®å®¡æ‰¹äºº','yqwx-sp','assignment','8','1','1','1','2015-07-01 14:49:59','1','2015-07-01 15:02:00','','0'),('5','1','æœ¬éƒ¨é—¨ç®¡ç†å‘˜','c','assignment','5',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('509e55188a034f67b20761e5db8adbb5','2','æ–‡ä»¶èµ„æ–™å€Ÿé˜…å®¡æ‰¹å²—','wjzlspg','user','8','1','1','1','2015-06-08 13:19:46','1','2015-06-30 15:53:44','','0'),('5525a6248bd24defa5716e78e90e7527','2','ä»ªå™¨ç®¡ç†-å®¡æ‰¹','yqgl-sp','user','8','0','1','1','2015-06-04 14:05:00','1','2015-06-24 11:18:41','','0'),('5d3b32dd0cf743618dcc44f92fa9546c','2','é¡¹ç›®ç»„A','PROJECT1','assignment','4','1','1','1','2015-04-21 16:46:38','1','2015-05-25 13:48:57','','0'),('6','2','æ™®é€šç”¨æˆ·','d','assignment','8','1','1','1','2013-05-27 08:00:00','1','2015-05-25 16:04:36','','0'),('64c51ff2129142bfbb18570e19e146cf','2','ä»ªå™¨ç®¡ç†-ç®¡ç†å‘˜','yqgl-gly','user','8','0','1','1','2015-06-04 14:06:17','1','2015-06-26 10:05:13','','0'),('66eb91788fd74fedad045a64af70512b','2','ä»ªå™¨é™çº§/æŠ¥åºŸäºº','jjbf','assignment','8','1','1','1','2015-07-01 15:02:38','1','2015-07-01 15:02:38','','0'),('76888a683b96489eab3b7258569fa7a0','2','ä»ªå™¨ç®¡ç†-å€Ÿç”¨ç”³è¯·è§’è‰²','yqgl-sqr','user','8','0','1','1','2015-06-04 15:48:14','1','2015-07-01 14:45:58','','0'),('93dc5c9814534369b4b3c2d165376fef','2','ä»ªå™¨é™çº§/æŠ¥åºŸå®¡æ‰¹äºº','jjbfsp','assignment','8','1','1','1','2015-07-01 15:02:59','1','2015-07-01 15:02:59','','0'),('cc35e8fe019440b3a64bfba41a89331a','2','æ–‡ä»¶èµ„æ–™ç®¡ç†å²—','wjzlgl','user','8','1','1','1','2015-06-08 13:17:44','1','2015-06-30 15:45:21','','0');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `menu_id` varchar(64) NOT NULL COMMENT 'èœå•ç¼–å·',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-èœå•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES ('0df038d9138a428ebb901367951edd4e','1'),('0df038d9138a428ebb901367951edd4e','13'),('0df038d9138a428ebb901367951edd4e','14'),('0df038d9138a428ebb901367951edd4e','15'),('0df038d9138a428ebb901367951edd4e','16'),('0df038d9138a428ebb901367951edd4e','17'),('0df038d9138a428ebb901367951edd4e','18'),('0df038d9138a428ebb901367951edd4e','19'),('0df038d9138a428ebb901367951edd4e','2'),('0df038d9138a428ebb901367951edd4e','20'),('0df038d9138a428ebb901367951edd4e','21'),('0df038d9138a428ebb901367951edd4e','22'),('0df038d9138a428ebb901367951edd4e','27'),('0df038d9138a428ebb901367951edd4e','28'),('0df038d9138a428ebb901367951edd4e','29'),('0df038d9138a428ebb901367951edd4e','3'),('0df038d9138a428ebb901367951edd4e','30'),('0df038d9138a428ebb901367951edd4e','56'),('0df038d9138a428ebb901367951edd4e','57'),('0df038d9138a428ebb901367951edd4e','58'),('0df038d9138a428ebb901367951edd4e','59'),('0df038d9138a428ebb901367951edd4e','62'),('0df038d9138a428ebb901367951edd4e','63'),('0df038d9138a428ebb901367951edd4e','64'),('0df038d9138a428ebb901367951edd4e','65'),('0df038d9138a428ebb901367951edd4e','66'),('0df038d9138a428ebb901367951edd4e','69'),('0df038d9138a428ebb901367951edd4e','7'),('0df038d9138a428ebb901367951edd4e','70'),('0df038d9138a428ebb901367951edd4e','71'),('0df038d9138a428ebb901367951edd4e','72'),('0df038d9138a428ebb901367951edd4e','73'),('0df038d9138a428ebb901367951edd4e','74'),('0df038d9138a428ebb901367951edd4e','8'),('0df038d9138a428ebb901367951edd4e','88'),('0df038d9138a428ebb901367951edd4e','89'),('0df038d9138a428ebb901367951edd4e','9'),('0df038d9138a428ebb901367951edd4e','90'),('1','1'),('1','10'),('1','11'),('1','12'),('1','120e5c17c94642fa9b9eaf818edca2ef'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','1aad42421be64487b3f59617a1414414'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','27'),('1','28'),('1','29'),('1','2e5226b7c087467fba3cb979d0e8428c'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','3efff8556dfd40679ba304b5170ba57e'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','537a1b39122a4bdcac8aa3ab5a2f8cac'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','61537afe08ca4d459433cad959cc68fb'),('1','62'),('1','63'),('1','64'),('1','65'),('1','654eb1eac83b4f4c8540665ee414b733'),('1','66'),('1','67'),('1','68'),('1','69'),('1','6a51ba918617408988c6eba913e9ca51'),('1','7'),('1','70'),('1','71'),('1','7142b3a3946642e181a6a5d1e1e93e1a'),('1','71a296d089bc4cebb3c8f236fec26fde'),('1','72'),('1','7ad9feb4b07d4df6894921817095830a'),('1','7f07d3f9a04e4c858be9ee6a189b5f37'),('1','8'),('1','8c24cbb7270b4c459859e8d2645faa86'),('1','9'),('1','9e129245e0ce4acdb0c5bde2910c270a'),('1','9fcf821aa9dc4792b8b0edbf05356fb4'),('1','bf32921976b34458b0d13a36d3ce7f5d'),('1','d48110ce5b9449a8a0551af39cc58d78'),('1','e1ea756d50734459a96579bb7d09baa2'),('1','f42c05c410624b7884de7d7357886e7a'),('13d47db92fe74c4194fb13a181d9d1d0','1'),('13d47db92fe74c4194fb13a181d9d1d0','1aad42421be64487b3f59617a1414414'),('13d47db92fe74c4194fb13a181d9d1d0','61537afe08ca4d459433cad959cc68fb'),('13d47db92fe74c4194fb13a181d9d1d0','6a51ba918617408988c6eba913e9ca51'),('13d47db92fe74c4194fb13a181d9d1d0','7f07d3f9a04e4c858be9ee6a189b5f37'),('13d47db92fe74c4194fb13a181d9d1d0','9e129245e0ce4acdb0c5bde2910c270a'),('13d47db92fe74c4194fb13a181d9d1d0','bf32921976b34458b0d13a36d3ce7f5d'),('13d47db92fe74c4194fb13a181d9d1d0','ee399f542d0f4d5ab0710e451988a890'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','25'),('2','26'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','71'),('2','72'),('2','8'),('2','9'),('21ac2c5fb3554e44a210b072af968a6b','1'),('21ac2c5fb3554e44a210b072af968a6b','537a1b39122a4bdcac8aa3ab5a2f8cac'),('21ac2c5fb3554e44a210b072af968a6b','7142b3a3946642e181a6a5d1e1e93e1a'),('21ac2c5fb3554e44a210b072af968a6b','7ad9feb4b07d4df6894921817095830a'),('21ac2c5fb3554e44a210b072af968a6b','8c24cbb7270b4c459859e8d2645faa86'),('21ac2c5fb3554e44a210b072af968a6b','f42c05c410624b7884de7d7357886e7a'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','71'),('3','72'),('3','8'),('3','9'),('4','1'),('4','10'),('4','11'),('4','12'),('4','13'),('4','14'),('4','15'),('4','16'),('4','17'),('4','18'),('4','19'),('4','2'),('4','20'),('4','21'),('4','22'),('4','23'),('4','24'),('4','25'),('4','26'),('4','27'),('4','28'),('4','29'),('4','3'),('4','30'),('4','31'),('4','32'),('4','33'),('4','34'),('4','35'),('4','36'),('4','37'),('4','38'),('4','39'),('4','4'),('4','40'),('4','41'),('4','42'),('4','43'),('4','44'),('4','45'),('4','46'),('4','47'),('4','48'),('4','49'),('4','5'),('4','50'),('4','51'),('4','52'),('4','53'),('4','54'),('4','55'),('4','56'),('4','57'),('4','58'),('4','59'),('4','6'),('4','60'),('4','61'),('4','62'),('4','63'),('4','64'),('4','65'),('4','66'),('4','67'),('4','68'),('4','69'),('4','7'),('4','70'),('4','71'),('4','72'),('4','8'),('4','9'),('4ef5f5ec4fc64d0ba60b01ff715740ae','1'),('4ef5f5ec4fc64d0ba60b01ff715740ae','45ff42fb8d024602816b9384813d2ede'),('4ef5f5ec4fc64d0ba60b01ff715740ae','537a1b39122a4bdcac8aa3ab5a2f8cac'),('4ef5f5ec4fc64d0ba60b01ff715740ae','7142b3a3946642e181a6a5d1e1e93e1a'),('4ef5f5ec4fc64d0ba60b01ff715740ae','8c24cbb7270b4c459859e8d2645faa86'),('4ef5f5ec4fc64d0ba60b01ff715740ae','f42c05c410624b7884de7d7357886e7a'),('5','1'),('5','10'),('5','11'),('5','12'),('5','13'),('5','14'),('5','15'),('5','16'),('5','17'),('5','18'),('5','19'),('5','2'),('5','20'),('5','21'),('5','22'),('5','23'),('5','24'),('5','25'),('5','26'),('5','27'),('5','28'),('5','29'),('5','3'),('5','30'),('5','31'),('5','32'),('5','33'),('5','34'),('5','35'),('5','36'),('5','37'),('5','38'),('5','39'),('5','4'),('5','40'),('5','41'),('5','42'),('5','43'),('5','44'),('5','45'),('5','46'),('5','47'),('5','48'),('5','49'),('5','5'),('5','50'),('5','51'),('5','52'),('5','53'),('5','54'),('5','55'),('5','56'),('5','57'),('5','58'),('5','59'),('5','6'),('5','60'),('5','61'),('5','62'),('5','63'),('5','64'),('5','65'),('5','66'),('5','67'),('5','68'),('5','69'),('5','7'),('5','70'),('5','71'),('5','72'),('5','8'),('5','9'),('509e55188a034f67b20761e5db8adbb5','1'),('509e55188a034f67b20761e5db8adbb5','1aad42421be64487b3f59617a1414414'),('509e55188a034f67b20761e5db8adbb5','61537afe08ca4d459433cad959cc68fb'),('509e55188a034f67b20761e5db8adbb5','6a51ba918617408988c6eba913e9ca51'),('509e55188a034f67b20761e5db8adbb5','7f07d3f9a04e4c858be9ee6a189b5f37'),('509e55188a034f67b20761e5db8adbb5','9e129245e0ce4acdb0c5bde2910c270a'),('509e55188a034f67b20761e5db8adbb5','bf32921976b34458b0d13a36d3ce7f5d'),('509e55188a034f67b20761e5db8adbb5','ee399f542d0f4d5ab0710e451988a890'),('5525a6248bd24defa5716e78e90e7527','1'),('5525a6248bd24defa5716e78e90e7527','27'),('5525a6248bd24defa5716e78e90e7527','28'),('5525a6248bd24defa5716e78e90e7527','29'),('5525a6248bd24defa5716e78e90e7527','30'),('5525a6248bd24defa5716e78e90e7527','45ff42fb8d024602816b9384813d2ede'),('5525a6248bd24defa5716e78e90e7527','537a1b39122a4bdcac8aa3ab5a2f8cac'),('5525a6248bd24defa5716e78e90e7527','56'),('5525a6248bd24defa5716e78e90e7527','57'),('5525a6248bd24defa5716e78e90e7527','58'),('5525a6248bd24defa5716e78e90e7527','59'),('5525a6248bd24defa5716e78e90e7527','62073fd9426148a59e9a901d947542b2'),('5525a6248bd24defa5716e78e90e7527','6634019181464aec9c01b27c9b020d8e'),('5525a6248bd24defa5716e78e90e7527','71'),('5525a6248bd24defa5716e78e90e7527','7142b3a3946642e181a6a5d1e1e93e1a'),('5525a6248bd24defa5716e78e90e7527','77373185e4a54fd799fec170f7f395b0'),('5525a6248bd24defa5716e78e90e7527','79a6d9d5ae224a58ad4104f8ddad285a'),('5525a6248bd24defa5716e78e90e7527','8c24cbb7270b4c459859e8d2645faa86'),('5525a6248bd24defa5716e78e90e7527','8ccb8869530747eb97164e635d4e7be0'),('5525a6248bd24defa5716e78e90e7527','92fc77d8ab4d4e18bd4889c57300ab72'),('5525a6248bd24defa5716e78e90e7527','f42c05c410624b7884de7d7357886e7a'),('5d3b32dd0cf743618dcc44f92fa9546c','1'),('5d3b32dd0cf743618dcc44f92fa9546c','10'),('5d3b32dd0cf743618dcc44f92fa9546c','11'),('5d3b32dd0cf743618dcc44f92fa9546c','12'),('5d3b32dd0cf743618dcc44f92fa9546c','13'),('5d3b32dd0cf743618dcc44f92fa9546c','14'),('5d3b32dd0cf743618dcc44f92fa9546c','15'),('5d3b32dd0cf743618dcc44f92fa9546c','16'),('5d3b32dd0cf743618dcc44f92fa9546c','17'),('5d3b32dd0cf743618dcc44f92fa9546c','18'),('5d3b32dd0cf743618dcc44f92fa9546c','19'),('5d3b32dd0cf743618dcc44f92fa9546c','2'),('5d3b32dd0cf743618dcc44f92fa9546c','20'),('5d3b32dd0cf743618dcc44f92fa9546c','21'),('5d3b32dd0cf743618dcc44f92fa9546c','22'),('5d3b32dd0cf743618dcc44f92fa9546c','27'),('5d3b32dd0cf743618dcc44f92fa9546c','28'),('5d3b32dd0cf743618dcc44f92fa9546c','29'),('5d3b32dd0cf743618dcc44f92fa9546c','3'),('5d3b32dd0cf743618dcc44f92fa9546c','30'),('5d3b32dd0cf743618dcc44f92fa9546c','3bdbe6d4a8984606a95759b2fdf24021'),('5d3b32dd0cf743618dcc44f92fa9546c','3c8047e81cd8496f93cf89ffa2915f3f'),('5d3b32dd0cf743618dcc44f92fa9546c','4'),('5d3b32dd0cf743618dcc44f92fa9546c','48e861f2a6e340c0aad4c61ef6597571'),('5d3b32dd0cf743618dcc44f92fa9546c','5'),('5d3b32dd0cf743618dcc44f92fa9546c','6'),('5d3b32dd0cf743618dcc44f92fa9546c','67'),('5d3b32dd0cf743618dcc44f92fa9546c','68'),('5d3b32dd0cf743618dcc44f92fa9546c','7'),('5d3b32dd0cf743618dcc44f92fa9546c','7142b3a3946642e181a6a5d1e1e93e1a'),('5d3b32dd0cf743618dcc44f92fa9546c','7f07d3f9a04e4c858be9ee6a189b5f37'),('5d3b32dd0cf743618dcc44f92fa9546c','8'),('5d3b32dd0cf743618dcc44f92fa9546c','84'),('5d3b32dd0cf743618dcc44f92fa9546c','8c24cbb7270b4c459859e8d2645faa86'),('5d3b32dd0cf743618dcc44f92fa9546c','9'),('5d3b32dd0cf743618dcc44f92fa9546c','9e129245e0ce4acdb0c5bde2910c270a'),('5d3b32dd0cf743618dcc44f92fa9546c','afeaca08c2ce48b0a183e8cda517e95f'),('5d3b32dd0cf743618dcc44f92fa9546c','c0e209a036d346c8b279eeabaf9705ce'),('5d3b32dd0cf743618dcc44f92fa9546c','d11482713aef4693a8c3a4d5297092b4'),('5d3b32dd0cf743618dcc44f92fa9546c','d4d9d8bf547848b6b274452a50005bc4'),('5d3b32dd0cf743618dcc44f92fa9546c','f7b76ff5bfed4be8a6abe4f862e105f3'),('6','1'),('6','10'),('6','11'),('6','13'),('6','14'),('6','15'),('6','16'),('6','17'),('6','18'),('6','19'),('6','2'),('6','20'),('6','21'),('6','22'),('6','23'),('6','27'),('6','28'),('6','29'),('6','3'),('6','30'),('6','31'),('6','32'),('6','33'),('6','34'),('6','35'),('6','36'),('6','37'),('6','38'),('6','39'),('6','3bdbe6d4a8984606a95759b2fdf24021'),('6','4'),('6','40'),('6','41'),('6','42'),('6','43'),('6','44'),('6','45'),('6','46'),('6','47'),('6','48'),('6','49'),('6','5'),('6','50'),('6','51'),('6','52'),('6','53'),('6','54'),('6','55'),('6','56'),('6','57'),('6','58'),('6','59'),('6','6'),('6','60'),('6','61'),('6','62'),('6','63'),('6','64'),('6','65'),('6','66'),('6','67'),('6','68'),('6','69'),('6','7'),('6','70'),('6','71'),('6','72'),('6','8'),('6','9'),('6','d4d9d8bf547848b6b274452a50005bc4'),('64c51ff2129142bfbb18570e19e146cf','0680741fef2643ff9070f93ac64ad318'),('64c51ff2129142bfbb18570e19e146cf','1'),('64c51ff2129142bfbb18570e19e146cf','186552005fef485ab9004164e68460d5'),('64c51ff2129142bfbb18570e19e146cf','23c823cd92004d16a1184a71fb0cf775'),('64c51ff2129142bfbb18570e19e146cf','27'),('64c51ff2129142bfbb18570e19e146cf','28'),('64c51ff2129142bfbb18570e19e146cf','29'),('64c51ff2129142bfbb18570e19e146cf','30'),('64c51ff2129142bfbb18570e19e146cf','537a1b39122a4bdcac8aa3ab5a2f8cac'),('64c51ff2129142bfbb18570e19e146cf','56'),('64c51ff2129142bfbb18570e19e146cf','57'),('64c51ff2129142bfbb18570e19e146cf','58'),('64c51ff2129142bfbb18570e19e146cf','59'),('64c51ff2129142bfbb18570e19e146cf','62073fd9426148a59e9a901d947542b2'),('64c51ff2129142bfbb18570e19e146cf','71'),('64c51ff2129142bfbb18570e19e146cf','7142b3a3946642e181a6a5d1e1e93e1a'),('64c51ff2129142bfbb18570e19e146cf','79a6d9d5ae224a58ad4104f8ddad285a'),('64c51ff2129142bfbb18570e19e146cf','7a784723be7c476e99b0c34c4f85f26f'),('64c51ff2129142bfbb18570e19e146cf','7ca622df322a4acaace7bbb576706a5c'),('64c51ff2129142bfbb18570e19e146cf','8a208fdb0d2e4b0b9e97a7abae357c9c'),('64c51ff2129142bfbb18570e19e146cf','8c24cbb7270b4c459859e8d2645faa86'),('64c51ff2129142bfbb18570e19e146cf','8ccb8869530747eb97164e635d4e7be0'),('64c51ff2129142bfbb18570e19e146cf','92fc77d8ab4d4e18bd4889c57300ab72'),('64c51ff2129142bfbb18570e19e146cf','93b1116630ad40b584bd6c455f526186'),('64c51ff2129142bfbb18570e19e146cf','eb4beaae012247fdb84e840e960a906e'),('64c51ff2129142bfbb18570e19e146cf','f42526191fe440039b2feb260104ab60'),('64c51ff2129142bfbb18570e19e146cf','f42c05c410624b7884de7d7357886e7a'),('66eb91788fd74fedad045a64af70512b','1'),('66eb91788fd74fedad045a64af70512b','1cddfa10d23049c88d3a0bc38608bbfb'),('66eb91788fd74fedad045a64af70512b','62073fd9426148a59e9a901d947542b2'),('66eb91788fd74fedad045a64af70512b','7142b3a3946642e181a6a5d1e1e93e1a'),('66eb91788fd74fedad045a64af70512b','8c24cbb7270b4c459859e8d2645faa86'),('66eb91788fd74fedad045a64af70512b','92fc77d8ab4d4e18bd4889c57300ab72'),('7','1'),('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','2'),('7','20'),('7','21'),('7','22'),('7','23'),('7','27'),('7','28'),('7','29'),('7','3'),('7','30'),('7','31'),('7','32'),('7','33'),('7','34'),('7','35'),('7','36'),('7','37'),('7','38'),('7','39'),('7','3c8047e81cd8496f93cf89ffa2915f3f'),('7','4'),('7','40'),('7','41'),('7','42'),('7','43'),('7','44'),('7','45'),('7','46'),('7','47'),('7','48'),('7','48e861f2a6e340c0aad4c61ef6597571'),('7','49'),('7','5'),('7','50'),('7','51'),('7','52'),('7','53'),('7','54'),('7','55'),('7','56'),('7','57'),('7','58'),('7','59'),('7','6'),('7','60'),('7','61'),('7','62'),('7','63'),('7','64'),('7','65'),('7','66'),('7','67'),('7','68'),('7','69'),('7','7'),('7','70'),('7','71'),('7','72'),('7','7f07d3f9a04e4c858be9ee6a189b5f37'),('7','8'),('7','9'),('7','9e129245e0ce4acdb0c5bde2910c270a'),('7','afeaca08c2ce48b0a183e8cda517e95f'),('7','d11482713aef4693a8c3a4d5297092b4'),('7','f7b76ff5bfed4be8a6abe4f862e105f3'),('76888a683b96489eab3b7258569fa7a0','1'),('76888a683b96489eab3b7258569fa7a0','1cddfa10d23049c88d3a0bc38608bbfb'),('76888a683b96489eab3b7258569fa7a0','537a1b39122a4bdcac8aa3ab5a2f8cac'),('76888a683b96489eab3b7258569fa7a0','62073fd9426148a59e9a901d947542b2'),('76888a683b96489eab3b7258569fa7a0','7142b3a3946642e181a6a5d1e1e93e1a'),('76888a683b96489eab3b7258569fa7a0','79a6d9d5ae224a58ad4104f8ddad285a'),('76888a683b96489eab3b7258569fa7a0','7ad9feb4b07d4df6894921817095830a'),('76888a683b96489eab3b7258569fa7a0','8c24cbb7270b4c459859e8d2645faa86'),('76888a683b96489eab3b7258569fa7a0','8ccb8869530747eb97164e635d4e7be0'),('76888a683b96489eab3b7258569fa7a0','92fc77d8ab4d4e18bd4889c57300ab72'),('76888a683b96489eab3b7258569fa7a0','b519acf461ef41b4a7515d1407248f58'),('76888a683b96489eab3b7258569fa7a0','f42c05c410624b7884de7d7357886e7a'),('93dc5c9814534369b4b3c2d165376fef','1'),('93dc5c9814534369b4b3c2d165376fef','62073fd9426148a59e9a901d947542b2'),('93dc5c9814534369b4b3c2d165376fef','7142b3a3946642e181a6a5d1e1e93e1a'),('93dc5c9814534369b4b3c2d165376fef','77373185e4a54fd799fec170f7f395b0'),('93dc5c9814534369b4b3c2d165376fef','8c24cbb7270b4c459859e8d2645faa86'),('93dc5c9814534369b4b3c2d165376fef','92fc77d8ab4d4e18bd4889c57300ab72'),('cc35e8fe019440b3a64bfba41a89331a','1'),('cc35e8fe019440b3a64bfba41a89331a','1aad42421be64487b3f59617a1414414'),('cc35e8fe019440b3a64bfba41a89331a','61537afe08ca4d459433cad959cc68fb'),('cc35e8fe019440b3a64bfba41a89331a','680224ca70354f68be34c92e483b8743'),('cc35e8fe019440b3a64bfba41a89331a','6a51ba918617408988c6eba913e9ca51'),('cc35e8fe019440b3a64bfba41a89331a','7f07d3f9a04e4c858be9ee6a189b5f37'),('cc35e8fe019440b3a64bfba41a89331a','811bcf4a6d234936a213bdb87539575f'),('cc35e8fe019440b3a64bfba41a89331a','9e129245e0ce4acdb0c5bde2910c270a'),('cc35e8fe019440b3a64bfba41a89331a','bf32921976b34458b0d13a36d3ce7f5d'),('cc35e8fe019440b3a64bfba41a89331a','e1ea756d50734459a96579bb7d09baa2');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_office`
--

DROP TABLE IF EXISTS `sys_role_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `office_id` varchar(64) NOT NULL COMMENT 'æœºæ„ç¼–å·',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-æœºæ„';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_office`
--

LOCK TABLES `sys_role_office` WRITE;
/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;
INSERT INTO `sys_role_office` VALUES ('0df038d9138a428ebb901367951edd4e','1'),('0df038d9138a428ebb901367951edd4e','10'),('0df038d9138a428ebb901367951edd4e','11'),('0df038d9138a428ebb901367951edd4e','12'),('0df038d9138a428ebb901367951edd4e','13'),('0df038d9138a428ebb901367951edd4e','14'),('0df038d9138a428ebb901367951edd4e','15'),('0df038d9138a428ebb901367951edd4e','16'),('0df038d9138a428ebb901367951edd4e','17'),('0df038d9138a428ebb901367951edd4e','18'),('0df038d9138a428ebb901367951edd4e','19'),('0df038d9138a428ebb901367951edd4e','2'),('0df038d9138a428ebb901367951edd4e','20'),('0df038d9138a428ebb901367951edd4e','21'),('0df038d9138a428ebb901367951edd4e','22'),('0df038d9138a428ebb901367951edd4e','23'),('0df038d9138a428ebb901367951edd4e','24'),('0df038d9138a428ebb901367951edd4e','25'),('0df038d9138a428ebb901367951edd4e','26'),('0df038d9138a428ebb901367951edd4e','3'),('0df038d9138a428ebb901367951edd4e','4'),('0df038d9138a428ebb901367951edd4e','5'),('0df038d9138a428ebb901367951edd4e','575368567d6f4b158effc01991e2a52c'),('0df038d9138a428ebb901367951edd4e','6'),('0df038d9138a428ebb901367951edd4e','7'),('0df038d9138a428ebb901367951edd4e','8'),('0df038d9138a428ebb901367951edd4e','9'),('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');
/*!40000 ALTER TABLE `sys_role_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `name` varchar(100) NOT NULL,
  `value` bigint(20) DEFAULT NULL,
  `init` bigint(20) DEFAULT NULL,
  `step` bigint(20) DEFAULT NULL,
  `max` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åºåˆ—';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
INSERT INTO `sys_sequence` VALUES ('ACTIVITI',137,0,0,0),('Area',100,0,100,100),('Comment',1100,0,1000,1000),('Dict',7400,0,1000,1000),('LabBorrowRequest',1900,0,100,100),('LabBorrowRequestAndBaseinfo',1000,0,100,100),('LabEquipmentBaseinfo',7800,0,1000,1000),('LabEquipmentBaseinfoService',1300,0,1000,1000),('LabFileAttributes',3800,0,1000,1000),('LabFileBorrow',2900,0,1000,1000),('LabFileBorrowRelationship',700,0,100,100),('LabRepairRequest',1800,0,100,100),('LabRepairRequestAndBaseinfo',900,0,100,100),('LabScrapApply',800,0,100,100),('LabScrapApplyAndBaseinfo',500,0,100,100),('Log',4300,0,0,0),('OaNotify',100,0,100,100),('Office',4200,0,1000,1000),('SysDictType',128200,0,1000,1000),('TestData',2100,0,0,0);
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `company_id` varchar(64) NOT NULL COMMENT 'å½’å±å…¬å¸',
  `office_id` varchar(64) NOT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `login_name` varchar(100) NOT NULL COMMENT 'ç™»å½•å',
  `password` varchar(100) NOT NULL COMMENT 'å¯†ç ',
  `no` varchar(100) DEFAULT NULL COMMENT 'å·¥å·',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `mobile` varchar(200) DEFAULT NULL COMMENT 'æ‰‹æœº',
  `user_type` char(1) DEFAULT NULL COMMENT 'ç”¨æˆ·ç±»å‹',
  `photo` varchar(1000) DEFAULT NULL COMMENT 'ç”¨æˆ·å¤´åƒ',
  `login_ip` varchar(100) DEFAULT NULL COMMENT 'æœ€åç™»é™†IP',
  `login_date` datetime DEFAULT NULL COMMENT 'æœ€åç™»é™†æ—¶é—´',
  `login_flag` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç™»å½•',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('054437e904b74cbc97696b2e25e5f88b','12','5','444','ac4b30abbed9a0e0e7ffefddeb25421cb18479db3ca72e17b87d91ce','444','44','','','','1','',NULL,NULL,'1','1','2015-05-15 18:44:34','1','2015-05-15 18:44:34','5','0'),('1','1','2','sa','5d90eb504445095bec7f6b93953a9d46820748aabe8305993e6267e0','0001','ç³»ç»Ÿç®¡ç†å‘˜','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:15:24','1','1','2013-05-27 08:00:00','1','2015-06-30 13:44:55','æœ€é«˜ç®¡ç†å‘˜','0'),('2','1','2','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0002','ç®¡ç†å‘˜','','','','','','10.46.2.94','2015-06-30 13:55:23','1','1','2013-05-27 08:00:00','1','2015-06-30 13:44:15','','0'),('20cd386ab2e24c099510a610e039b195','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','gaojie','d869b855cc83b194f8dc9474f6356fe09564b8b5e1ec4a1de1fd19ba','7003','ä»ªå™¨é™çº§/æŠ¥åºŸäºº','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:16:42','1','1','2015-07-01 15:11:05','1','2015-07-01 15:11:05','','0'),('2328396b33ee435bae5a4b3bfaddf54f','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','zhangli','49a308921ad43dcb71ad4af0e8cb7dd2bba366e9270b7fc9e5dae775','7001','ä»ªå™¨ç»´ä¿®äºº','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:14:20','1','1','2015-07-01 15:09:57','1','2015-07-01 15:09:57','','0'),('2b6898829355496a8b7fd88d48586be6','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','zhangsan','19533eaa4c0418671adb205accf9cc74d6840688150132bfface5063','112','å¼ ä¸‰','','','','3','','0:0:0:0:0:0:0:1','2015-06-30 15:50:04','1','1','2015-06-08 13:23:37','1','2015-06-08 13:25:08','','0'),('3','1','3','sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','ç»¼åˆéƒ¨',NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','2015-04-25 15:03:21','1','1','2013-05-27 08:00:00','1','2015-04-25 13:22:49',NULL,'0'),('35f45ac7089e4fafa0bbd3d4ef704dff','1','2','chenghua','5336ea88cb3072ddfd529a40c66266c39064719c2d4899d7126aa5d1','7004','ä»ªå™¨é™çº§/æŠ¥åºŸå®¡æ‰¹äºº','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:17:09','1','1','2015-07-01 15:11:29','1','2015-07-01 15:11:29','','0'),('3fd2e4b370ec45fd9347d023baaac558','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','lixiang','ee2f64f58fda49d788fcae68554be82497c6e432ed0edb3d520ea6fa','111','ææ¹˜','','','','3','','0:0:0:0:0:0:0:1','2015-06-30 15:57:47','1','1','2015-06-08 13:15:32','1','2015-06-30 11:04:59','','0'),('4','1','4','sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','å¸‚åœºéƒ¨','','','1','','',NULL,NULL,'1','1','2013-05-27 08:00:00','1','2015-05-18 17:25:05','','0'),('5','1','5','sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','æŠ€æœ¯éƒ¨',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('586d46b5fe564111bef8610bc9f5472b','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','zhaowei','75eaf969f886bb03146a0e577f7dc14eea9a7bcab03ce77ffc8dcf45','7002','ä»ªå™¨ç»´ä¿®å®¡æ‰¹äºº','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:14:52','1','1','2015-07-01 15:10:32','1','2015-07-01 15:10:32','','0'),('59cf2d9ee33b4e4f9f133d3deb9570fa','1','2','mawu','7ca0c50f60efaf12bd01aed339e74187adbd3d4e0426d93f20ec8acd','115','é©¬äº”','','','','3','','0:0:0:0:0:0:0:1','2015-06-30 15:57:14','1','1','2015-06-08 13:24:58','1','2015-06-08 13:24:58','','0'),('6','1','6','sd_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','ç ”å‘éƒ¨',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60e4211791c84d4db1c3d8f6eaf59de4','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','demo','8fa77e6a6e7489b1767db018741ca513277f35e4844dae48878ef506','1','ç³»ç»Ÿç®¡ç†å‘˜','','','','3','','10.21.22.1','2015-05-22 16:55:11','1','1','2015-05-21 17:07:06','1','2015-05-22 09:05:52','','0'),('9bba3deb05ec40a5989e64588ba91cc0','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','lisi','ae0924d908efce2aab64063102b34050d1c9ed052c5adf9c2571f05e','113','æå››','','','','3','','0:0:0:0:0:0:0:1','2015-06-30 15:49:32','1','1','2015-06-08 13:24:11','1','2015-06-08 13:25:20','','0'),('aac8925a0f6c4a2cbb874fe890c5839a','1','25412c1ef4c047868860b9859b36ae46','lijian','a44785321a7b0c08e091e224178205a16f3ded17a35d931716a73ffb','0506001','ä»ªå™¨ç®¡ç†å‘˜','','','','3','','0:0:0:0:0:0:0:1','2015-07-01 15:17:22','1','1','2015-06-04 14:09:00','1','2015-06-30 15:31:49','','0'),('b84c2f90d7ee4697883198aac8e90df8','1','25412c1ef4c047868860b9859b36ae46','huaqiang','b52e9da1665cc36b8eac8896f4668410a0abb3a3f550cec032b5a54b','0506002','ä»ªå™¨å€Ÿç”¨ç”³è¯·å®¡æ‰¹äºº','','','','3','','10.46.2.94','2015-06-30 15:33:56','1','1','2015-06-04 14:10:00','1','2015-06-30 15:33:24','','0'),('d3c1f3ea6d0f404fb4eef1c13260f553','22','24','ljhai','35634e311bf6a32e0c4348b64c31d6755949b60c5030838387ee7bbf','å˜å˜å˜','æä¹…æµ·','','','','','',NULL,NULL,'1','b69d0c605aee4526a0039f8d999361b3','2015-04-23 14:39:17','b69d0c605aee4526a0039f8d999361b3','2015-04-23 14:39:17','','0'),('d42b66c65cf149dba833e0839d6400b4','1','25412c1ef4c047868860b9859b36ae46','wangfeng','98227617eae1a0ddb9abc3a325d707fae5b0cb79e720962755cd41ae','0506003','ä»ªå™¨å€Ÿç”¨äºº','','','','3','','0:0:0:0:0:0:0:1','2015-07-01 15:15:09','1','1','2015-06-04 15:48:51','1','2015-06-30 15:32:47','','0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT 'ç”¨æˆ·ç¼–å·',
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·-è§’è‰²';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('054437e904b74cbc97696b2e25e5f88b','0df038d9138a428ebb901367951edd4e'),('1','1'),('1','2'),('10','2'),('10402383c5da43db970ff64fdd1d2376','0df038d9138a428ebb901367951edd4e'),('11','3'),('12','4'),('13','5'),('14','6'),('2','1'),('20cd386ab2e24c099510a610e039b195','66eb91788fd74fedad045a64af70512b'),('2328396b33ee435bae5a4b3bfaddf54f','21ac2c5fb3554e44a210b072af968a6b'),('2b6898829355496a8b7fd88d48586be6','13d47db92fe74c4194fb13a181d9d1d0'),('3','2'),('3','5d3b32dd0cf743618dcc44f92fa9546c'),('35f45ac7089e4fafa0bbd3d4ef704dff','93dc5c9814534369b4b3c2d165376fef'),('3fd2e4b370ec45fd9347d023baaac558','cc35e8fe019440b3a64bfba41a89331a'),('4','3'),('5','4'),('586d46b5fe564111bef8610bc9f5472b','4ef5f5ec4fc64d0ba60b01ff715740ae'),('59cf2d9ee33b4e4f9f133d3deb9570fa','509e55188a034f67b20761e5db8adbb5'),('6','5'),('60e4211791c84d4db1c3d8f6eaf59de4','5d3b32dd0cf743618dcc44f92fa9546c'),('7','2'),('7','7'),('73ab8671a4fb404589ecc42115568e4c','0df038d9138a428ebb901367951edd4e'),('8','6'),('9','1'),('9bba3deb05ec40a5989e64588ba91cc0','13d47db92fe74c4194fb13a181d9d1d0'),('aac8925a0f6c4a2cbb874fe890c5839a','64c51ff2129142bfbb18570e19e146cf'),('b69d0c605aee4526a0039f8d999361b3','0df038d9138a428ebb901367951edd4e'),('b84c2f90d7ee4697883198aac8e90df8','5525a6248bd24defa5716e78e90e7527'),('d3c1f3ea6d0f404fb4eef1c13260f553','0df038d9138a428ebb901367951edd4e'),('d42b66c65cf149dba833e0839d6400b4','76888a683b96489eab3b7258569fa7a0'),('ffc8d3736566453aa1a6284cb3c36f6e','0df038d9138a428ebb901367951edd4e');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±ç”¨æˆ·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `area_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `sex` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `in_date` date DEFAULT NULL COMMENT 'åŠ å…¥æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data`
--

LOCK TABLES `test_data` WRITE;
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data_child`
--

DROP TABLE IF EXISTS `test_data_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT 'ä¸šåŠ¡ä¸»è¡¨ID',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®å­è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data_child`
--

LOCK TABLES `test_data_child` WRITE;
/*!40000 ALTER TABLE `test_data_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data_main`
--

DROP TABLE IF EXISTS `test_data_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±ç”¨æˆ·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `area_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `sex` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `in_date` date DEFAULT NULL COMMENT 'åŠ å…¥æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data_main`
--

LOCK TABLES `test_data_main` WRITE;
/*!40000 ALTER TABLE `test_data_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ‘ç»“æ„è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tree`
--

LOCK TABLES `test_tree` WRITE;
/*!40000 ALTER TABLE `test_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_tree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-01 15:20:16
