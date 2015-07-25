-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 09, 2015 at 03:02 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yiicore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_audit_trail`
--

CREATE TABLE IF NOT EXISTS `tbl_audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` varchar(500) NOT NULL,
  `new_value` varchar(500) NOT NULL,
  `action` varchar(100) NOT NULL,
  `model` varchar(250) NOT NULL,
  `field` varchar(100) NOT NULL,
  `stamp` datetime NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_audit_trail_old_value` (`old_value`),
  KEY `idx_audit_trail_new_value` (`new_value`),
  KEY `idx_audit_trail_action` (`action`),
  KEY `idx_audit_trail_user_id` (`user_id`),
  KEY `idx_audit_trail_model_id` (`model_id`),
  KEY `idx_audit_trail_model` (`model`),
  KEY `idx_audit_trail_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_actions`
--

CREATE TABLE IF NOT EXISTS `yiicore_actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action_name` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `controller_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=223 ;

--
-- Dumping data for table `yiicore_actions`
--

INSERT INTO `yiicore_actions` (`id`, `action_name`, `controller_id`) VALUES
(1, 'view', 77),
(2, 'create', 77),
(3, 'update', 77),
(4, 'delete', 77),
(5, 'index', 77),
(6, 'error', 78),
(7, 'view', 78),
(8, 'view', 79),
(9, 'create', 79),
(10, 'update', 79),
(11, 'delete', 79),
(12, 'index', 79),
(13, 'view', 80),
(14, 'create', 80),
(15, 'update', 80),
(16, 'delete', 80),
(17, 'index', 80),
(18, 'index', 81),
(19, 'listproblem', 81),
(20, 'listspecialty', 81),
(21, 'index', 82),
(22, 'unsubscribe', 82),
(23, 'error', 82),
(24, 'contact', 82),
(25, 'thankyou', 82),
(26, 'guestsubscriber', 82),
(27, 'underconstruction', 82),
(28, 'test', 82),
(29, 'view', 83),
(30, 'create', 83),
(31, 'update', 83),
(32, 'delete', 83),
(33, 'index', 83),
(34, 'admin', 83),
(35, 'ajaxactivate', 83),
(36, 'ajaxdeactivate', 83),
(37, 'ajaxshow', 83),
(38, 'ajaxnotshow', 83),
(39, 'ajaxapprove', 83),
(40, 'view', 84),
(41, 'create', 84),
(42, 'update', 84),
(43, 'delete', 84),
(44, 'index', 84),
(45, 'ajaxactivate', 84),
(46, 'ajaxdeactivate', 84),
(47, 'ajaxshow', 84),
(48, 'ajaxnotshow', 84),
(49, 'ajaxapprove', 84),
(50, 'view', 85),
(51, 'create', 85),
(52, 'update', 85),
(53, 'delete', 85),
(54, 'index', 85),
(55, 'ajaxactivate', 85),
(56, 'ajaxdeactivate', 85),
(57, 'ajaxshow', 85),
(58, 'ajaxnotshow', 85),
(59, 'ajaxapprove', 85),
(60, 'view', 86),
(61, 'create', 86),
(62, 'update', 86),
(63, 'delete', 86),
(64, 'index', 86),
(65, 'uploadfile', 86),
(66, 'ajaxactivate', 86),
(67, 'ajaxdeactivate', 86),
(68, 'ajaxshow', 86),
(69, 'ajaxnotshow', 86),
(70, 'ajaxapprove', 86),
(71, 'view', 87),
(72, 'create', 87),
(73, 'update', 87),
(74, 'delete', 87),
(75, 'index', 87),
(76, 'ajaxactivate', 87),
(77, 'ajaxdeactivate', 87),
(78, 'ajaxshow', 87),
(79, 'ajaxnotshow', 87),
(80, 'ajaxapprove', 87),
(81, 'view', 88),
(82, 'create', 88),
(83, 'update', 88),
(84, 'delete', 88),
(85, 'index', 88),
(86, 'admin', 88),
(87, 'ajaxactivate', 88),
(88, 'ajaxdeactivate', 88),
(89, 'ajaxshow', 88),
(90, 'ajaxnotshow', 88),
(91, 'ajaxapprove', 88),
(92, 'getactionsname', 89),
(93, 'test', 89),
(94, 'index', 89),
(95, 'view', 90),
(96, 'create', 90),
(97, 'update', 90),
(98, 'delete', 90),
(99, 'index', 90),
(100, 'update_my_profile', 90),
(101, 'change_my_password', 90),
(102, 'ajaxactivate', 90),
(103, 'ajaxdeactivate', 90),
(104, 'ajaxshow', 90),
(105, 'ajaxnotshow', 90),
(106, 'ajaxapprove', 90),
(107, 'view', 91),
(108, 'help', 91),
(109, 'update', 91),
(110, 'addcustomphoto', 91),
(111, 'choosemodel', 91),
(112, 'delete', 91),
(113, 'index', 91),
(114, 'handlecropzoom', 91),
(115, 'ajaxactivate', 91),
(116, 'ajaxdeactivate', 91),
(117, 'ajaxshow', 91),
(118, 'ajaxnotshow', 91),
(119, 'ajaxapprove', 91),
(120, 'exportexcel', 92),
(121, 'view', 92),
(122, 'create', 92),
(123, 'update', 92),
(124, 'delete', 92),
(125, 'index', 92),
(126, 'ajaxactivate', 92),
(127, 'ajaxdeactivate', 92),
(128, 'ajaxshow', 92),
(129, 'ajaxnotshow', 92),
(130, 'ajaxapprove', 92),
(131, 'view', 93),
(132, 'create', 93),
(133, 'update', 93),
(134, 'delete', 93),
(135, 'index', 93),
(136, 'ajaxactivate', 93),
(137, 'ajaxdeactivate', 93),
(138, 'ajaxshow', 93),
(139, 'ajaxnotshow', 93),
(140, 'ajaxapprove', 93),
(141, 'create', 94),
(142, 'view', 94),
(143, 'update', 94),
(144, 'delete', 94),
(145, 'index', 94),
(146, 'ajaxactivate', 94),
(147, 'ajaxdeactivate', 94),
(148, 'ajaxshow', 94),
(149, 'ajaxnotshow', 94),
(150, 'ajaxapprove', 94),
(151, 'view', 95),
(152, 'create', 95),
(153, 'update', 95),
(154, 'delete', 95),
(155, 'index', 95),
(156, 'ajaxactivate', 95),
(157, 'ajaxdeactivate', 95),
(158, 'ajaxshow', 95),
(159, 'ajaxnotshow', 95),
(160, 'ajaxapprove', 95),
(161, 'view', 96),
(162, 'create', 96),
(163, 'update', 96),
(164, 'delete', 96),
(165, 'index', 96),
(166, 'ajaxactivate', 96),
(167, 'ajaxdeactivate', 96),
(168, 'ajaxshow', 96),
(169, 'ajaxnotshow', 96),
(170, 'ajaxapprove', 96),
(171, 'view', 97),
(172, 'create', 97),
(173, 'addroles', 97),
(174, 'update', 97),
(175, 'viewroles', 97),
(176, 'delete', 97),
(177, 'index', 97),
(178, 'admin', 97),
(179, 'ajaxactivate', 97),
(180, 'ajaxdeactivate', 97),
(181, 'ajaxshow', 97),
(182, 'ajaxnotshow', 97),
(183, 'ajaxapprove', 97),
(184, 'update', 98),
(185, 'index', 98),
(186, 'ajaxactivate', 98),
(187, 'ajaxdeactivate', 98),
(188, 'ajaxshow', 98),
(189, 'ajaxnotshow', 98),
(190, 'ajaxapprove', 98),
(191, 'forgotpassword', 99),
(192, 'resetpassword', 99),
(193, 'changepassword', 99),
(194, 'error', 99),
(195, 'index', 99),
(196, 'login', 99),
(197, 'logout', 99),
(198, 'ajaxactivate', 99),
(199, 'ajaxdeactivate', 99),
(200, 'ajaxshow', 99),
(201, 'ajaxnotshow', 99),
(202, 'ajaxapprove', 99),
(203, 'view', 100),
(204, 'create', 100),
(205, 'update', 100),
(206, 'delete', 100),
(207, 'index', 100),
(208, 'ajaxactivate', 100),
(209, 'ajaxdeactivate', 100),
(210, 'ajaxshow', 100),
(211, 'ajaxnotshow', 100),
(212, 'ajaxapprove', 100),
(213, 'view', 101),
(214, 'create', 101),
(215, 'update', 101),
(216, 'delete', 101),
(217, 'index', 101),
(218, 'ajaxactivate', 101),
(219, 'ajaxdeactivate', 101),
(220, 'ajaxshow', 101),
(221, 'ajaxnotshow', 101),
(222, 'ajaxapprove', 101);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_actions_roles`
--

CREATE TABLE IF NOT EXISTS `yiicore_actions_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) unsigned DEFAULT NULL,
  `controller_id` int(11) unsigned DEFAULT NULL,
  `actions` text CHARACTER SET utf8 COMMENT 'Anh Dung change to text',
  `can_access` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `can_access` (`can_access`),
  KEY `controller_id` (`controller_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=227 ;

--
-- Dumping data for table `yiicore_actions_roles`
--

