-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2024 at 07:33 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `corememories`
--

-- --------------------------------------------------------

--
-- Table structure for table `islandcontents`
--

CREATE TABLE `islandcontents` (
  `islandContentID` int(4) NOT NULL,
  `islandOfPersonalityID` int(4) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `content` varchar(300) NOT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `islandcontents`
--

INSERT INTO `islandcontents` (`islandContentID`, `islandOfPersonalityID`, `image`, `content`, `color`) VALUES
(1, 1, 'images/adv1.png', 'My first hiking experience was an exhilarating adventure that allowed me to connect with nature, challenge my physical limits, and create lasting memories while exploring breathtaking landscapes.', NULL),
(2, 1, 'images/adv2.png', 'Embracing the hiking experience offers a unique opportunity to immerse myself in nature, enjoy the tranquility of the outdoors, and discover the beauty of diverse landscapes while enhancing my physical fitness.', NULL),
(3, 1, 'images/adv3.png', 'Spending the night camping under the stars provides a refreshing escape from daily life, fostering a deep connection with nature, and creating unforgettable memories around the campfire with friends.', NULL),
(4, 2, 'images/gaming1.png', 'Achieving the Platinum rank in Valorant signifies a high level of skill and strategic gameplay, showcasing a player\'s ability to effectively collaborate with teammates, make quick decisions, and consistently perform well in competitive matches.', NULL),
(5, 2, 'images/gaming2.png', 'Participating in tournaments offers a thrilling opportunity to test one’s skills against top competitors, fostering personal growth, teamwork, and strategic thinking in a high-pressure environment.', NULL),
(6, 2, 'images/gaming3.png', 'Achieving the Mythical Glory rank in Mobile Legends represents the pinnacle of skill and dedication, demonstrating exceptional gameplay, strategic mastery, and the ability to consistently outperform opponents in competitive matches.', NULL),
(7, 3, 'images/gym1.png', 'Working out at the gym with my brother is a rewarding hobby that strengthens our bond, promotes physical fitness, and motivates us to achieve our health goals together.', NULL),
(8, 3, 'images/gym2.png', 'Achieving personal records (PRs) in the gym is a thrilling milestone that reflects my dedication, progress, and commitment to pushing my physical limits and enhancing my overall fitness.', NULL),
(9, 3, 'images/gym3.png', 'Noticing my small gains serves as a motivating reminder of my progress and dedication, highlighting the incremental improvements that contribute to my overall fitness journey.', NULL),
(10, 4, 'images/programming1.png', 'Writing the code for my first \"Hello World\" program was a significant milestone, marking the beginning of my journey into programming and showcasing my newfound ability to create and execute simple code.', NULL),
(11, 4, 'images/programming2.png', 'Enhancing my logical reasoning skills to effectively debug code is a crucial aspect of my development as a programmer, enabling me to identify issues, analyze solutions, and implement fixes with greater efficiency.', NULL),
(12, 4, 'images/programming3.png', 'Continuously learning coding is essential for my growth as a programmer, allowing me to stay updated with the latest technologies, refine my skills, and tackle increasingly complex challenges.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `islandsofpersonality`
--

CREATE TABLE `islandsofpersonality` (
  `islandOfPersonalityID` int(4) NOT NULL,
  `name` varchar(40) NOT NULL,
  `shortDescription` varchar(300) DEFAULT NULL,
  `longDescription` varchar(900) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `islandsofpersonality`
--

INSERT INTO `islandsofpersonality` (`islandOfPersonalityID`, `name`, `shortDescription`, `longDescription`, `color`, `image`, `status`) VALUES
(1, 'Adventure Island', 'A thrilling and ever-changing island that captures Jairo’s love for exploring the unknown and embracing challenges. From nature trails to adrenaline-pumping activities, this is where his daring spirit comes alive.', 'A thrilling and ever-changing island that captures Jairo’s love for exploring the unknown and embracing challenges. From nature trails to adrenaline-pumping activities, this is where his daring spirit comes alive.\r\n', 'red', 'images/adventureIsland.png', NULL),
(2, 'Gaming Island', 'A vibrant and lively island filled with digital landscapes, heroic battles, and endless challenges. It’s where Jairo’s strategic mind and competitive edge shine the brightest.', 'A vibrant and lively island filled with digital landscapes, heroic battles, and endless challenges. It’s where Jairo’s strategic mind and competitive edge shine the brightest.', 'pink', 'images/gamingIsland.png', NULL),
(3, 'Gym Island', 'A strong and disciplined island, representing Jairo’s commitment to physical health and personal growth. It’s a place of grit, perseverance, and achievement.\n\n', 'A strong and disciplined island, representing Jairo’s commitment to physical health and personal growth. It’s a place of grit, perseverance, and achievement.\n\n', 'blue', 'images/gymIsland.png', 'active'),
(4, 'Programming Island', 'This island is the powerhouse of logic and creativity. It’s a world of glowing screens, dynamic code, and endless possibilities, where Jairo builds, innovates, and solves complex problems.\n\n', 'This island is the powerhouse of logic and creativity. It’s a world of glowing screens, dynamic code, and endless possibilities, where Jairo builds, innovates, and solves complex problems.\n\n', 'yellow', 'images/programmingIsland.png', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `islandcontents`
--
ALTER TABLE `islandcontents`
  ADD PRIMARY KEY (`islandContentID`);

--
-- Indexes for table `islandsofpersonality`
--
ALTER TABLE `islandsofpersonality`
  ADD PRIMARY KEY (`islandOfPersonalityID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `islandcontents`
--
ALTER TABLE `islandcontents`
  MODIFY `islandContentID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `islandsofpersonality`
--
ALTER TABLE `islandsofpersonality`
  MODIFY `islandOfPersonalityID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
