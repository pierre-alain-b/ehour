--
-- Modification for table `AUDIT`
--

alter table AUDIT rename AUDITLOG;

--
-- Modification for table `TIMESHEET_ENTRY`
--
DROP TABLE IF EXISTS `TIMESHEET_ENTRY`;
CREATE TABLE `TIMESHEET_ENTRY` (
  `ACTIVITY_ID` int(11) NOT NULL,
  `ENTRY_DATE` date NOT NULL,
  `UPDATE_DATE` TIMESTAMP,  
  `HOURS` float(9,3),
  `COMMENT` varchar(2048),
  PRIMARY KEY  (`ENTRY_DATE`,`ACTIVITY_ID`),
  KEY `ACTIVITY_ID` (`ACTIVITY_ID`),
  CONSTRAINT `TIMESHEET_ENTRY_fk` FOREIGN KEY (`ACTIVITY_ID`) REFERENCES `ACTIVITIES` (`ACTIVITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `ACTIVITIES`
--
DROP TABLE IF EXISTS `ACTIVITIES`;
CREATE TABLE `ACTIVITIES` (
  `ACTIVITY_ID` int(11) NOT NULL auto_increment,
  `CODE` varchar(128) default NULL,
  `NAME` varchar(255) NOT NULL,
  `DATE_START` date default NULL,
  `DATE_END` date default NULL,
  `ALLOTTED_HOURS` float(9,3) NOT NULL,
  `ACTIVE` char(1) character set latin1 NOT NULL default 'Y',
  `PROJECT_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY  (`ACTIVITY_ID`),
  UNIQUE KEY `ACTIVITY_ID` (`ACTIVITY_ID`),
  CONSTRAINT `ACTIVITY_fk1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `PROJECT` (`PROJECT_ID`),
  CONSTRAINT `ACTIVITY_fk2` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`)    
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `CUSTOMER_REVIEWERS`
--
DROP TABLE IF EXISTS `CUSTOMER_REVIEWERS`;
CREATE TABLE `CUSTOMER_REVIEWERS` (
  `USER_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`,`CUSTOMER_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  CONSTRAINT `CUSTOMER_REVIEWERS_fk1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`),
  CONSTRAINT `CUSTOMER_REVIEWERS_fk2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Structure for table `CUSTOMER_REPORTERS`
--
DROP TABLE IF EXISTS `CUSTOMER_REPORTERS`;
CREATE TABLE `CUSTOMER_REPORTERS` (
  `USER_ID` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`,`CUSTOMER_ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  CONSTRAINT `CUSTOMER_REPORTERS_fk1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`USER_ID`),
  CONSTRAINT `CUSTOMER_REPORTERS_fk2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `CUSTOMER` (`CUSTOMER_ID`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Addition of new information for `USER_ROLE`
--

INSERT INTO `USER_ROLE` VALUES ('ROLE_CUSTOMERREVIEWER','Customer Reviewer');
INSERT INTO `USER_ROLE` VALUES ('ROLE_CUSTOMERREPORTER','Customer Reporter');