INSERT INTO `yiicore_actions_roles` (`id`, `roles_id`, `controller_id`, `actions`, `can_access`) VALUES
(50, 2, 106, 'View, Create, Update, Delete, List, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(51, 2, 107, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(52, 2, 108, 'View, Create, Update, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(53, 2, 109, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(54, 2, 110, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(55, 2, 111, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(56, 2, 112, 'View, Create, Update, Delete, Index, UploadFile, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(57, 2, 113, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(58, 2, 114, 'View, Edit, Create, Update, Delete, Index, Group, User, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove,GetControllerList, GetAvailableAction', 'allow'),
(59, 2, 115, 'View, Create, Update, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(60, 2, 116, 'GetActionsName, RolesSession, Test, Index', 'allow'),
(61, 2, 117, 'View, Create, Update, Delete, Index, Update_my_profile, Change_my_password, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, DeleteAll', 'allow'),
(62, 2, 118, 'View, Help, Update, AddCustomPhoto, ChooseModel, Delete, Index, HandleCropZoom, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(63, 2, 119, 'Create,Delete,Index,Update,View,DeleteAll,UpdateStatusAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(64, 2, 120, 'View,Create,Getcheckbox,Update,Delete,Index,GetControllerList,GetActionList,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(65, 2, 121, 'Create, View, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(66, 2, 122, 'View, Create, Imagepaging, Imageurl, Imageupload, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, DeleteAll, RemoveImage', 'allow'),
(67, 2, 123, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(68, 2, 124, 'View, Create, Update, Delete, Index, AddCategory, GetDropdownCategory, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(69, 2, 125, 'ExportExcel, View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(70, 2, 126, 'View, Create, AddRoles, Update, ViewRoles, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(71, 2, 127, 'Update, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(72, 2, 128, 'ForgotPassword, ResetPassword, ChangePassword, Error, Index, Login, Logout, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(73, 2, 129, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(74, 2, 130, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(75, 2, 131, 'Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(76, 2, 132, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(77, 2, 133, 'Error, View', 'allow'),
(78, 2, 134, 'Index, ListProblem, ListSpecialty', 'allow'),
(79, 2, 135, 'Index, Unsubscribe, Error, Contact, ThankYou, GuestSubscriber, UnderConstruction, Test', 'allow'),
(81, 1, 106, 'View, Create, Update, Delete, List, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(82, 1, 107, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(83, 1, 108, 'View, Create, Update, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(84, 1, 109, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(85, 1, 110, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(86, 1, 111, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(87, 1, 112, 'View, Create, Update, Delete, Index, UploadFile, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(88, 1, 113, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(89, 1, 114, 'View, Edit, Create, Update, Delete, Index, Group, User, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, GetControllerList,GetAvailableAction', 'allow'),
(90, 1, 115, 'View, Create, Update, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(91, 1, 116, 'GetActionsName, RolesSession, Test, Index', 'allow'),
(92, 1, 117, 'View, Create, Update, Delete, Index, Update_my_profile, Change_my_password, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(93, 1, 118, 'View, Help, Update, AddCustomPhoto, ChooseModel, Delete, Index, HandleCropZoom, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(94, 1, 119, 'Create,Delete,Index,Update,View,DeleteAll,UpdateStatusAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(95, 1, 120, 'View,Create,Getcheckbox,Update,Delete,Index,GetControllerList,GetActionList,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(96, 1, 121, 'Create, View, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(97, 1, 122, 'View, Create, Imagepaging, Imageurl, Imageupload, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, DeleteAll, RemoveImage', 'allow'),
(98, 1, 123, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(99, 1, 124, 'View, Create, Update, Delete, Index, AddCategory, GetDropdownCategory, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(100, 1, 125, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(101, 1, 126, 'View, Create, AddRoles, Update, ViewRoles, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(102, 1, 127, 'Update, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, SendTestMail', 'allow'),
(103, 1, 128, 'ForgotPassword, ResetPassword, ChangePassword, Error, Index, Login, Logout, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(104, 1, 129, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(105, 1, 130, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(106, 1, 131, 'Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(107, 1, 132, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(108, 1, 133, 'Error, View', 'allow'),
(109, 1, 134, 'Index, ListProblem, ListSpecialty', 'allow'),
(110, 1, 135, 'Index, Unsubscribe, Error, Contact, ThankYou, GuestSubscriber, UnderConstruction, Test', 'allow'),
(112, 1, 114, '', 'deny'),
(113, 2, 114, '', 'deny'),
(114, 1, 139, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(115, 1, 139, '', 'deny'),
(118, 2, 139, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(119, 2, 139, '', 'deny'),
(120, 2, 140, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(121, 2, 140, '', 'deny'),
(122, 1, 122, '', 'deny'),
(123, 2, 122, '', 'deny'),
(124, 1, 120, '', 'deny'),
(125, 2, 120, '', 'deny'),
(126, 1, 141, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(127, 1, 141, '', 'deny'),
(128, 2, 141, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(129, 2, 141, '', 'deny'),
(130, 1, 142, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(131, 1, 142, '', 'deny'),
(132, 1, 143, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(133, 1, 143, '', 'deny'),
(134, 2, 143, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(135, 2, 143, '', 'deny'),
(136, 1, 144, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(137, 1, 144, '', 'deny'),
(138, 2, 144, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(139, 2, 144, '', 'deny'),
(140, 2, 110, '', 'deny'),
(141, 2, 142, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(142, 2, 142, '', 'deny'),
(143, 1, 145, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(144, 1, 145, '', 'deny'),
(145, 2, 145, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(146, 2, 145, '', 'deny'),
(147, 1, 146, 'Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(148, 1, 146, '', 'deny'),
(149, 2, 146, 'Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(150, 2, 146, '', 'deny'),
(151, 1, 124, '', 'deny'),
(152, 2, 124, '', 'deny'),
(153, 2, 148, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(154, 2, 148, '', 'deny'),
(155, 1, 148, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(156, 1, 148, '', 'deny'),
(157, 2, 127, '', 'deny'),
(158, 1, 127, '', 'deny'),
(159, 2, 149, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(160, 2, 149, '', 'deny'),
(161, 2, 150, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(162, 2, 150, '', 'deny'),
(163, 2, 151, 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(164, 2, 151, '', 'deny'),
(165, 2, 152, 'Index, Rendernewitem, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(166, 2, 152, '', 'deny'),
(167, 2, 153, 'View, Create, Update, Delete, Index, Admin, Approve, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(168, 2, 153, '', 'deny'),
(169, 1, 153, 'View, Create, Update, Delete, Index, Admin, Approve, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(170, 1, 153, '', 'deny'),
(171, 2, 154, 'Create, Delete, Index, Update, View, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(172, 2, 154, '', 'deny'),
(173, 2, 155, 'View,Create,Update,Delete,Index,Up,Down,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(174, 2, 155, '', 'deny'),
(175, 2, 156, 'View, Create, Update, Delete, Index, Update_my_profile, Change_my_password, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove', 'allow'),
(176, 2, 156, '', 'deny'),
(177, 1, 157, 'Create,Delete,Index,Update,View,DeleteAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(178, 1, 157, '', 'deny'),
(179, 2, 157, 'Create,Delete,Index,Update,View,DeleteAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(180, 2, 157, '', 'deny'),
(181, 1, 119, '', 'deny'),
(182, 1, 158, 'Create,Delete,Index,Update,View,DeleteAll,Rendernewitem,Rendernewpageitem,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(183, 2, 158, 'Create,Delete,Index,Update,View,DeleteAll,Rendernewitem,Rendernewpageitem,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(184, 1, 159, 'Create,Delete,Index,Update,View,DeleteAll,RemoveImage,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(185, 2, 159, 'Create,Delete,Index,Update,View,DeleteAll,RemoveImage,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(186, 1, 160, 'Create,Delete,Index,Update,View,DeleteAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(187, 2, 160, 'Create,Delete,Index,Update,View,DeleteAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(188, 1, 161, 'Create,Delete,Index,Update,View,DeleteAll,RemoveImage,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(189, 2, 161, 'Create,Delete,Index,Update,View,DeleteAll,RemoveImage,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove', 'allow'),
(190, 1, 155, 'View,Create,Update,Delete,Index,Up,Down,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(191, 1, 162, 'View,Create,Update,Delete,Index,Up,Down,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(192, 2, 162, 'View,Create,Update,Delete,Index,Up,Down,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(193, 1, 163, 'Create,Delete,Index,Update,View,DeleteAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(194, 2, 163, 'Create,Delete,Index,Update,View,DeleteAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(195, 1, 164, 'Create,Delete,Index,Update,View,DeleteAll,RemoveImage,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveFile', 'allow'),
(196, 2, 164, 'Create,Delete,Index,Update,View,DeleteAll,RemoveImage,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveFile', 'allow'),
(197, 1, 165, 'Create,Delete,Index,Update,View,DeleteAll,RemoveImage,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveFile', 'allow'),
(198, 2, 165, 'Create,Delete,Index,Update,View,DeleteAll,RemoveImage,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveFile', 'allow'),
(199, 2, 166, 'Group,ResetRoleCustomOfUser,User', 'allow'),
(200, 3, 119, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(201, 3, 119, '', 'deny'),
(202, 3, 121, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(203, 3, 121, '', 'deny'),
(204, 3, 129, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(205, 3, 129, '', 'deny'),
(206, 3, 142, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(207, 3, 142, '', 'deny'),
(208, 3, 163, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(209, 3, 163, '', 'deny'),
(210, 3, 162, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(211, 3, 162, '', 'deny'),
(212, 3, 122, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(213, 3, 122, '', 'deny'),
(214, 3, 158, 'Index,Create,Update,Rendernewpageitem,Rendernewitem,View,Delete,DeleteAll', 'allow'),
(215, 3, 158, '', 'deny'),
(216, 3, 159, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(217, 3, 159, '', 'deny'),
(218, 3, 115, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(219, 3, 115, '', 'deny'),
(220, 3, 160, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(221, 3, 160, '', 'deny'),
(222, 3, 161, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(223, 3, 161, '', 'deny'),
(224, 3, 157, 'Create,Delete,Index,Update,View,DeleteAll,AjaxActivate,AjaxDeactivate,AjaxShow,AjaxNotShow,AjaxApprove,RemoveImage,RemoveFile', 'allow'),
(225, 3, 157, '', 'deny'),
(226, 102, 157, '', 'allow');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_actions_users`
--

CREATE TABLE IF NOT EXISTS `yiicore_actions_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `controller_id` int(11) unsigned DEFAULT NULL,
  `actions` text CHARACTER SET utf8 COMMENT 'Anh Dung change to text',
  `can_access` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `yiicore_actions_users`
--

INSERT INTO `yiicore_actions_users` (`id`, `user_id`, `controller_id`, `actions`, `can_access`) VALUES
(1, 3, 119, 'Index,Update', 'allow'),
(2, 3, 119, 'Create,View,Delete,DeleteAll', 'deny'),
(3, 8, 119, 'Index,Create,Update,Delete,DeleteAll', 'allow'),
(4, 8, 119, 'View', 'deny'),
(5, 9, 119, 'Create,View', 'allow'),
(6, 9, 119, 'Index,Update,Delete,DeleteAll', 'deny'),
(7, 9, 121, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(8, 9, 121, '', 'deny'),
(9, 9, 129, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(10, 9, 129, '', 'deny'),
(11, 9, 142, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(12, 9, 142, '', 'deny'),
(13, 9, 163, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(14, 9, 163, '', 'deny'),
(15, 9, 162, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(16, 9, 162, '', 'deny'),
(17, 9, 122, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(18, 9, 122, '', 'deny'),
(19, 9, 158, 'Index,Create,Update,Rendernewpageitem,Rendernewitem,View,Delete,DeleteAll', 'allow'),
(20, 9, 158, '', 'deny'),
(21, 9, 159, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(22, 9, 159, '', 'deny'),
(23, 9, 115, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(24, 9, 115, '', 'deny'),
(25, 9, 160, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(26, 9, 160, '', 'deny'),
(27, 9, 161, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(28, 9, 161, '', 'deny'),
(29, 9, 157, 'Index,Create,Update,View,Delete,DeleteAll', 'allow'),
(30, 9, 157, '', 'deny');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_ads`
--

CREATE TABLE IF NOT EXISTS `yiicore_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_holder` varchar(30) NOT NULL,
  `image` text NOT NULL,
  `link` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expired_date` date NOT NULL,
  `order_display` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `yiicore_ads`
--

INSERT INTO `yiicore_ads` (`id`, `place_holder`, `image`, `link`, `status`, `created_date`, `expired_date`, `order_display`) VALUES
(1, 'Blog - Right Side', '1418617425.jpg', 'http://google.com', 1, '2014-06-25 03:13:27', '2014-06-26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_applications`
--

CREATE TABLE IF NOT EXISTS `yiicore_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_name` varchar(255) NOT NULL,
  `application_short_name` varchar(255) NOT NULL,
  `is_delete` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `yiicore_applications`
--

INSERT INTO `yiicore_applications` (`id`, `application_name`, `application_short_name`, `is_delete`) VALUES
(1, 'Back-end', 'BE', 0),
(2, 'Front-end', 'FE', 0);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_area_code`
--

CREATE TABLE IF NOT EXISTS `yiicore_area_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(100) NOT NULL,
  `area_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=276 ;

--
-- Dumping data for table `yiicore_area_code`
--

INSERT INTO `yiicore_area_code` (`id`, `area_name`, `area_code`) VALUES
(41, 'Afghanistan', '93'),
(42, 'Albania', '355'),
(43, 'Algeria', '213'),
(44, 'American Samoa', '1'),
(45, 'Andorra', '376'),
(46, 'Angola', '244'),
(47, 'Anguilla', '1'),
(48, 'Antigua and Barbuda', '1'),
(49, 'Argentina', '54'),
(50, 'Armenia', '374'),
(51, 'Aruba', '297'),
(52, 'Ascension', '247'),
(53, 'Australia', '61'),
(54, 'Austria', '43'),
(55, 'Azerbaijan', '994'),
(56, 'Bahamas', '1'),
(57, 'Bahrain', '973'),
(58, 'Bangladesh', '880'),
(59, 'Barbados', '1'),
(60, 'Belarus', '375'),
(61, 'Belgium', '32'),
(62, 'Belize', '501'),
(63, 'Benin', '229'),
(64, 'Bermuda', '1'),
(65, 'Bhutan', '975'),
(66, 'Bolivia', '591'),
(67, 'Bosnia and Herzegovina', '387'),
(68, 'Botswana', '267'),
(69, 'Brazil', '55'),
(70, 'British Virgin Islands', '1'),
(71, 'Brunei', '673'),
(72, 'Bulgaria', '359'),
(73, 'Burkina Faso', '226'),
(74, 'Burundi', '257'),
(75, 'Cambodia', '855'),
(76, 'Cameroon', '237'),
(77, 'Canada', '1'),
(78, 'Cape Verde', '238'),
(79, 'Cayman Islands', '1'),
(80, 'Central African Republic', '236'),
(81, 'Chad', '235'),
(82, 'Chile', '56'),
(83, 'China', '86'),
(84, 'Colombia', '57'),
(85, 'Comoros', '269'),
(86, 'Congo', '242'),
(87, 'Cook Islands', '682'),
(88, 'Costa Rica', '506'),
(89, 'Croatia', '385'),
(90, 'Cuba', '53'),
(91, 'Curacao', '599'),
(92, 'Cyprus', '357'),
(93, 'Czech Republic', '420'),
(94, 'Democratic Republic of Congo', '243'),
(95, 'Denmark', '45'),
(96, 'Diego Garcia', '246'),
(97, 'Djibouti', '253'),
(98, 'Dominica', '1'),
(99, 'Dominican Republic', '1'),
(100, 'East Timor', '670'),
(101, 'Ecuador', '593'),
(102, 'Egypt', '20'),
(103, 'El Salvador', '503'),
(104, 'Equatorial Guinea', '240'),
(105, 'Eritrea', '291'),
(106, 'Estonia', '372'),
(107, 'Ethiopia', '251'),
(108, 'Falkland (Malvinas) Islands', '500'),
(109, 'Faroe Islands', '298'),
(110, 'Fiji', '679'),
(111, 'Finland', '358'),
(112, 'France', '33'),
(113, 'French Guiana', '594'),
(114, 'French Polynesia', '689'),
(115, 'Gabon', '241'),
(116, 'Gambia', '220'),
(117, 'Georgia', '995'),
(118, 'Germany', '49'),
(119, 'Ghana', '233'),
(120, 'Gibraltar', '350'),
(121, 'Greece', '30'),
(122, 'Greenland', '299'),
(123, 'Grenada', '1'),
(124, 'Guadeloupe', '590'),
(125, 'Guam', '1'),
(126, 'Guatemala', '502'),
(127, 'Guinea', '224'),
(128, 'Guinea-Bissau', '245'),
(129, 'Guyana', '592'),
(130, 'Haiti', '509'),
(131, 'Honduras', '504'),
(132, 'Hong Kong', '852'),
(133, 'Hungary', '36'),
(134, 'Iceland', '354'),
(135, 'India', '91'),
(136, 'Indonesia', '62'),
(137, 'Inmarsat Satellite', '870'),
(138, 'Iran', '98'),
(139, 'Iraq', '964'),
(140, 'Ireland', '353'),
(141, 'Iridium Satellite', '8816/8817'),
(142, 'Israel', '972'),
(143, 'Italy', '39'),
(144, 'Ivory Coast', '225'),
(145, 'Jamaica', '1'),
(146, 'Japan', '81'),
(147, 'Jordan', '962'),
(148, 'Kazakhstan', '7'),
(149, 'Kenya', '254'),
(150, 'Kiribati', '686'),
(151, 'Kuwait', '965'),
(152, 'Kyrgyzstan', '996'),
(153, 'Laos', '856'),
(154, 'Latvia', '371'),
(155, 'Lebanon', '961'),
(156, 'Lesotho', '266'),
(157, 'Liberia', '231'),
(158, 'Libya', '218'),
(159, 'Liechtenstein', '423'),
(160, 'Lithuania', '370'),
(161, 'Luxembourg', '352'),
(162, 'Macau', '853'),
(163, 'Macedonia', '389'),
(164, 'Madagascar', '261'),
(165, 'Malawi', '265'),
(166, 'Malaysia', '60'),
(167, 'Maldives', '960'),
(168, 'Mali', '223'),
(169, 'Malta', '356'),
(170, 'Marshall Islands', '692'),
(171, 'Martinique', '596'),
(172, 'Mauritania', '222'),
(173, 'Mauritius', '230'),
(174, 'Mayotte', '262'),
(175, 'Mexico', '52'),
(176, 'Micronesia', '691'),
(177, 'Moldova', '373'),
(178, 'Monaco', '377'),
(179, 'Mongolia', '976'),
(180, 'Montenegro', '382'),
(181, 'Montserrat', '1'),
(182, 'Morocco', '212'),
(183, 'Mozambique', '258'),
(184, 'Myanmar', '95'),
(185, 'Namibia', '264'),
(186, 'Nauru', '674'),
(187, 'Nepal', '977'),
(188, 'Netherlands', '31'),
(189, 'Netherlands Antilles', '599'),
(190, 'New Caledonia', '687'),
(191, 'New Zealand', '64'),
(192, 'Nicaragua', '505'),
(193, 'Niger', '227'),
(194, 'Nigeria', '234'),
(195, 'Niue', '683'),
(196, 'Norfolk Island', '6723'),
(197, 'North Korea', '850'),
(198, 'Northern Marianas', '1'),
(199, 'Norway', '47'),
(200, 'Oman', '968'),
(201, 'Pakistan', '92'),
(202, 'Palau', '680'),
(203, 'Panama', '507'),
(204, 'Papua New Guinea', '675'),
(205, 'Paraguay', '595'),
(206, 'Peru', '51'),
(207, 'Philippines', '63'),
(208, 'Poland', '48'),
(209, 'Portugal', '351'),
(210, 'Puerto Rico', '1'),
(211, 'Qatar', '974'),
(212, 'Reunion', '262'),
(213, 'Romania', '40'),
(214, 'Russian Federation', '7'),
(215, 'Rwanda', '250'),
(216, 'Saint Helena', '290'),
(217, 'Saint Kitts and Nevis', '1'),
(218, 'Saint Lucia', '1'),
(219, 'Saint Pierre and Miquelon', '508'),
(220, 'Saint Vincent and the Grenadines', '1'),
(221, 'Samoa', '685'),
(222, 'San Marino', '378'),
(223, 'Sao Tome and Principe', '239'),
(224, 'Saudi Arabia', '966'),
(225, 'Senegal', '221'),
(226, 'Serbia', '381'),
(227, 'Seychelles', '248'),
(228, 'Sierra Leone', '232'),
(229, 'Singapore', '65'),
(230, 'Sint Maarten', '1'),
(231, 'Slovakia', '421'),
(232, 'Slovenia', '386'),
(233, 'Solomon Islands', '677'),
(234, 'Somalia', '252'),
(235, 'South Africa', '27'),
(236, 'South Korea', '82'),
(237, 'South Sudan', '211'),
(238, 'Spain', '34'),
(239, 'Sri Lanka', '94'),
(240, 'Sudan', '249'),
(241, 'Suriname', '597'),
(242, 'Swaziland', '268'),
(243, 'Sweden', '46'),
(244, 'Switzerland', '41'),
(245, 'Syria', '963'),
(246, 'Taiwan', '886'),
(247, 'Tajikistan', '992'),
(248, 'Tanzania', '255'),
(249, 'Thailand', '66'),
(250, 'Thuraya Satellite', '882 16'),
(251, 'Togo', '228'),
(252, 'Tokelau', '690'),
(253, 'Tonga', '676'),
(254, 'Trinidad and Tobago', '1'),
(255, 'Tunisia', '216'),
(256, 'Turkey', '90'),
(257, 'Turkmenistan', '993'),
(258, 'Turks and Caicos Islands', '1'),
(259, 'Tuvalu', '688'),
(260, 'Uganda', '256'),
(261, 'Ukraine', '380'),
(262, 'United Arab Emirates', '971'),
(263, 'United Kingdom', '44'),
(264, 'United States of America', '1'),
(265, 'U.S. Virgin Islands', '1'),
(266, 'Uruguay', '598'),
(267, 'Uzbekistan', '998'),
(268, 'Vanuatu', '678'),
(269, 'Vatican City', '379, 39'),
(270, 'Venezuela', '58'),
(271, 'Vietnam', '84'),
(272, 'Wallis and Futuna', '681'),
(273, 'Yemen', '967'),
(274, 'Zambia', '260'),
(275, 'Zimbabwe', '263');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_banners`
--

CREATE TABLE IF NOT EXISTS `yiicore_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `banner_title` text NOT NULL,
  `banner_description` tinytext NOT NULL,
  `thumb_image` varchar(255) NOT NULL,
  `large_image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `place_holder_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `order_display` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `group_banner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `yiicore_banners`
--

INSERT INTO `yiicore_banners` (`id`, `name`, `banner_title`, `banner_description`, `thumb_image`, `large_image`, `link`, `place_holder_id`, `status`, `order_display`, `created_date`, `group_banner_id`) VALUES
(11, '', 'banner home 1', '<p>test</p>\r\n', '', '1418616767_11_banner-2.jpg', '', 0, 1, 1, '2014-12-15 05:12:46', 11),
(12, '', 'banner home 2', '<p>test</p>\r\n', '', '1418617145_12_banner-1.jpg', '', 0, 1, 2, '2014-12-15 05:19:05', 11),
(13, '', 'banner about us 1', '<p>test</p>\r\n', '', '1418617276_13_banner-3.jpg', '', 0, 1, 3, '2014-12-15 05:21:16', 12);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_categories`
--

CREATE TABLE IF NOT EXISTS `yiicore_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `title_tag` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_keyword` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_slug` (`slug`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `yiicore_categories`
--

INSERT INTO `yiicore_categories` (`id`, `category_name`, `slug`, `display_order`, `status`, `parent_id`, `type`, `level`, `title_tag`, `meta_keyword`, `meta_description`) VALUES
(4, 'Test 2', 'test-2', 2, 1, 0, 'news', 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_cms`
--

CREATE TABLE IF NOT EXISTS `yiicore_cms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `banner` varchar(128) DEFAULT NULL,
  `cms_content` longtext,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `display_order` int(11) DEFAULT NULL,
  `show_in_menu` tinyint(4) DEFAULT '0',
  `place_holder_id` varchar(50) DEFAULT NULL,
  `creator_id` int(250) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `short_content` tinytext,
  `link` varchar(255) DEFAULT NULL,
  `meta_keywords` tinytext,
  `meta_desc` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `yiicore_cms`
--

INSERT INTO `yiicore_cms` (`id`, `title`, `slug`, `banner`, `cms_content`, `created_date`, `display_order`, `show_in_menu`, `place_holder_id`, `creator_id`, `status`, `short_content`, `link`, `meta_keywords`, `meta_desc`) VALUES
(10, 'Page 1', 'page-1', NULL, '<p>\r\n	Page 1</p>\r\n', '2014-04-18 03:55:14', 3, 1, '', 1, 1, 'no', NULL, 'page1', 'page1'),
(11, 'Page 2', 'page-2', NULL, '<p>\r\n	Page 2 content</p>\r\n', '2014-04-18 03:55:14', NULL, 0, NULL, NULL, 1, NULL, NULL, 'page2', 'page3'),
(14, '-----External Page-----', 'external-page', NULL, '', '2014-04-25 04:24:45', NULL, 0, NULL, NULL, 1, NULL, NULL, '', ''),
(15, 'admin1', 'admin1', NULL, '', '2014-04-26 03:13:34', NULL, 0, NULL, NULL, 0, NULL, NULL, '', ''),
(22, 'Coming soon', 'approve-successfully', NULL, '<p>\r\n	{company_name}Coming soon.</p>\r\n', '2014-04-18 03:55:14', 1, 1, '', 1, 1, 'no', NULL, 'nothing', 'nothing'),
(23, 'Thank you for registering', 'thank-you-for-registering', NULL, '<h1>\r\n	Thank you!</h1>\r\n', '2014-06-14 08:22:16', NULL, 0, NULL, NULL, 1, NULL, NULL, '', ''),
(24, 'Term Of Use', 'term-of-use', NULL, '<p>\r\n	Term of Use &#39;s content.</p>\r\n', '2014-06-14 08:54:53', NULL, 0, NULL, NULL, 1, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_controllers`
--

CREATE TABLE IF NOT EXISTS `yiicore_controllers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `controller_name` varchar(335) CHARACTER SET utf8 DEFAULT NULL,
  `module_name` varchar(335) CHARACTER SET utf8 DEFAULT NULL,
  `actions` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `controller_name` (`controller_name`(255)),
  KEY `controller_name_2` (`controller_name`(255)),
  KEY `module_name` (`module_name`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=167 ;

--
-- Dumping data for table `yiicore_controllers`
--

INSERT INTO `yiicore_controllers` (`id`, `controller_name`, `module_name`, `actions`) VALUES
(106, 'ActionsRoles', 'admin', 'View, Create, Update, Delete, List, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(107, 'ActionsUsers', 'admin', 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(108, 'Applications', 'admin', 'View, Create, Update, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(110, 'Banners', 'admin', 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(114, 'Controllers', 'admin', 'View, Edit, Create, Update, Delete, Index, Group, User, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, GetControlerList,GetAvailableAction'),
(115, 'Emailtemplates', 'admin', 'View, Create, Update, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(117, 'Manageadmin', 'admin', 'View, Create, Update, Delete, Index, Update_my_profile, Change_my_password, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, DeleteAll'),
(118, 'Managebanner', 'admin', 'View, Help, Update, AddCustomPhoto, ChooseModel, Delete, Index, HandleCropZoom, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(119, 'Users', 'admin', 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(120, 'Backmenus', 'admin', 'View, Create, Getcheckbox, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(121, 'Newsletter', 'admin', 'Create, View, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(122, 'Pages', 'admin', 'View, Create, Imagepaging, Imageurl, Imageupload, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, DeleteAll, RemoveImage'),
(125, 'Roles', 'admin', 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(127, 'Setting', 'admin', 'Update, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove, SendTestMail'),
(128, 'Site', 'admin', 'ForgotPassword, ResetPassword, ChangePassword, Error, Index, Login, Logout, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(129, 'Subscriber', 'admin', 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(142, 'Subscribergroup', 'admin', 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(150, 'event', 'admin', 'View, Create, Update, Delete, Index, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(156, 'AdminAccount', 'admin', 'View, Create, Update, Delete, Index, Update_my_profile, Change_my_password, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(157, 'Seos', 'admin', 'View, Create, Update, Delete, Index, Admin, AjaxActivate, AjaxDeactivate, AjaxShow, AjaxNotShow, AjaxApprove'),
(158, 'Frontmenus', 'admin', NULL),
(159, 'Smartblocks', 'admin', NULL),
(160, 'Newscategories', 'admin', NULL),
(161, 'News', 'admin', NULL),
(162, 'Ads', 'admin', NULL),
(163, 'Groupbanners', 'admin', NULL),
(164, 'BannerItems', 'admin', NULL),
(165, 'Detailbanners', 'admin', NULL),
(166, 'RolesAuth', 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_email_templates`
--

CREATE TABLE IF NOT EXISTS `yiicore_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_body` text,
  `parameter_description` tinytext,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `yiicore_email_templates`
--

INSERT INTO `yiicore_email_templates` (`id`, `email_subject`, `email_body`, `parameter_description`, `type`) VALUES
(1, 'Registered sucessfully!', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">Dear &nbsp;{FULL_NAME}, </span></font></p>\r\n\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">You registered successfully.</span></font></p>\r\n			<font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">Your Information</span></font>\r\n\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">Full name: {FULL_NAME}</span></font></p>\r\n\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">Email: {EMAIL}</span></font></p>\r\n\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">Password: {PASSWORD}</span></font></p>\r\n\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">Phone: {PHONE}</span></font></p>\r\n\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">Country: {COUNTRY}</span></font></p>\r\n\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;">Please begin by login with this link: {LINK_LOGIN}</span></font></p>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'Send to User\r\n{EMAIL}: email\r\n{PASSWORD}\r\n{FULL_NAME} \r\n{LINK_LOGIN}: link login\r\n{PHONE}\r\n{COUNTRY}\r\n', NULL),
(2, 'A new member has been added.', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p><strong><em>Dear &nbsp;Administrator,</em></strong></p>\r\n\r\n			<p>A new member has been added to the system with below information.</p>\r\n			<strong>Information</strong>\r\n\r\n			<p>Full name: {FULL_NAME}</p>\r\n\r\n			<p>Email: {EMAIL}</p>\r\n\r\n			<p>Password: {PASSWORD}</p>\r\n\r\n			<p>Phone: {PHONE}</p>\r\n\r\n			<p>Country: {COUNTRY}</p>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'Send a notification to Admin for new member\r\n{EMAIL}: email\r\n{PASSWORD}\r\n{FULL_NAME} \r\n{PHONE}\r\n{COUNTRY}\r\n', NULL),
(3, 'Reset your password', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p><strong><em>Dear &nbsp;{FULL_NAME},</em></strong></p>\r\n\r\n			<p>We have received a request to reset the password for your account. If you did not request to reset your password, please ignore this email.</p>\r\n\r\n			<p>{RESET_LINK}</p>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'send email to User for forgetting password\r\n{FULL_NAME}: name of user.\r\n{RESET_LINK}', NULL),
(4, 'Contact Us : {NAME}   ', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p><font face="Arial" style="font-size: 10pt;"><strong>Dear Administrator,</strong><br />\r\n			<br />\r\n			<br />\r\n			<strong>{EMAIL}</strong>&nbsp;has contacted you from trends website:<br />\r\n			<br />\r\n			The contact details are:</font></p>\r\n\r\n			<div>Name: {NAME}&nbsp;</div>\r\n\r\n			<div>&nbsp;</div>\r\n\r\n			<div>Subject: {SUBJECT}</div>\r\n\r\n			<div>&nbsp;</div>\r\n\r\n			<div>Email: {EMAIL}&nbsp;</div>\r\n\r\n			<div>&nbsp;</div>\r\n\r\n			<div>Phone: {PHONE}&nbsp;</div>\r\n\r\n			<div>&nbsp;</div>\r\n\r\n			<div>Message: {MESSAGE}</div>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'Email to Admin\r\n{NAME}    {EMAIL}   {PHONE}   {MESSAGE} {SUBJECT}\r\n', NULL),
(5, 'You have been added your information to Trends website', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p><font face="Arial" style="font-size: 10pt;"><strong>Dear {NAME},</strong><br />\r\n			<br />\r\n			<br />\r\n			<b>You have been added your information to Trends website. We will contact you soon</b><br />\r\n			<br />\r\n			The contact details are:</font></p>\r\n\r\n			<div>Name: {NAME}&nbsp;</div>\r\n\r\n			<div>&nbsp;</div>\r\n\r\n			<div>Subject: {SUBJECT}</div>\r\n\r\n			<div>&nbsp;</div>\r\n\r\n			<div>Email: {EMAIL}&nbsp;</div>\r\n\r\n			<div>&nbsp;</div>\r\n\r\n			<div>Phone: {PHONE}&nbsp;</div>\r\n\r\n			<div>&nbsp;</div>\r\n\r\n			<div>Message: {MESSAGE}</div>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'Email To Contact Person\r\n{NAME}    {EMAIL}   {PHONE}   {MESSAGE} {SUBJECT}', NULL),
(6, 'A new Password has been sent by Member', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p><strong><em>Dear &nbsp;{FULL_NAME},</em></strong></p>\r\n\r\n			<p>You have changed your password into your account.</p>\r\n\r\n			<p>Your new password is:&nbsp; {PASSWORD}</p>\r\n\r\n			<p>Please click this link:&nbsp;&nbsp;{LINK_LOGIN}&nbsp;to login.</p>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'Change Password\r\n\r\n{FULL_NAME}: name of user.\r\n{PASSWORD}: new password\r\n{LINK_LOGIN}: link login', NULL),
(7, 'Request Reset Password Account Admin', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p>Dear {NAME},</p>\r\n\r\n			<p>Someone requested that the password be reset for the following account in verzdesign website:</p>\r\n\r\n			<p>Email: {EMAIL}</p>\r\n\r\n			<p>Username: {USERNAME}</p>\r\n\r\n			<p>If this was a mistake, just ignore this email and nothing will happen.</p>\r\n\r\n			<p>To reset your password, visit the following address: {LINK}</p>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '{NAME}: name of user.\r\n{EMAIL}: Email of user\r\n{LINK}: link reset\r\n{USERNAME}', NULL),
(8, 'Reset Password  Admin Account', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p>Dear {NAME},</p>\r\n\r\n			<p>You have requested a new password for verzdesign website.</p>\r\n\r\n			<p>Your new password is:&nbsp; {PASSWORD}</p>\r\n\r\n			<p>Please click this link:&nbsp;&nbsp;{LINK_LOGIN}&nbsp;to login.</p>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '{NAME}: name of user.\r\n{PASSWORD}: new password\r\n{LINK_LOGIN}: link login', NULL),
(9, 'You have change password successfully', '<table border="0" cellpadding="0" cellspacing="0" style="font-size:12px; font-family: ''Arial'';" width="600">\r\n	<tbody>\r\n		<tr>\r\n			<td height="100"><!--\r\n        logo picture and slogan\r\n        -->\r\n			<div id="logo" style="float:left;"><img src="http://www.verzdesign.com/wp-content/uploads/2013/08/logo.jpg" /></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style="padding:10px 0px;border-bottom-width:thick;border-bottom-style:solid;font-family:Arial, Helvetica, sans-serif;border-top-width:thin;border-top-style:solid;border-color:#000;border-left:0px; border-right: 0px; border-top: 2px #000 solid;"><!--\r\n        email content\r\n        -->\r\n			<p>Dear {NAME},</p>\r\n\r\n			<p>You have been changed password successfully.</p>\r\n\r\n			<p>Your new password is:&nbsp; {PASSWORD}</p>\r\n\r\n			<p>Please click this link:&nbsp;&nbsp;{LINK_LOGIN}&nbsp;to login.</p>\r\n\r\n			<p style="padding-top:15px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS"><span style="font-size: 12px; line-height: 20.7999992370605px;">Yours Sincerely,</span></font></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td><!--\r\n        get signature\r\n        -->\r\n			<p><font face="Arial"><span style="font-size: 12px; line-height: 20.7999992370605px;"><strong>Verz Design</strong><br />\r\n			<a href="http://www.verzdesign.com" style=" color: #15c;" target="_blank">www.verzdesign.com</a></span></font></p>\r\n\r\n			<div style="color:rgb(0,0,0);font-size:16px;">\r\n			<hr /></div>\r\n\r\n			<p><span style="font-size:10px;"><font face="sans-serif, Arial, Verdana, Trebuchet MS" style="font-size: 10px; line-height: 20.7999992370605px;">COPYRIGHT &copy;2014 Verz design. ALL RIGHTS RESERVED.</font></span></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', 'change password successfully - Admin\r\n{NAME}: name of user.\r\n{PASSWORD}: new password\r\n{LINK_LOGIN}: link login', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_event`
--

CREATE TABLE IF NOT EXISTS `yiicore_event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `title_text` text NOT NULL,
  `left_text` text NOT NULL,
  `right_text` text NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `yiicore_event`
--

INSERT INTO `yiicore_event` (`id`, `title`, `image1`, `image2`, `title_text`, `left_text`, `right_text`, `created_date`, `slug`, `status`) VALUES
(1, 'Social Events', '1398504130_1_image1.png', '1398503485_1_image2.png', '<h3>\r\n	15 &ndash; 17 April 2015</h3>\r\n<h4>\r\n	Fairmont Hotel, Singapore</h4>\r\n<p>\r\n	Lunches and Drinks included</p>\r\n<h2>\r\n	Social Events</h2>\r\n<p>\r\n	Ice Breaker/Golf/Tennis</p>\r\n<p>\r\n	Evening Excursion/Quiz Night</p>\r\n', '<h3>\r\n	Technical Programme*</h3>\r\n<h3>\r\n	Regional Reviews</h3>\r\n<h3>\r\n	Basin &amp; Field case Studies</h3>\r\n<ul>\r\n	<li class="first">\r\n		Networking</li>\r\n	<li>\r\n		Farmout Forum</li>\r\n	<li>\r\n		Posters</li>\r\n	<li class="last">\r\n		Petroleum Geology Course</li>\r\n</ul>\r\n<h5>\r\n	*For talk proposals, please contact <a href="mailto:peter.woodroof@petrofac.com">peter.woodroof@petrofac.com</a> or <a href="mailto:chris.howells@tgs.com">chris.howells@tgs.com</a></h5>\r\n<h5>\r\n	See events and register online at <a href="#">www.seapexconf.org</a></h5>\r\n', '<p>\r\n	Dear Industry Colleagues,</p>\r\n<p>\r\n	With just one year to go until the SEAPEX 2015 Exhibition and Conference, I am proud to announce that we are well on the way to having the biggest and most significant SEAPEX conference yet.</p>\r\n<p>\r\n	SEAPEX 2015 will not only be disseminating critical upstream knowledge; but it will provide first-rate networking opportunities, as well as promoting investment in the region.</p>\r\n<p>\r\n	Plus, with the Scout Check now firmly linked to SEAPEX, we are on track to see even greater involvement and support from the wide-range of operating companies involved in exploration, development and production within Asia-Pacific.</p>\r\n<p>\r\n	This is the one not-to-be-missed event for upstream industry players and investors.</p>\r\n<p>\r\n	Place it in your diary now,</p>\r\n<p>\r\n	Respectfully Yours,</p>\r\n<p>\r\n	Peter Woodroof</p>\r\n<p>\r\n	Chairman</p>\r\n<p>\r\n	Place it in your diary now,</p>\r\n<p>\r\n	Respectfully Yours,</p>\r\n<p>\r\n	Peter Woodroof</p>\r\n<p>\r\n	Chairman</p>\r\n', '2014-04-22 02:25:43', 'social-events', 1);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_fe_menus`
--

CREATE TABLE IF NOT EXISTS `yiicore_fe_menus` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `order` int(2) DEFAULT NULL,
  `required_login` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `type` varchar(50) DEFAULT 'page' COMMENT 'page, custom URL',
  `parent_id` bigint(11) DEFAULT '0',
  `place_holder_id` bigint(11) DEFAULT NULL,
  `page_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `yiicore_fe_menus`
--

INSERT INTO `yiicore_fe_menus` (`id`, `name`, `link`, `order`, `required_login`, `status`, `type`, `parent_id`, `place_holder_id`, `page_id`) VALUES
(1, 'Event Details', 'http://localhost/seapex/event/social-events', 6, 0, 1, 'url', 0, 1, 9),
(6, 'Registration', 'http://google.com', 3, 0, 1, 'url', 0, NULL, 9),
(7, 'Accommodation', 'http://zing.vn', 4, 0, 1, 'url', 0, NULL, 9),
(8, 'test', 'coming-soon', 1, 0, 1, 'page', 0, NULL, 9),
(9, 'cms page test', 'page-2', 5, 0, 1, 'page', 0, NULL, 11);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_group_banners`
--

CREATE TABLE IF NOT EXISTS `yiicore_group_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `display_in_url` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `yiicore_group_banners`
--

INSERT INTO `yiicore_group_banners` (`id`, `name`, `display_in_url`) VALUES
(11, 'Home', 'http://localhost/coreProject/admin'),
(12, 'About Us', 'http://localhost/coreProject/about-us');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_ip_logins`
--

CREATE TABLE IF NOT EXISTS `yiicore_ip_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `ip_address` varchar(32) DEFAULT NULL,
  `time_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `yiicore_ip_logins`
--

INSERT INTO `yiicore_ip_logins` (`id`, `username`, `ip_address`, `time_login`) VALUES
(3, 'admin', '127.0.0.1', 1411108457);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_links`
--

CREATE TABLE IF NOT EXISTS `yiicore_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `target` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `visible` varchar(45) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `rel` varchar(45) DEFAULT NULL,
  `notes` mediumtext,
  `rss` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_logger`
--

CREATE TABLE IF NOT EXISTS `yiicore_logger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(128) NOT NULL,
  `category` varchar(128) NOT NULL,
  `logtime` int(11) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_menu`
--

CREATE TABLE IF NOT EXISTS `yiicore_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `maxdepth` smallint(6) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `yiicore_menu`
--

INSERT INTO `yiicore_menu` (`id`, `title`, `maxdepth`, `created`, `modified`) VALUES
(4, 'Main', 0, '2014-04-25 03:10:54', NULL),
(6, 'Footer', 0, '2014-04-25 08:40:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_menuitem`
--

CREATE TABLE IF NOT EXISTS `yiicore_menuitem` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `order` int(2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `page_id` bigint(11) DEFAULT NULL,
  `target` varchar(20) DEFAULT '_self',
  `icon` varchar(50) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT NULL,
  `menu_id` bigint(11) NOT NULL,
  `parent_id` bigint(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=354 ;

--
-- Dumping data for table `yiicore_menuitem`
--

INSERT INTO `yiicore_menuitem` (`id`, `name`, `link`, `order`, `status`, `page_id`, `target`, `icon`, `created`, `modified`, `menu_id`, `parent_id`) VALUES
(205, 'Footer 1', 'http://localhost/seapex/coming-soon', 1, 1, 9, '_blank', NULL, '2014-04-25 08:51:08', NULL, 6, 0),
(206, 'Footer 2', 'http://localhost/seapex/coming-soon', 2, 1, 9, '_self', NULL, '2014-04-25 08:51:08', NULL, 6, 0),
(351, 'Home', 'http://localhost/yiicore', 1, 1, 0, '_self', NULL, '2014-12-19 09:11:02', NULL, 4, 0),
(352, 'About Us 11111', 'http://localhost/verz/coreproject/about-us', 1, 1, 16, '_self', NULL, '2014-12-19 09:11:02', NULL, 4, 0),
(353, 'About Us', 'http://localhost/verz/coreproject/about-us', 1, 1, 16, '_self', NULL, '2014-12-19 09:11:02', NULL, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_menus`
--

CREATE TABLE IF NOT EXISTS `yiicore_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(300) CHARACTER SET utf8 NOT NULL,
  `menu_link` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `display_order` int(11) NOT NULL,
  `show_in_menu` tinyint(1) unsigned DEFAULT NULL,
  `application_id` tinyint(1) unsigned DEFAULT NULL,
  `parent_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=79 ;

--
-- Dumping data for table `yiicore_menus`
--

INSERT INTO `yiicore_menus` (`id`, `menu_name`, `menu_link`, `display_order`, `show_in_menu`, `application_id`, `parent_id`) VALUES
(51, 'System Configuration', 'admin/setting/index', 2, 1, 1, 55),
(53, 'CMS Management', '', 4, 1, 1, 0),
(55, 'System', '', 5, 1, 1, 0),
(56, 'Admin Accounts', 'admin/manageadmin', 1, 1, 1, 55),
(60, 'Email Templates', 'admin/emailtemplates', 3, 1, 1, 53),
(62, 'Member Management', 'admin/users', 1, 1, 1, 0),
(63, 'Banner management', '', 3, 1, 1, 0),
(64, 'Banners', 'admin/groupbanners', 1, 1, 1, 63),
(66, 'Newsletter management', '', 2, 1, 1, 0),
(67, 'Newsletter Templates', 'admin/newsletter', 1, 1, 1, 66),
(68, 'Subscribers', 'admin/subscriber', 2, 1, 1, 66),
(69, 'Subcriber Groups', 'admin/subscribergroup', 3, 1, 1, 66),
(70, 'SEO', 'admin/seos', 3, 1, 1, 55),
(71, 'Pages', 'admin/pages', 1, 1, 1, 53),
(72, 'Front Menus', 'admin/frontmenus', 1, 1, 1, 53),
(73, 'Smart Blocks', 'admin/smartblocks', 1, 1, 1, 53),
(74, 'News Categories', 'admin/newscategories', 11, 1, 1, 53),
(75, 'News', 'admin/news', 13, 1, 1, 53),
(76, 'Ads', 'admin/ads', 2, 1, 1, 63),
(77, 'Roles', 'admin/roles/index', 4, 1, 1, 55),
(78, 'back menus tesst', 'admin/backmenus', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_modules`
--

CREATE TABLE IF NOT EXISTS `yiicore_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_newsletter`
--

CREATE TABLE IF NOT EXISTS `yiicore_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `content` text,
  `created_time` datetime NOT NULL,
  `send_time` datetime DEFAULT NULL,
  `remain_subscribers` text,
  `total_subscriber` int(11) NOT NULL DEFAULT '0',
  `total_sent` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `yiicore_newsletter`
--

INSERT INTO `yiicore_newsletter` (`id`, `subject`, `content`, `created_time`, `send_time`, `remain_subscribers`, `total_subscriber`, `total_sent`) VALUES
(1, 'hot news', '<p>\r\n	czxv</p>\r\n', '2014-06-17 16:43:53', '2014-06-18 05:11:00', '1,', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_newsletter_group_subscriber`
--

CREATE TABLE IF NOT EXISTS `yiicore_newsletter_group_subscriber` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `newsletter_id` int(11) NOT NULL,
  `subscriber_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_newsletter_tracking`
--

CREATE TABLE IF NOT EXISTS `yiicore_newsletter_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletter_id` int(11) NOT NULL,
  `subscriber_email_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_place_holders`
--

CREATE TABLE IF NOT EXISTS `yiicore_place_holders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `yiicore_place_holders`
--

INSERT INTO `yiicore_place_holders` (`id`, `position`) VALUES
(1, 'Top'),
(2, 'Left'),
(3, 'Bottom'),
(4, 'Right');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_posts`
--

CREATE TABLE IF NOT EXISTS `yiicore_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT NULL,
  `posted_by` bigint(11) DEFAULT NULL,
  `post_type` varchar(20) DEFAULT 'page',
  `title_tag` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `meta_desc` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `featured_image` varchar(300) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `slug` varchar(400) DEFAULT NULL,
  `parent_id` bigint(20) NOT NULL,
  `menuitem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `User_idx` (`posted_by`),
  KEY `slug` (`slug`),
  KEY `status` (`status`),
  KEY `title` (`title`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `yiicore_posts`
--

INSERT INTO `yiicore_posts` (`id`, `title`, `short_content`, `content`, `status`, `posted_by`, `post_type`, `title_tag`, `meta_keywords`, `meta_desc`, `featured_image`, `display_order`, `created_date`, `modified_date`, `slug`, `parent_id`, `menuitem_id`) VALUES
(8, 'Register Success', NULL, '<p>You have registered successfully. An activation email will be send&nbsp;to you after we verify you profile.&nbsp;Thank you.</p>\r\n', 1, 2, 'page', '', '', '', '1418629521_8_1939695_753687881347375_3405657449372777578_n.jpg', 43242, '2014-07-14 16:52:34', '2014-12-15 15:45:21', 'register-success', 0, 338),
(13, 'Resetted Password Successfully', NULL, '<p>You have resetted your password successfully.</p>\r\n', 1, 2, 'page', NULL, NULL, NULL, NULL, 2, '2014-07-16 14:21:27', '2014-12-11 14:45:17', 'resetted-password-successfully', 0, 339),
(14, 'Block 1  title', NULL, '<p>gfdsfgs</p>\r\n', 1, 2, 'block', NULL, NULL, NULL, NULL, 1, '2014-12-12 15:04:45', '2014-12-15 14:28:27', '', 0, NULL),
(16, 'About Us', NULL, '<p><span style="color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px; line-height: normal;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. </span></p>\r\n\r\n<p><span style="color: rgb(102, 102, 102); font-family: Verdana, Geneva, sans-serif; font-size: 10px; line-height: normal;">Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt.</span></p>\r\n', 1, 2, 'page', 'title about us', 'about us meta keywords', 'about us meta description', NULL, 3, '2014-12-15 15:44:45', '2014-12-18 05:51:50', 'about-us', 0, 350);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_posts_categories`
--

CREATE TABLE IF NOT EXISTS `yiicore_posts_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_roles`
--

CREATE TABLE IF NOT EXISTS `yiicore_roles` (
  `id` smallint(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `role_short_name` varchar(255) NOT NULL,
  `application_id` tinyint(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `yiicore_roles`
--

INSERT INTO `yiicore_roles` (`id`, `role_name`, `role_short_name`, `application_id`, `status`) VALUES
(1, 'manager', 'Manager', 1, 1),
(2, 'adminstrator', 'Adminstrator', 1, 1),
(3, 'role 1', '', 1, 1),
(102, 'role 2', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_roles_menus`
--

CREATE TABLE IF NOT EXISTS `yiicore_roles_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` smallint(11) unsigned DEFAULT NULL,
  `menu_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=144 ;

--
-- Dumping data for table `yiicore_roles_menus`
--

INSERT INTO `yiicore_roles_menus` (`id`, `role_id`, `menu_id`) VALUES
(81, 2, 51),
(86, 2, 56),
(91, 1, 60),
(92, 2, 60),
(95, 1, 56),
(106, 1, 67),
(107, 2, 67),
(108, 1, 68),
(109, 2, 68),
(110, 1, 69),
(111, 2, 69),
(113, 1, 51),
(114, 1, 70),
(115, 2, 70),
(120, 1, 71),
(121, 2, 71),
(124, 1, 72),
(125, 2, 72),
(126, 1, 73),
(127, 2, 73),
(128, 1, 74),
(129, 2, 74),
(130, 1, 75),
(131, 2, 75),
(132, 1, 64),
(133, 2, 64),
(134, 1, 76),
(135, 2, 76),
(136, 1, 66),
(137, 2, 66),
(138, 1, 63),
(139, 2, 63),
(140, 2, 53),
(141, 1, 55),
(142, 2, 55),
(143, 2, 77);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_seos`
--

CREATE TABLE IF NOT EXISTS `yiicore_seos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_tag` varchar(300) NOT NULL,
  `url` varchar(400) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `yiicore_seos`
--

INSERT INTO `yiicore_seos` (`id`, `title_tag`, `url`, `meta_keyword`, `meta_desc`) VALUES
(1, 'home page', 'http://verzview.com/verzgess/demo/', 'keyword', 'description'),
(3, 'Voluptate sint excepteur eligendi magnam dolores est voluptatibus cupiditate architecto omnis totam pariatur Sed quibusdam facilis debitis ea aliquam consectetur', 'Aut libero facilis commodo harum labore molestiae placeat nisi quibusdam sint non iste maxime a distinctio Laboris sit', 'Est voluptas nulla omnis quia velit, dolor quae eum magnam suscipit ex amet, quia neque molestias ut explicabo. In.', 'Explicabo. Ut nobis ex aut in incididunt odio impedit, exercitation aut sunt.'),
(4, 'In reprehenderit corrupti laborum Corrupti sint et', 'Fugiat excepturi tempora ut dicta rerum incididunt soluta odit', 'Aut amet, minim et ratione Nam cum quas dolores est nulla elit, quaerat maxime dolor labore vitae ex sunt.', 'Fugit, dolorem tenetur quia voluptas doloremque voluptas ut minus corrupti, ut eu qui.'),
(5, 'Qui labore eaque qui dicta ea fuga Possimus quaerat quos assumenda voluptatum occaecat velit commodi distinctio Quia ullamco', 'Rem do unde nisi id ex perferendis accusamus quos esse provident deleniti inventore et ratione', 'Obcaecati earum nisi tempore, tempore, dolorem ut excepturi tempore, officia exercitation consectetur, elit, quia quo nemo aperiam eos laboriosam, aute.', 'Aute labore qui omnis ex autem aliqua. Voluptas totam tenetur excepteur voluptatem atque.');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_settings`
--

CREATE TABLE IF NOT EXISTS `yiicore_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `yiicore_settings`
--

INSERT INTO `yiicore_settings` (`id`, `updated`, `key`, `value`) VALUES
(1, '2012-07-03 02:29:14', 'transportType', 's:4:"smtp";'),
(2, '2014-07-25 00:27:42', 'smtpHost', 's:14:"smtp.gmail.com";'),
(3, '2014-07-25 00:27:42', 'smtpUsername', 's:19:"verztest9@gmail.com";'),
(4, '2014-07-25 00:27:42', 'smtpPassword', 's:8:"verztest";'),
(5, '2012-01-31 22:01:43', 'smtpPort', 's:3:"465";'),
(6, '2012-07-03 02:29:14', 'encryption', 's:3:"ssl";'),
(7, '2014-12-18 03:30:48', 'adminEmail', 's:28:"van.nguyenthikhanh@gmail.com";'),
(8, '2014-12-04 10:21:18', 'dateFormat', 's:5:"d/m/y";'),
(9, '2014-12-04 10:21:18', 'timeFormat', 's:5:"H:i:s";'),
(10, '2014-03-10 20:24:01', 'paypal_email_address', 's:40:"van.nguyenthikhanh-facilitator@gmail.com";'),
(11, '2014-03-09 20:15:03', 'paypalType', 's:4:"test";'),
(12, '2014-07-06 15:17:15', 'paypalURL', 's:0:"";'),
(13, '2014-07-06 15:17:15', 'twitter', 's:18:"http://twitter.com";'),
(14, '2014-07-06 15:17:15', 'facebook', 's:19:"http://facebook.com";'),
(15, '2012-03-21 13:29:44', 'linkedin', 'N;'),
(16, '2012-03-21 13:29:44', 'rss', 'N;'),
(17, '2012-07-12 01:02:22', 'meta_description', 's:235:"65 Doctor allows you to set appointments ahead of time with doctors from various medical specialties in Singapore. Let us help you find the right doctor based on your symptoms, required procedures, location, and even insurance company.";'),
(18, '2012-07-12 01:02:22', 'meta_keywords', 's:203:"Singapore Doctors, Online Doctors Singapore, Doctor Appointments Online, Medical Appointments Online, Schedule Doctor Appointments, Find Doctors, Singapore Medical Consultation, Medical Community Online.";'),
(19, '2014-04-26 04:00:39', 'title', 's:6:"Seapex";'),
(20, '2013-04-15 01:59:14', 'last_working', 's:19:"2013-04-15 10:59:13";'),
(21, '2014-12-18 03:30:48', 'autoEmail', 's:17:"core@verzview.com";'),
(32, '2012-06-13 03:52:30', 'image_watermark', 's:21:"bg_13395847462753.gif";'),
(33, '2012-10-07 20:23:53', 'login_limit_times', 's:1:"4";'),
(34, '2012-10-07 20:44:28', 'time_refresh_login', 's:1:"8";'),
(35, '2013-04-12 00:14:21', 'title_all_mail', 's:0:"";'),
(36, '2014-05-07 02:18:35', 'mailchimp_on', 'N;'),
(37, '2014-05-07 02:18:36', 'mailchimp_api_key', 'N;'),
(38, '2014-05-07 02:18:36', 'mailchimp_list_id', 'N;'),
(39, '2014-05-07 02:18:36', 'mailchimp_title_groups', 'N;'),
(40, '2013-04-15 00:28:39', 'server_name', 's:25:"http://localhost/yii_core";'),
(41, '2014-04-18 09:20:00', 'company_name', 's:16:"SEAPEX Singapore";'),
(42, '2014-04-18 09:20:00', 'company_address', 's:63:"20 Upper Circular Road, The River Walk #01-06, Singapore 058416";'),
(43, '2014-04-18 09:24:14', 'copy_right', 's:65:"Copyright © 2014 SEAPEX. All rights reserved. Web Design by Verz";'),
(44, '2014-07-25 00:27:42', 'defaultPageSize', 's:2:"50";'),
(45, '2014-05-07 02:18:35', 'anotherEmail', 's:14:"judy@gmail.com";'),
(46, '2014-06-17 08:34:40', 'paypal_currency', 's:3:"SGD";'),
(47, '2014-05-16 08:13:02', 'paypal_minimum', 's:1:"1";'),
(48, '2014-06-17 08:34:40', 'copyright_on_footer', 's:0:"";'),
(49, '2014-07-25 04:58:13', 'baseUrl', 's:29:"http://localhost/coreprojects";'),
(50, '2014-12-16 04:04:00', 'projectName', 's:9:" Yii Core";'),
(51, '2014-07-25 04:58:13', 'defaultPageTitle', 's:17:" Yii Core Welcome";'),
(52, '2014-07-06 15:17:15', 'metaDescription', 's:4:"Test";'),
(53, '2014-07-06 15:17:15', 'metaKeywords', 's:4:"Test";'),
(54, '2014-07-06 15:17:15', 'googleAnalytics', 's:4:"test";'),
(55, '2014-07-06 15:17:15', 'copyrightOnFooter', 's:13:"<p>test</p>\r\n";'),
(56, '2014-07-06 15:17:15', 'currencSign', 's:0:"";'),
(57, '2014-07-25 00:27:42', 'loginLimitTimes', 's:1:"5";'),
(58, '2014-07-25 00:27:42', 'timeRefreshLogin', 's:2:"50";'),
(59, '2014-07-25 00:27:42', 'mailSenderName', 's:8:"Yii Core";'),
(60, '2014-07-06 15:17:15', 'companyName', 's:0:"";'),
(61, '2014-07-06 15:17:15', 'companyAddress', 's:0:"";'),
(62, '2014-07-06 15:17:15', 'contactFreeText', 's:0:"";'),
(63, '2014-07-06 15:17:16', 'paypalBusinessEmail', 's:0:"";'),
(64, '2014-07-06 15:17:16', 'paypalMode', 's:4:"live";'),
(65, '2014-07-06 15:11:58', 'paypalMinimum', 's:0:"";'),
(66, '2014-07-06 15:17:16', 'paypalCurrency', 's:0:"";'),
(67, '2014-12-04 10:21:18', 'currencySign', 's:3:"SGD";');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_static_block`
--

CREATE TABLE IF NOT EXISTS `yiicore_static_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `yiicore_static_block`
--

INSERT INTO `yiicore_static_block` (`id`, `title`, `content`) VALUES
(1, 'Test', '<p>\r\n	Test</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_subscriber`
--

CREATE TABLE IF NOT EXISTS `yiicore_subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `subscriber_group_id` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `yiicore_subscriber`
--

INSERT INTO `yiicore_subscriber` (`id`, `name`, `email`, `status`, `subscriber_group_id`) VALUES
(1, 'huynh', 'hue@gmail.com', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_subscriber_group`
--

CREATE TABLE IF NOT EXISTS `yiicore_subscriber_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_users`
--

CREATE TABLE IF NOT EXISTS `yiicore_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` smallint(1) unsigned DEFAULT NULL,
  `application_id` tinyint(1) unsigned DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `temp_password` varchar(30) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `slug` varchar(350) DEFAULT NULL,
  `login_attemp` smallint(5) unsigned DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(30) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `gender` varchar(6) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `verify_code` varchar(100) DEFAULT NULL,
  `area_code_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `yiicore_users`
--

INSERT INTO `yiicore_users` (`id`, `role_id`, `application_id`, `username`, `email`, `password_hash`, `temp_password`, `first_name`, `last_name`, `full_name`, `slug`, `login_attemp`, `created_date`, `last_logged_in`, `ip_address`, `status`, `gender`, `phone`, `verify_code`, `area_code_id`) VALUES
(1, 1, 1, 'manager', 'manager@manager.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'manager', 'manager', '', NULL, 0, '2012-06-18 17:00:00', '2014-06-16 17:15:38', '::1', 1, 'FEMALE', '0909999999', NULL, 0),
(2, 2, 1, 'admin', 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'Admin', 'Admin', 'Administrator', NULL, 0, '2012-06-18 17:00:00', '2015-03-04 09:12:44', '::1', 1, 'MALE', '0909999999', '', 0),
(3, 3, 2, '', 'van.nguyenthikhanh+001@gmail.com', '25f9e794323b453885f5181f1b624d0b', '123456789', '', '', 'test123', NULL, 0, '0000-00-00 00:00:00', '2014-12-18 16:20:49', '127.0.0.1', 1, NULL, '123456789', '', 43),
(5, 0, 0, '', 'huynhynh@gmail.comff', '67cca2bfd1a76373b60e21d3715184c4', '12345678912345678912345678912h', '', '', 'huynh thi hue 1 huynh thi hue 1 huynh thi hue 1 hd', NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 0, NULL, '(+65) 9565-5555', NULL, NULL),
(6, 3, 2, '', 'quocbao1087@gmail.com', '4e4306e9c965998f87587b071e1fed3c', '3DUFI6', 'Bao', 'Nguyen', 'Bao Nguyen', NULL, 0, '0000-00-00 00:00:00', '2014-06-16 15:48:53', '127.0.0.1', 1, NULL, '123456789', '425580', 43),
(7, 2, 1, 'vanAdmin', 'van.nguyenthikhanh@gmail.com', '83422503bcfc01d303030e8a7cc80efc', '123456789a', '', '', 'Van Nguyen', NULL, 0, '2014-12-11 12:31:32', '0000-00-00 00:00:00', '', 1, NULL, '', NULL, NULL),
(8, 3, 1, 'sdfdsfsdf', 'ssdfsd@yahoo.com12', '98641e30ace18a76f07bd7e5fbf7cd6c', '123456qq', '', '', 'ssdfsd@yahoo.com12', NULL, 0, '2014-12-19 08:10:38', '2014-12-19 15:33:33', '', 1, '1', '43242432432432', NULL, NULL),
(9, 102, 1, '23334232', 'SFASDF@YAHOO.COM', '58cf703f664397ec4f0ac359b84b565c', 'a123123', NULL, NULL, 'SSDFFSDF', NULL, NULL, '2014-12-19 08:58:58', NULL, NULL, 0, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `yiicore_users_actions`
--

CREATE TABLE IF NOT EXISTS `yiicore_users_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `module` varchar(31) DEFAULT NULL,
  `controller` varchar(31) DEFAULT NULL,
  `actions` varchar(256) DEFAULT NULL,
  `type` varchar(31) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
