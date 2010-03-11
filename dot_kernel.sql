-- phpMyAdmin SQL Dump
-- version 3.3.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 11, 2010 at 07:29 AM
-- Server version: 5.0.77
-- PHP Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `dot_kernel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` 
(
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(64) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `dateCreated` DATETIME NOT NULL,
  `isActive` ENUM('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY  (`id`)
) 
  ENGINE=MyISAM  
  DEFAULT CHARSET=latin1 
  AUTO_INCREMENT=1 ;
-- --------------------------------------------------------

--
-- Table structure for table `emailTransporter`
--

CREATE TABLE IF NOT EXISTS `emailTransporter` 
(
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(100) NOT NULL,
  `pass` VARCHAR(100) NOT NULL,
  `server` VARCHAR(100) NOT NULL DEFAULT 'smtp.gmail.com',
  `capacity` INT(11) NOT NULL DEFAULT '2000',
  `date` DATE NOT NULL DEFAULT '0000-00-00',
  `counter` INT(11) NOT NULL DEFAULT '0',
  `isActive` ENUM('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY  (`id`)
) 
  ENGINE=MyISAM  
  DEFAULT CHARSET=utf8 
  AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` 
(
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` VARCHAR(255) NOT NULL,
  `value` TEXT NOT NULL,
  `title` TEXT NOT NULL,
  `comment` TEXT NOT NULL,
  `isEditable` ENUM('1','0') NOT NULL DEFAULT '0',
  `type` ENUM('radio','option','textarea') NOT NULL DEFAULT 'textarea',
  `possibleValues` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) 
  ENGINE=MyISAM  
  DEFAULT CHARSET=latin1
  AUTO_INCREMENT=1 ;

--
-- Dumping data for table `setting`
--


INSERT INTO `setting` (`id`, `key`, `value`, `title`, `comment`, `isEditable`, `type`, `possibleValues`) VALUES
(1, 'meta_keywords', 'DotKernel, DotKernel, php, Zend Framework, ', 'Default Meta Keywords.', 'The default meta keywords.', '1', 'textarea', ''),
(2, 'meta_description', 'Enterprise Level PHP Solutions, based on Zend Framework and DotKernel , build by DotBoost Technologies Inc.', '', '', '0', 'textarea', ''),
(3, 'search_engine_bots', 'googlebot=Google.com\r\nYahoo!=Yahoo Bot\r\njeeves=Ask Jeeves Teoma\r\ninfoseek=Infoseek\r\nia_archiver=Archive.org\r\nmsnbot=MSN\r\nFAST=Alltheweb\r\ncrawler@alexa.com=Alexa\r\nYahooSeeker=Yahoo Shopping\r\ncurl=CURL\r\nwget=WGET', '', 'Not Used = Use this section to list which search engine user-agents you''d like to be treated as a search engine visit along with a ''human'' name for the online list in a bot=Human Name format.(one per line)', '0', 'textarea', ''),
(4, 'page_title', 'DotKernel Framework', 'The Site Title.', 'The Site Title', '1', 'textarea', ''),
(5, 'url_rewrite_mode', '0', 'Url Rewrite Mode.', 'The State of the rewrite mode', '1', 'radio', '1;0'),
(6, 'contact_recipient', 'contact@dotkernel.com', 'Contact us email.', 'The email address that recieves all contact emails from the site.', '0', 'textarea', ''),
(7, 'admin_link_name_to_site', 'DotKernel', '', '', '0', 'textarea', ''),
(8, 'admin_link_to_site', 'http://localhost/DotKernel/', '', '', '0', 'textarea', ''),
(9, 'admin_email', 'admin@dotkernel.com', 'Admin Email.', 'The "From" field of an email sent by the script.', '1', 'textarea', ''),
(10, 'site_name', 'DotKernel', '', 'Used in admin panel.', '0', 'textarea', ''),
(11, 'company_link', 'http://localhost/DotKernel/', '', '', '0', 'textarea', ''),
(12, 'license_url', 'http://www.dotkernel.com/', '', '', '0', 'textarea', ''),
(13, 'license_name', 'DotKernel', '', '', '0', 'textarea', ''),
(14, 'server_time', '0', '', '', '0', 'textarea', ''),
(15, 'time_format', '%d %b %Y', 'General Date Format.', '%d - day of the month as a decimal number (range 01 to 31) %b - abbreviated month name according to the current locale %B - full month name according to the current locale %m - month as a decimal number (range 01 to 12) %y - year as a decimal number without a century (range 00 to 99) %Y - year as a decimal number including the century', '1', 'option', '%d %b %Y;%d %B %Y;%d %B %y;%d %m %Y;%d %m %y;%B %d, %Y;%b %d, %Y'),
(16, 'time_format_short', '%d %b %Y', '', '', '0', 'textarea', ''),
(17, 'time_format_long', '%b %d, %Y, %H:%M', 'Long Time Format.', 'General time format.', '1', 'option', '%d %b %Y, %H:%M;%d %B %Y, %H:%M;%d %B %y, %H:%M;%d %m %Y, %H:%M;%d %m %y, %H:%M;%B %d, %Y, %H:%M;%b %d, %Y, %H:%M'),
(18, 'security_image_code_length', '4', 'Security image code lenght', 'The number o characters in the security code.', '1', 'option', '3;4;5;6;7;8;9;10'),
(19, 'smtp_addresses', 'aol.com;aim.com;comcast.net;hotmail.com;earthlink.net;juno.com;juno.net;bellsouth.net;cox.net;roadrunner.com;sbcglobal.net', '', '', '0', 'textarea', ''),
(20, 'smtp_use', '0', '', 'Send email through SMTP', '1', 'radio', '1;0'),
(21, 'dev_emails', 'team@dotkernel.com', '', '', '0', 'textarea', ''),
(22, 'results_per_page', '10', '', 'How many records will be on every page', '1', 'option', '10;20;30;40;50'),
(23, 'recaptcha_public_key', '123XXX', 'Recaptcha Public Key.', 'Use this in the JavaScript code that is served to your users. http://recaptcha.net/', '1', 'textarea', ''),
(24, 'recaptcha_private_key', '123XXX', 'Recaptcha Private Key.', 'Use this when communicating between your server and our server. Because this key is a global key, it is OK if the private key is distributed to multiple users. http://recaptcha.net/', '1', 'textarea', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `firstName` VARCHAR(255) NOT NULL,
  `lastName` VARCHAR(255) NOT NULL,
  `dateCreated` DATETIME NOT NULL,
  `isActive` ENUM('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
)
 ENGINE=MyISAM
 DEFAULT CHARSET=latin1 
 AUTO_INCREMENT=1;
