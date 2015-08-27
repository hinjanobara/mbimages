-- phpMyAdmin SQL Dump
-- version 4.2.3deb1.trusty~ppa.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 30, 2015 at 09:05 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mybarangay2`
--

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE IF NOT EXISTS `business` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `street` varchar(150) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lng` varchar(50) DEFAULT NULL,
  `opened` varchar(50) DEFAULT NULL,
  `business_category_id` int(11) DEFAULT NULL,
  `business_info` text,
  `accepted_payment_id` int(11) DEFAULT NULL,
  `average_rate` varchar(3) DEFAULT NULL,
  `total_review` int(11) DEFAULT NULL,
  `view_hits` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `created`, `modified`, `member_id`, `name`, `website`, `email`, `telephone`, `street`, `city`, `country_id`, `lat`, `lng`, `opened`, `business_category_id`, `business_info`, `accepted_payment_id`, `average_rate`, `total_review`, `view_hits`) VALUES
(1, '2015-02-20 02:17:46', '2015-03-11 09:18:49', 1, 'Airbnb', 'https://www.airbnb.ca', '', '(222) 222-222', 'Somewhere In', 'Vancouver', 31, '49.204256', '-123.135259', '', 4, NULL, NULL, '4.5', 12, NULL),
(2, '2015-02-20 06:45:19', '2015-03-11 09:20:36', 1, 'GreenLogik Inc.', 'http://itsmyelectric.org', '', '+639234332382', 'Exchange Road, Tektite Blg., Ortigas Center', 'Pasig', 137, '14.582508', '121.062107', '', 3, NULL, NULL, '5', 0, NULL),
(3, '2015-02-20 22:25:10', '2015-03-24 08:23:38', 1, 'Canada Ventures Inc.', 'http://canadaventures.com', '', '(111) 111-111', '123 anywhere street', 'Toronto', 31, '49.3456', '-123.22074', '', 2, NULL, NULL, '4.0', 2, NULL),
(4, '2015-02-21 02:59:56', '2015-03-11 09:20:29', 1, 'Clear Trust', 'http://cleartrust.ca', '', '(222) 222-222', 'Somewhere In', 'Vancouver', 31, '49.204028', '-123.134123', '', 2, NULL, NULL, '3', 0, NULL),
(5, '2015-02-24 06:30:53', '2015-03-11 09:20:25', 1, 'Tim Hortons', 'timhortons.com', '', '+1 604-266-5331', '5702 Granville St', 'Vancouver', 31, '49.233854', '-123.138966', '', 1, NULL, NULL, '4.3', 3, NULL),
(6, '2015-02-26 16:30:44', '2015-03-11 09:20:19', 2, 'Test Business', 'www.testbusiness.com', '', '09123322332', '123 anywhere street', 'MArikina City', 137, '12.879721', '121.774017', '', 3, NULL, NULL, '5', 0, NULL),
(8, '2015-03-11 07:37:56', '2015-03-11 09:20:15', 1, 'West Onyx', '', NULL, '', 'Exchange Road, Tektite Blg., Ortigas Center', 'Pasig', 137, '14.5810833', '121.0593087', 'Opened', NULL, NULL, NULL, '4.0', 2, NULL),
(9, '2015-03-13 05:38:22', '2015-03-13 05:38:22', 1, 'Patricia Executive Village', NULL, NULL, NULL, 'Bacoor, Barangay Mabolo 3,  Bacoor', 'Cavite', 137, '14.4602022', '120.9605134', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '2015-03-13 05:49:24', '2015-03-13 05:49:24', 1, 'Patricia Executive Village', NULL, NULL, NULL, 'Bacoor, Barangay Mabolo 3,  Bacoor', 'Cavite', 137, '14.4602022', '120.9605134', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, '2015-03-18 09:11:31', '2015-03-18 09:11:31', 4, 'Ming Bistro & Bar', 'https://www.facebook.com/pages/Ming-Bistro-Cafe/322017847883007', NULL, '+632 9014425 ; +6391', 'G/F PSE Tower, Exchange Road, Ortigas Center', 'Pasig City', 137, '14.5829527', '121.0624681', 'Opening Soon', NULL, NULL, NULL, '3', 1, NULL),
(12, '2015-03-19 04:40:14', '2015-03-19 04:40:14', 5, 'Teddy''s Bigger Burgers', '', NULL, '+6327283056', 'Ayala Centre, Makati Avenue', 'Makati City', 137, '14.5592187', '121.0266472', 'Opening Soon', NULL, NULL, NULL, '4', 1, NULL),
(13, '2015-03-19 05:33:45', '2015-03-19 05:33:45', 5, 'PinPin Restaurant', 'www.pinpinrestaurant.com', NULL, '604-322-3086', '6113 Fraser Street', 'Vancouver, BC  ', 31, '49.2289761', '-123.0909249', 'Opening Soon', NULL, NULL, NULL, '4', 1, NULL),
(14, '2015-03-20 04:21:28', '2015-03-20 04:21:28', 5, 'Astoria Boracay', 'www.astoriaboracay.com', NULL, '+63 36 288 1111', 'Station 1, Boracay Island', 'Malay, Aklan', 137, NULL, NULL, 'Opening Soon', NULL, NULL, NULL, '3', NULL, NULL),
(15, '2015-03-20 04:31:50', '2015-03-20 04:31:50', 5, 'UCC Viena Cafe', '', NULL, '+63 2 757 0740', 'Greenbelt 5', 'Makati City', 137, '14.5530932', '121.0215992', 'Opening Soon', NULL, NULL, NULL, '4', NULL, NULL),
(16, '2015-03-22 18:52:31', '2015-03-22 18:52:31', 3, 'Business Name', 'website.com', NULL, '2222222', '123 somewhere down there', 'of this city', 10, NULL, NULL, 'Opening Soon', NULL, NULL, NULL, '', 1, NULL),
(17, '2015-03-30 05:46:13', '2015-03-30 05:46:13', 1, 'Porsche Center Philippines', 'http://www.porsche.com/pap/_philippines_/aboutporsche/importers/', NULL, '6327270943', '201 EDSA', 'Mandaluyong City ', 137, '14.5764833', '121.0500559', 'Opening Soon', NULL, NULL, NULL, 'on', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_categories`
--

CREATE TABLE IF NOT EXISTS `business_categories` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `main_title` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `sub_title` varchar(100) NOT NULL,
  `unique_word` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1172 ;

--
-- Dumping data for table `business_categories`
--

INSERT INTO `business_categories` (`id`, `created`, `modified`, `user_id`, `main_title`, `title`, `sub_title`, `unique_word`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', '', '', 'active'),
(2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'ATV Rentals/Tours', '', 'atvrentals'),
(3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Amateur Sports Teams', '', 'amateursportsteams'),
(4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Amusement Parks', '', 'amusementparks'),
(5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Aquariums', '', 'aquariums'),
(6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Archery', '', 'archery'),
(7, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Badminton', '', 'badminton'),
(8, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Basketball Courts', '', 'basketballcourts'),
(9, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Bathing Area', '', 'bathing_area'),
(10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Batting Cages', '', 'battingcages'),
(11, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Beach Volleyball', '', 'beachvolleyball'),
(12, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Beaches', '', 'beaches'),
(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Bicycle Paths', '', 'bicyclepaths'),
(14, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Bike Rentals', '', 'bikerentals'),
(15, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Boating', '', 'boating'),
(16, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Bowling', '', 'bowling'),
(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Bungee Jumping', '', 'bungeejumping'),
(18, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Challenge Courses', '', 'challengecourses'),
(19, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Climbing', '', 'climbing'),
(20, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Cycling Classes', '', 'cyclingclasses'),
(21, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Day Camps', '', 'daycamps'),
(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Disc Golf', '', 'discgolf'),
(23, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Diving', '', 'diving'),
(24, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Diving', 'Free Diving', 'freediving'),
(25, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Diving', 'Scuba Diving', 'scuba'),
(26, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Experiences', '', 'experiences'),
(27, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fencing Clubs', '', 'fencing'),
(28, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fishing', '', 'fishing'),
(29, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', '', 'fitness'),
(30, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Barre Classes', 'barreclasses'),
(31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Boot Camps', 'bootcamps'),
(32, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Boxing', 'boxing'),
(33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Dance Studios', 'dancestudio'),
(34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Gyms', 'gyms'),
(35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Martial Arts', 'martialarts'),
(36, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Meditation Centers', 'meditationcenters'),
(37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Pilates', 'pilates'),
(38, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Swimming Lessons/Schools', 'swimminglessons'),
(39, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Tai Chi', 'taichi'),
(40, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Trainers', 'healthtrainers'),
(41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Fitness & Instruction', 'Yoga', 'yoga'),
(42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Flyboarding', '', 'flyboarding'),
(43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Gliding', '', 'gliding'),
(44, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Go Karts', '', 'gokarts'),
(45, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Golf', '', 'golf'),
(46, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Gun/Rifle Ranges', '', 'gun_ranges'),
(47, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Gymnastics', '', 'gymnastics'),
(48, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Hang Gliding', '', 'hanggliding'),
(49, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Hiking', '', 'hiking'),
(50, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Horse Racing', '', 'horseracing'),
(51, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Horseback Riding', '', 'horsebackriding'),
(52, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Hot Air Balloons', '', 'hot_air_balloons'),
(53, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Indoor Playcentre', '', 'indoor_playcenter'),
(54, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Jet Skis', '', 'jetskis'),
(55, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Kids Activities', '', 'kids_activities'),
(56, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Kiteboarding', '', 'kiteboarding'),
(57, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Lakes', '', 'lakes'),
(58, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Laser Tag', '', 'lasertag'),
(59, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Lawn Bowling', '', 'lawn_bowling'),
(60, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Leisure Centers', '', 'leisure_centers'),
(61, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Mini Golf', '', 'mini_golf'),
(62, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Mountain Biking', '', 'mountainbiking'),
(63, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Nudist', '', 'nudist'),
(64, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Paddleboarding', '', 'paddleboarding'),
(65, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Paintball', '', 'paintball'),
(66, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Parks', '', 'parks'),
(67, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Parks', 'Dog Parks', 'dog_parks'),
(68, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Parks', 'Skate Parks', 'skate_parks'),
(69, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Playgrounds', '', 'playgrounds'),
(70, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Public Plazas', '', 'publicplazas'),
(71, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Rafting/Kayaking', '', 'rafting'),
(72, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Recreation Centers', '', 'recreation'),
(73, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Rock Climbing', '', 'rock_climbing'),
(74, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Sailing', '', 'sailing'),
(75, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Skating Rinks', '', 'skatingrinks'),
(76, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Skiing', '', 'skiing'),
(77, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Skydiving', '', 'skydiving'),
(78, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Sledding', '', 'sledding'),
(79, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Soccer', '', 'football'),
(80, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Spin Classes', '', 'spinclasses'),
(81, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Sport Equipment Hire', '', 'sport_equipment_hire'),
(82, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Sports Clubs', '', 'sports_clubs'),
(83, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Squash', '', 'squash'),
(84, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Summer Camps', '', 'summer_camps'),
(85, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Surf Lifesaving', '', 'surflifesaving'),
(86, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Surfing', '', 'surfing'),
(87, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Swimming Pools', '', 'swimmingpools'),
(88, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Tennis', '', 'tennis'),
(89, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Trampoline Parks', '', 'trampoline'),
(90, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Tubing', '', 'tubing'),
(91, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Volleyball', '', 'volleyball'),
(92, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Wildlife Hunting Ranges', '', 'wildlifehunting'),
(93, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Zoos', '', 'zoos'),
(94, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Active Life', 'Zorbing', '', 'zorbing'),
(95, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', '', '', 'arts'),
(96, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Arcades', '', 'arcades'),
(97, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Art Galleries', '', 'galleries'),
(98, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Betting Centers', '', 'bettingcenters'),
(99, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Bingo Halls', '', 'bingo'),
(100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Botanical Gardens', '', 'gardens'),
(101, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Cabaret', '', 'cabaret'),
(102, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Casinos', '', 'casinos'),
(103, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Castles', '', 'castles'),
(104, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Choirs', '', 'choirs'),
(105, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Cinema', '', 'movietheaters'),
(106, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Country Clubs', '', 'countryclubs'),
(107, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Cockfighting Arena', '', 'cockarena'),
(108, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Cultural Center', '', 'culturalcenter'),
(109, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', '', 'festivals'),
(110, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'Ati-atihan', 'atiatihan'),
(111, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'Christmas Markets', 'xmasmarkets'),
(112, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'Dinagyang', 'dinagyang'),
(113, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'Fun Fair', 'funfair'),
(114, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'General Festivals', 'generalfestivals'),
(115, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'MassKara', 'masskara'),
(116, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'Moriones', 'moriones'),
(117, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'Panagbenga', 'panagbenga'),
(118, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'Sinulog', 'sinulog'),
(119, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Festivals', 'Trade Fairs', 'tradefairs'),
(120, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Greenhills Tiangge', '', 'greentiangge'),
(122, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Mah Jong Halls', '', 'mahjong'),
(123, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Marching Bands', '', 'marchingbands'),
(124, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Museums', '', 'museums'),
(126, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Observatories', '', 'observatories'),
(127, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Opera & Ballet', '', 'opera'),
(128, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Pachinko', '', 'pachinko'),
(129, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Paint & Sip', '', 'paintandsip'),
(130, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Performing Arts', '', 'theater'),
(131, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Planetarium', '', 'planetarium'),
(132, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Professional Sports Teams', '', 'sportsteams'),
(133, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Psychics & Astrologers', '', 'psychic_astrology'),
(134, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Race Tracks', '', 'racetracks'),
(135, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Social Clubs', '', 'social_clubs'),
(136, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Stadiums & Arenas', '', 'stadiumsarenas'),
(137, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Street Art', '', 'streetart'),
(138, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Tablao Flamenco', '', 'tablaoflamenco'),
(139, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Arts & Entertainment', 'Ticket Sales', '', 'ticketsales'),
(141, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', '', '', 'auto'),
(142, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Aircraft Dealers', '', 'aircraftdealers'),
(143, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Auto Customization', '', 'autocustomization'),
(144, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Auto Detailing', '', 'auto_detailing'),
(145, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Auto Electric Services', '', 'autoelectric'),
(146, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Auto Glass Services', '', 'autoglass'),
(147, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Auto Loan Providers', '', 'autoloanproviders'),
(148, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Auto Parts & Supplies', '', 'autopartssupplies'),
(149, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Auto Repair', '', 'autorepair'),
(150, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Boat Dealers', '', 'boatdealers'),
(151, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Body Shops', '', 'bodyshops'),
(152, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Car Buyers', '', 'carbuyers'),
(153, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Car Dealers', '', 'car_dealers'),
(154, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Car Inspectors', '', 'autodamageassessment'),
(155, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Car Share Services', '', 'carshares'),
(156, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Car Stereo Installation', '', 'stereo_installation'),
(157, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Car Wash', '', 'carwash'),
(158, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Gas & Service Stations', '', 'servicestations'),
(159, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Mobile Dent Repair', '', 'mobiledentrepair'),
(160, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Motorcycle Dealers', '', 'motorcycledealers'),
(161, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Motorcycle Repair', '', 'motorcyclerepair'),
(162, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Oil Change Stations', '', 'oilchange'),
(163, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Parking', '', 'parking'),
(164, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'RV Dealers', '', 'rv_dealers'),
(165, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'RV Repair', '', 'rvrepair'),
(166, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Registration Services', '', 'registrationservices'),
(167, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Smog Check Stations', '', 'smog_check_stations'),
(168, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Tires', '', 'tires'),
(169, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Towing', '', 'towing'),
(170, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Truck Rental', '', 'truck_rental'),
(171, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Vehicle Shipping', '', 'vehicleshipping'),
(172, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Wheel & Rim Repair', '', 'wheelrimrepair'),
(173, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Automotive', 'Windshield Installation & Repair', '', 'windshieldinstallrepair'),
(174, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', '', '', 'beautysvc'),
(175, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Barbers', '', 'barbers'),
(176, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Cosmetics & Beauty Supply', '', 'cosmetics'),
(177, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Day Spas', '', 'spas'),
(178, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Erotic Massage', '', 'eroticmassage'),
(179, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Eyelash Service', '', 'eyelashservice'),
(181, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Loss Centers', '', 'hairloss'),
(182, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Removal', '', 'hairremoval'),
(183, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Removal', 'Laser Hair Removal', 'laser_hair_removal'),
(184, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Removal', 'Sugaring', 'sugaring'),
(185, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Removal', 'Threadering', 'threadering'),
(186, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Removal', 'Waxing', 'waxing'),
(187, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Salons', '', 'hair'),
(188, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Salons', 'Blow Dry/Out Services', 'blowoutservices'),
(189, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Salons', 'Hair Extensions', 'hair_extensions'),
(190, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Salons', 'Hair Stylists', 'hairstylists'),
(191, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Hair Salons', 'Men''s Hair Salons', 'menshair'),
(192, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Makeup Artists', '', 'makeupartists'),
(193, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Massage', '', 'massage'),
(195, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Nail Salons', '', 'othersalons'),
(196, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Perfume', '', 'perfume'),
(197, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Permanent Makeup', '', 'permanentmakeup'),
(198, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Piercing', '', 'piercing'),
(199, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Rolfing', '', 'rolfing'),
(200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Skin Care', '', 'skincare'),
(201, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Tanning', '', 'tanning'),
(202, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Tanning', 'Spray Tanning', 'spraytanning'),
(203, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Tanning', 'Tanning Beds', 'tanningbeds'),
(204, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Beauty & Spas', 'Tattoo', '', 'tattoo'),
(205, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Bicycles', '', '', 'bicycles'),
(206, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Bicycles', 'Bike Associations', '', 'bikeassociations'),
(207, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Bicycles', 'Bike Repair', '', 'bikerepair'),
(208, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Bicycles', 'Bike Shop', '', 'bikeshop'),
(209, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Bicycles', 'Special Bikes', '', 'specialbikes'),
(210, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', '', '', 'education'),
(211, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Adult Education', '', 'adultedu'),
(212, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Art Classes', '', 'artclasses'),
(213, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'College Counseling', '', 'collegecounseling'),
(214, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Colleges & Universities', '', 'collegeuniv'),
(215, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Educational Services', '', 'educationservices'),
(216, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Elementary Schools', '', 'elementaryschools'),
(217, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Middle Schools & High Schools', '', 'highschools'),
(218, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Preschools', '', 'preschools'),
(219, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Private Schools', '', 'privateschools'),
(220, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Private Tutors', '', 'privatetutors'),
(221, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Religious Schools', '', 'religiousschools'),
(222, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Special Education', '', 'specialed'),
(223, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', '', 'specialtyschools'),
(224, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Art Schools', 'artschools'),
(225, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Bartending Schools', 'bartendingschools'),
(226, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'CPR Classes', 'cprclasses'),
(227, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Circus Schools', 'circusschools'),
(228, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Cooking Schools', 'cookingschools'),
(229, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Cosmetology Schools', 'cosmetology_schools'),
(230, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Dance Schools', 'dance_schools'),
(231, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Driving Schools', 'driving_schools'),
(232, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Firearm Training', 'firearmtraining'),
(233, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'First Aid Classes', 'firstaidclasses'),
(234, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Flight Instruction', 'flightinstruction'),
(235, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Food Safety Training', 'foodsafety'),
(236, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Language Schools', 'language_schools'),
(237, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Massage Schools', 'massage_schools'),
(238, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Nursing Schools', 'nursingschools'),
(239, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Parenting Classes', 'parentingclasses'),
(240, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Pole Dancing Classes', 'poledancingclasses'),
(241, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Samba Schools', 'sambaschools'),
(242, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Ski Schools', 'skischools'),
(244, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Specialty Schools', 'Vocational & Technical School', 'vocation'),
(245, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Test Preparation', '', 'testprep'),
(246, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Education', 'Tutoring Centers', '', 'tutoring'),
(247, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', '', '', 'eventservices'),
(248, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Bartenders', '', 'bartenders'),
(249, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Boat Charters', '', 'boatcharters'),
(251, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Caterers', '', 'catering'),
(252, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Clowns', '', 'clowns'),
(253, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'DJs', '', 'djs'),
(254, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Face Painting', '', 'facepainting'),
(261, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Magicians', '', 'magicians'),
(262, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Mohels', '', 'mohels'),
(263, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Musicians', '', 'musicians'),
(264, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Officiants', '', 'officiants'),
(265, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Party & Event Planning', '', 'eventplanning'),
(266, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Party Bike Rentals', '', 'partybikerentals'),
(267, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Party Bus Rentals', '', 'partybusrentals'),
(268, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Party Equipment Rentals', '', 'partyequipmentrentals'),
(269, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Party Supplies', '', 'partysupplies'),
(270, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Personal Chefs', '', 'personalchefs'),
(271, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Photo Booth Rentals', '', 'photoboothrentals'),
(272, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Photographers', '', 'photographers'),
(273, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Photographers', 'Event Photography', 'eventphotography'),
(274, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Photographers', 'Session Photography', 'sessionphotography'),
(275, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Trivia Hosts', '', 'triviahosts'),
(276, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Valet Services', '', 'valetservices'),
(277, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Venues & Event Spaces', '', 'venues'),
(278, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Videographers', '', 'videographers'),
(279, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Event Planning & Services', 'Wedding Planning', '', 'wedding_planning'),
(280, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', '', '', 'financialservices'),
(281, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', 'Banks & Credit Unions', '', 'banks'),
(282, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', 'Check Cashing/Pay-day Loans', '', 'paydayloans'),
(283, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', 'Currency Exchange', '', 'currencyexchange'),
(284, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', 'Debt Relief Services', '', 'debtrelief'),
(285, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', 'Financial Advising', '', 'financialadvising'),
(286, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', 'Insurance', '', 'insurance'),
(287, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', 'Investing', '', 'investing'),
(288, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Financial Services', 'Tax Services', '', 'taxservices'),
(289, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', '', '', 'food'),
(290, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Bagels', '', 'bagels'),
(291, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Bakeries', '', 'bakeries'),
(292, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Beer, Wine & Spirits', '', 'beer_and_wine'),
(293, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Beverage Store', '', 'beverage_stores'),
(294, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Breweries', '', 'breweries'),
(295, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Bubble Tea', '', 'bubbletea'),
(296, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Butcher', '', 'butcher'),
(297, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'CSA', '', 'csa'),
(298, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Churros', '', 'churros'),
(299, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Coffee & Tea', '', 'coffee'),
(300, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Coffee & Tea Supplies', '', 'coffeeteasupplies'),
(301, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Convenience Stores', '', 'convenience'),
(302, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Cupcakes', '', 'cupcakes'),
(303, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Delicatessen', '', 'delicatessen'),
(304, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Desserts', '', 'desserts'),
(305, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Distilleries', '', 'distilleries'),
(306, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Do-It-Yourself Food', '', 'diyfood'),
(307, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Donairs', '', 'donairs'),
(308, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Donuts', '', 'donuts'),
(309, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Ethic Grocery', '', 'ethicgrocery'),
(310, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Ethnic Grocery', '', 'ethnicgrocery'),
(311, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Farmers Market', '', 'farmersmarket'),
(312, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Fishmonger', '', 'fishmonger'),
(313, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Food Delivery Services', '', 'fooddeliveryservices'),
(314, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Food Trucks', '', 'foodtrucks'),
(315, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Friterie', '', 'friterie'),
(316, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Gelato', '', 'gelato'),
(317, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Grocery', '', 'grocery'),
(318, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Hawker Centre', '', 'hawkercentre'),
(319, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Honey', '', 'honey'),
(320, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Ice Cream & Frozen Yogurt', '', 'icecream'),
(321, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Internet Cafes', '', 'internetcafe'),
(322, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Japanese Sweets', '', 'jpsweets'),
(323, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Juice Bars & Smoothies', '', 'juicebars'),
(325, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Milkshake Bars', '', 'milkshakebars'),
(326, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Mulled Wine', '', 'gluhwein'),
(327, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Organic Stores', '', 'organic_stores'),
(328, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Panzerotti', '', 'panzerotti'),
(330, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Patisserie/Cake Shop', '', 'cakeshop'),
(331, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Piadina', '', 'piadina'),
(332, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Pretzels', '', 'pretzels'),
(333, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Salumerie', '', 'salumerie'),
(334, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Shaved Ice', '', 'shavedice'),
(335, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', '', 'gourmet'),
(336, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Candy Stores', 'candy'),
(337, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Cheese Shops', 'cheese'),
(338, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Chocolatiers & Shops', 'chocolate'),
(339, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Ethnic Food', 'ethnicmarkets'),
(340, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Fruits & Veggies', 'markets'),
(341, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Health Markets', 'healthmarkets'),
(342, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Herbs & Spices', 'herbsandspices'),
(343, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Meat Shops', 'meats'),
(344, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Pasta Shops', 'pastashops'),
(345, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Seafood Markets', 'seafoodmarkets'),
(346, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Specialty Food', 'Tofu Shops', 'tofu'),
(347, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Street Vendors', '', 'streetvendors'),
(348, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Tea Rooms', '', 'tea'),
(349, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Wineries', '', 'wineries'),
(350, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Food', 'Zapiekanka', '', 'zapiekanka'),
(351, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', '', '', 'health'),
(352, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Acupuncture', '', 'acupuncture'),
(353, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Cannabis Clinics', '', 'cannabis_clinics'),
(354, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Chiropractors', '', 'chiropractors'),
(355, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Counseling & Mental Health', '', 'c_and_mh'),
(356, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Counseling & Mental Health', 'Psychoanalysts', 'psychoanalysts'),
(357, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Counseling & Mental Health', 'Psychologists', 'psychologists'),
(358, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Counseling & Mental Health', 'Psychotherapists', 'psychotherapists'),
(359, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Counseling & Mental Health', 'Sex Therapists', 'sextherapists'),
(360, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Counseling & Mental Health', 'Sports Psychologists', 'sportspsychologists'),
(361, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dental Hygienists', '', 'dentalhygienists'),
(362, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dental Hygienists', 'Mobile Clinics', 'dentalhygienistsmobile'),
(363, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dental Hygienists', 'Storefront Clinics', 'dentalhygeiniststorefront'),
(364, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dentists', '', 'dentists'),
(365, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dentists', 'Cosmetic Dentists', 'cosmeticdentists'),
(366, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dentists', 'Endodontists', 'endodontists'),
(367, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dentists', 'General Dentistry', 'generaldentistry'),
(368, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dentists', 'Oral Surgeons', 'oralsurgeons'),
(369, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dentists', 'Orthodontists', 'orthodontists'),
(370, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dentists', 'Pediatric Dentists', 'pediatric_dentists'),
(371, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Dentists', 'Periodontists', 'periodontists'),
(372, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Diagnostic Services', '', 'diagnosticservices'),
(373, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Diagnostic Services', 'Diagnostic Imaging', 'diagnosticimaging'),
(374, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Diagnostic Services', 'Laboratory Testing', 'laboratorytesting'),
(375, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', '', 'physicians'),
(376, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Allergists', 'allergist'),
(377, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Anesthesiologists', 'anesthesiologists'),
(378, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Audiologist', 'audiologist'),
(379, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Cardiologists', 'cardiology'),
(380, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Cosmetic Surgeons', 'cosmeticsurgeons'),
(381, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Dermatologists', 'dermatology'),
(382, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Ear Nose & Throat', 'earnosethroat'),
(383, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Endocrinologists', 'endocrinologists'),
(384, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Family Practice', 'familydr'),
(385, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Fertility', 'fertility'),
(386, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Gastroenterologist', 'gastroenterologist'),
(387, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Gerontologists', 'gerontologist'),
(388, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Internal Medicine', 'internalmed'),
(389, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Naturopathic/Holistic', 'naturopathic'),
(390, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Neurologist', 'neurologist'),
(391, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Obstetricians & Gynecologists', 'obgyn'),
(392, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Oncologist', 'oncologist'),
(393, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Ophthalmologists', 'opthamalogists'),
(394, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Orthopedists', 'orthopedists'),
(395, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Osteopathic Physicians', 'osteopathicphysicians'),
(396, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Pediatricians', 'pediatricians'),
(397, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Podiatrists', 'podiatrists'),
(398, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Proctologists', 'proctologist'),
(399, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Psychiatrists', 'psychiatrists'),
(400, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Pulmonologist', 'pulmonologist'),
(401, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Radiologists', 'radiologists'),
(402, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Rheumatologists', 'rhematologists'),
(403, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Sports Medicine', 'sportsmed'),
(404, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Surgeons', 'surgeons'),
(405, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Tattoo Removal', 'tattooremoval'),
(406, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doctors', 'Urologists', 'urologists'),
(407, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Doulas', '', 'doulas'),
(408, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Emergency Rooms', '', 'emergencyrooms'),
(409, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Health Insurance Offices', '', 'healthinsurance'),
(410, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Hearing Aid Providers', '', 'hearingaidproviders'),
(411, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Hearing Aids', '', 'hearing_aids'),
(412, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Home Health Care', '', 'homehealthcare'),
(413, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Hospice', '', 'hospice'),
(414, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Hospitals', '', 'hospitals'),
(415, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Hypnosis/Hypnotherapy', '', 'hypnosis'),
(416, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Lactation Services', '', 'lactationservices'),
(417, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Laser Eye Surgery/Lasik', '', 'laserlasikeyes'),
(418, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Lice Services', '', 'liceservices'),
(419, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Massage Therapy', '', 'massage_therapy'),
(420, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Medical Centers', '', 'medcenters'),
(421, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Medical Centers', 'Bulk Billing', 'bulkbilling'),
(422, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Medical Centers', 'Osteopaths', 'osteopaths'),
(423, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Medical Centers', 'Walk-in Clinics', 'walkinclinics'),
(424, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Medical Foot Care', '', 'medicalfoot'),
(425, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Medical Spas', '', 'medicalspa'),
(426, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Medical Transportation', '', 'medicaltransportation'),
(427, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Midwives', '', 'midwives'),
(428, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Nurse Practitioner', '', 'nursepractitioner'),
(429, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Nutritionists', '', 'nutritionists'),
(430, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Occupational Therapy', '', 'occupationaltherapy'),
(431, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Optometrists', '', 'optometrists'),
(432, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Orthotics', '', 'orthotics'),
(433, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Pharmacy', '', 'pharmacy'),
(434, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Physical Therapy', '', 'physicaltherapy'),
(435, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Prosthetics', '', 'prosthetics'),
(436, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Reflexology', '', 'reflexology'),
(437, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Rehabilitation Center', '', 'rehabilitation_center'),
(438, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Reiki', '', 'reiki'),
(439, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Retirement Homes', '', 'retirement_homes'),
(440, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Saunas', '', 'saunas'),
(441, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Sleep Specialists', '', 'sleepspecialists'),
(442, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Speech Therapists', '', 'speech_therapists'),
(443, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Traditional Chinese Medicine', '', 'tcm'),
(444, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Urgent Care', '', 'urgent_care'),
(445, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Health & Medical', 'Weight Loss Centers', '', 'weightlosscenters'),
(446, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', '', '', 'homeservices'),
(447, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Building Supplies', '', 'buildingsupplies'),
(448, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Cabinetry', '', 'cabinetry'),
(449, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Carpenters', '', 'carpenters'),
(450, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Carpet Installation', '', 'carpetinstallation'),
(451, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Carpeting', '', 'carpeting'),
(452, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Chimney Sweeps', '', 'chimneysweeps'),
(453, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Contractors', '', 'contractors'),
(454, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Damage Restoration', '', 'damagerestoration'),
(455, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Door Sales/Installation', '', 'doorsales'),
(456, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Drywall Installation & Repair', '', 'drywall'),
(457, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Electricians', '', 'electricians'),
(458, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Fences & Gates', '', 'fencesgates'),
(459, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Fire Protection Services', '', 'fireprotection'),
(460, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Fireplace Services', '', 'fireplace'),
(461, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Firewood', '', 'firewood'),
(462, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Flooring', '', 'flooring'),
(463, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Furniture Assembly', '', 'furnitureassembly'),
(464, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Garage Door Services', '', 'garage_door_services'),
(465, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Gardeners', '', 'gardeners'),
(466, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Glass & Mirrors', '', 'glassandmirrors'),
(467, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Gutter Services', '', 'gutterservices');
INSERT INTO `business_categories` (`id`, `created`, `modified`, `user_id`, `main_title`, `title`, `sub_title`, `unique_word`) VALUES
(468, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Handyman', '', 'handyman'),
(469, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Heating & Air Conditioning/HVAC', '', 'hvac'),
(470, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Home Automation', '', 'homeautomation'),
(471, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Home Cleaning', '', 'homecleaning'),
(472, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Home Inspectors', '', 'home_inspectors'),
(473, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Home Organization', '', 'home_organization'),
(474, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Home Theatre Installation', '', 'hometheatreinstallation'),
(475, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Home Window Tinting', '', 'homewindowtinting'),
(476, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Insulation Installation', '', 'insulationinstallation'),
(477, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Interior Design', '', 'interiordesign'),
(479, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Irrigation', '', 'irrigation'),
(480, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Keys & Locksmiths', '', 'locksmiths'),
(481, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Landscape Architects', '', 'landscapearchitects'),
(482, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Landscaping', '', 'landscaping'),
(483, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Lighting Fixtures & Equipment', '', 'lighting'),
(484, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Masonry/Concrete', '', 'masonry_concrete'),
(485, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Movers', '', 'movers'),
(486, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Painters', '', 'painters'),
(487, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Plumbing', '', 'plumbing'),
(488, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Pool & Hot Tub Service', '', 'poolservice'),
(489, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Pool Cleaners', '', 'poolcleaners'),
(490, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Pressure Washers', '', 'pressurewashers'),
(505, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Refinishing Services', '', 'refinishing'),
(506, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Roofing', '', 'roofing'),
(507, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Security Systems', '', 'securitysystems'),
(508, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Shades & Blinds', '', 'blinds'),
(509, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Shutters', '', 'shutters'),
(510, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Solar Installation', '', 'solarinstallation'),
(511, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Structural Engineers', '', 'structuralengineers'),
(512, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Stucco Services', '', 'stucco'),
(513, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Television Service Providers', '', 'televisionserviceproviders'),
(514, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Tree Services', '', 'treeservices'),
(515, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Utilities', '', 'utilities'),
(516, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Water Purification Services', '', 'waterpurification'),
(517, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Window Washing', '', 'windowwashing'),
(518, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Home Services', 'Windows Installation', '', 'windowsinstallation'),
(519, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', '', '', 'hotelstravel'),
(520, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Airports', '', 'airports'),
(521, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Bed & Breakfast', '', 'bedbreakfast'),
(522, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Campgrounds', '', 'campgrounds'),
(523, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Car Rental', '', 'carrental'),
(524, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Guest Houses', '', 'guesthouses'),
(525, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Health Retreats', '', 'healthretreats'),
(526, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Hostels', '', 'hostels'),
(527, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Hotels', '', 'hotels'),
(528, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Hotels', 'Agriturismi', 'agriturismi'),
(529, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Hotels', 'Condotels', 'condotels'),
(530, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Hotels', 'Mountain Huts', 'mountainhuts'),
(531, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Hotels', 'Pensions', 'pensions'),
(532, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Hotels', 'Residences', 'residences'),
(533, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Hotels', 'Rest Stops', 'reststops'),
(534, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Motorcycle Rental', '', 'motorcycle_rental'),
(535, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'RV Parks', '', 'rvparks'),
(536, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'RV Rental', '', 'rvrental'),
(537, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Resorts', '', 'resorts'),
(538, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Ski Resorts', '', 'skiresorts'),
(539, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Tours', '', 'tours'),
(540, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Tours', 'Architectural Tours', 'architecturaltours'),
(541, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Tours', 'Art Tours', 'arttours'),
(542, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Tours', 'Bus Tours', 'bustours'),
(543, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Tours', 'Food Tours', 'foodtours'),
(544, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Tours', 'Historical Tours', 'historicaltours'),
(545, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Tours', 'Walking Tours', 'walkingtours'),
(546, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Tours', 'Wine Tours', 'winetours'),
(547, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Train Stations', '', 'trainstations'),
(548, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', '', 'transport'),
(549, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Airlines', 'airlines'),
(550, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Airport Shuttles', 'airport_shuttles'),
(551, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Bike Sharing', 'bikesharing'),
(552, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Buses', 'buses'),
(553, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Dolmus Station', 'dolmusstation'),
(554, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Ferries', 'ferries'),
(555, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Limos', 'limos'),
(556, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Pedicabs', 'pedicabs'),
(557, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Public Transportation', 'publictransport'),
(558, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Taxis', 'taxis'),
(559, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Trains', 'trains'),
(560, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Transportation', 'Water Taxis', 'watertaxis'),
(561, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Travel Services', '', 'travelservices'),
(562, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Vacation Rental Agents', '', 'vacationrentalagents'),
(563, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Hotels & Travel', 'Vacation Rentals', '', 'vacation_rentals'),
(564, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Flavor', '', '', 'localflavor'),
(565, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Flavor', 'MyBarangay Events', '', 'mybarangayevents'),
(566, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', '', '', 'localservices'),
(567, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Adoption Services', '', 'adoptionservices'),
(568, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Appliances & Repair', '', 'homeappliancerepair'),
(569, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Appraisal Services', '', 'appraisalservices'),
(570, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Bail Bondsmen', '', 'bailbondsmen'),
(571, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Bike Repair/Maintenance', '', 'bike_repair_maintenance'),
(572, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Bookbinding', '', 'bookbinding'),
(573, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Carpet Cleaning', '', 'carpet_cleaning'),
(574, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Child Care & Day Care', '', 'childcare'),
(575, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Community Service/Non-Profit', '', 'nonprofit'),
(576, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Community Service/Non-Profit', 'Food Banks', 'foodbanks'),
(577, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Couriers & Delivery Services', '', 'couriers'),
(578, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Dry Cleaning & Laundry', '', 'drycleaninglaundry'),
(579, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Electronics Repair', '', 'electronicsrepair'),
(580, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Funeral Services & Cemeteries', '', 'funeralservices'),
(581, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Furniture Repair', '', 'furniturerepair'),
(582, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Furniture Reupholstery', '', 'reupholstery'),
(583, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'IT Services & Computer Repair', '', 'itservices'),
(584, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'IT Services & Computer Repair', 'Data Recovery', 'datarecovery'),
(585, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'IT Services & Computer Repair', 'Mobile Phone Repair', 'mobilephonerepair'),
(586, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'IT Services & Computer Repair', 'Telecommunications', 'telecommunications'),
(587, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Internet Booths & Calling Centers', '', 'internetbooth'),
(588, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Jewelry Repair', '', 'jewelryrepair'),
(589, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Junk Removal & Hauling', '', 'junkremovalandhauling'),
(590, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Knife Sharpening', '', 'knifesharpening'),
(591, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Mailbox Centers', '', 'mailboxcenters'),
(592, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Metal Fabricators', '', 'metalfabricators'),
(593, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Musical Instrument Services', '', 'musicinstrumentservices'),
(594, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Musical Instrument Services', 'Guitar Stores', 'guitarstores'),
(595, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Musical Instrument Services', 'Piano Services', 'pianoservices'),
(596, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Musical Instrument Services', 'Piano Stores', 'pianostores'),
(597, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Nanny Services', '', 'nannys'),
(598, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Notaries', '', 'notaries'),
(599, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Pest Control', '', 'pest_control'),
(600, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Powder Coating', '', 'powdercoating'),
(601, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Printing Services', '', 'copyshops'),
(602, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Propane', '', 'propane'),
(603, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Record Labels', '', 'record_labels'),
(604, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Recording & Rehearsal Studios', '', 'recording_studios'),
(605, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Recycling Center', '', 'recyclingcenter'),
(606, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Screen Printing', '', 'screenprinting'),
(607, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Screen Printing/T-Shirt Printing', '', 'screen_printing_tshirt_printing'),
(608, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Self Storage', '', 'selfstorage'),
(609, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Septic Services', '', 'septicservices'),
(610, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Sewing & Alterations', '', 'sewingalterations'),
(611, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Shipping Centers', '', 'shipping_centers'),
(612, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Shoe Repair', '', 'shoerepair'),
(613, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Snow Removal', '', 'snowremoval'),
(614, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Watch Repair', '', 'watch_repair'),
(615, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Water Delivery', '', 'waterdelivery'),
(616, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Local Services', 'Youth Club', '', 'youth_club'),
(617, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Mass Media', '', '', 'massmedia'),
(618, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Mass Media', 'Print Media', '', 'printmedia'),
(619, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Mass Media', 'Radio Stations', '', 'radiostations'),
(620, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Mass Media', 'Television Stations', '', 'televisionstations'),
(621, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', '', '', 'nightlife'),
(622, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Adult Entertainment', '', 'adultentertainment'),
(623, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', '', 'bars'),
(624, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Absinthe Bars', 'absinthebars'),
(625, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Airport Lounges', 'airportlounges'),
(626, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Beach Bars', 'beachbars'),
(627, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Beer Bar', 'beerbar'),
(628, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Champagne Bars', 'champagne_bars'),
(629, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Cocktail Bars', 'cocktailbars'),
(630, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Dive Bars', 'divebars'),
(631, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Gay Bars', 'gaybars'),
(632, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Hookah Bars', 'hookah_bars'),
(633, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Hotel bar', 'hotel_bar'),
(634, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Irish Pub', 'irish_pubs'),
(635, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Lounges', 'lounges'),
(636, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Pubs', 'pubs'),
(637, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Sake Bars', 'sakebars'),
(638, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Sports Bars', 'sportsbars'),
(639, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Bars', 'Wine Bars', 'wine_bars'),
(640, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Beer Gardens', '', 'beergardens'),
(641, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Coffeeshops', '', 'coffeeshops'),
(642, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Comedy Clubs', '', 'comedyclubs'),
(643, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Country Dance Halls', '', 'countrydancehalls'),
(644, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Dance Clubs', '', 'danceclubs'),
(645, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Dance Restaurants', '', 'dancerestaurants'),
(646, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Fasil Music', '', 'fasil'),
(647, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Jazz & Blues', '', 'jazzandblues'),
(648, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Karaoke', '', 'karaoke'),
(649, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Music Venues', '', 'musicvenues'),
(650, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Piano Bars', '', 'pianobars'),
(651, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Nightlife', 'Pool Halls', '', 'poolhalls'),
(652, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', '', '', 'pets'),
(653, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Animal Shelters', '', 'animalshelters'),
(654, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Horse Boarding', '', 'horse_boarding'),
(655, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Pet Adoption', '', 'petadoption'),
(656, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Pet Services', '', 'petservices'),
(657, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Pet Services', 'Aquarium Services', 'aquariumservices'),
(658, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Pet Services', 'Dog Walkers', 'dogwalkers'),
(659, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Pet Services', 'Pet Boarding/Pet Sitting', 'pet_sitting'),
(660, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Pet Services', 'Pet Groomers', 'groomer'),
(661, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Pet Services', 'Pet Training', 'pet_training'),
(662, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Pet Stores', '', 'petstore'),
(663, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Pets', 'Veterinarians', '', 'vet'),
(664, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', '', '', 'professional'),
(665, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Accountants', '', 'accountants'),
(666, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Advertising', '', 'advertising'),
(667, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Architects', '', 'architects'),
(668, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Boat Repair', '', 'boatrepair'),
(669, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Career Counseling', '', 'careercounseling'),
(670, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Editorial Services', '', 'editorialservices'),
(671, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Employment Agencies', '', 'employmentagencies'),
(672, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Graphic Design', '', 'graphicdesign'),
(673, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Internet Service Providers', '', 'isps'),
(674, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', '', 'lawyers'),
(675, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Bankruptcy Law', 'bankruptcy'),
(676, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Business Law', 'businesslawyers'),
(677, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Criminal Defense Law', 'criminaldefense'),
(678, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'DUI Law', 'duilawyers'),
(679, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Divorce & Family Law', 'divorce'),
(680, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Employment Law', 'employmentlawyers'),
(681, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Estate Planning Law', 'estateplanning'),
(682, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'General Litigation', 'general_litigation'),
(683, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'IP & Internet Law', 'iplaw'),
(684, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Immigration Law', 'immigrationlawyers'),
(685, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Personal Injury Law', 'personal_injury'),
(686, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Real Estate Law', 'realestatelawyers'),
(687, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Lawyers', 'Tax Law', 'taxlaw'),
(688, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Legal Services', '', 'legalservices'),
(689, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Life Coach', '', 'lifecoach'),
(690, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Marketing', '', 'marketing'),
(691, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Matchmakers', '', 'matchmakers'),
(692, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Music Production Services', '', 'musicproduction'),
(693, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Office Cleaning', '', 'officecleaning'),
(694, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Patent Law', '', 'patentlaw'),
(695, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Payroll Services', '', 'payroll'),
(696, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Personal Assistants', '', 'personalassistants'),
(697, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Private Investigation', '', 'privateinvestigation'),
(698, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Public Relations', '', 'publicrelations'),
(699, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Security Services', '', 'security'),
(700, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Shredding Services', '', 'shredding'),
(701, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Signmaking', '', 'signmaking'),
(702, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Software Development', '', 'softwaredevelopment'),
(703, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Talent Agencies', '', 'talentagencies'),
(704, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Taxidermy', '', 'taxidermy'),
(705, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Tenant and Eviction Law', '', 'tenantlaw'),
(706, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Translation Services', '', 'translationservices'),
(707, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Video/Film Production', '', 'videofilmproductions'),
(708, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Professional Services', 'Web Design', '', 'web_design'),
(709, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', '', '', 'publicservicesgovt'),
(710, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Authorized Postal Representative', '', 'authorized_postal_representative'),
(711, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Community Centers', '', 'communitycenters'),
(712, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Courthouses', '', 'courthouses'),
(713, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Departments of Motor Vehicles', '', 'departmentsofmotorvehicles'),
(714, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Embassy', '', 'embassy'),
(715, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Fire Departments', '', 'firedepartments'),
(716, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Landmarks & Historical Buildings', '', 'landmarks'),
(717, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Libraries', '', 'libraries'),
(718, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Police Departments', '', 'policedepartments'),
(719, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Post Offices', '', 'postoffices'),
(720, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Registry Office', '', 'registry_office'),
(721, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Public Services & Government', 'Tax Office', '', 'taxoffice'),
(722, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', '', '', 'realestate'),
(723, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Apartments', '', 'apartments'),
(724, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Art Space Rentals', '', 'artspacerentals'),
(725, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Commercial Real Estate', '', 'commercialrealestate'),
(726, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Estate Liquidation', '', 'estateliquidation'),
(727, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Home Staging', '', 'homestaging'),
(728, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Kitchen Incubators', '', 'kitchenincubators'),
(729, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Mobile Home Dealers', '', 'mobilehomes'),
(730, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Mortgage Brokers', '', 'mortgagebrokers'),
(731, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Property Management', '', 'propertymgmt'),
(732, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Real Estate Agents', '', 'realestateagents'),
(733, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Real Estate Services', '', 'realestatesvcs'),
(734, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'Shared Office Spaces', '', 'sharedofficespaces'),
(735, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Real Estate', 'University Housing', '', 'university_housing'),
(736, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Religious Organizations', '', '', 'religiousorgs'),
(737, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Religious Organizations', 'Buddhist Temples', '', 'buddhist_temples'),
(738, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Religious Organizations', 'Churches', '', 'churches'),
(739, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Religious Organizations', 'Hindu Temples', '', 'hindu_temples'),
(740, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Religious Organizations', 'Mosques', '', 'mosques'),
(741, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Religious Organizations', 'Shrines', '', 'shrines'),
(742, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Religious Organizations', 'Synagogues', '', 'synagogues'),
(743, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', '', '', 'restaurants'),
(744, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Afghan', '', 'afghani'),
(745, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'African', '', 'african'),
(746, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'African', 'Senegalese', 'senegalese'),
(747, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'African', 'South African', 'southafrican'),
(748, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'American (New)', '', 'newamerican'),
(749, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'American (Traditional)', '', 'tradamerican'),
(750, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Arabian', '', 'arabian'),
(751, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Arabian', 'Arab Pizza', 'arabpizza'),
(752, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Argentine', '', 'argentine'),
(753, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Armenian', '', 'armenian'),
(754, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Asian Fusion', '', 'asianfusion'),
(755, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Asturian', '', 'asturian'),
(756, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Australian', '', 'australian'),
(757, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Austrian', '', 'austrian'),
(758, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Baguettes', '', 'baguettes'),
(759, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Bangladeshi', '', 'bangladeshi'),
(760, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Barbeque', '', 'bbq'),
(761, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Basque', '', 'basque'),
(762, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Bavarian', '', 'bavarian'),
(763, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Beer Garden', '', 'beergarden'),
(764, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Beer Hall', '', 'beerhall'),
(765, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Beisl', '', 'beisl'),
(766, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Belgian', '', 'belgian'),
(767, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Belgian', 'Flemish', 'flemish'),
(768, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Bistros', '', 'bistros'),
(769, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Black Sea', '', 'blacksea'),
(770, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Brasseries', '', 'brasseries'),
(771, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Brazilian', '', 'brazilian'),
(772, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Brazilian', 'Brazilian Empanadas', 'brazilianempanadas'),
(773, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Brazilian', 'Central Brazilian', 'centralbrazilian'),
(774, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Brazilian', 'Northeastern Brazilian', 'northeasternbrazilian'),
(775, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Brazilian', 'Northern Brazilian', 'northernbrazilian'),
(776, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Brazilian', 'Rodizios', 'rodizios'),
(777, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Breakfast & Brunch', '', 'breakfast_brunch'),
(778, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'British', '', 'british'),
(779, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Buffets', '', 'buffets'),
(780, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Bulgarian', '', 'bulgarian'),
(781, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Burgers', '', 'burgers'),
(782, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Burmese', '', 'burmese'),
(783, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Cafes', '', 'cafes'),
(784, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Cafeteria', '', 'cafeteria'),
(785, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Cajun/Creole', '', 'cajun'),
(786, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Cambodian', '', 'cambodian'),
(787, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Canadian', '', 'New (newcanadian'),
(788, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Canteen', '', 'canteen'),
(789, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Caribbean', '', 'caribbean'),
(790, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Caribbean', 'Dominican', 'dominican'),
(791, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Caribbean', 'Haitian', 'haitian'),
(792, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Caribbean', 'Puerto Rican', 'puertorican'),
(793, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Caribbean', 'Trinidadian', 'trinidadian'),
(794, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Catalan', '', 'catalan'),
(795, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chech', '', 'chech'),
(796, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Cheesesteaks', '', 'cheesesteaks'),
(797, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chicken Shop', '', 'chickenshop'),
(798, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chicken Wings', '', 'chicken_wings'),
(799, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chilean', '', 'chilean'),
(800, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', '', 'chinese'),
(801, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Cantonese', 'cantonese'),
(802, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Congee', 'congee'),
(803, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Dim Sum', 'dimsum'),
(804, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Fuzhou', 'fuzhou'),
(805, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Hakka', 'hakka'),
(806, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Henghwa', 'henghwa'),
(807, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Hokkien', 'hokkien'),
(808, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Hunan', 'hunan'),
(809, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Pekinese', 'pekinese'),
(810, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Shanghainese', 'shanghainese'),
(811, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Szechuan', 'szechuan'),
(812, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Chinese', 'Teochew', 'teochew'),
(813, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Comfort Food', '', 'comfortfood'),
(814, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Corsican', '', 'corsican'),
(815, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Creperies', '', 'creperies'),
(816, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Cuban', '', 'cuban'),
(817, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Curry Sausage', '', 'currysausage'),
(818, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Cypriot', '', 'cypriot'),
(819, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Czech', '', 'czech'),
(820, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Czech/Slovakian', '', 'czechslovakian'),
(821, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Danish', '', 'danish'),
(822, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Delis', '', 'delis'),
(823, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Diners', '', 'diners'),
(824, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Dumplings', '', 'dumplings'),
(825, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Eastern European', '', 'eastern_european'),
(826, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Ethiopian', '', 'ethiopian'),
(827, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Fast Food', '', 'hotdogs'),
(828, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', '', 'filipino'),
(829, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Adobo', 'adobo'),
(830, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Batchoy', 'batchoy'),
(831, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Bibingka', 'bibingka'),
(832, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Bistek Tagalog', 'bistek'),
(833, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Bulalo', 'bulalo'),
(834, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Crispy Pata', 'crispypata'),
(835, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Daing na Bangus', 'daing'),
(836, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Dinuguan', 'dinuguan'),
(837, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Embutido', 'embutido'),
(838, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Halo-halo', 'halohalo'),
(839, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Inasal na Manok', 'inasal'),
(840, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Kaldereta', 'kaldereta'),
(841, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Kare-kare', 'karekare'),
(842, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Lechon', 'lechon'),
(843, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Longganisa', 'longganisa'),
(844, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Lumpia', 'lumpia'),
(845, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Pancit', 'pancit'),
(846, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Pinakbet', 'pinakbet'),
(847, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Sisig', 'sisig'),
(848, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Tapa', 'tapa'),
(849, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Sinigang', 'sinigang'),
(850, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Filipino', 'Tocino', 'tocino'),
(851, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Fischbroetchen', '', 'fischbroetchen'),
(852, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Fish & Chips', '', 'fishnchips'),
(853, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Fondue', '', 'fondue'),
(854, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Food Court', '', 'food_court'),
(855, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Food Stands', '', 'foodstands'),
(856, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'French', '', 'french'),
(857, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'French', 'Alsatian', 'alsatian'),
(858, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'French', 'Auvergnat', 'auvergnat'),
(859, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'French', 'Berrichon', 'berrichon'),
(860, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'French', 'Bourguignon', 'bourguignon'),
(861, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'French', 'Nicoise', 'nicois'),
(862, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'French', 'Provencal', 'provencal'),
(863, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'French Southwest', '', 'sud_ouest'),
(864, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Galician', '', 'galician'),
(865, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Gastropubs', '', 'gastropubs'),
(866, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Georgian', '', 'georgian'),
(867, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'German', '', 'german'),
(868, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'German', 'Baden', 'baden'),
(869, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'German', 'Eastern German', 'easterngerman'),
(870, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'German', 'Hessian', 'hessian'),
(871, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'German', 'Northern German', 'northerngerman'),
(872, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'German', 'Palatine', 'palatine'),
(873, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'German', 'Rhinelandian', 'rhinelandian'),
(874, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Giblets', '', 'giblets'),
(875, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Gluten-Free', '', 'gluten_free'),
(876, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Greek', '', 'greek'),
(877, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Halal', '', 'halal'),
(878, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Hawaiian', '', 'hawaiian'),
(879, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Heuriger', '', 'heuriger'),
(880, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Himalayan/Nepalese', '', 'himalayan'),
(881, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Hong Kong Style Cafe', '', 'hkcafe'),
(882, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Hot Dogs', '', 'hotdog'),
(883, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Hot Pot', '', 'hotpot'),
(884, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Hungarian', '', 'hungarian'),
(885, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Iberian', '', 'iberian'),
(886, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Indian', '', 'indpak'),
(887, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Indonesian', '', 'indonesian'),
(888, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'International', '', 'international'),
(889, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Irish', '', 'irish'),
(890, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Island Pub', '', 'island_pub'),
(891, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Israeli', '', 'israeli'),
(892, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', '', 'italian'),
(893, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Abruzzese', 'abruzzese'),
(894, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Altoatesine', 'altoatesine'),
(895, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Apulian', 'apulian'),
(896, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Calabrian', 'calabrian'),
(897, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Cucina campana', 'cucinacampana'),
(898, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Emilian', 'emilian'),
(899, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Friulan', 'friulan'),
(900, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Ligurian', 'ligurian'),
(901, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Lumbard', 'lumbard'),
(902, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Napoletana', 'napoletana'),
(903, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Piemonte', 'piemonte'),
(904, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Roman', 'roman'),
(905, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Sardinian', 'sardinian'),
(906, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Sicilian', 'sicilian'),
(907, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Tuscan', 'tuscan'),
(908, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Italian', 'Venetian', 'venetian'),
(909, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', '', 'japanese'),
(910, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Blowfish', 'blowfish'),
(911, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Conveyor Belt Sushi', 'conveyorsushi'),
(912, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Donburi', 'donburi'),
(913, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Gyudon', 'gyudon'),
(914, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Oyakodon', 'oyakodon'),
(915, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Hand Rolls', 'handrolls'),
(916, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Horumon', 'horumon'),
(917, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Izakaya', 'izakaya'),
(918, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Japanese Curry', 'japacurry'),
(919, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Kaiseki', 'kaiseki'),
(920, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Kushikatsu', 'kushikatsu'),
(921, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Oden', 'oden'),
(922, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Okinawan', 'okinawan'),
(923, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Okonomiyaki', 'okonomiyaki'),
(924, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Onigiri', 'onigiri'),
(925, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Ramen', 'ramen'),
(926, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Robatayaki', 'robatayaki'),
(927, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Soba', 'soba'),
(928, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Sukiyaki', 'sukiyaki'),
(929, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Takoyaki', 'takoyaki'),
(930, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Tempura', 'tempura'),
(931, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Teppanyaki', 'teppanyaki'),
(932, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Tonkatsu', 'tonkatsu'),
(933, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Udon', 'udon'),
(934, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Unagi', 'unagi'),
(935, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Western Style Japanese Food', 'westernjapanese'),
(936, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Yakiniku', 'yakiniku'),
(937, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Japanese', 'Yakitori', 'yakitori'),
(938, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Jewish', '', 'jewish'),
(939, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Kebab', '', 'kebab'),
(940, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Korean', '', 'korean');
INSERT INTO `business_categories` (`id`, `created`, `modified`, `user_id`, `main_title`, `title`, `sub_title`, `unique_word`) VALUES
(941, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Kosher', '', 'kosher'),
(942, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Kurdish', '', 'kurdish'),
(943, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Laos', '', 'laos'),
(944, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Laotian', '', 'laotian'),
(945, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Latin American', '', 'latin'),
(946, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Latin American', 'Colombian', 'colombian'),
(947, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Latin American', 'Salvadoran', 'salvadoran'),
(948, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Latin American', 'Venezuelan', 'venezuelan'),
(949, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Live/Raw Food', '', 'raw_food'),
(950, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Lyonnais', '', 'lyonnais'),
(951, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Malaysian', '', 'malaysian'),
(952, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Malaysian', 'Mamak', 'mamak'),
(953, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Malaysian', 'Nyonya', 'nyonya'),
(954, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Meatballs', '', 'meatballs'),
(955, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mediterranean', '', 'mediterranean'),
(956, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mediterranean', 'Falafel', 'falafel'),
(957, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', '', 'mexican'),
(958, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', 'Eastern Mexican', 'easternmexican'),
(959, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', 'Jaliscan', 'jaliscan'),
(960, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', 'Northern Mexican', 'northernmexican'),
(961, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', 'Oaxacan', 'oaxacan'),
(962, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', 'Pueblan', 'pueblan'),
(963, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', 'Tacos', 'tacos'),
(964, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', 'Tamales', 'tamales'),
(965, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mexican', 'Yucatan', 'yucatan'),
(966, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Middle Eastern', '', 'mideastern'),
(967, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Middle Eastern', 'Egyptian', 'egyptian'),
(968, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Middle Eastern', 'Lebanese', 'lebanese'),
(969, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Milk Bars', '', 'milkbars'),
(970, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Modern Australian', '', 'modern_australian'),
(971, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Modern European', '', 'modern_european'),
(972, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Mongolian', '', 'mongolian'),
(973, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Moroccan', '', 'moroccan'),
(974, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'New Zealand', '', 'newzealand'),
(975, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Night Food', '', 'nightfood'),
(976, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Norcinerie', '', 'norcinerie'),
(977, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Open Sandwiches', '', 'opensandwiches'),
(978, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Oriental', '', 'oriental'),
(979, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Pakistani', '', 'pakistani'),
(980, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Parent Cafes', '', 'eltern_cafes'),
(981, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Parma', '', 'parma'),
(982, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Persian/Iranian', '', 'persian'),
(983, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Peruvian', '', 'peruvian'),
(984, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Pita', '', 'pita'),
(985, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Pizza', '', 'pizza'),
(986, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Polish', '', 'polish'),
(987, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Polish', 'Pierogis', 'pierogis'),
(988, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', '', 'portuguese'),
(989, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Alentejo', 'alentejo'),
(990, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Algarve', 'algarve'),
(991, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Azores', 'azores'),
(992, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Beira', 'beira'),
(993, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Fado Houses', 'fado_houses'),
(994, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Madeira', 'madeira'),
(995, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Minho', 'minho'),
(996, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Ribatejo', 'ribatejo'),
(997, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Portuguese', 'Tras-os-Montes', 'tras_os_montes'),
(998, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Potatoes', '', 'potatoes'),
(999, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Poutineries', '', 'poutineries'),
(1000, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Pub Food', '', 'pubfood'),
(1001, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Rice', '', 'riceshop'),
(1002, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Romanian', '', 'romanian'),
(1003, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Rotisserie Chicken', '', 'rotisserie_chicken'),
(1004, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Rumanian', '', 'rumanian'),
(1005, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Russian', '', 'russian'),
(1006, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Salad', '', 'salad'),
(1007, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Sandwiches', '', 'sandwiches'),
(1008, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Scandinavian', '', 'scandinavian'),
(1009, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Scottish', '', 'scottish'),
(1010, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Seafood', '', 'seafood'),
(1011, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Serbo Croatian', '', 'serbocroatian'),
(1012, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Signature Cuisine', '', 'signature_cuisine'),
(1013, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Singaporean', '', 'singaporean'),
(1014, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Slovakian', '', 'slovakian'),
(1015, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Soul Food', '', 'soulfood'),
(1016, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Soup', '', 'soup'),
(1017, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Southern', '', 'southern'),
(1018, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Spanish', '', 'spanish'),
(1019, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Spanish', 'Arroceria / Paella', 'arroceria_paella'),
(1020, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Sri Lankan', '', 'srilankan'),
(1021, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Steakhouses', '', 'steak'),
(1022, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Sushi Bars', '', 'sushi'),
(1023, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Swabian', '', 'swabian'),
(1024, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Swedish', '', 'swedish'),
(1025, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Swiss Food', '', 'swissfood'),
(1026, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Tabernas', '', 'tabernas'),
(1027, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Taiwanese', '', 'taiwanese'),
(1028, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Tapas Bars', '', 'tapas'),
(1029, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Tapas/Small Plates', '', 'tapasmallplates'),
(1030, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Tex-Mex', '', 'tex-mex'),
(1031, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Thai', '', 'thai'),
(1032, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Traditional Norwegian', '', 'norwegian'),
(1033, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Traditional Swedish', '', 'traditional_swedish'),
(1034, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Trattorie', '', 'trattorie'),
(1035, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Turkish', '', 'turkish'),
(1036, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Turkish', 'Chee Kufta', 'cheekufta'),
(1037, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Turkish', 'Gozleme', 'gozleme'),
(1038, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Turkish', 'Turkish Ravioli', 'turkishravioli'),
(1039, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Ukrainian', '', 'ukrainian'),
(1040, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Uzbek', '', 'uzbek'),
(1041, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Vegan', '', 'vegan'),
(1042, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Vegetarian', '', 'vegetarian'),
(1043, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Venison', '', 'venison'),
(1044, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Vietnamese', '', 'vietnamese'),
(1045, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Wok', '', 'wok'),
(1046, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Wraps', '', 'wraps'),
(1047, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Restaurants', 'Yugoslav', '', 'yugoslav'),
(1048, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', '', '', 'shopping'),
(1049, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Adult', '', 'adult'),
(1050, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Antiques', '', 'antiques'),
(1052, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Arts & Crafts', '', 'artsandcrafts'),
(1053, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Arts & Crafts', 'Art Supplies', 'artsupplies'),
(1055, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Arts & Crafts', 'Cooking Classes', 'cookingclasses'),
(1056, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Arts & Crafts', 'Costumes', 'costumes'),
(1057, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Arts & Crafts', 'Embroidery & Crochet', 'embroideryandcrochet'),
(1058, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Arts & Crafts', 'Fabric Stores', 'fabricstores'),
(1059, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Arts & Crafts', 'Framing', 'framing'),
(1060, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Auction Houses', '', 'auctionhouses'),
(1061, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Baby Gear & Furniture', '', 'baby_gear'),
(1062, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Battery Stores', '', 'batterystores'),
(1063, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Bespoke Clothing', '', 'bespoke'),
(1064, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Books, Mags, Music & Video', '', 'media'),
(1065, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Books, Mags, Music & Video', 'Bookstores', 'bookstores'),
(1066, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Books, Mags, Music & Video', 'Comic Books', 'comicbooks'),
(1067, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Books, Mags, Music & Video', 'Music & DVDs', 'musicvideo'),
(1068, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Books, Mags, Music & Video', 'Newspapers & Magazines', 'mags'),
(1069, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Books, Mags, Music & Video', 'Video Game Stores', 'videogamestores'),
(1070, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Books, Mags, Music & Video', 'Videos & Video Game Rental', 'videoandgames'),
(1071, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Books, Mags, Music & Video', 'Vinyl Records', 'vinyl_records'),
(1072, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Brewing Supplies', '', 'brewingsupplies'),
(1073, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Bridal', '', 'bridal'),
(1074, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Chinese Bazaar', '', 'chinesebazaar'),
(1075, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Computers', '', 'computers'),
(1076, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Concept Shops', '', 'concept_shops'),
(1078, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Customized Merchandise', '', 'custommerchandise'),
(1079, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Department Stores', '', 'deptstores'),
(1080, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Discount Store', '', 'discountstore'),
(1081, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Drugstores', '', 'drugstores'),
(1082, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Electronics', '', 'electronics'),
(1083, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Eyewear & Opticians', '', 'opticians'),
(1084, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', '', 'fashion'),
(1085, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Accessories', 'accessories'),
(1086, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Children''s Clothing', 'childcloth'),
(1088, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Formal Wear', 'formalwear'),
(1089, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Hats', 'hats'),
(1090, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Kimonos', 'kimonos'),
(1091, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Leather Goods', 'leather'),
(1092, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Lingerie', 'lingerie'),
(1093, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Maternity Wear', 'maternity'),
(1094, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Men''s Clothing', 'menscloth'),
(1095, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Plus Size Fashion', 'plus_size_fashion'),
(1096, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Shoe Stores', 'shoes'),
(1097, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Sleepwear', 'sleepwear'),
(1098, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Sports Wear', 'sportswear'),
(1099, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Stockings', 'stockings'),
(1100, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Surf Shop', 'surfshop'),
(1101, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Swimwear', 'swimwear'),
(1102, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Used, Vintage & Consignment', 'vintage'),
(1103, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fashion', 'Women''s Clothing', 'womenscloth'),
(1104, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fireworks', '', 'fireworks'),
(1105, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Fitness/Exercise Equipment', '', 'fitnessequipment'),
(1106, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Flea Markets', '', 'fleamarkets'),
(1107, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Flowers & Gifts', '', 'flowers'),
(1108, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Flowers & Gifts', 'Cards & Stationery', 'stationery'),
(1109, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Flowers & Gifts', 'Florists', 'florists'),
(1110, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Flowers & Gifts', 'Flowers', 'flowersonly'),
(1111, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Flowers & Gifts', 'Gift Shops', 'giftshops'),
(1112, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Gold Buyers', '', 'goldbuyers'),
(1113, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Golf Equipment Shops', '', 'golfshops'),
(1114, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Guns & Ammo', '', 'guns_and_ammo'),
(1115, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'High Fidelity Audio Equipment', '', 'hifi'),
(1116, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Hobby Shops', '', 'hobbyshops'),
(1117, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', '', 'homeandgarden'),
(1118, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Appliances', 'appliances'),
(1119, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Christmas Trees', 'christmastrees'),
(1120, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Furniture Stores', 'furniture'),
(1121, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Hardware Stores', 'hardware'),
(1122, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Home Decor', 'homedecor'),
(1123, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Hot Tub & Pool', 'hottubandpool'),
(1124, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Kitchen & Bath', 'kitchenandbath'),
(1125, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Linens', 'linens'),
(1126, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Materiale elettrico', 'materialeelettrico'),
(1127, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Mattresses', 'mattresses'),
(1128, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Nurseries & Gardening', 'gardening'),
(1129, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Pumpkin Patches', 'pumpkinpatches'),
(1130, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Rugs', 'rugs'),
(1131, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Home & Garden', 'Tableware', 'tableware'),
(1132, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Horse Equipment Shops', '', 'horsequipment'),
(1133, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Jewelry', '', 'jewelry'),
(1134, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Kiosk', '', 'kiosk'),
(1135, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Knitting Supplies', '', 'knittingsupplies'),
(1136, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Luggage', '', 'luggage'),
(1137, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Market Stalls', '', 'marketstalls'),
(1138, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Medical Supplies', '', 'medicalsupplies'),
(1139, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Mobile Phones', '', 'mobilephones'),
(1140, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Motorcycle Gear', '', 'motorcyclinggear'),
(1141, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Musical Instruments & Teachers', '', 'musicalinstrumentsandteachers'),
(1142, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Office Equipment', '', 'officeequipment'),
(1143, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Outlet Stores', '', 'outlet_stores'),
(1144, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Pawn Shops', '', 'pawn'),
(1146, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Personal Shopping', '', 'personal_shopping'),
(1147, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Photography Stores & Services', '', 'photographystores'),
(1148, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Pool & Billiards', '', 'poolbilliards'),
(1149, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Pop-up Shops', '', 'popupshops'),
(1150, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Scandinavian Design', '', 'scandinaviandesign'),
(1151, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Shopping Centers', '', 'shoppingcenters'),
(1152, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Souvenir Shops', '', 'souvenirs'),
(1153, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Spiritual Shop', '', 'spiritual_shop'),
(1154, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Sporting Goods', '', 'sportgoods'),
(1155, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Sporting Goods', 'Bikes', 'bikes'),
(1156, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Sporting Goods', 'Golf Equipment', 'golfequipment'),
(1157, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Sporting Goods', 'Outdoor Gear', 'outdoorgear'),
(1158, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Sporting Goods', 'Skate Shops', 'skateshops'),
(1159, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Sporting Goods', 'Ski & Snowboard Shops', 'skishops'),
(1161, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Thrift Stores', '', 'thrift_stores'),
(1162, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Tickets', '', 'tickets'),
(1163, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Tobacco Shops', '', 'tobaccoshops'),
(1164, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Toy Stores', '', 'toys'),
(1165, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Trophy Shops', '', 'trophyshops'),
(1166, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Uniforms', '', 'uniforms'),
(1167, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Used Bookstore', '', 'usedbooks'),
(1168, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Vape Shops', '', 'vapeshops'),
(1169, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Watches', '', 'watches'),
(1170, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Wholesale Stores', '', 'wholesale_stores'),
(1171, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shopping', 'Wigs', '', 'wigs');

-- --------------------------------------------------------

--
-- Table structure for table `business_category_lists`
--

CREATE TABLE IF NOT EXISTS `business_category_lists` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `business_id` int(11) NOT NULL,
  `business_category_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `business_category_lists`
--

INSERT INTO `business_category_lists` (`id`, `created`, `modified`, `business_id`, `business_category_id`) VALUES
(1, '2015-03-11 07:37:56', NULL, 8, 288),
(2, '2015-03-11 07:37:56', NULL, 8, 287),
(3, '2015-03-11 07:37:56', NULL, 8, 286),
(4, '2015-03-18 09:11:31', NULL, 11, 800),
(5, '2015-03-18 09:11:31', NULL, 11, 803),
(6, '2015-03-19 04:40:14', NULL, 12, 749),
(7, '2015-03-19 04:40:14', NULL, 12, 828),
(8, '2015-03-19 05:33:45', NULL, 13, 743),
(9, '2015-03-19 05:33:45', NULL, 13, 828),
(10, '2015-03-20 04:21:29', NULL, 14, 519),
(11, '2015-03-20 04:21:29', NULL, 14, 527),
(12, '2015-03-20 04:21:29', NULL, 14, 537),
(13, '2015-03-20 04:31:50', NULL, 15, 743),
(14, '2015-03-20 04:31:50', NULL, 15, 828),
(15, '2015-03-20 04:31:50', NULL, 15, 783),
(16, '2015-03-22 18:52:31', NULL, 16, 88),
(17, '2015-03-30 05:46:13', NULL, 17, 141);

-- --------------------------------------------------------

--
-- Table structure for table `business_category_list_updates`
--

CREATE TABLE IF NOT EXISTS `business_category_list_updates` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `business_update_id` int(11) NOT NULL,
  `business_category_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `business_category_list_updates`
--

INSERT INTO `business_category_list_updates` (`id`, `created`, `modified`, `business_update_id`, `business_category_id`) VALUES
(1, '2015-03-20 07:14:57', NULL, 1, 288),
(2, '2015-03-20 07:14:57', NULL, 1, 287),
(3, '2015-03-20 07:14:57', NULL, 1, 286),
(4, '2015-03-20 08:15:59', NULL, 2, 288),
(5, '2015-03-20 08:15:59', NULL, 2, 286),
(6, '2015-03-20 08:15:59', NULL, 2, 281),
(7, '2015-03-20 08:16:21', NULL, 3, 288),
(8, '2015-03-20 08:16:21', NULL, 3, 286),
(9, '2015-03-20 08:16:21', NULL, 3, 281),
(10, '2015-03-23 03:31:19', NULL, 4, 586),
(11, '2015-03-24 09:28:38', NULL, 5, 730),
(12, '2015-03-25 15:32:23', NULL, 6, 749),
(13, '2015-03-25 15:32:23', NULL, 6, 828),
(14, '2015-03-27 03:34:04', NULL, 7, 722),
(15, '2015-03-27 03:35:38', NULL, 8, 287),
(16, '2015-03-27 05:59:26', NULL, 9, 353),
(17, '2015-03-27 06:16:55', NULL, 10, 281),
(18, '2015-03-27 06:19:20', NULL, 11, 144),
(19, '2015-03-27 06:40:08', NULL, 12, 583),
(20, '2015-03-28 04:23:45', NULL, 13, 287),
(21, '2015-03-28 05:03:09', NULL, 14, 299);

-- --------------------------------------------------------

--
-- Table structure for table `business_images`
--

CREATE TABLE IF NOT EXISTS `business_images` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_path` varchar(50) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `caption` text,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `business_images`
--

INSERT INTO `business_images` (`id`, `created`, `modified`, `member_id`, `business_id`, `file_path`, `filename`, `caption`, `type`) VALUES
(1, '2015-03-17 03:25:32', '2015-03-17 03:38:09', 1, 1, 'img/business/', 'bc21341baf150317032532.jpg', 'This is the first caption', ''),
(2, '2015-03-17 03:52:45', '2015-03-17 03:52:45', 1, 1, 'img/business/', 'd0576c95ab150317035245.png', 'This is a clear trust logo', NULL),
(3, '2015-03-17 04:05:29', '2015-03-17 04:05:29', 1, 1, 'img/business/', '7044393d11150317040529.jpg', 'this is tim horton image', NULL),
(4, '2015-03-18 02:55:59', '2015-03-18 02:55:59', 1, 1, 'img/business/', '6cd2299e06150318025559.jpg', 'Another caption test.', NULL),
(5, '2015-03-18 03:52:59', '2015-03-18 03:52:59', 1, 10, 'img/business/', 'e66aba2eba150318035259.jpg', 'Patricia Executive Village is an exclusive community which offers Asian-inspired single attached homes.', NULL),
(6, '2015-03-18 06:26:17', '2015-03-18 06:26:17', 1, 8, 'img/business/', '31ae30b892150318062617.jpg', 'This is a test caption', NULL),
(7, '2015-03-18 06:35:23', '2015-03-18 06:35:23', 1, 4, 'img/business/', 'f7344bca88150318063523.jpg', 'Vancouver skyline', NULL),
(8, '2015-03-18 06:35:42', '2015-03-18 06:35:42', 1, 4, 'img/business/', '26155c675a150318063542.png', 'Clear trust logo', NULL),
(10, '2015-03-18 09:24:57', '2015-03-18 09:24:57', 4, 11, 'img/business/', '94b91c5529150318092457.jpg', '', NULL),
(11, '2015-03-18 09:25:51', '2015-03-18 09:25:51', 4, 11, 'img/business/', '4cc5419847150318092551.jpg', '', NULL),
(12, '2015-03-19 02:03:10', '2015-03-19 02:03:10', 1, 1, 'img/business/', '5538c36355150319020310.jpg', 'This is a caption', NULL),
(13, '2015-03-19 04:40:55', '2015-03-19 04:40:55', 5, 12, 'img/business/', '307ca4de32150319044055.jpg', '', NULL),
(14, '2015-03-19 04:41:27', '2015-03-19 04:41:27', 5, 12, 'img/business/', '599a0953e9150319044127.jpg', '', NULL),
(15, '2015-03-19 04:41:50', '2015-03-19 04:41:50', 5, 12, 'img/business/', 'fb3ebec446150319044150.jpg', '', NULL),
(16, '2015-03-19 05:34:12', '2015-03-19 05:34:12', 5, 13, 'img/business/', '886f3c2ba0150319053412.jpg', '', NULL),
(17, '2015-03-19 05:34:29', '2015-03-19 05:34:29', 5, 13, 'img/business/', 'd8260324e5150319053429.jpg', '', NULL),
(18, '2015-03-19 05:34:44', '2015-03-19 05:34:44', 5, 13, 'img/business/', '6a8c5ff903150319053444.jpg', '', NULL),
(19, '2015-03-19 05:35:06', '2015-03-19 05:35:06', 5, 13, 'img/business/', 'd02214c2d3150319053506.jpg', '', NULL),
(20, '2015-03-20 02:55:21', '2015-03-20 02:55:21', 1, 1, 'img/business/', '5406bfc6dc150320025521.jpg', 'Skyscrapper world', NULL),
(21, '2015-03-20 04:22:53', '2015-03-20 04:22:53', 5, 14, 'img/business/', 'd10c12c9d8150320042253.jpg', '', NULL),
(22, '2015-03-20 04:25:13', '2015-03-20 04:25:13', 5, 14, 'img/business/', 'e14a42c2cc150320042513.jpg', '', NULL),
(23, '2015-03-20 04:33:41', '2015-03-20 04:33:41', 5, 15, 'img/business/', 'fe37f16e8f150320043341.jpg', '', NULL),
(24, '2015-03-20 04:34:05', '2015-03-20 04:34:05', 5, 15, 'img/business/', '81e2773a38150320043405.jpg', '', NULL),
(25, '2015-03-20 04:34:30', '2015-03-20 04:34:30', 5, 15, 'img/business/', 'fed897650a150320043430.jpg', '', NULL),
(26, '2015-03-20 04:34:49', '2015-03-20 04:34:49', 5, 15, 'img/business/', 'dc92869cb6150320043449.jpg', '', NULL),
(27, '2015-03-22 21:43:17', '2015-03-22 21:43:17', 1, 8, 'img/business/', '75b3e45305150322094317.jpg', '', NULL),
(28, '2015-03-24 09:27:47', '2015-03-24 09:27:47', 1, 16, 'img/business/', '7dcbb0a849150324092747.png', 'This is business image', NULL),
(29, '2015-03-28 10:35:53', '2015-03-28 10:35:53', 1, 5, 'img/business/', '49a3a28c0d150328103553.png', 'Tim Hortons Banner', NULL),
(30, '2015-03-30 03:00:42', '2015-03-30 03:00:42', 1, 1, 'img/business/', '046210998e150330030042.png', 'This is the official logo', NULL),
(31, '2015-03-30 05:48:16', '2015-03-30 05:48:16', 1, 17, 'img/business/', '7a441feaf0150330054816.jpg', 'Sun', NULL),
(32, '2015-03-30 05:49:37', '2015-03-30 05:49:37', 1, 17, 'img/business/', 'cb6b3062fa150330054937.jpg', 'speed', NULL),
(33, '2015-03-30 05:50:19', '2015-03-30 05:50:19', 1, 17, 'img/business/', 'ddb2a95a6f150330055019.jpg', 'Display', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_sub_categories`
--

CREATE TABLE IF NOT EXISTS `business_sub_categories` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `business_category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `business_sub_categories`
--

INSERT INTO `business_sub_categories` (`id`, `created`, `modified`, `user_id`, `business_category_id`, `name`) VALUES
(1, '2015-03-09 00:00:00', '2015-03-09 06:37:34', 1, 1, 'Auto Sales'),
(2, '2015-03-09 00:00:00', '2015-03-09 06:37:34', 1, 1, 'Auto Care'),
(3, '2015-03-09 00:00:00', '2015-03-09 06:38:37', 1, 2, 'Food catering (baking/dining)'),
(4, '2015-03-09 00:00:00', '2015-03-09 06:38:22', 1, 2, 'Restaurants'),
(5, '2015-03-09 00:00:00', '2015-03-09 06:43:36', 1, 3, 'Dental'),
(6, '2015-03-09 00:00:00', '2015-03-09 06:43:36', 1, 3, 'Medical'),
(7, '2015-03-09 00:00:00', '2015-03-09 06:43:36', 1, 3, 'Wellness'),
(8, '2015-03-09 00:00:00', '2015-03-09 06:43:36', 1, 3, 'Hair Care/Beauty Care'),
(9, '2015-03-09 00:00:00', '2015-03-09 06:46:05', 1, 4, 'Realty'),
(10, '2015-03-09 00:00:00', '2015-03-09 06:46:05', 1, 4, 'Property Rental'),
(11, '2015-03-09 00:00:00', '2015-03-09 06:46:05', 1, 4, 'Mortgage/Financing'),
(12, '2015-03-09 00:00:00', '2015-03-09 06:46:05', 1, 4, 'Insurance'),
(13, '2015-03-09 00:00:00', '2015-03-09 06:46:05', 1, 4, 'Home Renovation'),
(14, '2015-03-09 00:00:00', '2015-03-09 06:47:38', 1, 5, 'Nanny Services'),
(15, '2015-03-09 00:00:00', '2015-03-09 06:47:38', 1, 5, 'Tutoring'),
(16, '2015-03-09 00:00:00', '2015-03-09 06:47:38', 1, 5, 'Nursing/Home Care'),
(17, '2015-03-09 00:00:00', '2015-03-09 06:58:48', 1, 6, 'Travel'),
(18, '2015-03-09 00:00:00', '2015-03-09 06:58:48', 1, 6, 'Remittance'),
(19, '2015-03-09 00:00:00', '2015-03-09 06:58:48', 1, 6, 'Freight');

-- --------------------------------------------------------

--
-- Table structure for table `business_updates`
--

CREATE TABLE IF NOT EXISTS `business_updates` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `street` varchar(150) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lng` varchar(50) DEFAULT NULL,
  `opened` varchar(50) DEFAULT NULL,
  `business_info` text,
  `accepted_payment_id` int(11) DEFAULT NULL,
  `approved` varchar(3) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `business_updates`
--

INSERT INTO `business_updates` (`id`, `created`, `modified`, `member_id`, `business_id`, `name`, `website`, `email`, `telephone`, `street`, `city`, `country_id`, `lat`, `lng`, `opened`, `business_info`, `accepted_payment_id`, `approved`) VALUES
(1, '2015-03-20 07:14:57', '2015-03-20 07:14:57', 1, 8, 'West Onyx', '', NULL, '', 'Exchange Road, Tektite Blg., Ortigas Center, Room 907A', 'Pasig', 137, '14.5824994', '121.0617674', 'Opening Soon', NULL, NULL, NULL),
(2, '2015-03-20 08:15:59', '2015-03-20 08:15:59', 1, 8, 'West Onyx', '', NULL, '', 'Exchange Road, Tektite Blg., Ortigas Center', 'Pasig', 137, '14.5810833', '121.0593087', 'Opening Soon', NULL, NULL, NULL),
(3, '2015-03-20 08:16:21', '2015-03-20 08:16:21', 1, 8, 'West Onyx', '', NULL, '', 'Exchange Road, Tektite Blg., Ortigas Center', 'Pasig', 137, '14.5810833', '121.0593087', 'Opening Soon', NULL, NULL, NULL),
(4, '2015-03-23 03:31:19', '2015-03-23 03:31:19', 1, 1, 'Airbnb', 'https://www.airbnb.ca', NULL, '(222) 222-222', 'Somewhere In', 'Vancouver', 31, '49.1151741', '-122.8456817', 'Opening Soon', NULL, NULL, NULL),
(5, '2015-03-24 09:28:38', '2015-03-24 09:28:38', 1, 4, 'Clear Trust', 'http://cleartrust.ca', NULL, '(222) 222-222', 'Somewhere In', 'Vancouver', 31, '49.1151741', '-122.8456817', 'Opening Soon', NULL, NULL, NULL),
(6, '2015-03-25 15:32:23', '2015-03-25 15:32:23', 5, 12, 'Teddy''s Bigger Burgers', '', NULL, '+6327283056', 'Ayala Centre, Makati Avenue', 'Makati City', 137, '14.5592187', '121.0266472', 'Opening Soon', NULL, NULL, NULL),
(7, '2015-03-27 03:34:04', '2015-03-27 03:34:04', 1, 10, 'Patricia Executive Village', '', NULL, '', 'Bacoor, Barangay Mabolo 3,  Bacoor', 'Cavite', 137, '14.4602022', '120.9605134', 'Opening Soon', NULL, NULL, NULL),
(8, '2015-03-27 03:35:38', '2015-03-27 03:35:38', 1, 4, 'Clear Trust', 'http://cleartrust.ca', NULL, '(222) 222-222', 'Somewhere In', 'Vancouver', 31, '49.1151741', '-122.8456817', 'Opening Soon', NULL, NULL, NULL),
(9, '2015-03-27 05:59:25', '2015-03-27 05:59:25', 1, 6, 'Test Business', 'www.testbusiness.com', NULL, '09123322332', '123 anywhere street', 'MArikina City', 137, '12.879721', '121.774017', 'Opening Soon', NULL, NULL, NULL),
(10, '2015-03-27 06:16:55', '2015-03-27 06:16:55', 1, 4, 'Clear Trust', 'http://cleartrust.ca', NULL, '(222) 222-222', 'Somewhere In', 'Vancouver', 31, '49.1151741', '-122.8456817', 'Opening Soon', NULL, NULL, NULL),
(11, '2015-03-27 06:19:20', '2015-03-27 06:19:20', 1, 9, 'Patricia Executive Village', '', NULL, '', 'Bacoor, Barangay Mabolo 3,  Bacoor', 'Cavite', 137, '14.4602022', '120.9605134', 'Opening Soon', NULL, NULL, NULL),
(12, '2015-03-27 06:40:08', '2015-03-27 06:40:08', 1, 2, 'GreenLogik Inc.', 'http://itsmyelectric.org', NULL, '+639234332382', 'Exchange Road, Tektite Blg., Ortigas Center', 'Pasig', 137, '14.5810833', '121.0593087', 'Opening Soon', NULL, NULL, NULL),
(13, '2015-03-28 04:23:45', '2015-03-28 04:23:45', 1, 3, 'Canada Ventures Inc.', 'http://canadaventures.com', NULL, '(111) 111-111', '123 anywhere street', 'Toronto', 31, '43.653226', '-79.3831843', 'Opening Soon', NULL, NULL, NULL),
(14, '2015-03-28 05:03:09', '2015-03-28 05:03:09', 1, 5, 'Tim Hortons', 'timhortons.com', NULL, '+1 604-266-5331', '5702 Granville St', 'Vancouver', 31, '49.2338694', '-123.1390285', 'Opening Soon', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `nationality` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=193 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country`, `nationality`) VALUES
(1, 'Afghanistan', 'Afghan'),
(2, 'Albania', 'Albanian'),
(3, 'Algeria', 'Algerian'),
(4, 'Andorra', 'Andorran'),
(5, 'Angola', 'Angolan'),
(6, 'Antigua and Barbuda', 'Antiguans, Barbudans'),
(7, 'Argentina', 'Argentinean'),
(8, 'Armenia', 'Armenian'),
(9, 'Australia', 'Australian'),
(10, 'Austria', 'Austrian'),
(11, 'Azerbaijan', 'Azerbaijani'),
(12, 'The Bahamas', 'Bahamian'),
(13, 'Bahrain', 'Bahraini'),
(14, 'Bangladesh', 'Bangladeshi'),
(15, 'Barbados', 'Barbadian'),
(16, 'Belarus', 'Belarusian'),
(17, 'Belgium', 'Belgian'),
(18, 'Belize', 'Belizean'),
(19, 'Benin', 'Beninese'),
(20, 'Bhutan', 'Bhutanese'),
(21, 'Bolivia', 'Bolivian'),
(22, 'Bosnia and Herzegovina', 'Bosnian, Herzegovinian'),
(23, 'Botswana', 'Motswana (singular), Batswana (plural)'),
(24, 'Brazil', 'Brazilian'),
(25, 'Brunei', 'Bruneian'),
(26, 'Bulgaria', 'Bulgarian'),
(27, 'Burkina Faso', 'Burkinabe'),
(28, 'Burundi', 'Burundian'),
(29, 'Cambodia', 'Cambodian'),
(30, 'Cameroon', 'Cameroonian'),
(31, 'Canada', 'Canadian'),
(32, 'Cape Verde', 'Cape Verdian'),
(33, 'Central African Republic', 'Central African'),
(34, 'Chad', 'Chadian'),
(35, 'Chile', 'Chilean'),
(36, 'China', 'Chinese'),
(37, 'Colombia', 'Colombian'),
(38, 'Comoros', 'Comoran'),
(39, 'Congo, Republic of the', 'Congolese'),
(40, 'Congo, Democratic Republic of the', 'Congolese'),
(41, 'Costa Rica', 'Costa Rican'),
(42, 'Cote d''Ivoire', 'Ivorian'),
(43, 'Croatia', 'Croatian'),
(44, 'Cuba', 'Cuban'),
(45, 'Cyprus', 'Cypriot'),
(46, 'Czech Republic', 'Czech'),
(47, 'Denmark', 'Danish'),
(48, 'Djibouti', 'Djibouti'),
(49, 'Dominica', 'Dominican'),
(50, 'Dominican Republic', 'Dominican'),
(51, 'East Timor', 'East Timorese'),
(52, 'Ecuador', 'Ecuadorean'),
(53, 'Egypt', 'Egyptian'),
(54, 'El Salvador', 'Salvadoran'),
(55, 'Equatorial Guinea', 'Equatorial Guinean'),
(56, 'Eritrea', 'Eritrean'),
(57, 'Estonia', 'Estonian'),
(58, 'Ethiopia', 'Ethiopian'),
(59, 'Fiji', 'Fijian'),
(60, 'Finland', 'Finnish'),
(61, 'France', 'French'),
(62, 'Gabon', 'Gabonese'),
(63, 'The Gambia', 'Gambian'),
(64, 'Georgia', 'Georgian'),
(65, 'Germany', 'German'),
(66, 'Ghana', 'Ghanaian'),
(67, 'Greece', 'Greek'),
(68, 'Grenada', 'Grenadian'),
(69, 'Guatemala', 'Guatemalan'),
(70, 'Guinea', 'Guinean'),
(71, 'Guinea-Bissau', 'Guinea-Bissauan'),
(72, 'Guyana', 'Guyanese'),
(73, 'Haiti', 'Haitian'),
(74, 'Honduras', 'Honduran'),
(75, 'Hungary', 'Hungarian'),
(76, 'Iceland', 'Icelander'),
(77, 'India', 'Indian'),
(78, 'Indonesia', 'Indonesian'),
(79, 'Iran', 'Iranian'),
(80, 'Iraq', 'Iraqi'),
(81, 'Ireland', 'Irish'),
(82, 'Israel', 'Israeli'),
(83, 'Italy', 'Italian'),
(84, 'Jamaica', 'Jamaican'),
(85, 'Japan', 'Japanese'),
(86, 'Jordan', 'Jordanian'),
(87, 'Kazakhstan', 'Kazakhstani'),
(88, 'Kenya', 'Kenyan'),
(89, 'Kiribati', 'I-Kiribati'),
(90, 'Korea, North', 'North Korean'),
(91, 'Korea, South', 'South Korean'),
(92, 'Kuwait', 'Kuwaiti'),
(93, 'Kyrgyz Republic', 'Kirghiz'),
(94, 'Laos', 'Laotian'),
(95, 'Latvia', 'Latvian'),
(96, 'Lebanon', 'Lebanese'),
(97, 'Lesotho', 'Mosotho'),
(98, 'Liberia', 'Liberian'),
(99, 'Libya', 'Libyan'),
(100, 'Liechtenstein', 'Liechtensteiner'),
(101, 'Lithuania', 'Lithuanian'),
(102, 'Luxembourg', 'Luxembourger'),
(103, 'Macedonia', 'Macedonian'),
(104, 'Madagascar', 'Malagasy'),
(105, 'Malawi', 'Malawian'),
(106, 'Malaysia', 'Malaysian'),
(107, 'Maldives', 'Maldivan'),
(108, 'Mali', 'Malian'),
(109, 'Malta', 'Maltese'),
(110, 'Marshall Islands', 'Marshallese'),
(111, 'Mauritania', 'Mauritanian'),
(112, 'Mauritius', 'Mauritian'),
(113, 'Mexico', 'Mexican'),
(114, 'Federated States of Micronesia', 'Micronesian'),
(115, 'Moldova', 'Moldovan'),
(116, 'Monaco', 'Monegasque'),
(117, 'Mongolia', 'Mongolian'),
(118, 'Morocco', 'Moroccan'),
(119, 'Mozambique', 'Mozambican'),
(120, 'Myanmar (Burma)', 'Burmese'),
(121, 'Namibia', 'Namibian'),
(122, 'Nauru', 'Nauruan'),
(123, 'Nepal', 'Nepalese'),
(124, 'Netherlands', 'Dutch'),
(125, 'New Zealand', 'New Zealander'),
(126, 'Nicaragua', 'Nicaraguan'),
(127, 'Niger', 'Nigerien'),
(128, 'Nigeria', 'Nigerian'),
(129, 'Norway', 'Norwegian'),
(130, 'Oman', 'Omani'),
(131, 'Pakistan', 'Pakistani'),
(132, 'Palau', 'Palauan'),
(133, 'Panama', 'Panamanian'),
(134, 'Papua New Guinea', 'Papua New Guinean'),
(135, 'Paraguay', 'Paraguayan'),
(136, 'Peru', 'Peruvian'),
(137, 'Philippines', 'Filipino'),
(138, 'Poland', 'Polish'),
(139, 'Portugal', 'Portuguese'),
(140, 'Qatar', 'Qatari'),
(141, 'Romania', 'Romanian'),
(142, 'Russia', 'Russian'),
(143, 'Rwanda', 'Rwandan'),
(144, 'Saint Kitts and Nevis', 'Kittian and Nevisian'),
(145, 'Saint Lucia', 'Saint Lucian'),
(146, 'Samoa', 'Samoan'),
(147, 'San Marino', 'Sammarinese'),
(148, 'Sao Tome and Principe', 'Sao Tomean'),
(149, 'Saudi Arabia', 'Saudi Arabian'),
(150, 'Senegal', 'Senegalese'),
(151, 'Serbia and Montenegro', 'Serbian'),
(152, 'Seychelles', 'Seychellois'),
(153, 'Sierra Leone', 'Sierra Leonean'),
(154, 'Singapore', 'Singaporean'),
(155, 'Slovakia', 'Slovak'),
(156, 'Slovenia', 'Slovene'),
(157, 'Solomon Islands', 'Solomon Islander'),
(158, 'Somalia', 'Somali'),
(159, 'South Africa', 'South African'),
(160, 'Spain', 'Spanish'),
(161, 'Sri Lanka', 'Sri Lankan'),
(162, 'Sudan', 'Sudanese'),
(163, 'Suriname', 'Surinamer'),
(164, 'Swaziland', 'Swazi'),
(165, 'Sweden', 'Swedish'),
(166, 'Switzerland', 'Swiss'),
(167, 'Syria', 'Syrian'),
(168, 'Taiwan', 'Taiwanese'),
(169, 'Tajikistan', 'Tadzhik'),
(170, 'Tanzania', 'Tanzanian'),
(171, 'Thailand', 'Thai'),
(172, 'Togo', 'Togolese'),
(173, 'Tonga', 'Tongan'),
(174, 'Trinidad and Tobago', 'Trinidadian'),
(175, 'Tunisia', 'Tunisian'),
(176, 'Turkey', 'Turkish'),
(177, 'Turkmenistan', 'Turkmen'),
(178, 'Tuvalu', 'Tuvaluan'),
(179, 'Uganda', 'Ugandan'),
(180, 'Ukraine', 'Ukrainian'),
(181, 'United Arab Emirates', 'Emirian'),
(182, 'United Kingdom', 'British'),
(183, 'United States', 'American'),
(184, 'Uruguay', 'Uruguayan'),
(185, 'Uzbekistan', 'Uzbekistani'),
(186, 'Vanuatu', 'Ni-Vanuatu'),
(187, 'Vatican City (Holy See)', 'none'),
(188, 'Venezuela', 'Venezuelan'),
(189, 'Vietnam', 'Vietnamese'),
(190, 'Yemen', 'Yemeni'),
(191, 'Zambia', 'Zambian'),
(192, 'Zimbabwe', 'Zimbabwean');

-- --------------------------------------------------------

--
-- Table structure for table `email_confirmations`
--

CREATE TABLE IF NOT EXISTS `email_confirmations` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(50) NOT NULL,
  `confirmed` varchar(1) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `email_confirmations`
--

INSERT INTO `email_confirmations` (`id`, `created`, `modified`, `user_id`, `email`, `token`, `confirmed`) VALUES
(1, '2015-02-17 09:26:18', '2015-02-18 01:46:31', 1, 'sherwinrobles@gmail.com', 'iPesglwRukohUXVGQWnm2BYpbrF8C9T4HZxJAa3StKv7dzEyMD', 'Y'),
(3, '2015-02-26 12:54:04', '2015-02-26 12:00:30', 2, 'ianulita@yahoo.com', 'uy4M96czSmW7q3jh1tCDZ5aBKvRwgH8pQdN0bAfoFlVUPJr2LE', 'Y'),
(4, '2015-03-18 03:02:44', '2015-03-18 03:02:44', 3, 'prijolesk@gmail.com', 'WjsOBcbUT7zlhFpa8oLGnJfmq91Hd6wN2CXVtDvMKgPyYirRkS', 'Y'),
(5, '2015-03-18 08:06:39', '2015-03-18 08:06:39', 4, 'jrescay@gmail.com', 'vTfZxm7iR4ErXIDMo0z1KVJBjCbcOuheHSW3kypaLUnGlF96As', 'Y'),
(6, '2015-03-19 04:25:49', '2015-03-19 04:25:49', 5, 'r.afan@me.com', 'XJf3wdO2cj1D9hURlBEQIYC5qogmWutGSAZvPprK4kzxMeFTyL', 'Y'),
(7, '2015-03-26 21:22:53', '2015-03-26 21:22:53', 6, 'win_r6@hotmail.com', 'ZwQ9OIeakbNgAT4LHyVPiunfvFKotx3S50MlhUrmzJpXBGRD6q', 'N'),
(8, '2015-03-30 05:38:50', '2015-03-30 05:38:50', 7, 'carissasiy@shaw.ca', 'Jv6cdnutikWh9zHb5wQeRG0gpD17YZrPxIF4lVsmSaBU83AyOj', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `event_date` date NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lng` varchar(50) DEFAULT NULL,
  `event_category_id` int(11) NOT NULL,
  `eventinfo` longtext NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `created`, `modified`, `member_id`, `name`, `event_date`, `website`, `telephone`, `street`, `city`, `country_id`, `lat`, `lng`, `event_category_id`, `eventinfo`) VALUES
(1, '2015-02-27 00:00:00', '2015-02-26 18:15:07', 2, 'Milo Fun Run', '2015-02-28', 'milo.com.ph', '091233322233', 'Random Street', 'Makati City', 137, '14.5681692', '120.9906162', 3, 'This is a test information regarding the Milo Fun Run.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rhoncus arcu finibus rhoncus efficitur. Aliquam quis laoreet enim, vitae elementum magna. Duis augue leo, eleifend sed purus ut, placerat euismod enim. In pellentesque ullamcorper rhoncus. Morbi consectetur, nisi vitae porttitor sagittis, risus erat varius nibh, eget ultricies sem odio non sem. In suscipit ultrices tristique. Suspendisse mollis convallis sollicitudin.  Quisque vel ipsum et augue scelerisque commodo at quis elit. Vivamus molestie sem id ligula porta, id lacinia nisl viverra. Sed consequat felis eget faucibus faucibus. Sed dignissim magna nec pretium fringilla. Suspendisse eu auctor massa, in aliquet nunc. In volutpat facilisis tellus, a faucibus nisi. Aliquam quis ante at neque lobortis sodales. Nullam rutrum venenatis mi at tincidunt. Duis in volutpat ante. '),
(2, '2015-02-26 17:32:45', '2015-02-26 18:23:02', 2, 'Test', '2015-12-31', 'test.com', '2222222', '123 anywhere street', 'Marikina City', 137, '13.5678985', '121.6857566', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rhoncus arcu finibus rhoncus efficitur. Aliquam quis laoreet enim, vitae elementum magna. Duis augue leo, eleifend sed purus ut, placerat euismod enim. In pellentesque ullamcorper rhoncus. Morbi consectetur, nisi vitae porttitor sagittis, risus erat varius nibh, eget ultricies sem odio non sem. In suscipit ultrices tristique. Suspendisse mollis convallis sollicitudin.'),
(3, '2015-02-26 17:36:09', '2015-02-26 18:23:22', 2, 'Test Event 2', '2015-12-31', 'testevent2.com', '2222222', '123 anywhere street', 'Marikina City', 137, '20.2579687', '123.3568687', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rhoncus arcu finibus rhoncus efficitur. Aliquam quis laoreet enim, vitae elementum magna. Duis augue leo, eleifend sed purus ut, placerat euismod enim. In pellentesque ullamcorper rhoncus. Morbi consectetur, nisi vitae porttitor sagittis, risus erat varius nibh, eget ultricies sem odio non sem. In suscipit ultrices tristique. Suspendisse mollis convallis sollicitudin.'),
(4, '2015-02-26 17:38:35', '2015-02-26 18:23:35', 2, 'Test Event 3', '2016-12-31', 'testevent3.com.ph', '2222222', '123 anywhere street ulit', 'Marikina City', 137, '35.2586865', '130.2587546', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rhoncus arcu finibus rhoncus efficitur. Aliquam quis laoreet enim, vitae elementum magna. Duis augue leo, eleifend sed purus ut, placerat euismod enim. In pellentesque ullamcorper rhoncus. Morbi consectetur, nisi vitae porttitor sagittis, risus erat varius nibh, eget ultricies sem odio non sem. In suscipit ultrices tristique. Suspendisse mollis convallis sollicitudin.'),
(5, '2015-02-26 17:52:38', '2015-02-26 18:14:20', 2, 'Metro Manila Food Fest', '2015-07-21', 'foodfest.com.ph', '09245534432', 'Maginhawa St.', 'Quezon City', 137, '14.5681692', '120.9906162', 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin rhoncus arcu finibus rhoncus efficitur. Aliquam quis laoreet enim, vitae elementum magna. Duis augue leo, eleifend sed purus ut, placerat euismod enim. In pellentesque ullamcorper rhoncus. Morbi consectetur, nisi vitae porttitor sagittis, risus erat varius nibh, eget ultricies sem odio non sem. In suscipit ultrices tristique. Suspendisse mollis convallis sollicitudin.'),
(6, '2015-02-26 19:07:47', '2015-02-26 18:11:55', 2, 'Test Event 4', '2015-07-25', 'testevent4.com.ph', '9323345', 'Ortigas Avenue', 'Pasig City', 137, '14.5900437', '121.0818826', 3, 'This is event is brought to you by SomeGoodCompany.Free 1gb flash drive for the first twenty people');

-- --------------------------------------------------------

--
-- Table structure for table `events_categories`
--

CREATE TABLE IF NOT EXISTS `events_categories` (
`id` int(11) NOT NULL,
  `created` date NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `events_categories`
--

INSERT INTO `events_categories` (`id`, `created`, `modified`, `user_id`, `name`) VALUES
(1, '2015-02-26', '2015-02-25 16:00:00', 2, 'Job Fair'),
(2, '2015-02-26', '2015-02-25 16:00:00', 2, 'Musical'),
(3, '2015-02-26', '2015-02-26 14:58:35', 2, 'Food Fest'),
(4, '2015-02-26', '2015-02-26 14:58:35', 2, 'Sale'),
(5, '2015-02-27', '2015-02-26 18:29:03', 2, 'Holiday'),
(6, '2015-02-27', '2015-02-26 18:29:07', 2, 'Meeting/Conference'),
(7, '2015-02-27', '2015-02-26 18:29:26', 2, 'Business Event');

-- --------------------------------------------------------

--
-- Table structure for table `event_reviews`
--

CREATE TABLE IF NOT EXISTS `event_reviews` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `event_reviews`
--

INSERT INTO `event_reviews` (`id`, `created`, `modified`, `member_id`, `event_id`, `content`, `rate`) VALUES
(1, '2015-02-26 18:36:44', '2015-02-26 10:36:44', 2, 1, 'Test review', 4),
(2, '2015-02-26 18:37:30', '2015-02-26 10:37:30', 2, 1, 'Test review number 2\r\n', 5),
(3, '2015-02-26 18:47:00', '2015-02-26 10:47:00', 2, 3, 'Test review for test event 2', 5),
(4, '2015-02-26 18:56:11', '2015-02-26 10:56:11', 2, 3, 'This a test event 2 1 star review', 1),
(5, '2015-02-26 19:25:48', '2015-02-26 11:25:48', 2, 2, 'Review for the 1st test entry', 3),
(6, '2015-02-26 19:26:15', '2015-02-26 11:26:15', 2, 5, 'Metro Manila Food Fest will be the best food fest ever', 5),
(7, '2015-02-26 19:26:51', '2015-02-26 11:26:51', 2, 5, 'Expensive food. Better eat at siomai house. ', 1),
(8, '2015-02-26 19:27:01', '2015-02-26 11:27:01', 2, 5, 'Meh', 3),
(9, '2015-02-26 19:27:18', '2015-02-26 11:27:18', 2, 6, 'Test Event 4 review number 1', 4),
(10, '2015-02-26 19:27:52', '2015-02-26 18:28:19', 2, 4, 'Napunta ng Korea! Aba Matinde!', 5);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE IF NOT EXISTS `friend_requests` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `requester_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `created`, `modified`, `member_id`, `requester_id`, `status`) VALUES
(1, '2015-02-26 06:42:07', '2015-02-26 06:42:07', 1, 1, 'Requested'),
(2, '2015-02-26 13:50:41', '2015-02-26 05:50:41', 1, 2, 'Requested');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE IF NOT EXISTS `jobs` (
`id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `position` varchar(100) NOT NULL,
  `job_category_id` int(11) NOT NULL,
  `job_description` text NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL,
  `salary_from` decimal(10,2) DEFAULT NULL,
  `salary_to` decimal(10,2) DEFAULT NULL,
  `requirements` text NOT NULL,
  `benefits` text NOT NULL,
  `how_to_apply` text NOT NULL,
  `view_hits` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `created`, `modified`, `member_id`, `position`, `job_category_id`, `job_description`, `company`, `website`, `email`, `telephone`, `street`, `city`, `country_id`, `salary_from`, `salary_to`, `requirements`, `benefits`, `how_to_apply`, `view_hits`) VALUES
(1, '2015-03-03 04:57:51', '2015-03-26 10:36:51', 1, 'Junior Web Developer', 1, '<p>We are startup, looking for Junior PHP Developer. FRESH GRADUATES are welcome to apply. Fulltime Office Based Regular exposure to business stakeholders and executive management, as well as the authority and scope to apply your expertise to many interesting technical problems. Candidate must have a strong understanding of UI, cross-browser compatibility, general web functions and standards. The position requires constant communication with colleagues. Experience in planning and delivering software platforms used across multiple products and organizational units. Deep expertise and hands on experience with Web Applications and programming languages such as HTML, CSS, JavaScript, JQuery and API&#39;s. Deep functional knowledge or hands on design experience with Web Services (REST, SOAP, etc ..) is needed to be successful in this position. Strong grasp of security principles and how they apply to E-Commerce applications.</p>\r\n', 'GreenLogik Inc.', 'http://mybarangay.com', 'sherwinrobles@gmail.com', '+639234332382', 'Tektite Towers, Exchange Rd, Ortigas Center', 'Pasig', 137, 0.00, 0.00, '<p>Experienced in web development using PHP, MySQL, HTML5, CSS3, JQuery Have knowledge of ANY PHP Framework like CakePHP, Phalcon, etc. is preferred but not required.</p>\r\n', '<p>Skill base and negotiable</p>\r\n', '<p>Email your resume to sherwinrobles@gmail.com</p>\r\n', NULL),
(2, '2015-03-04 09:36:17', '2015-03-04 09:36:17', 1, 'Makeup Artist', 2, 'Increasing sales and growing the business;\r\n-Enhancing the retailer''s image as a high-end store; and\r\n-Establishing and maintaining retailer as the destination store for our prestige brand, Laura Mercier cosmetics. \r\n\r\nResponsibilities include:\r\n-Assist customer in doing facial and makeover consultations\r\n-Attend training classes and maintain product knowledge awareness\r\n-Conduct product demonstrations to model selling and customer service techniques\r\n-Develop and maintain own clientele, including phone contact, letters, and phone calls\r\n-Drive sales and assure that all goals are being met\r\n-Focus brand sales by line/resource \r\n-Is an expert about merchandise/line â€“ the features, advantages, and benefits\r\n-Operate P.O.S. register and report sales accurately\r\n-Recommend proprietary credit to all customers, in keeping with retailer''s standards', 'Stila Styles LLC', 'http://stilastyles.com', 'hr@stilastyles.com', '(111) 111-111', 'Arden Avenue, Glendale ', 'CALIFORNIA 91203', 183, 15000.00, 20000.00, 'Requirements for the Position:\r\n- Artistry experience in a retail environment required\r\n- Excellent communication skills \r\n- Independent and self-motivated \r\n- Ability to prioritize tasks and meet deadlines \r\n- High energy, driven and a commitment to succeed \r\n\r\nEducation and/or Experience:\r\n- Proven track record of cosmetic sales \r\n- Proficient in Microsoft Office', 'Negotiable', 'Send email to hr@stilastyles.com', NULL),
(3, '2015-03-13 05:32:38', '2015-03-13 05:32:38', 1, 'UI/UX Front-End Developer', 1, '<p>Headforwards are looking for an experienced front end web developer with experience of UI design and UX processes. Previous experience in this sector is essential. The ideal candidate will have a certain level of understanding of some programming processes and languages whilst being expert in the core skills areas. This role will be working on very high end web application development for some of the largest companies in the world</p>\r\n', 'Headforwards', 'http://www.headforwards.com', '', '', 'Pool Innovation Centre, Trevenson Rd, Redruth', 'Cornwall', 182, 0.00, 0.00, '<ul>\r\n	<li>Exemplary HTML/CSS knowledge</li>\r\n	<li>Javascript authoring (not editing)</li>\r\n	<li>Extensive JQuery knowledge</li>\r\n	<li>AJAX</li>\r\n	<li>Photoshop/Illustrator</li>\r\n	<li>Proven ability to meet high standards of written and oral communications</li>\r\n	<li>Proven ability to work under pressure and with other people</li>\r\n	<li>Experience working in Agile environments</li>\r\n</ul>\r\n\r\n<p><strong>Optional&nbsp;skills:</strong></p>\r\n\r\n<ul>\r\n	<li>TDD Javascript</li>\r\n	<li>Framework knowledge like backbone.js and require.js</li>\r\n</ul>\r\n\r\n<p>Core hours are 5 days a week, 8.5 hours per day (9:00-17:30) Monday-Friday, including 1 hour lunch break.</p>\r\n', '<p>&nbsp;Varied dependent on experience &ndash; comparable to most UK industry levels</p>\r\n\r\n<p>This is a &ldquo;Rolling Recruitment Programme&rdquo; and the closing date for this vacancy is the last day of April 2015.</p>\r\n', '<p>Complete the application form&nbsp;<a href="http://www.headforwards.com/application-form/">here</a></p>\r\n', NULL),
(4, '2015-03-18 07:09:32', '2015-03-18 07:09:32', 1, 'Junior Web Developer', 1, 'We are startup, looking for Junior PHP Developer.\r\nFRESH GRADUATES are welcome to apply.\r\nFulltime\r\nOffice Based\r\n\r\nRegular exposure to business stakeholders and executive management, as well as the authority and scope to apply your expertise to many interesting technical problems. Candidate must have a strong understanding of UI, cross-browser compatibility, general web functions and standards. The position requires constant communication with colleagues. Experience in planning and delivering software platforms used across multiple products and organizational units. Deep expertise and hands on experience with Web Applications and programming languages such as HTML, CSS, JavaScript, JQuery and API''s. Deep functional knowledge or hands on design experience with Web Services (REST, SOAP, etc ..) is needed to be successful in this position. Strong grasp of security principles and how they apply to E-Commerce applications.', 'GreenLogik Inc.', 'http://mybarangay.com', 'sherwinrobles@gmail.com', '+639234332382', 'Tektite Towers, Exchange Rd, Ortigas Center', 'Pasig', 137, 0.00, 0.00, 'Experienced in web development using PHP, MySQL, HTML5, CSS3, JQuery \r\nHave knowledge of ANY PHP Framework like CakePHP, Phalcon, etc. is preferred but not required.', 'Skill base and negotiable', 'Email your resume to sherwinrobles@gmail.com', NULL),
(5, '2015-03-18 07:10:24', '2015-03-18 07:10:24', 1, 'Junior Web Developer', 1, 'We are startup, looking for Junior PHP Developer.\r\nFRESH GRADUATES are welcome to apply.\r\nFulltime\r\nOffice Based\r\n\r\nRegular exposure to business stakeholders and executive management, as well as the authority and scope to apply your expertise to many interesting technical problems. Candidate must have a strong understanding of UI, cross-browser compatibility, general web functions and standards. The position requires constant communication with colleagues. Experience in planning and delivering software platforms used across multiple products and organizational units. Deep expertise and hands on experience with Web Applications and programming languages such as HTML, CSS, JavaScript, JQuery and API''s. Deep functional knowledge or hands on design experience with Web Services (REST, SOAP, etc ..) is needed to be successful in this position. Strong grasp of security principles and how they apply to E-Commerce applications.', 'GreenLogik Inc.', 'http://mybarangay.com', 'sherwinrobles@gmail.com', '+639234332382', 'Tektite Towers, Exchange Rd, Ortigas Center', 'Pasig', 137, 0.00, 0.00, 'Experienced in web development using PHP, MySQL, HTML5, CSS3, JQuery \r\nHave knowledge of ANY PHP Framework like CakePHP, Phalcon, etc. is preferred but not required.', 'Skill base and negotiable', 'Email your resume to sherwinrobles@gmail.com', NULL),
(6, '2015-03-18 07:12:24', '2015-03-26 10:41:25', 1, 'Junior Web Developer', 1, '<p>We are startup, looking for Junior PHP Developer. FRESH GRADUATES are welcome to apply. Fulltime Office Based Regular exposure to business stakeholders and executive management, as well as the authority and scope to apply your expertise to many interesting technical problems. Candidate must have a strong understanding of UI, cross-browser compatibility, general web functions and standards. The position requires constant communication with colleagues. Experience in planning and delivering software platforms used across multiple products and organizational units. Deep expertise and hands on experience with Web Applications and programming languages such as HTML, CSS, JavaScript, JQuery and API&#39;s. Deep functional knowledge or hands on design experience with Web Services (REST, SOAP, etc ..) is needed to be successful in this position. Strong grasp of security principles and how they apply to E-Commerce applications.</p>\r\n', 'GreenLogik Inc.', 'http://mybarangay.com', 'sherwinrobles@gmail.com', '+639234332382', 'Tektite Towers, Exchange Rd, Ortigas Center', 'Pasig', 137, 0.00, 0.00, '<p>Experienced in web development using PHP, MySQL, HTML5, CSS3, JQuery Have knowledge of ANY PHP Framework like CakePHP, Phalcon, etc. is preferred but not required.</p>\r\n', '<p>Skill base and negotiable</p>\r\n', '<p>Email your resume to sherwinrobles@gmail.com</p>\r\n', NULL),
(7, '2015-03-18 07:13:00', '2015-03-26 10:40:05', 1, 'Junior Web Developer', 1, '<p>We are startup, looking for Junior PHP Developer. FRESH GRADUATES are welcome to apply. Fulltime Office Based Regular exposure to business stakeholders and executive management, as well as the authority and scope to apply your expertise to many interesting technical problems. Candidate must have a strong understanding of UI, cross-browser compatibility, general web functions and standards. The position requires constant communication with colleagues. Experience in planning and delivering software platforms used across multiple products and organizational units. Deep expertise and hands on experience with Web Applications and programming languages such as HTML, CSS, JavaScript, JQuery and API&#39;s. Deep functional knowledge or hands on design experience with Web Services (REST, SOAP, etc ..) is needed to be successful in this position. Strong grasp of security principles and how they apply to E-Commerce applications.</p>\r\n', 'GreenLogik Inc.', 'http://mybarangay.com', 'sherwinrobles@gmail.com', '+639234332382', 'Tektite Towers, Exchange Rd, Ortigas Center', 'Pasig', 137, 0.00, 0.00, '<p>Experienced in web development using PHP, MySQL, HTML5, CSS3, JQuery Have knowledge of ANY PHP Framework like CakePHP, Phalcon, etc. is preferred but not required.</p>\r\n', '<p>Skill base and negotiable</p>\r\n', '<p>Email your resume to sherwinrobles@gmail.com</p>\r\n', NULL),
(8, '2015-03-18 07:24:04', '2015-03-26 10:39:33', 1, 'Junior Web Developer', 1, '<p>We are startup, looking for Junior PHP Developer. FRESH GRADUATES are welcome to apply. Fulltime Office Based Regular exposure to business stakeholders and executive management, as well as the authority and scope to apply your expertise to many interesting technical problems. Candidate must have a strong understanding of UI, cross-browser compatibility, general web functions and standards. The position requires constant communication with colleagues. Experience in planning and delivering software platforms used across multiple products and organizational units. Deep expertise and hands on experience with Web Applications and programming languages such as HTML, CSS, JavaScript, JQuery and API&#39;s. Deep functional knowledge or hands on design experience with Web Services (REST, SOAP, etc ..) is needed to be successful in this position. Strong grasp of security principles and how they apply to E-Commerce applications.</p>\r\n', 'GreenLogik Inc.', 'http://mybarangay.com', 'sherwinrobles@gmail.com', '+639234332382', 'Tektite Towers, Exchange Rd, Ortigas Center', 'Pasig', 137, 0.00, 0.00, '<p>Experienced in web development using PHP, MySQL, HTML5, CSS3, JQuery Have knowledge of ANY PHP Framework like CakePHP, Phalcon, etc. is preferred but not required.</p>\r\n', '<p>Skill base and negotiable</p>\r\n', '<p>Email your resume to sherwinrobles@gmail.com</p>\r\n', NULL),
(9, '2015-03-18 07:31:10', '2015-03-18 07:31:10', 1, 'Junior Web Developer', 1, 'We are startup, looking for Junior PHP Developer.\r\nFRESH GRADUATES are welcome to apply.\r\nFulltime\r\nOffice Based\r\n\r\nRegular exposure to business stakeholders and executive management, as well as the authority and scope to apply your expertise to many interesting technical problems. Candidate must have a strong understanding of UI, cross-browser compatibility, general web functions and standards. The position requires constant communication with colleagues. Experience in planning and delivering software platforms used across multiple products and organizational units. Deep expertise and hands on experience with Web Applications and programming languages such as HTML, CSS, JavaScript, JQuery and API''s. Deep functional knowledge or hands on design experience with Web Services (REST, SOAP, etc ..) is needed to be successful in this position. Strong grasp of security principles and how they apply to E-Commerce applications.', 'GreenLogik Inc.', 'http://mybarangay.com', 'sherwinrobles@gmail.com', '+639234332382', 'Tektite Towers, Exchange Rd, Ortigas Center', 'Pasig', 137, 0.00, 0.00, 'Experienced in web development using PHP, MySQL, HTML5, CSS3, JQuery \r\nHave knowledge of ANY PHP Framework like CakePHP, Phalcon, etc. is preferred but not required.', 'Skill base and negotiable', 'Email your resume to sherwinrobles@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE IF NOT EXISTS `job_categories` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `job_categories`
--

INSERT INTO `job_categories` (`id`, `created`, `modified`, `user_id`, `name`) VALUES
(1, '2015-03-03 00:00:00', '2015-03-03 04:43:08', 1, 'Information Technology'),
(2, '2015-03-03 00:00:00', '2015-03-03 04:43:08', 1, 'Business & Finance');

-- --------------------------------------------------------

--
-- Table structure for table `job_logos`
--

CREATE TABLE IF NOT EXISTS `job_logos` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `job_logos`
--

INSERT INTO `job_logos` (`id`, `created`, `modified`, `member_id`, `job_id`, `file_path`, `filename`) VALUES
(1, '2015-03-18 07:31:10', '2015-03-18 07:31:10', 1, 9, 'img/job/', '725a3e4f9c150318073110.jpg'),
(2, '2015-03-26 10:35:30', '2015-03-26 10:35:30', 1, 1, 'img/job/', 'c980d3c9a9150326103530.png'),
(3, '2015-03-26 10:39:33', '2015-03-26 10:39:33', 1, 8, 'img/job/', '983c455150150326103933.jpg'),
(4, '2015-03-26 10:40:05', '2015-03-26 10:40:05', 1, 7, 'img/job/', '919b86a5f3150326104005.jpg'),
(5, '2015-03-26 10:41:25', '2015-03-26 10:41:25', 1, 6, 'img/job/', 'c3002162fc150326104125.png');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `cookie_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `created`, `modified`, `first_name`, `middle_name`, `last_name`, `gender`, `birthday`, `street`, `city`, `country_id`, `email`, `password`, `mobile`, `timezone`, `cookie_token`) VALUES
(1, '2015-02-17 09:26:18', '2015-03-30 07:09:45', 'Sherwin', NULL, 'Robles', NULL, NULL, '858 Fabella St.', 'Mandaluyong', 137, 'stuffsontheweb@gmail.com', '$2a$08$aj/LUKCuL6BIhimNYUKgnO6auk1XJ1IZ9KvqM8pppvKwySpgDBEVe', '', NULL, '$2a$08$lbENQmvS6dZhvFwRJ0ww5uNK17N/i/aLRfu4PrFNY1mBpOgmVNHXi'),
(2, '2015-02-26 12:54:04', '2015-02-26 12:48:46', 'Ian', NULL, 'Ulita', NULL, NULL, 'Lot 15 Block 16 Sweet Gum Street, Ponte Verde Subdivision', 'Antipolo City', 138, 'ianulita@yahoo.com', '$2a$08$NY2LzkKBYFI8OAsBQDRq7.2633tuu2O0Gl1ZLzm8WaW3Wkv9rT72u', '', NULL, NULL),
(3, '2015-03-18 03:02:44', '2015-03-29 15:08:24', 'kevin', NULL, 'marc', NULL, NULL, NULL, NULL, NULL, 'prijolesk@gmail.com', '$2a$08$v8ykIEKvmDUcinpc/B/ZXOjFuj3C1flsQiIIRZtXOipwQv.mabxsu', NULL, NULL, '$2a$08$eGvVo0v9rh6/MoySwm/wi.0dDD6saQRhkNM2WdjPQ8M72URGTvgp2'),
(4, '2015-03-18 08:06:38', '2015-03-30 06:03:31', 'Jose', NULL, 'Escay', NULL, NULL, NULL, NULL, NULL, 'jrescay@gmail.com', '$2a$08$gHa87.P.f/RXtxVAo750Tuk.PGCPIbgctxKv8Cp2EN0bm6t949XcO', NULL, NULL, '$2a$08$0t.De5mRtA6mEgdzAMsXoOLPSi5Pwy8EOTo1ryVMxRSp6JP0miIg2'),
(5, '2015-03-19 04:25:48', '2015-03-30 05:35:55', 'Robert', NULL, 'Afan', NULL, NULL, '', 'Vancouver, BC  ', 31, 'emailrobert@shaw.ca', '$2a$08$yFywD3IndYJJ6RsDLbmr9usPsS66wAC9Hmgggl4TRxPmVauPFEq9K', '', NULL, '$2a$08$0GoEed/o0cOsqTJgZlEWzOKVD3bEqWomiyU.0pwMZ/qJkB19dNLva'),
(6, '2015-03-26 21:22:53', '2015-03-26 21:22:53', 'Win', NULL, 'Lui', NULL, NULL, NULL, NULL, NULL, 'win_r6@hotmail.com', '$2a$08$VZd8iZ6Od/WRnplPNeCJOO9GtTpXDLJALHdlWkFBAnZsfkvAYFXEi', NULL, NULL, NULL),
(7, '2015-03-30 05:38:50', '2015-03-30 05:45:31', 'Carissa', NULL, 'Siy', NULL, NULL, NULL, NULL, NULL, 'carissasiy@shaw.ca', '$2a$08$T5npCq69UUTqXKsAwFk8K.ZnvNvAdkf6XSlAJLCEOV9qhfFyFuxs.', NULL, NULL, '$2a$08$yQyiTTsm57Q7sr30ieD4MeSJM/2mkoM3hDdz7RGyF7jxGUKq.N0tq');

-- --------------------------------------------------------

--
-- Table structure for table `member_accounts`
--

CREATE TABLE IF NOT EXISTS `member_accounts` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `credit` decimal(13,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `member_photos`
--

CREATE TABLE IF NOT EXISTS `member_photos` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `caption` varchar(300) DEFAULT NULL,
  `primary_pic` varchar(3) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `member_photos`
--

INSERT INTO `member_photos` (`id`, `created`, `modified`, `member_id`, `file_path`, `filename`, `caption`, `primary_pic`) VALUES
(1, '2015-03-24 06:52:50', '2015-03-24 09:51:16', 1, 'img/member/', '36b051c3a3150324065250.jpg', 'This is my primary pic', 'No'),
(3, '2015-03-24 09:39:58', '2015-03-30 03:35:35', 1, 'img/member/', '87d085487b150324093958.jpg', 'Me and Mary Anne', 'No'),
(5, '2015-03-29 10:12:34', '2015-03-29 10:12:34', 3, 'img/member/', '29d035e285150329101234.jpg', '', 'Yes'),
(7, '2015-03-29 15:47:37', '2015-03-29 15:51:26', 5, 'img/member/', '768fc9a878150329034737.jpg', '', 'Yes'),
(8, '2015-03-29 15:48:45', '2015-03-29 15:49:08', 5, 'img/member/', '2eaa439a97150329034845.jpg', '', 'No'),
(9, '2015-03-30 03:07:11', '2015-03-30 04:09:59', 1, 'img/member/', '92dcb95298150330030711.jpg', 'Bago ako nadisgrasya :D', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `member_transactions`
--

CREATE TABLE IF NOT EXISTS `member_transactions` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `transaction_type_id` int(11) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `amount` decimal(13,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE IF NOT EXISTS `payment_methods` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `realties`
--

CREATE TABLE IF NOT EXISTS `realties` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country_id` int(11) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `realty_category_id` int(11) NOT NULL,
  `realty_type_id` int(11) NOT NULL,
  `realty_condition_id` int(11) NOT NULL,
  `house_area` varchar(10) DEFAULT NULL,
  `lot_area` varchar(10) DEFAULT NULL,
  `bedrooms` int(11) NOT NULL,
  `bathrooms` varchar(4) NOT NULL,
  `parking` int(11) NOT NULL,
  `pets_allowed` tinytext NOT NULL,
  `details` text NOT NULL,
  `view_hits` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `realties`
--

INSERT INTO `realties` (`id`, `created`, `modified`, `member_id`, `name`, `price`, `street`, `city`, `country_id`, `lat`, `lng`, `realty_category_id`, `realty_type_id`, `realty_condition_id`, `house_area`, `lot_area`, `bedrooms`, `bathrooms`, `parking`, `pets_allowed`, `details`, `view_hits`) VALUES
(1, '2015-03-13 06:39:45', '2015-03-13 06:39:45', 1, 'Patricia Executive Village', 4565840.00, 'Bacoor, Barangay Mabolo 3,  Bacoor', 'Cavite', 137, '14.4602022', '120.9605134', 3, 1, 1, '100', '150', 3, '2', 1, 'Yes', '<p><strong>Patricia Executive Village&nbsp;</strong><em>is an exclusive community which offers Asian-inspired single attached homes.&nbsp; &nbsp;Through its magnificent amenities, the family enjoys fun and comfort of a high-quality living in a place of warmth and generous environment. &nbsp;It is perfect for families seeking better place to grow and share life&rsquo;s precious times.</em></p>\r\n\r\n<p><strong>Access is a Privilege</strong></p>\r\n\r\n<p><em>Among the highlights of living in</em>&nbsp;<em>Patricia Executive Village</em>&nbsp;<em>is its location in the South. Situated at the key point in&nbsp;</em><em>Bacoor,&nbsp;</em><em>Barangay Mabolo 3,&nbsp; Bacoor, Cavite, about 4.5 kilometers southwest of Bacoor Town Proper. The most prominent landmark&nbsp; along this highway is the SM Bacoor.&nbsp; Malls, banks, hospitals and schools are closely converging and transportation is a breeze, you&rsquo;ll pick a deal when you know you have an easy route to life&rsquo;s vital business.</em></p>\r\n\r\n<p><strong>Comfort is Essential</strong></p>\r\n\r\n<p><em>Take pride knowing that life&rsquo;s most valuable comforts are here with the most distinguished prime amenities inclusive of spacious living and dining area, luxurious bedrooms, functional and well designed bathrooms, an electronic gate system plus a 24 hour CCTV Camera for your peace of mind.&nbsp;</em></p>\r\n\r\n<p><strong>Elegance is a Reward</strong></p>\r\n\r\n<p><em>Distinctively designed with elegance and luxury in mind, you&rsquo;ll never go wrong in boasting a home that goes beyond comfort, built with the most intelligently chosen materials, backed by years of expertise and credentials, trust that every space in your home is rewarded with elegance and style.</em></p>\r\n\r\n<h2>Reasons to buy Patricia Excutive Village</h2>\r\n\r\n<ul>\r\n	<li>LOCATION:\r\n	<ul>\r\n		<li>Accessible to all types of public transportation</li>\r\n		<li>Right along Tirona Highway</li>\r\n		<li>5 mins from SM Bacoor</li>\r\n		<li>25 mins Baclaran or SM Mall of Asia through CavitEx</li>\r\n		<li>Near Schools and Hospitals</li>\r\n	</ul>\r\n	</li>\r\n	<li>QUALITY FINISHES: Good finishes. Comes with granite floor tiles, laminated wood panels, modular cabinets, granite kitchen counter top, and even a bath tub. Also comes with fence and landscaped pocket garden already.</li>\r\n	<li>SECURITY: exclusive community with roaming guards, guarded electronic gate, and 24 hour CCTV camera</li>\r\n	<li>VALUE FOR MONEY: Still at preselling stage where price is at its lowest.</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Features, Finishes and Amenities</h2>\r\n\r\n<h3>House Features:</h3>\r\n\r\n<ul>\r\n	<li>Min Floor Area: 144 sq.m.</li>\r\n	<li>Min Lot Area: 112 sq.m.</li>\r\n	<li>Four (4) bedrooms</li>\r\n	<li>Three (3) Toilets and Baths with one bath tub</li>\r\n	<li>Spaciouse Living area</li>\r\n	<li>Dining area and Kitchen area</li>\r\n	<li>Laundry &amp; service area</li>\r\n	<li>Balcony</li>\r\n	<li>One (1) carport</li>\r\n	<li>Comes with gate</li>\r\n	<li>Provision for CATV, telephone &amp; airconditioning unit</li>\r\n</ul>\r\n\r\n<h3>Amenities</h3>\r\n\r\n<ul>\r\n	<li>Swimming Pool</li>\r\n	<li>Basketball Court</li>\r\n	<li>Electronic Gate System</li>\r\n	<li>24 hour CCTV Camera</li>\r\n	<li>Walled subdivision with secured gate</li>\r\n</ul>\r\n\r\n<h3>House Finishes:</h3>\r\n\r\n<ul>\r\n	<li>60&times;60 Synthetic Granite at the Ground Floor</li>\r\n	<li>Laminated Vinyl at second floor</li>\r\n	<li>8&times;8 floor tiles and 8&times;12 Glazed wall tiles at T&amp;B</li>\r\n	<li>Hardiflex board on exterior ceiling</li>\r\n	<li>Gypsum board on metal furring for interior ceiling</li>\r\n	<li>Colored roofing on steel framing</li>\r\n	<li>CHB 5&rdquo; Exterior wall</li>\r\n	<li>Sliding windows</li>\r\n	<li>Panel door on main entrance</li>\r\n	<li>Stainless kitchen sink on granite counter top</li>\r\n	<li>Light colored bathroom fixtures</li>\r\n	<li>Modular cabinets in all rooms</li>\r\n</ul>\r\n', NULL),
(2, '2015-03-25 08:52:51', '2015-03-25 08:52:51', 1, 'RESIDENTIAL TOWNHOUSES', 14400000.00, 'Heroes Hill Area', 'Quezon', 137, '14.0313906', '122.1130909', 4, 1, 3, '86', '336.28', 3, '4', 1, 'Yes', '<div style="background:rgb(246, 246, 246); border:0px; padding:0px">14 Units Townhouse (7 units available) FEATURES: - 4 storey - 3 bedrooms - 4 toilet and bath - With multi purpose room/ family room - 1 laundry area Lot area: 86 sqm to 89 sqm Floor area: 336.28 sqm- 342.46 sqm&nbsp;</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">&nbsp;</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px"><strong>PRICE: 14,150,000.00 to 14,400,000.00</strong></div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px"><strong>SAMPLE COMPUTATION:</strong></div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">&nbsp;</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">Total Contract Price: &nbsp;&nbsp;PHP 14,400,000.00</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">30% Down payment: &nbsp; &nbsp;PHP 4,320,000.00</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">Less Reservation:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PHP 100,000.00</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">Net down payment:&nbsp;&nbsp;&nbsp;&nbsp; PHP 4,220,000.00</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">&nbsp;</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">70% payable thru Bank Financing:&nbsp;&nbsp; PHP 10,080,000.00</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">&nbsp;</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">Approx. monthly amortization:</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">&nbsp;</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">@ 15 years to pay (fixed)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : PHP 102,238.07/ month</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">@ 10 years to pay (fixed)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : PHP 122,298.22/ month</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">@ 5 years to pay&nbsp;&nbsp; (fixed)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : PHP 199,596.08/ month</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">&nbsp;</div>\r\n\r\n<div style="background:rgb(246, 246, 246); border:0px; padding:0px">This project is located in the peaceful Heroes Hill area. I also the attached the floor plans, price list and building perspective for your reference.&nbsp; We have other for sale townhouses in Quezon City located in strategic location, just give us of your client&rsquo;s requirement and we will send you list of properties to offer within the soonest time possible.</div>\r\n', NULL),
(3, '2015-03-26 08:16:55', '2015-03-26 08:16:55', 1, 'Batangas House & Lot ', 14300000.00, 'Truy District', 'Batangas', 137, '13.7564651', '121.0583076', 3, 1, 2, '326', '10,741', 6, '4', 3, 'Yes', '<p>House in Philippines now available set in amazing mountain region of Batangas.&nbsp;<br />\r\n<br />\r\nBrokers welcome at 2.5% please email info@logicreplace.com for agreement form.&nbsp;<br />\r\n&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Stunning mountain views of Mt. Batulao and Mt.Talamitam</li>\r\n	<li>Located in Tuy district (not in the town)</li>\r\n	<li>2 km from the highway and is accessed using a concrete road</li>\r\n	<li>30 minutes drive to Tagaytay</li>\r\n	<li>90km south from Manila (about 3 hours drive)</li>\r\n	<li>10km from Nasugbu town and beach</li>\r\n	<li>200 feet above sea level</li>\r\n	<li>Cool mountain breeze</li>\r\n	<li>Pollution free fresh air</li>\r\n</ul>\r\n\r\n<p>Lot Details</p>\r\n\r\n<ul>\r\n	<li>10,741 square meters (2.65 Acres)</li>\r\n	<li>Clean title</li>\r\n	<li>Modern detached house</li>\r\n	<li>Extensive high walls surround property</li>\r\n	<li>Entry gate and driveways</li>\r\n	<li>Electricity supply</li>\r\n	<li>Deep well with electric pump</li>\r\n	<li>High pressure clean water</li>\r\n	<li>Fast internet connection with wi-fi zone</li>\r\n	<li>Mango trees</li>\r\n</ul>\r\n\r\n<p>House Details</p>\r\n\r\n<ul>\r\n	<li>Detached house</li>\r\n	<li>Built in 2008</li>\r\n	<li>Ground floor and first floor</li>\r\n	<li>Earthquake protection construction</li>\r\n	<li>Modern design</li>\r\n	<li>Curved wood staircase</li>\r\n	<li>Entrance hall</li>\r\n	<li>First level floor balcony</li>\r\n	<li>5 bedrooms, 2 with en-suit bathrooms</li>\r\n	<li>2 Additional bathrooms</li>\r\n	<li>Air conditioned rooms</li>\r\n	<li>Rooms with ceiling fans</li>\r\n	<li>Clean water supply</li>\r\n	<li>Country style kitchen and dining room</li>\r\n	<li>Lounge</li>\r\n	<li>Electric water heating</li>\r\n	<li>Satellite TV</li>\r\n	<li>Main electric supply and meter</li>\r\n	<li>Electric generator and deep well house</li>\r\n	<li>200 meter private driveway leading to house</li>\r\n	<li>Own entrance gates</li>\r\n	<li>Garage</li>\r\n	<li>External building with dirty kitchen, laundry and maids bedrooms</li>\r\n	<li>Garden area and lawns</li>\r\n</ul>\r\n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `realty_categories`
--

CREATE TABLE IF NOT EXISTS `realty_categories` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `realty_type_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `realty_categories`
--

INSERT INTO `realty_categories` (`id`, `created`, `modified`, `user_id`, `name`, `realty_type_id`) VALUES
(1, '2015-03-06 00:00:00', '2015-03-06 09:20:29', 1, 'House', 1),
(2, '2015-03-06 00:00:00', '2015-03-06 09:20:29', 1, 'Lot', 1),
(3, '2015-03-06 00:00:00', '2015-03-06 09:38:53', 1, 'House & Lot', 1),
(4, '2015-03-06 00:00:00', '2015-03-06 09:20:29', 1, 'Town House', 1),
(5, '2015-03-06 00:00:00', '2015-03-06 09:20:29', 1, 'Condo / Apartment', 1),
(6, '2015-03-06 00:00:00', '2015-03-06 09:22:56', 1, 'Hotel', 2),
(7, '2015-03-06 00:00:00', '2015-03-06 09:22:56', 1, 'Lot', 2),
(8, '2015-03-06 00:00:00', '2015-03-06 09:22:56', 1, 'Resort / Beach', 2),
(9, '2015-03-06 00:00:00', '2015-03-06 09:24:25', 1, 'Lot', 3),
(10, '2015-03-06 00:00:00', '2015-03-06 09:24:25', 1, 'Warehouse', 3);

-- --------------------------------------------------------

--
-- Table structure for table `realty_conditions`
--

CREATE TABLE IF NOT EXISTS `realty_conditions` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `realty_conditions`
--

INSERT INTO `realty_conditions` (`id`, `created`, `modified`, `user_id`, `name`) VALUES
(1, '2015-03-06 00:00:00', '2015-03-06 08:58:50', 1, 'Brand New'),
(2, '2015-03-06 00:00:00', '2015-03-26 10:32:03', 1, 'Pre-owned'),
(3, '2015-03-25 00:00:00', '2015-03-25 08:47:35', 1, 'Pre-selling');

-- --------------------------------------------------------

--
-- Table structure for table `realty_photos`
--

CREATE TABLE IF NOT EXISTS `realty_photos` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `realty_id` int(11) NOT NULL,
  `file_path` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `caption` varchar(300) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `realty_photos`
--

INSERT INTO `realty_photos` (`id`, `created`, `modified`, `member_id`, `realty_id`, `file_path`, `filename`, `caption`) VALUES
(1, '2015-03-26 08:16:55', '2015-03-26 08:16:55', 1, 3, 'img/realty/', '1177305406150326081655.jpg', ''),
(2, '2015-03-26 08:16:55', '2015-03-26 08:16:55', 1, 3, 'img/realty/', '0647e3bee8150326081655.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `realty_types`
--

CREATE TABLE IF NOT EXISTS `realty_types` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `realty_types`
--

INSERT INTO `realty_types` (`id`, `created`, `modified`, `user_id`, `name`) VALUES
(1, '2015-03-05 00:00:00', '2015-03-05 09:25:58', 1, 'Residential'),
(2, '2015-03-05 00:00:00', '2015-03-05 09:25:58', 1, 'Commercial'),
(3, '2015-03-05 00:00:00', '2015-03-05 09:26:11', 1, 'Industrial');

-- --------------------------------------------------------

--
-- Table structure for table `reset_passwords`
--

CREATE TABLE IF NOT EXISTS `reset_passwords` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(50) NOT NULL,
  `used` varchar(1) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reset_passwords`
--

INSERT INTO `reset_passwords` (`id`, `created`, `modified`, `user_id`, `email`, `token`, `used`) VALUES
(1, '2015-02-18 03:40:01', '2015-03-07 03:35:43', 1, 'sherwinrobles@gmail.com', 'biSmXKydFEHaBY9Vnsg87J5OMZrIwh2AuQveUcPDWo1tNqz0Cf', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `created`, `modified`, `member_id`, `business_id`, `content`, `rate`) VALUES
(1, '2015-02-20 02:17:46', '2015-03-11 09:08:05', 1, 1, 'Great company! Great guys!', 4),
(2, '2015-02-20 08:48:09', '2015-03-11 09:08:10', 1, 1, 'This is second comment! Everything is great!', 5),
(3, '2015-02-20 09:45:18', '2015-03-11 09:08:14', 1, 1, 'This is long review test.Hmm, okay, why all the fantabulous reviews? Could it be that half the people reviewing have never eaten sweet potatoes in this manner and therefore find it novel? Or for the others, is it because this is literally the only place you can get sweet potatoes in the area? Just speculating, because my sweet potatoes were spectacularly dull. One of them was painfully dry and could''ve choked a donkey, and the others were a bit softer and lightly sweet, but certainly not drool-worthy. ', 4),
(4, '2015-02-20 22:25:10', '2015-03-11 09:08:18', 1, 3, 'This is the first review for capital ventrues inc.', 4),
(5, '2015-02-21 02:59:56', '2015-03-11 09:08:23', 1, 4, 'any dfsdg df gdf gdf g df dfgdfghdfh df gh dfgh fd gh dfg hfd g', 3),
(6, '2015-02-24 06:30:53', '2015-03-11 09:08:28', 1, 5, 'Canadian chain selling signature premium-blend coffee, plus light fare like pastries, panini & soup', 5),
(7, '2015-02-26 18:06:53', '2015-02-26 10:06:53', 2, 1, 'This is a test review', 4),
(8, '2015-03-11 07:37:56', '2015-03-11 07:37:56', 1, 8, 'This is a review and for a test, purpose only.', 4),
(9, '2015-03-11 09:39:50', '2015-03-11 09:39:50', 1, 1, 'This is a test for computation of average rate, current is 4;', 4),
(10, '2015-03-11 09:45:25', '2015-03-11 09:45:25', 1, 1, 'San na ang rate?', 5),
(11, '2015-03-11 09:47:03', '2015-03-11 09:47:03', 1, 1, 'This is another rate.', 5),
(12, '2015-03-11 09:48:36', '2015-03-11 09:48:36', 1, 1, 'This is another 5 rate.', 5),
(13, '2015-03-12 08:35:16', '2015-03-12 08:35:16', 1, 1, 'This is a review', 5),
(14, '2015-03-18 02:54:27', '2015-03-18 02:54:27', 1, 1, 'checking the review', 5),
(15, '2015-03-18 09:11:32', '2015-03-18 09:11:32', 4, 11, 'This is a typical casual Chinese food restaurant.  The food was OK and the prices are cheap/reasonable.  To be fair, I could not be more observant since I was here for a lunch meeting, rather than to enjoy the cuisine and the place.  One thing I noticed - the place could get really noisy during lunchtime.', 3),
(16, '2015-03-19 04:40:14', '2015-03-19 04:40:14', 5, 12, 'We were in Manila on a business trip a few weeks ago and we were craving for a good burger.  We decided to try Teddyâ€™s Bigger Burgers.  Their menu looked so appetizing.\r\n\r\nWe each ordered the 7 oz Kilauea Fire with flavored fries and onion rings.  All I can say is:  sobrang sarap (so yummy).  The burger was juicy but not soggy, perfect temperature, and just enough spice.  Definitely one of the better burgers in the city.    The 7 oz. was a huge!  I would have been ok with the 5 oz burger.  The onion rings and the flavored fries were pretty good too.  Both were served hot and fresh of the deep fryer.\r\n\r\nThis is a casual dining place, perfect hangout for the barkadas.  The only drawback was that they didnâ€™t have washrooms available inside the restaurant.  We had to use the sink in the employee area behind the cash counter to wash our handsâ€¦.no big deal.\r\n\r\nBurger:  427 pesos plus add another 99 pesos to make it a combo.  Good enough for this balikbayan and my Canadian friend.  We liked it so much we ate there twice in the 2 weeks that we stayed in Manila.', 4),
(17, '2015-03-19 05:33:45', '2015-03-19 05:33:45', 5, 13, 'My friend and I went to PinPin for lunch yesterday and we had lumpiang sariwa, lumpiang shanghai, chicken and pork barbeque with java rice, and my friend had corned beef with rice and itlog (egg).\r\n\r\nStarted off with tasty sotanghong soup, which was included in their value meal, and then the rest of the meal was served.  PinPin has one of the best tasting lumpiang shanghai in the city, in my humble opinion.  Always crispy, just enough laman (filling), and the taste is quite yummy.  Theyâ€™ve definitely got this down pat.  \r\n\r\nThis is not a turo-turo restaurant.  You order off a menu, and the food is served fresh from the kitchen.  Great service, delicious food, and the setting is pleasantly comfortable.  This barangay member gives it 4 Salakots.  Highly recommended.\r\n', 4),
(18, '2015-03-20 08:28:30', '2015-03-20 08:28:30', 1, 1, 'This is another test for review', 5),
(19, '2015-03-22 21:42:19', '2015-03-22 21:42:19', 1, 8, 'This is a second review for west onyx', 4),
(20, '2015-03-28 04:39:49', '2015-03-28 04:39:49', 1, 3, 'This is 4 salakot rate and review.', 4),
(21, '2015-03-28 06:03:38', '2015-03-28 06:03:38', 1, 5, 'Canadian chain selling signature premium-blend coffee, plus light fare like pastries, panini & soup', 4),
(22, '2015-03-28 06:06:57', '2015-03-28 06:06:57', 1, 5, 'Canadian chain selling signature premium-blend coffee, plus light fare like pastries, panini & soup 4', 4),
(23, '2015-03-28 14:40:26', '2015-03-28 14:40:26', 3, 1, 'ratings lang', 3);

-- --------------------------------------------------------

--
-- Table structure for table `social_profiles`
--

CREATE TABLE IF NOT EXISTS `social_profiles` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `social_id` varchar(50) NOT NULL,
  `profile_link` varchar(200) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `street` int(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `social_network` varchar(20) NOT NULL,
  `access_token` varchar(200) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `social_profiles`
--

INSERT INTO `social_profiles` (`id`, `created`, `modified`, `member_id`, `social_id`, `profile_link`, `first_name`, `middle_name`, `last_name`, `gender`, `birthday`, `street`, `city`, `country_id`, `email`, `mobile`, `social_network`, `access_token`) VALUES
(12, '2015-02-20 01:32:52', '2015-02-20 01:32:52', 1, '116218806671873583610', 'https://plus.google.com/+SherwinRobles', 'Sherwin', NULL, 'Robles', 'male', NULL, NULL, NULL, NULL, 'sherwinrobles@gmail.com', NULL, 'Google', 'ya29.IAES6YaZkx8A-vxWDdecOx3O3b1sUfgMJBQ3OYVSOlQOakCED8sj6y4ERHWuONqImHpVEMi9jJB6qg');

-- --------------------------------------------------------

--
-- Table structure for table `things`
--

CREATE TABLE IF NOT EXISTS `things` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `member_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `thing_category_id` int(11) NOT NULL,
  `thing_condition_id` int(11) NOT NULL,
  `details` text NOT NULL,
  `view_hits` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `things`
--

INSERT INTO `things` (`id`, `created`, `modified`, `member_id`, `name`, `price`, `thing_category_id`, `thing_condition_id`, `details`, `view_hits`) VALUES
(1, '2015-03-13 09:53:36', '2015-03-13 09:53:36', 1, 'Karbonn Android One Sparkle V Blue', 3417.70, 2, 1, '<h2>PRODUCT SUMMARY OF KARBONN ANDROID ONE SPARKLE V BLUE</h2>\r\n\r\n<ul>\r\n	<li>11.43 cm (4.5) IPS Display</li>\r\n	<li>1.3 GHz Quadcore Processor</li>\r\n	<li>1 GB RAM and 4 GB ROM</li>\r\n	<li>5 MP Rear Camera and 2 MP Front</li>\r\n	<li>Android v 4.4 KitKat</li>\r\n	<li>Dual SIM</li>\r\n	<li>1700mAh Lithium Polymer Battery</li>\r\n	<li>Latest Updates by Android One</li>\r\n	<li>Android One certified hardware and software</li>\r\n	<li>1 Year Brand Warranty</li>\r\n	<li>SUPC:&nbsp;SDL341238150</li>\r\n</ul>\r\n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thing_categories`
--

CREATE TABLE IF NOT EXISTS `thing_categories` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `thing_categories`
--

INSERT INTO `thing_categories` (`id`, `created`, `modified`, `user_id`, `name`) VALUES
(1, '2015-03-13 00:00:00', '2015-03-13 09:42:41', 1, 'Computers'),
(2, '2015-03-13 00:00:00', '2015-03-13 09:42:41', 1, 'Phones'),
(3, '2015-03-13 00:00:00', '2015-03-13 09:42:41', 1, 'Clothes'),
(4, '2015-03-13 00:00:00', '2015-03-13 09:42:41', 1, 'Shoes'),
(5, '2015-03-13 00:00:00', '2015-03-13 09:42:41', 1, 'Appliances');

-- --------------------------------------------------------

--
-- Table structure for table `thing_conditions`
--

CREATE TABLE IF NOT EXISTS `thing_conditions` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `thing_conditions`
--

INSERT INTO `thing_conditions` (`id`, `created`, `modified`, `user_id`, `name`) VALUES
(1, '2015-03-13 00:00:00', '2015-03-13 09:35:16', 1, 'Brand New'),
(2, '2015-03-13 00:00:00', '2015-03-13 09:35:16', 1, 'Used');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE IF NOT EXISTS `transaction_types` (
`id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `created` date NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `birth_day` date NOT NULL,
  `street` varchar(150) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country_id` int(11) NOT NULL,
  `email` int(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `business`
--
ALTER TABLE `business`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_categories`
--
ALTER TABLE `business_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_category_lists`
--
ALTER TABLE `business_category_lists`
 ADD KEY `id` (`id`);

--
-- Indexes for table `business_category_list_updates`
--
ALTER TABLE `business_category_list_updates`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_images`
--
ALTER TABLE `business_images`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_sub_categories`
--
ALTER TABLE `business_sub_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_updates`
--
ALTER TABLE `business_updates`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_confirmations`
--
ALTER TABLE `email_confirmations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events_categories`
--
ALTER TABLE `events_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_reviews`
--
ALTER TABLE `event_reviews`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_logos`
--
ALTER TABLE `job_logos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_accounts`
--
ALTER TABLE `member_accounts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_photos`
--
ALTER TABLE `member_photos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_transactions`
--
ALTER TABLE `member_transactions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realties`
--
ALTER TABLE `realties`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realty_categories`
--
ALTER TABLE `realty_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realty_conditions`
--
ALTER TABLE `realty_conditions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realty_photos`
--
ALTER TABLE `realty_photos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `realty_types`
--
ALTER TABLE `realty_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_profiles`
--
ALTER TABLE `social_profiles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `things`
--
ALTER TABLE `things`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thing_categories`
--
ALTER TABLE `thing_categories`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thing_conditions`
--
ALTER TABLE `thing_conditions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `business_categories`
--
ALTER TABLE `business_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1172;
--
-- AUTO_INCREMENT for table `business_category_lists`
--
ALTER TABLE `business_category_lists`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `business_category_list_updates`
--
ALTER TABLE `business_category_list_updates`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `business_images`
--
ALTER TABLE `business_images`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `business_sub_categories`
--
ALTER TABLE `business_sub_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `business_updates`
--
ALTER TABLE `business_updates`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=193;
--
-- AUTO_INCREMENT for table `email_confirmations`
--
ALTER TABLE `email_confirmations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `events_categories`
--
ALTER TABLE `events_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `event_reviews`
--
ALTER TABLE `event_reviews`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `job_logos`
--
ALTER TABLE `job_logos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `member_accounts`
--
ALTER TABLE `member_accounts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member_photos`
--
ALTER TABLE `member_photos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `member_transactions`
--
ALTER TABLE `member_transactions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `realties`
--
ALTER TABLE `realties`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `realty_categories`
--
ALTER TABLE `realty_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `realty_conditions`
--
ALTER TABLE `realty_conditions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `realty_photos`
--
ALTER TABLE `realty_photos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `realty_types`
--
ALTER TABLE `realty_types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `reset_passwords`
--
ALTER TABLE `reset_passwords`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `social_profiles`
--
ALTER TABLE `social_profiles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `things`
--
ALTER TABLE `things`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `thing_categories`
--
ALTER TABLE `thing_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `thing_conditions`
--
ALTER TABLE `thing_conditions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
