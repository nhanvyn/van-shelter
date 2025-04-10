-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2025 at 06:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `van_shelter`
--

-- --------------------------------------------------------

--
-- Table structure for table `animaltype`
--

CREATE TABLE `animaltype` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animaltype`
--

INSERT INTO `animaltype` (`type_id`, `type_name`) VALUES
(3, 'Bird'),
(2, 'Cat'),
(1, 'Dog');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmarks`
--

INSERT INTO `bookmarks` (`id`, `user_id`, `pet_id`, `created_at`) VALUES
(100, 8, 35307, '2025-04-06 22:45:20'),
(101, 8, 35288, '2025-04-06 22:45:21'),
(103, 8, 35308, '2025-04-07 23:36:33'),
(104, 8, 35306, '2025-04-08 01:00:32'),
(108, 9, 35282, '2025-04-08 02:04:07'),
(125, 10, 35308, '2025-04-09 04:22:32'),
(126, 10, 35281, '2025-04-09 04:22:34');

-- --------------------------------------------------------

--
-- Table structure for table `breeds`
--

CREATE TABLE `breeds` (
  `breed_id` int(11) NOT NULL,
  `breed_name` varchar(100) NOT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `breeds`
--

INSERT INTO `breeds` (`breed_id`, `breed_name`, `type_id`) VALUES
(92, 'Lab X', 1),
(93, 'Pit Bull', 1),
(94, 'Lab', 1),
(95, 'Chihuahua', 1),
(96, 'Labrador', 1),
(97, 'Shih Tzu', 1),
(98, 'Rottweiler', 1),
(99, 'Husky', 1),
(100, 'Shep X', 1),
(101, 'Pitbull', 1),
(102, 'Husky X', 1),
(103, 'Shepherd X', 1),
(104, 'Terrier X', 1),
(105, 'Pomeranian', 1),
(106, 'German Shepherd', 1),
(107, 'Border Collie', 1),
(108, 'Golden Retriever', 1),
(109, 'Germ. Shepherd', 1),
(110, 'Shepherd', 1),
(111, 'Beagle', 1),
(112, 'Border Collie X', 1),
(113, 'Pug', 1),
(114, 'Shep', 1),
(115, 'Retriever', 1),
(116, 'Maltese', 1),
(117, 'Pit X', 1),
(118, 'Jack Russell Terrier', 1),
(119, 'Shiba Inu', 1),
(120, 'Collie X', 1),
(121, 'Poodle X', 1),
(122, 'Cocker Spaniel', 1),
(123, 'Pitbull X', 1),
(124, 'French Bulldog', 1),
(125, 'Maltipoo', 1),
(126, 'Yorkshire Terrier', 1),
(127, 'Boxer', 1),
(128, 'Rottweiler X', 1),
(129, 'Shih Tzu X', 1),
(130, 'Bichon Frise', 1),
(131, 'Boston Terrier', 1),
(132, 'Yorkie X', 1),
(133, 'Miniature Poodle', 1),
(134, 'Chihuahua X', 1),
(135, 'Samoyed', 1),
(136, 'Siberian Husky', 1),
(137, 'Sheltie', 1),
(138, 'Chow', 1),
(139, 'Malamute', 1),
(140, 'Pit Bull X', 1),
(141, 'Rotty', 1),
(142, 'Schnauzer', 1),
(143, 'Toy Poodle', 1),
(144, 'Akita', 1),
(145, 'Lhasa Apso', 1),
(146, 'Labrador X', 1),
(147, 'Shep X Lab', 1),
(148, 'Poodle', 1),
(149, 'Shep X Husky', 1),
(150, 'Dachshund', 1),
(151, 'Rott', 1),
(152, 'Mastiff X', 1),
(153, 'Rotty X', 1),
(154, 'Terrier', 1),
(155, 'Pekingese', 1),
(156, 'Chow X', 1),
(157, 'Collie', 1),
(158, 'Maltese X', 1),
(159, 'Min Pin', 1),
(160, 'Miniature Pinscher', 1),
(161, 'Doberman', 1),
(162, 'Labradoodle', 1),
(163, 'Malamute X', 1),
(164, 'American Eskimo', 1),
(165, 'Cockapoo', 1),
(166, 'Labrador Retriever', 1),
(167, 'Rottweiller', 1),
(168, 'German Shepherd X', 1),
(169, 'Lab X Shep', 1),
(170, 'Golden Retreiver', 1),
(171, 'Retriever X', 1),
(172, 'Jack Russell', 1),
(173, 'Yorkie', 1),
(174, 'Pom', 1),
(175, 'Chow Chow', 1),
(176, 'Rottie X', 1),
(177, 'Spaniel X', 1),
(178, 'Akita X', 1),
(179, 'Beagle X', 1),
(180, 'Standard Poodle', 1),
(181, 'Lab X Pit', 1),
(182, 'Cat - DSH', 2),
(183, 'Cat - DMH', 2),
(184, 'Bird, Budgie', 3),
(185, 'Bird, Pigeon', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `pet_id`, `message`, `is_read`, `created_at`) VALUES
(53, 8, 35308, 'Status for pet \'Gloom\' changed from \'Health\' to \'Hold\'.', 1, '2025-04-07 04:54:23'),
(54, 8, 35307, 'Status for pet \'Spark\' changed from \'Health\' to \'Adoption Pending\'.', 1, '2025-04-07 04:54:28'),
(55, 8, 35288, 'Status for pet \'Jackson\' changed from \'Behavior\' to \'Impound\'.', 1, '2025-04-07 04:54:32'),
(56, 8, 35308, 'Status for pet \'Gloom\' changed from \'Hold\' to \'Adoptable\'.', 1, '2025-04-07 05:10:05'),
(57, 8, 35307, 'Status for pet \'Spark\' changed from \'Adoption Pending\' to \'Seized\'.', 1, '2025-04-07 05:10:11'),
(58, 8, 35288, 'Status for pet \'Jackson\' changed from \'Impound\' to \'Passed Away\'.', 1, '2025-04-07 05:10:15'),
(59, 8, 35288, 'Status for pet \'Jackson\' changed from \'Passed Away\' to \'Ride Home Free\'.', 1, '2025-04-07 05:10:33'),
(60, 8, 35308, 'Status for pet \'Gloom\' changed from \'Adoptable\' to \'Behavior\'.', 1, '2025-04-07 05:11:06'),
(61, 8, 35307, 'Status for pet \'Spark\' changed from \'Seized\' to \'Owner Request - Signed Over\'.', 1, '2025-04-07 05:11:11'),
(62, 8, 35308, 'Status for pet \'Gloom\' changed from \'Behavior\' to \'Hold\'.', 1, '2025-04-07 05:39:10'),
(63, 7, 35308, 'Status for pet \'Gloom\' changed from \'Behavior\' to \'Hold\'.', 1, '2025-04-07 05:39:10'),
(64, 9, 35282, 'Status for pet \'Sailor (new name)\' changed from \'Adoption Assessment\' to \'Adoption Pending\'.', 1, '2025-04-08 02:04:32'),
(65, 9, 35282, 'Status for pet \'Sailor (new name)\' changed from \'Adoption Pending\' to \'Adoptable\'.', 1, '2025-04-08 02:05:11'),
(66, 10, 35287, 'Status for pet \'Hashbrown? Bella?\' changed from \'Impound\' to \'Adoption Assessment\'.', 1, '2025-04-09 02:30:19'),
(67, 8, 35306, 'Status for pet \'Flip\' changed from \'Adoptable\' to \'Court Ordered\'.', 0, '2025-04-09 02:30:31'),
(68, 8, 35306, 'Status for pet \'Flip\' changed from \'Court Ordered\' to \'Hold\'.', 0, '2025-04-09 02:30:46'),
(69, 10, 35287, 'Status for pet \'Hashbrown? Bella?\' changed from \'Adoption Assessment\' to \'Health\'.', 1, '2025-04-09 02:31:10'),
(70, 8, 35288, 'Status for pet \'Jackson\' changed from \'Ride Home Free\' to \'Adoptable\'.', 0, '2025-04-09 02:31:47'),
(71, 10, 35288, 'Status for pet \'Jackson\' changed from \'Ride Home Free\' to \'Adoptable\'.', 1, '2025-04-09 02:31:47'),
(72, 8, 35307, 'Status for pet \'Spark\' changed from \'Owner Request - Signed Over\' to \'Adoption Pending\'.', 0, '2025-04-09 02:31:54'),
(73, 10, 35307, 'Status for pet \'Spark\' changed from \'Owner Request - Signed Over\' to \'Adoption Pending\'.', 1, '2025-04-09 02:31:54');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `animal_id` int(11) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `date_impounded` date DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `kennel_number` varchar(20) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `age_category` varchar(50) DEFAULT NULL,
  `breed_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`animal_id`, `sex`, `date_impounded`, `name`, `kennel_number`, `color`, `age_category`, `breed_id`, `source_id`, `status_id`) VALUES
(26981, 'F', '2016-02-06', 'Zoey', '100', 'Black', 'Adult', 182, 26, 5),
(27331, 'M', '2016-06-15', 'Charlie/KC', '200', 'Grey', 'Adult', 182, 27, 1),
(27643, 'F', '2016-09-29', 'Hootie', '200', 'Black', 'Adult', 182, 26, 1),
(27753, 'M/N', '2016-11-17', 'Onyx', '200', 'Black/White', 'Adult', 182, 26, 1),
(27792, 'F', '2016-11-29', 'Misty', '100', 'Black/White', 'Adult', 182, 26, 5),
(27810, 'F', '2016-12-06', 'De\'Monica', '200', 'Black', 'Adult', 182, 28, 1),
(27826, 'M/N', '2016-12-11', 'Tiga', '200', 'Orange', 'Adult', 182, 28, 1),
(27924, 'F/S', '2017-02-07', 'Smokey', '100', 'Grey', 'Young Adult', 183, 28, 5),
(28097, 'F/S', '2017-04-25', 'Princess Gertie', '100', 'Grey', 'Adult', 182, 27, 5),
(28458, 'F', '2017-08-26', 'Betty', '100', 'Black', 'Adult', 182, 2, 5),
(28602, 'F/S', '2017-10-10', 'Snowball', '100', 'White', 'Senior', 182, 26, 5),
(28793, 'M', '2017-12-20', 'Max', '200', 'Brown Tabby', 'Adult', 182, 27, 1),
(28794, 'F', '2017-12-20', 'Lady Maude', '200', 'Grey & White', 'Adult', 182, 8, 1),
(28797, 'F/S', '2017-12-20', 'Blackie', '100', 'Black', 'Senior', 182, 27, 5),
(28846, 'F/S', '2018-01-13', 'KiKi', '100', 'Grey & White', 'Adult', 182, 27, 5),
(28847, 'M', '2018-01-13', 'Monkey (new name)', '100', 'Black, Grey & White', 'Young Adult', 182, 27, 5),
(28852, 'M/N', '2018-01-17', 'Mr Benster', '200', 'Black', 'Adult', 182, 1, 1),
(28990, 'F/S', '2018-03-17', 'Madison', '100', 'Grey, white, tan', 'Adult', 182, 26, 5),
(29094, 'F/S', '2018-04-24', 'Tigger #14', '100', 'Black', 'Senior', 182, 26, 5),
(29126, 'F', '2018-05-03', 'Kona', '100', 'Black', 'Young Adult', 182, 26, 5),
(29127, 'F', '2018-05-03', 'Luna', '100', 'Black w/ white paws & chest', 'Adult', 182, 26, 5),
(30151, 'M', '2019-08-26', '', '200', 'Black', 'Adult', 182, 26, 1),
(31967, 'X', '2021-02-27', '', '100', 'White w/ dk tail feathers', 'Adult', 185, 2, 9),
(32997, 'X', '2021-03-15', '', '100', 'grey/black/brown', 'Adult', 185, 1, 5),
(33001, 'X', '2021-03-17', '', '100', 'Brown/black/white', 'Adult', 185, 1, 5),
(33002, 'M', '2021-03-17', 'Oscar', '200', 'Black', 'Adult', 182, 26, 1),
(33003, 'M', '2021-03-17', 'BPJ (Big Production Jr.)', '200', 'Black & White', 'Puppy', 183, 26, 1),
(33073, 'F', '2021-05-11', '', '100', 'Yellow', 'Adult', 184, 2, 5),
(33080, 'X', '2021-05-15', '', '100', 'Blue, white w/black', 'Adult', 184, 1, 5),
(33122, 'F', '2021-06-14', '', '100', 'White w/black striped head', 'Adult', 184, 2, 5),
(33138, 'M', '2021-06-24', '', '100', 'White & Blue', 'Adult', 184, 2, 5),
(33165, 'X', '2021-07-07', 'Blueberry', '200', 'Blue/White/Black', 'Adult', 184, 1, 1),
(33174, 'X', '2021-07-15', '', 'Bunny lane', 'White', 'Adult', 185, 1, 15),
(33221, 'X', '2021-08-05', 'Andrew aka Pudgie', '200', 'Black/Grey', 'Adult', 185, 1, 1),
(33224, 'F', '2021-08-06', 'Miracle (new name)', '200', 'Blue, Black w/white', 'Young Adult', 184, 2, 3),
(33226, 'X', '2021-08-08', 'Destiny (new name)', '200', 'Blue & White', 'Adult', 184, 2, 3),
(33247, 'M', '2021-08-17', 'Phenomenon (New Name)', '200', 'Green/yellow', 'Adult', 184, 1, 3),
(33282, 'X', '2021-09-15', 'Trodcho', '200', 'Yellow & Green', 'Adult', 184, 2, 1),
(33362, 'F', '2021-11-17', '', '100', 'Yellow w/white on cheeks', 'Adult', 184, 2, 5),
(33399, 'X', '2021-12-15', 'Alona (new name)', 'ISO', 'Grey, lt and dark', 'Adult', 185, 2, 15),
(33410, 'F', '2022-01-16', '', '200', 'Yellow/Green', 'Young Adult', 184, 1, 3),
(33449, 'M', '2022-02-14', 'Milo', '100', 'Black/White', 'Puppy', 182, 1, 5),
(33477, 'X', '2022-03-01', '', 'ISO', 'Black & white', 'Adult', 185, 1, 15),
(33497, 'F', '2022-03-17', 'Midge (new name)', '200', 'Yellow', 'Adult', 184, 2, 3),
(33564, 'F', '2022-05-01', 'TnT (new name)', '200', 'Green / Yellow', 'Adult', 184, 1, 3),
(33578, 'M', '2022-05-10', '', '100', 'Blue & white', 'Adult', 184, 1, 9),
(33580, 'X', '2022-05-12', '', 'Bunny Lane', 'White/black', 'Adult', 185, 1, 15),
(33581, 'M', '2022-05-12', 'Little Elvis (new name)', '100', 'Blue w/black', 'Adult', 184, 1, 5),
(33590, 'F', '2022-05-18', 'Meryl Cheep (new name)', '100', 'Yellow & green', 'Adult', 184, 1, 5),
(33603, 'M', '2022-05-27', '', '100', 'Blue, Black & White', 'Adult', 184, 2, 9),
(33621, 'X', '2022-05-10', 'Ajax - new name', '100', 'Grey, black & white', 'Young Adult', 185, 2, 15),
(33622, 'X', '2022-06-01', '', '200', 'Grey, Black & White', 'Young Adult', 185, 2, 1),
(33646, 'X', '2022-06-20', '', '100', 'Brown & white', 'Adult', 185, 2, 9),
(33661, 'F', '2022-06-28', 'Pineapple (new name)', '200', 'Yellow', 'Adult', 184, 1, 3),
(33677, 'F', '2022-07-08', '', '200', 'Green & Yellow', 'Adult', 184, 1, 1),
(33678, 'F', '2022-07-08', '', '200', 'Blue w/Black', 'Adult', 184, 1, 1),
(33680, 'F', '2022-07-10', 'Mango (new name)', '100', 'Green & Yellow', 'Adult', 184, 1, 5),
(33718, 'X', '2022-08-04', 'Blueberry (new name)', '100', 'Blue/black/white', 'Adult', 184, 1, 5),
(33743, 'F', '2022-08-15', 'Limoncello (new name)', '200', 'Yellow', 'Young Adult', 184, 1, 3),
(33751, 'M', '2022-08-22', 'Patches', '200', 'Black & white', 'Young Adult', 182, 1, 1),
(33825, 'X', '2022-10-01', '', 'ISO', 'White', 'Adult', 185, 2, 15),
(33827, 'X', '2022-10-02', '', 'ISO', 'White with Red tips', 'Adult', 185, 2, 15),
(33862, 'F', '2022-10-24', 'Paula (new name)', '100', 'Yellow w/ Green', 'Adult', 184, 2, 5),
(33881, 'F', '2022-11-10', 'Gloria (new name)', '100', 'White & Blue', 'Adult', 184, 2, 5),
(33937, 'M/N', '2022-12-18', 'Cocoa', '200', 'Black', 'Adult', 182, 2, 1),
(33938, 'M/N', '2022-12-18', 'Buttercup', '200', 'Black', 'Adult', 182, 2, 1),
(33957, 'M', '2023-01-03', 'Jackson', '200', 'Brown', 'Young Adult', 104, 1, 1),
(33958, 'M', '2023-01-04', 'Fin', '200', 'White w/ Grey', 'Puppy', 105, 2, 1),
(33961, 'M', '2023-01-11', 'Deka', '400', 'Golden', 'Adult', 92, 2, 2),
(33963, 'F', '2023-01-11', 'Jada', '400', 'Grey-ish', 'Adult', 129, 1, 2),
(33967, 'F', '2023-01-15', 'Huanxi', '200', 'Grey & White', 'Adult', 117, 1, 1),
(33974, 'F/S', '2023-01-18', 'Sable (Sayba new name)', '200', 'Tan with White', 'Adult', 93, 2, 3),
(33975, 'M/N', '2023-01-19', 'Dexter', '200', 'Black & White', 'Adult', 102, 1, 1),
(33977, 'F', '2023-01-20', 'Sasha', '400', 'Tan', 'Adult', 109, 2, 2),
(33979, 'M', '2023-01-23', 'Bentley', '200', 'Brown', 'Adult', 104, 1, 1),
(33980, 'F', '2023-01-23', 'Breezy', '200', 'Grey & white', 'Young Adult', 93, 1, 1),
(33986, 'F', '2023-01-27', 'Cleo', '200', 'White w/black spots', 'Young Adult', 93, 1, 1),
(33989, 'M/N', '2023-01-30', 'Pesser', '200', 'White', 'Adult', 105, 3, 1),
(33991, 'M', '2023-02-02', 'Maiko', '200', 'White and Grey', 'Adult', 99, 2, 1),
(33996, 'F', '2023-02-07', 'Buddha', '400', 'Black, tan w/cream', 'Senior', 109, 3, 2),
(33997, 'M', '2023-02-08', 'Whisky', '200', 'brown/black', 'Adult', 168, 1, 1),
(34000, 'M', '2023-02-09', 'Whisky', '200', 'black/ brown', 'Adult', 168, 1, 1),
(34004, 'F', '2023-02-11', 'Lily', '200', 'Brown/golden', 'Young Adult', 125, 3, 1),
(34005, 'M', '2023-02-12', 'Whisky', '200', 'Black', 'Young Adult', 109, 1, 1),
(34006, 'M/N', '2023-02-13', 'Chico', '400', 'Black', 'Adult', 92, 2, 2),
(34007, 'M', '2023-02-13', 'Falkore (aka Velcro)', '100', 'Tan', 'Young Adult', 93, 1, 6),
(34013, 'M/N', '2023-02-17', 'Charlie', '200', 'Black', 'Adult', 117, 3, 1),
(34014, 'F', '2023-02-17', 'Celina', '200', 'Chocolate', 'Adult', 96, 1, 1),
(34015, 'M', '2023-02-17', 'Christian', '200', 'Cream', 'Adult', 121, 1, 1),
(34017, 'F', '2023-02-17', 'Pudding', '24', 'White', 'Adult', 105, 1, 1),
(34022, 'M', '2023-02-21', 'Jelly', '400', 'Apricot', 'Adult', 133, 2, 2),
(34025, 'M', '2023-02-26', 'Kado', '200', 'Tan & cream', 'Senior', 177, 1, 1),
(34026, 'M/N', '2023-02-28', 'DuoDuo', '200', 'Tan & white', 'Young Adult', 144, 1, 1),
(34027, 'F/S', '2023-02-28', 'Lola', '400', 'Red', 'Adult', 93, 3, 2),
(34029, 'F/S', '2023-03-01', 'Zero', '200', 'Black & White', 'Adult', 112, 2, 1),
(34032, 'M/N', '2023-03-02', 'Comet (Dolly new name)', '200', 'Black & white', 'Puppy', 92, 1, 3),
(34033, 'F', '2023-03-02', 'Princess Leia', '200', 'black/brown/white', 'Young Adult', 103, 1, 1),
(34034, 'F/S', '2023-03-04', 'Lola', '200', 'Red', 'Adult', 93, 3, 1),
(34035, 'F', '2023-03-06', 'Daze (Daisy)', '200', 'Blonde', 'Adult', 177, 3, 1),
(34044, 'F', '2023-03-14', 'Bella', '200', 'Black and White', 'Adult', 93, 1, 1),
(34045, 'M', '2023-03-15', 'Rambo', '200', 'Brown & White', 'Senior', 111, 1, 1),
(34051, 'M/N', '2023-03-19', 'Amigo', '400', 'Tan', 'Senior', 95, 2, 2),
(34052, 'M', '2023-03-20', 'EINSTEIN', '200', 'White', 'Puppy', 97, 1, 1),
(34054, 'M/N', '2023-03-21', 'Kranki', '100', 'Brown/Tan', 'Adult', 178, 4, 5),
(34056, 'F/S', '2023-03-21', 'Lila', '200', 'Black', 'Senior', 131, 3, 1),
(34058, 'M/N', '2023-03-23', '', '100', 'Black & White', 'Young Adult', 182, 1, 5),
(34062, 'F', '2023-03-25', 'Sadie', '200', 'Black & White', 'Adult', 93, 1, 1),
(34072, 'F', '2023-03-27', 'Kita', '200', 'Grey & White', 'Adult', 99, 1, 1),
(34073, 'F', '2023-03-27', 'MoMo', '400', 'Grey w/white', 'Adult', 101, 1, 2),
(34075, 'F/S', '2023-03-27', 'Silver (new name)', '100', 'Grey w/white', 'Adult', 93, 2, 5),
(34076, 'M/N', '2023-03-28', 'Harry Styles (new Name)', '200', 'Tan & White', 'Adult', 93, 1, 3),
(34077, 'F', '2023-03-29', 'Tiea', '200', 'White', 'Young Adult', 93, 3, 1),
(34078, 'M', '2023-03-29', 'Santa', '200', 'brown/black/white', 'Young Adult', 109, 1, 1),
(34080, 'M', '2023-03-29', 'Kong', '400', 'Black & White', 'Adult', 95, 2, 2),
(34084, 'F/S', '2023-03-30', 'Cali', '200', 'Brown', 'Adult', 119, 1, 1),
(34086, 'M', '2023-03-31', 'Lennon aka John', '200', 'Green with Yellow', 'Adult', 184, 1, 3),
(34089, 'X', '2023-04-01', '', '100', 'Yellow w/ white on face', 'Adult', 184, 2, 17),
(34090, 'M/N', '2023-04-01', 'Rocky', '200', 'Brown', 'Young Adult', 97, 1, 1),
(34091, 'M', '2023-04-04', 'Knuckles', '200', 'Tan & white', 'Puppy', 93, 1, 1),
(34092, 'M', '2023-04-04', 'Stallone', '200', 'Tan & white', 'Puppy', 93, 1, 1),
(34094, 'M', '2023-04-06', 'Jet', '100', 'Black', 'Young Adult', 123, 1, 6),
(34095, 'F', '2023-04-06', 'Maggie', '200', 'White brown and black', 'Adult', 118, 2, 1),
(34096, 'F', '2023-04-08', 'Anna', '200', 'Brown & Black', 'Adult', 106, 1, 1),
(34100, 'M', '2023-04-11', 'Tyson', '100', 'Grey & White', 'Adult', 182, 3, 5),
(34101, 'F/S', '2023-04-11', 'Queenie (new name)', '100', 'Black w/ Brown', 'Senior', 95, 3, 5),
(34104, 'F/S', '2023-04-13', 'Sugar', '200', 'White', 'Senior', 116, 1, 1),
(34106, 'M', '2023-04-14', 'Turbo', '200', 'White', 'Puppy', 135, 1, 1),
(34107, 'M', '2023-04-15', 'Quinn', '200', 'Black & Tan', 'Senior', 109, 1, 1),
(34108, 'F/S', '2023-04-17', 'Pringles', '400', 'White', 'Adult', 164, 1, 2),
(34109, 'M', '2023-04-18', 'Cabello', '200', 'Black w/Brown Socks', 'Young Adult', 106, 2, 1),
(34110, 'M', '2023-04-18', 'Mars', '100', 'Brown & White', 'Young Adult', 99, 1, 5),
(34114, 'M', '2023-04-19', 'Russia', '100', 'White', 'Adult', 93, 1, 11),
(34117, 'F', '2023-04-22', 'Ginger', '200', 'Red', 'Senior', 108, 3, 1),
(34118, 'M/N', '2023-04-24', 'Frankie', '200', 'Golden', 'Adult', 134, 3, 1),
(34125, 'F', '2023-04-28', 'Alissa', '200', 'White & Light Grey', 'Adult', 99, 1, 1),
(34127, 'M', '2023-04-30', 'Odie', '200', 'Tan & White', 'Adult', 101, 2, 1),
(34128, 'M/N', '2023-04-30', 'Bosley (new name)', '100', 'Black w/Brown & Grey', 'Senior', 133, 1, 5),
(34129, 'M', '2023-05-01', 'Reagan', '200', 'White', 'Senior', 106, 1, 1),
(34130, 'F', '2023-05-01', 'Rocket', '200', 'Black & Brown', 'Young Adult', 106, 1, 1),
(34134, 'M', '2023-05-04', 'Chaos', '200', 'White & Brown', 'Adult', 93, 4, 1),
(34137, 'M', '2023-05-05', 'Loki', '400', 'Black and Tan', 'Young Adult', 98, 2, 2),
(34139, 'F', '2023-05-07', 'Mochi', '100', 'Brown and Black', 'Adult', 103, 4, 11),
(34140, 'M/N', '2023-05-07', 'Loko', '200', 'Brown & Black', 'Young Adult', 160, 1, 1),
(34142, 'M', '2023-05-08', 'Apollo', '200', 'White', 'Adult', 99, 3, 1),
(34145, 'F/S', '2023-05-10', 'Sky', '200', 'Cream', 'Adult', 95, 2, 1),
(34146, 'F', '2023-05-10', 'Stitch', '08', 'Tan w/white', 'Adult', 124, 2, 1),
(34147, 'F/S', '2023-05-10', 'Rain', '200', 'Tan w/black', 'Adult', 124, 2, 1),
(34148, 'F', '2023-05-10', 'Dharma (new name)', '100', 'Tan', 'Adult', 93, 1, 6),
(34149, 'F', '2023-05-10', 'Shipura', '200', 'Cream', 'Senior', 97, 1, 1),
(34151, 'F/S', '2023-05-11', 'Bella', '400', 'White', 'Senior', 104, 2, 2),
(34157, 'F', '2023-05-13', 'Liah', '400', 'Beige', 'Adult', 125, 1, 2),
(34158, 'M', '2023-05-15', 'Gunner (new name)', '100', 'Grey/Brown', 'Young Adult', 93, 1, 6),
(34160, 'F/S', '2023-05-16', 'Dani', '200', 'Grey w/ White', 'Adult', 117, 2, 1),
(34163, 'F', '2023-05-17', 'Rosie', '200', 'White w/ Brown Spots', 'Adult', 95, 2, 1),
(34164, 'M', '2023-05-18', 'JJ (aka Jaden and Joe Malone)', '200', 'Beige w/white', 'Adult', 93, 1, 1),
(34168, 'M', '2023-05-18', 'Coco', '100', 'Brown & White', 'Young Adult', 140, 1, 5),
(34171, 'M/N', '2023-05-18', 'Lord Felix/Johnny', '400', 'White', 'Adult', 116, 1, 2),
(34172, 'M', '2023-05-18', 'Lucky', '27', 'Grey & white', 'Senior', 99, 1, 1),
(34176, 'F/S', '2023-05-23', 'Zendaya (new name)Zendi', '200', 'Grey, black & White', 'Adult', 102, 1, 3),
(34177, 'M/N', '2023-05-23', 'Willie', '100', 'Brown Tabby', 'Young Adult', 182, 1, 5),
(34178, 'M', '2023-05-23', 'Keno', '400', 'Black w/tan', 'Adult', 109, 2, 2),
(34179, 'M', '2023-05-23', 'Remington', '200', 'Black', 'Adult', 124, 1, 1),
(34182, 'F/S', '2023-05-27', 'Luna', '19', 'Tan w/black', 'Senior', 105, 1, 1),
(34190, 'F', '2023-05-29', 'Ruby', '200', 'Brown & white', 'Adult', 131, 1, 1),
(34192, 'M/N', '2023-05-30', 'Lloyd', '200', 'Black & Tan', 'Adult', 134, 3, 3),
(34193, 'F/S', '2023-05-30', 'Pickle', '200', 'Tan', 'Adult', 104, 1, 1),
(34198, 'M', '2023-06-02', 'Koda', '400', 'Black', 'Adult', 162, 2, 2),
(34199, 'F', '2023-06-02', 'Poppy', '21', 'Black w/ white markings', 'Adult', 92, 2, 1),
(34200, 'M/N', '2023-06-02', 'Odie (new name Bradley)', '100', 'White', 'Adult', 130, 1, 5),
(34202, 'F/S', '2023-06-04', 'Darling (now Dolly)', '200', 'Cream', 'Adult', 95, 2, 3),
(34203, 'M', '2023-06-04', 'Palmer', '200', 'Black w White paws', 'Senior', 92, 1, 1),
(34204, 'M', '2023-06-04', 'Quinn', '200', 'Black & Brown', 'Adult', 109, 2, 1),
(34206, 'M', '2023-06-05', 'Zan Zan', '200', 'Red', 'Puppy', 119, 2, 1),
(34207, 'M', '2023-06-05', 'Shaq O\'Neil', '400', 'White & Brown', 'Adult', 93, 1, 2),
(34215, 'F', '2023-06-06', 'Jasmine (new name)', '100', 'Grey and White', 'Adult', 182, 3, 5),
(34219, 'F', '2023-06-07', 'Kali', '21', 'White w/ beige', 'Senior', 134, 3, 1),
(34220, 'F', '2023-06-07', 'Bianca Del Rio (new name)', '200', 'Yellow', 'Adult', 184, 2, 3),
(34223, 'M', '2023-06-08', 'JJ aka Jaden', '23', 'Beige w/white', 'Adult', 93, 3, 1),
(34224, 'F/S', '2023-06-08', 'Bailee', '400', 'Black', 'Adult', 162, 1, 2),
(34228, 'F', '2023-06-09', 'Pringles', '35', 'White', 'Adult', 102, 1, 1),
(34230, 'F', '2023-06-10', 'Kodak', '400', 'Black & Tan', 'Adult', 109, 3, 2),
(34231, 'M/N', '2023-06-11', 'Chapo', '100', 'Golden/White', 'Young Adult', 93, 1, 5),
(34232, 'M/N', '2023-06-11', 'Wodka', '400', 'White', 'Adult', 142, 1, 2),
(34242, 'F', '2023-06-17', 'Juicy Fruit (new name)', '200', 'Yellow w/black and green', 'Adult', 184, 1, 3),
(34244, 'F', '2023-06-18', 'Milo', '400', 'Black w/ Brown', 'Adult', 150, 3, 2),
(34245, 'F/S', '2023-06-18', 'Purdy (New Name)', '200', 'Brown w/ White', 'Adult', 93, 1, 3),
(34246, 'F', '2023-06-18', 'Sima', '200', 'Black w/ Brown', 'Young Adult', 98, 3, 1),
(34247, 'M', '2023-06-19', '', '100', 'Grey', 'Young Adult', 93, 5, 5),
(34249, 'M/N', '2023-06-20', 'Spike (New Name)Webber', '200', 'Black w/White around mouth', 'Senior', 123, 2, 3),
(34250, 'F', '2023-06-20', 'Smudge', '100', 'Black', 'Adult', 183, 2, 5),
(34257, 'M/N', '2023-06-22', 'Pow-man (aka Noodle)', '400', 'White', 'Adult', 125, 1, 2),
(34259, 'F', '2023-06-24', 'Mia', '200', 'Golden w/white', 'Adult', 92, 1, 1),
(34260, 'F', '2023-06-24', 'Sima', '200', 'Black and tan', 'Adult', 176, 1, 1),
(34266, 'M/N', '2023-06-27', 'Aspen', '17', 'White & Cream', 'Adult', 116, 1, 1),
(34268, 'F', '2023-06-28', 'Paris', '200', 'White', 'Young Adult', 93, 1, 1),
(34271, 'F/S', '2023-06-28', 'Maggie', '200', 'White & Brown', 'Adult', 118, 1, 1),
(34272, 'M/N', '2023-06-28', 'Kevin', '400', 'Grey, Black & White', 'Adult', 102, 1, 2),
(34274, 'M/N', '2023-06-29', 'Dougie (new name, Dog)', '200', 'Tan & Black', 'Adult', 105, 1, 3),
(34275, 'M/N', '2023-06-29', 'Oreo', '200', 'Black w/ white', 'Senior', 134, 1, 1),
(34277, 'F/S', '2023-07-02', 'Molly', '100', 'Black', 'Senior', 145, 1, 5),
(34278, 'M', '2023-07-02', 'Diesel', '200', 'White w/Black', 'Young Adult', 93, 1, 1),
(34279, 'M', '2023-07-03', 'Blue', '200', 'Tan & Brown', 'Young Adult', 124, 3, 1),
(34280, 'F', '2023-07-03', 'Coco', '200', 'Brown & Tan', 'Adult', 98, 2, 1),
(34282, 'F/S', '2023-07-04', 'Claudia (new name)', '200', 'White w/Brown & Black', 'Adult', 111, 1, 3),
(34288, 'M', '2023-07-07', 'Sharpie', '17', 'Black', 'Adult', 129, 3, 1),
(34289, 'M/N', '2023-07-07', 'Watson', '25', 'Black w/white', 'Senior', 92, 1, 1),
(34290, 'F/S', '2023-07-07', 'Buttercup', '19', 'Golden', 'Adult', 92, 2, 1),
(34291, 'F/S', '2023-07-08', 'Coco', '200', 'Black w/white & grey', 'Adult', 92, 1, 1),
(34295, 'X', '2023-07-10', 'Kim Chi (new name)', '200', 'Yellow w/ white cheeks', 'Young Adult', 184, 2, 3),
(34296, 'M', '2023-07-10', 'Tuff', '200', 'Brown and white', 'Adult', 111, 2, 1),
(34298, 'M', '2023-07-11', 'Knuckles', '200', 'Brown w/white', 'Adult', 105, 1, 1),
(34299, 'F/S', '2023-07-12', 'Amy', '200', 'White w/ Black', 'Adult', 93, 1, 1),
(34300, 'M', '2023-07-12', 'Chopper', '200', 'White w/Black', 'Adult', 93, 1, 1),
(34301, 'F', '2023-07-12', 'Millie', '200', 'Golden', 'Adult', 96, 1, 1),
(34307, 'F', '2023-07-15', 'Pepper', '20', 'Grey/Black & White', 'Adult', 97, 1, 1),
(34308, 'F/S', '2023-07-16', 'Pepper', '200', 'Black and White', 'Adult', 133, 2, 1),
(34312, 'M', '2023-07-17', 'Keno', '200', 'Black w/Tan', 'Adult', 109, 1, 1),
(34313, 'X', '2023-07-18', '', '100', 'Grey', 'Adult', 185, 2, 9),
(34319, 'M/N', '2023-07-23', 'Alfie (new name)', '200', 'Black', 'Senior', 92, 2, 3),
(34320, 'M', '2023-07-23', 'Pluto', '200', 'Beige & Black', 'Young Adult', 109, 1, 1),
(34321, 'M', '2023-07-23', 'Fendi', '400', 'White', 'Adult', 130, 1, 2),
(34323, 'M/N', '2023-07-28', 'Pidan', '200', 'Tan', 'Senior', 121, 2, 1),
(34328, 'F', '2023-07-29', 'Ivory', '200', 'White', 'Adult', 93, 1, 1),
(34330, 'M', '2023-07-29', 'Kado', '200', 'Tan w/cream & Grey muzzle', 'Senior', 177, 1, 1),
(34331, 'F', '2023-07-29', 'Lucy', '400', 'Black', 'Adult', 109, 1, 2),
(34332, 'M', '2023-07-29', 'Lucky', '400', 'Brown', 'Adult', 96, 1, 2),
(34333, 'X', '2023-07-30', '', '100', 'Black w/Grey spots on wings', 'Young Adult', 185, 1, 5),
(34334, 'M/N', '2023-07-30', 'Casey', '200', 'Black', 'Young Adult', 92, 1, 1),
(34337, 'M', '2023-08-02', 'Haku', '400', 'Red & white', 'Adult', 119, 2, 2),
(34339, 'F/S', '2023-08-04', 'Ava May', '200', 'Black & Tan', 'Adult', 109, 3, 1),
(34344, 'M', '2023-08-06', 'Ginger', '400', 'White', 'Young Adult', 105, 2, 2),
(34346, 'M/N', '2023-08-08', 'Nugget', '200', 'Black & White', 'Young Adult', 102, 1, 1),
(34347, 'M/N', '2023-08-08', 'Rico', '200', 'Grey', 'Young Adult', 93, 1, 1),
(34348, 'F', '2023-08-08', 'Dora', '200', 'Black & White', 'Adult', 93, 4, 1),
(34352, 'M/N', '2023-08-11', 'Archer (new name)', '200', 'Black & Tan', 'Young Adult', 176, 1, 3),
(34355, 'M', '2023-08-11', 'Oreo', '200', 'Black & White', 'Adult', 134, 1, 1),
(34356, 'F', '2023-08-11', 'Silver', '200', 'Grey', 'Adult', 93, 3, 1),
(34371, 'M/N', '2023-08-19', 'Jackson', '200', 'White & Brown', 'Senior', 118, 3, 1),
(34372, 'M/N', '2023-08-20', 'Charlie', '400', 'Black', 'Adult', 96, 2, 2),
(34373, 'F/S', '2023-08-20', 'Snow White (new name)', '200', 'White', 'Young Adult', 136, 1, 3),
(34376, 'M/N', '2023-08-21', 'Jackson', '100', 'Tan', 'Adult', 177, 2, 5),
(34384, 'F', '2023-08-25', 'Romeo', '200', 'Black and White', 'Adult', 99, 2, 1),
(34386, 'M', '2023-08-26', 'Monster', '400', 'White w/Brown spots on ears', 'Adult', 134, 2, 2),
(34387, 'F', '2023-08-27', 'Millie', '200', 'White & Grey', 'Young Adult', 99, 1, 1),
(34389, 'F/S', '2023-08-28', 'Hula-hoop now Saya (new name)', '200', 'White & Black', 'Puppy', 93, 1, 3),
(34390, 'F/S', '2023-08-28', 'Marley', '200', 'Black', 'Adult', 92, 3, 3),
(34391, 'M', '2023-08-28', 'Blue', '200', 'Brown w/white', 'Young Adult', 93, 1, 1),
(34392, 'M', '2023-08-29', 'Puppy', '200', 'Tan & Grey', 'Senior', 132, 1, 1),
(34393, 'M/N', '2023-08-29', 'Kado', '200', 'Tan & cream', 'Senior', 177, 1, 1),
(34395, 'M', '2023-08-30', 'Panda', '200', 'White & black', 'Senior', 97, 1, 1),
(34397, 'F', '2023-08-30', 'Roxi', '200', 'Black w/white', 'Adult', 93, 2, 1),
(34398, 'M/N', '2023-08-30', 'Chaos aka Kevin', '47', 'White w/Brown', 'Adult', 93, 4, 4),
(34399, 'X', '2023-08-30', '', 'ISO', 'White', 'Adult', 185, 1, 15),
(34400, 'F', '2023-08-31', 'Twiti', '200', 'White', 'Adult', 116, 2, 1),
(34401, 'M', '2023-08-31', 'Chawii', '200', 'White', 'Adult', 116, 2, 1),
(34402, 'M', '2023-08-31', 'Miller', '400', 'Golden', 'Adult', 108, 2, 2),
(34403, 'M', '2023-09-01', 'Pollux', '200', 'Black & Tan', 'Adult', 98, 3, 1),
(34404, 'M/N', '2023-09-02', 'Guchi', '200', 'Tan', 'Adult', 104, 2, 1),
(34405, 'M', '2023-09-02', 'Money', '200', 'White', 'Adult', 125, 1, 1),
(34408, 'M', '2023-09-05', 'Concrete', '200', 'Grey w/ white', 'Adult', 93, 2, 1),
(34409, 'M', '2023-09-05', 'Storm', '200', 'Gold w/ white', 'Young Adult', 107, 1, 1),
(34411, 'M', '2023-09-07', 'Angus', '400', 'Golden', 'Adult', 92, 1, 2),
(34417, 'F', '2023-09-11', 'Bella', '200', 'Black w/ Beige', 'Young Adult', 109, 1, 1),
(34419, 'F', '2023-09-12', 'Mocha', '400', 'Brown and Black', 'Adult', 109, 1, 2),
(34424, 'F', '2023-09-14', 'Brownie', '200', 'Brown', 'Young Adult', 162, 2, 1),
(34427, 'F', '2023-09-15', 'Amie', '200', 'Grey/Black', 'Senior', 133, 1, 1),
(34428, 'M', '2023-09-15', 'Fudge', '200', 'Brown', 'Puppy', 133, 1, 1),
(34430, 'M', '2023-09-16', 'Rex', '200', 'Brown', 'Senior', 95, 1, 1),
(34431, 'F/S', '2023-09-16', 'Lola', '200', 'Grey', 'Adult', 142, 1, 1),
(34435, 'F', '2023-09-18', 'Gilly', '400', 'Brown', 'Adult', 92, 1, 2),
(34437, 'M/N', '2023-09-19', 'Oz (new name)', '200', 'Black & White', 'Adult', 99, 1, 3),
(34439, 'F/S', '2023-09-21', 'Kinder (new name)', '200', 'White', 'Adult', 130, 2, 3),
(34442, 'M', '2023-09-21', 'Shadow', '200', 'White', 'Adult', 93, 4, 1),
(34443, 'F/S', '2023-09-22', 'Mocha', '200', 'Brown', 'Adult', 109, 1, 1),
(34444, 'F', '2023-09-22', 'Hazel', '200', 'Brown', 'Senior', 131, 1, 1),
(34445, 'M', '2023-09-22', 'Jersey (new name)', '100', 'Brown & White', 'Adult', 93, 4, 6),
(34452, 'F', '2023-09-24', 'Quincy', '200', 'Brown', 'Adult', 162, 1, 1),
(34453, 'M', '2023-09-24', 'Gucci', '200', 'Brown', 'Adult', 93, 1, 1),
(34454, 'M', '2023-09-25', 'Lloyd', '18', 'Grey', 'Adult', 104, 1, 1),
(34457, 'M', '2023-09-26', 'Diesel', '200', 'Black w/Brown', 'Adult', 98, 1, 1),
(34459, 'X', '2023-09-26', '', 'ISO', 'Grey and Brown', 'Adult', 185, 1, 15),
(34460, 'M/N', '2023-09-26', 'Beef (new name)', '100', 'Black and Brown', 'Adult', 98, 1, 6),
(34463, 'F', '2023-09-29', 'Lucky', '400', 'White and Black', 'Adult', 162, 1, 2),
(34464, 'F/S', '2023-09-29', 'Lily', '400', 'White', 'Adult', 162, 1, 2),
(34467, 'F', '2023-10-01', 'Aziza', '200', 'Black, White & Grey', 'Adult', 139, 1, 1),
(34469, 'M/N', '2023-10-01', 'Popcorn (new name)', '200', 'Golden', 'Young Adult', 119, 1, 3),
(34470, 'M/N', '2023-10-01', 'J.D. (new name)', '100', 'Golden and White', 'Adult', 177, 2, 5),
(34473, 'F', '2023-10-03', 'Kikko', '200', 'Black/Brown', 'Adult', 124, 1, 1),
(34474, 'F', '2023-10-03', 'Isla', '200', 'Black', 'Young Adult', 107, 4, 1),
(34475, 'M', '2023-10-04', 'Ping Ping', '200', 'Golden', 'Adult', 122, 1, 1),
(34477, 'M', '2023-10-07', 'Captain', '200', 'Black and White', 'Adult', 136, 1, 1),
(34479, 'M/N', '2023-10-11', 'Brownie', '200', 'Apricot', 'Adult', 133, 1, 1),
(34483, 'M/N', '2023-10-14', 'Tony', '200', 'Brindle', 'Adult', 95, 2, 1),
(34488, 'M', '2023-10-15', 'Milo', '200', 'Brown & White', 'Adult', 105, 1, 1),
(34492, 'M', '2023-10-16', 'Pete (New Name)', '100', 'Green and Yellow', 'Adult', 184, 1, 5),
(34493, 'M', '2023-10-19', 'Dante (new name)', '100', 'Brown & White', 'Senior', 95, 3, 5),
(34495, 'M', '2023-10-20', 'Kado', '200', 'Tan and Cream', 'Senior', 177, 1, 1),
(34498, 'M', '2023-10-20', 'Prince', '200', 'Golden', 'Adult', 96, 1, 1),
(34499, 'F', '2023-10-20', 'Minnie', '200', 'Black', 'Adult', 96, 1, 1),
(34501, 'M', '2023-10-23', 'Blizzard (Blizz)', '100', 'White', 'Adult', 109, 4, 11),
(34502, 'F', '2023-10-23', 'Maple', '200', 'Golden', 'Young Adult', 108, 1, 1),
(34508, 'F', '2023-10-24', 'Maya', '200', 'Brown', 'Young Adult', 140, 1, 1),
(34512, 'F', '2023-10-31', 'Roxi', '200', 'Black w/White', 'Adult', 93, 1, 1),
(34513, 'F', '2023-11-01', 'Anna', '200', 'Brown and Black', 'Adult', 109, 2, 1),
(34514, 'F', '2023-11-02', 'Lily', '200', 'Golden w/White', 'Young Adult', 119, 1, 1),
(34516, 'M', '2023-11-04', 'Goku', '200', 'Golden', 'Puppy', 108, 1, 1),
(34518, 'M', '2023-11-05', 'Orca', '200', 'Black and White', 'Adult', 95, 2, 1),
(34521, 'M', '2023-11-07', 'Shelby', '200', 'Golden', 'Adult', 171, 1, 1),
(34523, 'F', '2023-11-08', 'Goose', '200', 'Yellow', 'Adult', 96, 1, 1),
(34526, 'M/N', '2023-11-08', 'Owen', '200', 'White, Beige & Black', 'Adult', 144, 1, 1),
(34527, 'F', '2023-11-08', 'Kimmy (now Rowan)', '200', 'Brown & Black', 'Senior', 106, 2, 3),
(34529, 'F/S', '2023-11-09', 'Silver', '100', 'Grey & White', 'Adult', 93, 2, 5),
(34530, 'M/N', '2023-11-09', 'Geordie', '200', 'White & Brown', 'Senior', 111, 1, 1),
(34532, 'M', '2023-11-12', 'Otto', '200', 'Black', 'Adult', 105, 1, 1),
(34534, 'M', '2023-11-12', 'Teddy', '200', 'Brown and white', 'Senior', 105, 1, 1),
(34535, 'M/N', '2023-11-12', 'Zeus', '200', 'Grey and White', 'Adult', 93, 3, 1),
(34537, 'F/S', '2023-11-14', 'Buttercup', '200', 'Cream', 'Adult', 92, 1, 1),
(34538, 'M/N', '2023-11-15', 'Benjamin', '100', 'Tan & White', 'Adult', 93, 4, 6),
(34542, 'M', '2023-11-16', 'Maxmillion aka Max', '200', 'Brown & Tan', 'Senior', 109, 4, 1),
(34544, 'F/S', '2023-11-17', 'Bella', '200', 'Black & Tan', 'Senior', 160, 1, 3),
(34545, 'F', '2023-11-17', 'Roxi', '200', 'Black and White', 'Adult', 93, 1, 1),
(34548, 'F', '2023-11-20', 'Roxi', '200', 'Black & White', 'Adult', 93, 1, 1),
(34549, 'F/S', '2023-11-20', 'Remee', '200', 'White', 'Senior', 121, 1, 1),
(34550, 'F', '2023-11-21', 'Dora', '100', 'White & Black', 'Adult', 117, 4, 12),
(34552, 'M', '2023-11-22', 'Shayu', '400', 'White', 'Adult', 119, 1, 2),
(34553, 'M', '2023-11-22', 'Baby Vegas/DOJA', '100', 'Black w/ White', 'Adult', 93, 4, 9),
(34554, 'F', '2023-11-23', 'Daisy', '200', 'White', 'Adult', 116, 1, 1),
(34557, 'F', '2023-11-24', 'Tieger', '200', 'Brown, Grey w/ white paws', 'Adult', 93, 2, 1),
(34561, 'F/S', '2023-11-29', 'Darla', '19', 'Black', 'Adult', 96, 1, 2),
(34562, 'M', '2023-12-01', 'Dante', '200', 'Tan w/white', 'Adult', 93, 2, 1),
(34563, 'F', '2023-12-01', 'Griselda', '200', 'White w/Black Spot', 'Adult', 124, 1, 1),
(34567, 'F', '2023-12-02', 'Luna', '200', 'Black', 'Adult', 162, 2, 1),
(34568, 'M', '2023-12-03', 'Bear', '200', 'Black', 'Adult', 121, 1, 1),
(34572, 'F', '2023-12-04', 'Mia', '200', 'Golden w/white', 'Adult', 92, 1, 1),
(34573, 'M', '2023-12-05', 'Dansy', '200', 'White', 'Adult', 135, 3, 1),
(34574, 'M/N', '2023-12-06', 'Prince', '100', 'Black and Brown', 'Adult', 168, 1, 5),
(34575, 'M', '2023-12-07', 'Rocky', '400', 'Black and brown', 'Adult', 109, 1, 2),
(34577, 'M', '2023-12-10', 'Buddy', '200', 'Tan', 'Adult', 134, 3, 1),
(34581, 'M', '2023-12-11', 'Naruto', '200', 'Tan/White', 'Senior', 144, 1, 1),
(34583, 'F', '2023-12-12', 'Bailey', '200', 'Black', 'Puppy', 107, 1, 1),
(34584, 'F', '2023-12-12', 'Misty', '200', 'Black', 'Young Adult', 107, 1, 1),
(34585, 'M/N', '2023-12-12', 'Diesel', '200', 'Black w/light brown markings', 'Young Adult', 128, 1, 1),
(34586, 'F', '2023-12-13', 'Pearl (New Name)', '100', 'Grey', 'Adult', 93, 2, 5),
(34591, 'F/S', '2023-12-16', 'Harley', '100', 'White', 'Senior', 93, 1, 6),
(34592, 'F', '2023-12-17', 'Mia', '200', 'Brown', 'Adult', 92, 1, 1),
(34594, 'F', '2023-12-17', 'Queenie', '400', 'Tan', 'Young Adult', 152, 1, 2),
(34599, 'F/S', '2023-12-22', 'Hazel', '100', 'White & Black', 'Adult', 93, 8, 6),
(34601, 'F', '2023-12-23', 'Pineapple (new name)', '100', 'Brown', 'Adult', 140, 1, 6),
(34602, 'M', '2023-12-25', 'Naruto', '200', 'Grey and White', 'Senior', 144, 2, 1),
(34603, 'M/N', '2023-12-26', 'Geordi', '200', 'Tan and brown', 'Adult', 111, 1, 1),
(34605, 'M/N', '2023-12-27', 'Maverick', '200', 'White W/Grey & Black', 'Adult', 99, 2, 1),
(34606, 'F/S', '2023-12-27', 'Honey', '400', 'White, Brown & Black', 'Young Adult', 111, 1, 2),
(34609, 'M/N', '2023-12-31', 'ZanZan', '200', 'Beige w/white', 'Adult', 119, 6, 1),
(34613, 'F', '2024-01-07', 'Tiea', '200', 'White', 'Adult', 93, 1, 1),
(34618, 'M', '2024-01-12', 'Oreo', '200', 'Black and Tan', 'Adult', 119, 2, 1),
(34623, 'M/N', '2024-01-18', 'Osrik', '200', 'Brown', 'Adult', 127, 3, 1),
(34624, 'F', '2024-01-20', 'Kale', '200', 'White', 'Senior', 118, 3, 1),
(34626, 'M', '2024-01-21', 'Noodle', '200', 'Brown', 'Adult', 133, 2, 1),
(34628, 'M', '2024-01-22', 'Geordi', '400', 'White, Beige & Brown', 'Senior', 111, 1, 2),
(34629, 'F/S', '2024-01-23', 'Hannah (new name)', '200', 'White w/ black & brown on face', 'Puppy', 97, 1, 3),
(34636, 'F/S', '2024-01-29', 'Tina', '200', 'Black & Brown', 'Young Adult', 176, 1, 3),
(34638, 'F', '2024-01-30', 'Luna', '400', 'White', 'Adult', 130, 1, 2),
(34647, 'M', '2024-02-10', 'Kado', '400', 'Tan and Cream', 'Senior', 177, 1, 2),
(34649, 'M', '2024-02-12', 'Stewie', '400', 'Yellow', 'Puppy', 96, 2, 2),
(34650, 'M', '2024-02-14', 'Daxton/Teddy', '200', 'Black', 'Adult', 115, 2, 1),
(34651, 'F', '2024-02-14', 'Alena', '200', 'Brown and black', 'Puppy', 168, 2, 1),
(34653, 'F/S', '2024-02-14', 'Casey', '200', 'White', 'Senior', 116, 2, 1),
(34654, 'M', '2024-02-15', 'Laddie', '400', 'Brown and cream', 'Young Adult', 162, 2, 2),
(34655, 'M/N', '2024-02-15', 'Coco', '200', 'Golden', 'Senior', 119, 1, 1),
(34656, 'F', '2024-02-15', 'Raven', '200', 'Black, brown and tan', 'Adult', 134, 2, 1),
(34658, 'M', '2024-02-16', 'Shadow', '200', 'Black w/white', 'Young Adult', 92, 2, 1),
(34659, 'M', '2024-02-16', 'Junior', '200', 'Brown and White', 'Adult', 140, 1, 1),
(34660, 'M/N', '2024-02-16', 'Buddy', '200', 'Tan and White', 'Senior', 102, 1, 1),
(34662, 'M', '2024-02-18', 'Cooper', '200', 'Golden', 'Puppy', 108, 2, 1),
(34663, 'F', '2024-02-18', 'Fendi', '200', 'Black, brown and tan', 'Puppy', 109, 2, 1),
(34667, 'M', '2024-02-22', 'Baymax', '200', 'White and tan', 'Adult', 105, 2, 1),
(34669, 'M', '2024-02-26', 'Woody', '400', 'Golden', 'Adult', 162, 1, 2),
(34670, 'F', '2024-02-26', 'Penny', '200', 'Apricot', 'Adult', 121, 1, 1),
(34672, 'M', '2024-02-27', 'Paulie', '200', 'Tan w/white chest', 'Adult', 118, 1, 1),
(34674, 'F', '2024-02-29', 'Easy', '100', 'Black and White', 'Adult', 140, 1, 6),
(34675, 'M', '2024-02-29', 'Joey (now Basil)', '200', 'Tan & White', 'Puppy', 111, 1, 3),
(34678, 'M', '2024-03-03', 'Dansy', '200', 'White', 'Young Adult', 135, 1, 1),
(34679, 'X', '2024-03-06', 'Pearlie', '100', 'White & Cream', 'Senior', 105, 3, 5),
(34683, 'M/N', '2024-03-06', 'Chandler (New Name)', '200', 'Brown w/Black', 'Young Adult', 103, 1, 3),
(34684, 'M', '2024-03-08', 'Snowy/QQ', '200', 'White', 'Adult', 130, 1, 1),
(34686, 'F', '2024-03-09', 'Ember (New Name)', '100', 'Black & Tan', 'Adult', 98, 1, 5),
(34687, 'F', '2024-03-09', 'Twenty', '200', 'White', 'Adult', 135, 2, 1),
(34688, 'M', '2024-03-09', 'Lucky', '400', 'Apricot', 'Adult', 143, 2, 2),
(34691, 'F', '2024-03-12', 'Hailey\'s Dodge Comet (new name', '100', 'Black', 'Puppy', 182, 2, 5),
(34692, 'M/N', '2024-03-15', 'Snowflake', '200', 'White', 'Adult', 130, 2, 1),
(34693, 'M', '2024-03-16', 'Ross (new name)', '100', 'Black', 'Puppy', 92, 2, 5),
(34694, 'M/N', '2024-03-16', 'Coco?', '200', 'White', 'Adult', 130, 2, 1),
(34696, 'F', '2024-03-17', 'Casper', '400', 'Brown and Black', 'Senior', 156, 3, 2),
(34698, 'M/N', '2024-03-18', 'Oisin', '200', 'White, Black & Brown', 'Adult', 92, 1, 1),
(34701, 'F', '2024-03-22', 'Poomba', '200', 'Tan & Black', 'Adult', 113, 3, 1),
(34703, 'M', '2024-03-23', 'Pedro', '200', 'Black and White', 'Puppy', 92, 1, 1),
(34704, 'M', '2024-03-25', 'Cujo', '200', 'Cream', 'Adult', 93, 3, 1),
(34705, 'F', '2024-03-25', 'Breezy', '200', 'Grey & white', 'Adult', 93, 1, 1),
(34706, 'M/N', '2024-03-25', 'Coco', '200', 'White and Tan', 'Adult', 97, 1, 1),
(34710, 'M', '2024-03-28', 'Valentine', '200', 'Tan', 'Adult', 124, 1, 1),
(34711, 'F', '2024-03-30', 'Skye', '200', 'Brown, Black, and White', 'Adult', 111, 1, 1),
(34712, 'M', '2024-04-01', 'Dee', '200', 'Golden', 'Young Adult', 165, 1, 1),
(34713, 'M/N', '2024-04-02', 'Wesley', '200', 'Black w/ white', 'Adult', 142, 2, 1),
(34716, 'M', '2024-04-05', 'Concrete', '400', 'Grey & White', 'Adult', 93, 2, 2),
(34718, 'M', '2024-04-05', 'Amigo (new name)', '200', 'Golden', 'Puppy', 95, 2, 3),
(34719, 'F', '2024-04-06', 'Luna', '400', 'Brown', 'Adult', 92, 1, 2),
(34723, 'M/N', '2024-04-08', 'Peanut (new name)', '200', 'Brown', 'Adult', 143, 1, 3),
(34726, 'F', '2024-04-14', 'Buddy', '200', 'Black, Brown and White', 'Adult', 119, 1, 1),
(34727, 'M/N', '2024-04-15', 'Manny', '200', 'Black and White', 'Young Adult', 112, 7, 3),
(34729, 'F', '2024-04-15', 'JoJo', '200', 'Cream', 'Adult', 119, 1, 1),
(34731, 'M', '2024-04-16', 'Boss', '48', 'Tan', 'Adult', 152, 4, 4),
(34736, 'F', '2024-04-18', 'Sky', '200', 'White w/Grey & Black', 'Adult', 136, 1, 1),
(34737, 'M/N', '2024-04-18', 'Cloud (New name)', '200', 'Black & White', 'Young Adult', 99, 1, 3),
(34742, 'F/S', '2024-04-23', 'Maya', '200', 'Chocolate w/grey muzzle', 'Senior', 96, 2, 1),
(34745, 'F', '2024-04-25', 'Lady', '200', 'Black and Brown', 'Young Adult', 109, 1, 1),
(34746, 'M/N', '2024-04-26', 'Oreo', '200', 'Black and Brown', 'Young Adult', 109, 1, 1),
(34749, 'M', '2024-04-28', 'Ghost', '200', 'Brown, Grey and White', 'Young Adult', 102, 1, 1),
(34751, 'M', '2024-04-29', 'Mister', '200', 'Cream', 'Senior', 95, 1, 1),
(34752, 'M', '2024-04-29', 'Bjorn', '200', 'Black', 'Adult', 168, 1, 1),
(34753, 'F', '2024-04-29', 'Sweets', '20', 'Black & Brown', 'Adult', 168, 1, 1),
(34754, 'F', '2024-04-30', 'Muppy', '200', 'Brown Brindle w/white', 'Adult', 93, 3, 1),
(34757, 'M', '2024-04-30', 'Gus', '200', 'Black', 'Young Adult', 96, 2, 1),
(34758, 'M/N', '2024-05-02', 'Oscar', '200', 'Black', 'Senior', 96, 9, 1),
(34759, 'M/N', '2024-05-04', 'Rupert', '200', 'Cream', 'Adult', 134, 1, 1),
(34762, 'F', '2024-05-05', 'Cleo', '200', 'Black, Grey, and White', 'Senior', 99, 2, 1),
(34767, 'M', '2024-05-07', 'Rocky', '200', 'Black & Brown', 'Adult', 109, 2, 1),
(34771, 'F', '2024-05-09', 'Cookie', '200', 'Tan', 'Adult', 124, 3, 1),
(34772, 'F', '2024-05-09', 'Bailey', '200', 'Cream', 'Adult', 124, 1, 1),
(34777, 'F', '2024-05-11', 'Blue', '100', 'White and Black', 'Adult', 93, 4, 6),
(34778, 'F', '2024-05-11', 'Maude (new name)', '200', 'Black and White', 'Puppy', 140, 4, 1),
(34779, 'F', '2024-05-11', 'Madonna (new name)', '200', 'Black and White', 'Puppy', 140, 4, 1),
(34781, 'F', '2024-05-12', 'Ella', '200', 'Red and White', 'Senior', 95, 1, 1),
(34782, 'M', '2024-05-13', 'Jack', '200', 'Black', 'Adult', 104, 1, 1),
(34785, 'M', '2024-05-14', 'Keanu (new name)', '100', 'Grey', 'Young Adult', 93, 2, 6),
(34787, 'F', '2024-05-17', 'Gina', '400', 'Tan', 'Young Adult', 140, 1, 2),
(34789, 'F', '2024-05-17', 'Juno', '400', 'Black and White', 'Adult', 177, 2, 2),
(34790, 'M/N', '2024-05-18', 'Wulfgang', '100', 'Black w/tan', 'Adult', 109, 1, 6),
(34791, 'F', '2024-05-18', 'Dixie (was Winnie)', '100', 'Black and Tan', 'Adult', 109, 1, 5),
(34795, 'F', '2024-05-20', 'Mia', '200', 'Tan', 'Adult', 140, 3, 1),
(34800, 'X', '2024-05-23', '', '100', 'Orange & White', 'Adult', 182, 2, 5),
(34801, 'M', '2024-05-23', 'Doby', '400', 'Brown & Black', 'Young Adult', 109, 1, 2),
(34805, 'M/N', '2024-05-27', 'Cheddar', '100', 'Cream', 'Adult', 140, 2, 6),
(34808, 'F', '2024-05-29', 'Sky', '200', 'Grey & White', 'Adult', 99, 2, 1),
(34810, 'M/N', '2024-05-30', 'Osrik', '200', 'Brown', 'Senior', 127, 3, 1),
(34813, 'M', '2024-06-01', 'Bugs', '200', 'Brown, tan, & black', 'Adult', 132, 2, 1),
(34815, 'F', '2024-06-03', 'Sunset (new name)', '100', 'Grey and White', 'Senior', 93, 1, 5),
(34816, 'F', '2024-06-03', 'Skeeter', '200', 'White', 'Adult', 136, 2, 1),
(34817, 'M/N', '2024-06-05', 'Ozzy', '400', 'White & Tan', 'Senior', 118, 2, 2),
(34818, 'F', '2024-06-08', 'Toshka (new name)', '200', 'Black & White', 'Puppy', 99, 1, 3),
(34821, 'M/N', '2024-06-08', 'Gideon (new name)', '100', 'Brown', 'Adult', 95, 1, 5),
(34824, 'F', '2024-06-09', 'Amie', '100', 'Tan w/black', 'Adult', 124, 1, 5),
(34830, 'M/N', '2024-06-12', 'Tater Tot (new name was Nico)', '200', 'Brown & Tan', 'Adult', 105, 2, 3),
(34832, 'M', '2024-06-14', 'Chosen', '200', 'Tan & White', 'Young Adult', 140, 3, 1),
(34833, 'F', '2024-06-14', 'Erma', '200', 'Brown', 'Puppy', 93, 3, 1),
(34834, 'F', '2024-06-14', 'Diamond', '200', 'White & Brown', 'Puppy', 93, 3, 1),
(34835, 'M', '2024-06-14', 'Clipz', '200', 'White & Brown', 'Puppy', 93, 3, 1),
(34836, 'M', '2024-06-14', 'Coco', '200', 'Golden', 'Young Adult', 108, 1, 1),
(34837, 'M', '2024-06-14', 'Randall', '200', 'Tan & Black', 'Adult', 126, 3, 1),
(34838, 'M/N', '2024-06-14', 'Ody', '400', 'White', 'Adult', 133, 1, 2),
(34839, 'M', '2024-06-15', 'Shadow', '200', 'Black & White', 'Puppy', 93, 1, 1),
(34841, 'M', '2024-06-17', 'Tito', '200', 'White', 'Senior', 116, 1, 1),
(34842, 'M', '2024-06-17', 'Coda', '200', 'Black, Brown & White', 'Adult', 168, 1, 1),
(34843, 'F', '2024-06-21', 'Terra', '200', 'Brown & Red', 'Adult', 103, 2, 1),
(34844, 'M', '2024-06-21', 'Molly', '400', 'Black', 'Adult', 96, 1, 2),
(34846, 'M', '2024-06-23', 'Ben', '200', 'Brown & Grey', 'Adult', 129, 3, 1),
(34855, 'M', '2024-06-29', 'Jax', '400', 'Brown & White', 'Young Adult', 131, 1, 2),
(34867, 'F', '2024-07-04', 'Sky', '200', 'Black & White', 'Adult', 99, 1, 1),
(34873, 'M', '2024-07-08', 'Bao', '200', 'Black & Brown', 'Adult', 109, 3, 1),
(34874, 'F/S', '2024-07-08', 'Bailey', '200', 'White', 'Young Adult', 124, 1, 1),
(34875, 'M', '2024-07-09', 'Zuka', '400', 'Black w/ white', 'Adult', 123, 1, 2),
(34876, 'M', '2024-07-09', 'Shadow', '200', 'Black w/White chest', 'Adult', 93, 2, 1),
(34877, 'M', '2024-07-10', 'Benji', '200', 'Cream', 'Young Adult', 116, 1, 1),
(34881, 'F', '2024-07-11', 'Kono', '200', 'Black & Brown', 'Adult', 128, 1, 1),
(34882, 'F', '2024-07-12', 'Xiaobai', '200', 'White', 'Adult', 109, 1, 1),
(34883, 'M', '2024-07-12', 'Sacai', '200', 'Black & Brown', 'Adult', 109, 1, 1),
(34884, 'M', '2024-07-12', 'Osrick', '200', 'Brown', 'Adult', 127, 9, 1),
(34887, 'F', '2024-07-13', 'Ginger', '200', 'Golden', 'Senior', 108, 3, 1),
(34888, 'M', '2024-07-13', 'Jacob', '200', 'Brown', 'Adult', 134, 3, 1),
(34889, 'F', '2024-07-13', 'Kiki', '200', 'White', 'Adult', 124, 3, 1),
(34890, 'M', '2024-07-13', 'Hanzo', '200', 'Apricot', 'Adult', 119, 3, 1),
(34891, 'F', '2024-07-13', 'Hazel', '200', 'Apricot', 'Adult', 143, 2, 1),
(34892, 'F', '2024-07-13', 'Hattie (new name) was Clover', '200', 'Black & White', 'Puppy', 107, 1, 3),
(34894, 'M', '2024-07-14', 'Milton', '200', 'Black & White', 'Senior', 118, 3, 1),
(34895, 'M', '2024-07-14', 'George', '200', 'Brown & White', 'Senior', 118, 3, 1),
(34897, 'M', '2024-07-15', 'Tank', '200', 'Brown', 'Senior', 124, 1, 1),
(34898, 'M', '2024-07-16', 'Ollie', '200', 'Tan & White', 'Adult', 93, 1, 1),
(34899, 'F', '2024-07-16', 'Muppy', '200', 'Brindle & White', 'Adult', 93, 1, 1),
(34900, 'M', '2024-07-19', 'Shadow', '200', 'Black w/white', 'Adult', 93, 3, 1),
(34901, 'M/N', '2024-07-20', 'Jojo', '100', 'Tan', 'Adult', 134, 3, 5),
(34902, 'F', '2024-07-20', 'Meisha', '100', 'Grey', 'Adult', 154, 3, 5),
(34903, 'M/N', '2024-07-20', 'Chuwee', '200', 'Cream', 'Senior', 134, 2, 1),
(34904, 'F', '2024-07-20', 'Brandy', '400', 'Black & Brown', 'Adult', 105, 1, 2),
(34905, 'F/S', '2024-07-21', 'Scruffy', '200', 'White', 'Senior', 154, 3, 1),
(34906, 'F', '2024-07-21', 'Olive (New Name)', '200', 'Green & Yellow', 'Adult', 184, 1, 3),
(34908, 'F/S', '2024-07-22', 'Mittens', '100', 'Black & White', 'Senior', 183, 3, 5),
(34909, 'M', '2024-07-22', 'Cheese', '400', 'Golden', 'Young Adult', 95, 2, 2),
(34911, 'F/S', '2024-07-23', 'Pepsi', '200', 'Black & Tan', 'Adult', 109, 1, 1),
(34912, 'M', '2024-07-24', 'Buddy', '200', 'White/Cream', 'Adult', 102, 3, 1),
(34913, 'M', '2024-07-24', 'Junior', '200', 'White w/Brown', 'Adult', 140, 3, 1),
(34914, 'M/N', '2024-07-24', 'Skoll', '200', 'White', 'Adult', 136, 2, 1),
(34915, 'F', '2024-07-26', 'Roxy', '200', 'Brown', 'Senior', 143, 1, 1),
(34918, 'F', '2024-07-27', 'Luna?', '200', 'Tan w/Black', 'Young Adult', 117, 2, 1),
(34920, 'M', '2024-07-28', 'Ollie', '200', 'Tan', 'Adult', 101, 3, 1),
(34924, 'F', '2024-07-30', 'Roxy', '200', 'Brown', 'Young Adult', 143, 1, 1),
(34927, 'F/S', '2024-07-31', 'Dasha (Was Rae)', '200', 'Golden & Beige', 'Adult', 104, 3, 3),
(34932, 'M/N', '2024-08-01', 'Bodie (formerly Sandy)', '100', 'Black & White', 'Young Adult', 107, 1, 5),
(34935, 'M/N', '2024-08-01', 'Tucker', '400', 'Brown', 'Adult', 162, 1, 2),
(34936, 'F/S', '2024-08-02', 'Lucy', '200', 'White', 'Senior', 115, 1, 1),
(34937, 'M/N', '2024-08-02', 'Mino', '200', 'Cream/Tan', 'Adult', 132, 2, 1),
(34938, 'M', '2024-08-02', 'Buddy', '200', 'Brown & White', 'Adult', 92, 1, 1),
(34939, 'M', '2024-08-02', 'Junior', '200', 'White', 'Adult', 102, 1, 1),
(34942, 'F', '2024-08-03', 'Figgy (new name)', '100', 'Black & Brown', 'Puppy', 109, 1, 5),
(34944, 'F', '2024-08-04', 'Tomasa', '200', 'Black', 'Adult', 146, 1, 1),
(34946, 'X', '2024-08-06', '', '100', 'Black w/ white face', 'Adult', 183, 3, 5),
(34947, 'X', '2024-08-06', '', '100', 'Black w/ white face', 'Adult', 183, 3, 5),
(34948, 'F', '2024-08-07', 'Petunia (was Tulip)', '200', 'Black', 'Puppy', 133, 2, 3),
(34949, 'M', '2024-08-08', 'Burt', '200', 'Cream', 'Adult', 105, 1, 1),
(34950, 'M', '2024-08-09', 'Shadow', '200', 'Black', 'Adult', 93, 2, 1),
(34951, 'M', '2024-08-09', 'Thorin', '200', 'White', 'Puppy', 108, 1, 1),
(34955, 'M/N', '2024-08-12', 'Ryder', '400', 'Brown w/ White', 'Adult', 127, 2, 2),
(34958, 'F', '2024-08-13', 'Aspen (new Name)', '200', 'Black & White', 'Young Adult', 99, 1, 3),
(34959, 'F', '2024-08-13', 'Roxy', '200', 'Brown', 'Young Adult', 143, 1, 1),
(34961, 'M', '2024-08-16', 'Mr. Beef', '200', 'Brown w/ White', 'Adult', 93, 1, 1),
(34962, 'M/N', '2024-08-17', 'Bonbon', '200', 'Cream', 'Senior', 95, 3, 1),
(34963, 'F', '2024-08-17', 'Stella (was Parsley)', '200', 'Black & Cream', 'Young Adult', 165, 1, 3),
(34965, 'F', '2024-08-17', 'Roxy', '200', 'Tan', 'Adult', 133, 1, 1),
(34966, 'F/S', '2024-08-18', 'Tia', '200', 'Black & White', 'Young Adult', 107, 2, 1),
(34968, 'F', '2024-08-18', 'Suzie', '200', 'Golden w/ black', 'Young Adult', 105, 2, 1),
(34971, 'M', '2024-08-19', 'Chico', '200', 'Tan', 'Puppy', 95, 1, 1),
(34975, 'F', '2024-08-23', 'Frankie Doodlez', '200', 'Silver', 'Senior', 93, 1, 1),
(34976, 'X', '2024-08-24', '', '100', 'White w/ grey', 'Adult', 185, 2, 5),
(34977, 'F/S', '2024-08-24', 'Maisy (was Gracie)', '200', 'Black and tan', 'Adult', 109, 2, 3),
(34978, 'F', '2024-08-25', 'Jasper', '200', 'Black, White w/ beige', 'Senior', 107, 1, 1),
(34980, 'F', '2024-08-25', 'Chloe', '400', 'Black w/ White & Beige', 'Senior', 109, 1, 2),
(34981, 'X', '2024-08-27', '', '100', 'White w/ brown', 'Adult', 185, 2, 5),
(34983, 'M/N', '2024-08-27', 'Zuka', '200', 'Black w/ White', 'Adult', 140, 2, 1),
(34984, 'F/S', '2024-08-27', 'Ella', '200', 'Black & Tan', 'Senior', 150, 1, 1),
(34986, 'M', '2024-08-28', 'Pippin', '400', 'Black w/ brown', 'Young Adult', 105, 2, 2),
(34987, 'F', '2024-08-28', 'Mumoo', '200', 'Black & White', 'Young Adult', 140, 1, 1),
(34988, 'F', '2024-08-28', 'Skona', '200', 'Brindle', 'Young Adult', 140, 1, 1),
(34989, 'M', '2024-08-29', 'Kingston', '200', 'Black & Brown', 'Adult', 98, 2, 1),
(34991, 'M', '2024-08-30', 'Sapphire (New Name)', '100', 'Blue, black & white', 'Puppy', 184, 1, 16),
(34992, 'M', '2024-08-31', 'Drake', '200', 'Brown', 'Adult', 96, 9, 1),
(35001, 'F', '2024-09-06', 'Lexi', '400', 'White', 'Adult', 130, 2, 2),
(35003, 'F', '2024-09-09', 'Dasha', '200', 'White w/Grey', 'Senior', 99, 1, 1),
(35006, 'F', '2024-09-23', 'Misha', '200', 'White', 'Puppy', 135, 2, 1),
(35007, 'M', '2024-09-23', 'Echo', '200', 'White', 'Puppy', 135, 2, 1),
(35009, 'M/N', '2024-09-12', 'Hades', '200', 'Brown & Tan Brindle', 'Adult', 152, 3, 1),
(35010, 'F', '2024-09-13', 'Lola', '200', 'Tan', 'Adult', 140, 3, 1),
(35015, 'M', '2024-09-15', 'Buddy', '200', 'Black', 'Adult', 121, 1, 1),
(35018, 'M/N', '2024-09-16', 'Lucas', '200', 'White', 'Senior', 130, 1, 1),
(35021, 'F', '2024-09-16', 'Maya', '200', 'Golden', 'Adult', 108, 1, 1),
(35023, 'X', '2024-09-17', '', '100', 'Black, Grey & White', 'Adult', 185, 1, 5),
(35030, 'F/S', '2024-09-21', 'Lola', '200', 'Red', 'Adult', 93, 3, 1),
(35031, 'M/N', '2024-09-22', 'Jingle', '200', 'White', 'Adult', 158, 1, 1),
(35032, 'F/S', '2024-09-26', 'Mia', '400', 'Black/Brown', 'Adult', 93, 2, 2),
(35033, 'M/N', '2024-09-26', 'Axi', '200', 'Brown', 'Adult', 119, 1, 1),
(35034, 'F/S', '2024-09-26', 'Lola', '200', 'Brown', 'Adult', 140, 1, 1),
(35035, 'F', '2024-09-29', 'Raven', '200', 'Black & brown', 'Adult', 160, 1, 1),
(35037, 'M', '2024-10-01', 'Orca', '200', 'Black & White', 'Adult', 95, 1, 1),
(35040, 'F', '2024-10-02', 'Bell', '200', 'Cream', 'Adult', 119, 1, 1),
(35041, 'F', '2024-10-02', 'Susanna', '200', 'Brown and white', 'Senior', 111, 1, 1),
(35046, 'M', '2024-10-05', 'Coke', '200', 'Black & white', 'Adult', 119, 1, 1),
(35050, 'M/N', '2024-10-10', 'Brisk', '400', 'Yellow', 'Senior', 105, 1, 2),
(35054, 'M/N', '2024-10-13', 'Haki', '400', 'Light Brown/Cream', 'Young Adult', 119, 1, 2),
(35056, 'F', '2024-10-13', 'Luna', '400', 'Black w/Brown', 'Adult', 98, 2, 2),
(35061, 'F', '2024-10-17', 'Guido', '200', 'Black, grey & white', 'Adult', 132, 2, 1),
(35065, 'M', '2024-10-19', 'Haha', '200', 'Black, brown & grey', 'Young Adult', 139, 1, 1),
(35066, 'M', '2024-10-20', 'Tigger', '200', 'Brown', 'Adult', 95, 9, 1),
(35067, 'M/N', '2024-10-20', 'Atticus (new name)', '100', 'Black', 'Adult', 93, 1, 5),
(35068, 'F/S', '2024-10-21', 'Dog', '200', 'White w/Beige', 'Adult', 93, 3, 1),
(35072, 'M/N', '2024-10-24', 'Oscar', '200', 'Black', 'Adult', 92, 3, 1),
(35075, 'F', '2024-10-25', 'Mia', '200', 'White', 'Adult', 99, 1, 1),
(35080, 'M', '2024-10-30', 'Biscuit', '200', 'Cream', 'Adult', 104, 1, 1),
(35083, 'F', '2024-11-01', 'Indy', '200', 'Black', 'Senior', 96, 1, 1),
(35086, 'M', '2024-11-04', 'Concrete', '200', 'Grey w/ White', 'Adult', 93, 2, 1),
(35088, 'F', '2024-11-06', 'Bentley', '200', 'Tan & Cream', 'Adult', 132, 1, 1),
(35089, 'F/S', '2024-11-10', 'Charlie', '200', 'Black w/ white', 'Adult', 117, 3, 1),
(35093, 'F', '2024-11-15', 'Nina', '200', 'Brown, Tan & White', 'Adult', 97, 9, 1),
(35096, 'M', '2024-11-19', 'Kaiser', '200', 'Golden', 'Adult', 144, 2, 1),
(35097, 'M', '2024-11-20', 'Koda', '200', 'Black & Tan', 'Adult', 163, 3, 1),
(35099, 'M/N', '2024-11-20', 'MaoMao', '200', 'Black & White', 'Adult', 107, 1, 1),
(35101, 'M', '2024-11-22', 'Max', '200', 'Black & white', 'Adult', 140, 1, 1),
(35104, 'M', '2024-11-25', 'Louie', '200', 'Golden', 'Adult', 95, 1, 1),
(35105, 'M', '2024-11-25', 'Hubert', '200', 'Golden w/white chest', 'Adult', 95, 2, 1),
(35106, 'M', '2024-11-25', 'Chevy', '400', 'Red', 'Young Adult', 117, 1, 2),
(35107, 'M/N', '2024-11-27', 'Sha-yu', '400', 'White', 'Adult', 119, 2, 2),
(35109, 'F/S', '2024-11-28', 'Haku', '200', 'White & Golden', 'Adult', 99, 1, 1),
(35113, 'F', '2024-11-29', 'Scarlet Muffin', '200', 'Cream', 'Senior', 104, 1, 1),
(35114, 'F/S', '2024-11-30', 'Lola', '400', 'Black', 'Adult', 96, 1, 2),
(35118, 'M', '2024-12-03', 'Sebi', '200', 'White and gray', 'Young Adult', 121, 1, 1),
(35128, 'F', '2024-12-11', 'Chloe', '200', 'White & Grey', 'Adult', 93, 3, 1),
(35129, 'F', '2024-12-11', 'Clover', '200', 'Brown & white', 'Adult', 118, 1, 1),
(35131, 'F', '2024-12-13', 'Nori (new name, was Veda)', '200', 'Cream & Brown', 'Senior', 144, 3, 3),
(35132, 'M', '2024-12-13', 'Okami (new name, was Noah)', '100', 'Cream & Brown', 'Young Adult', 144, 3, 6),
(35133, 'M', '2024-12-13', 'Toby', '200', 'Brown w/black', 'Adult', 144, 3, 1),
(35134, 'F', '2024-12-13', 'Sarah', '200', 'Brown w/black', 'Young Adult', 144, 3, 1),
(35136, 'F', '2024-12-13', 'Miriam', '200', 'White & Brown', 'Puppy', 144, 3, 1),
(35137, 'F', '2024-12-13', 'Sachiko (new name, was Leah)', '100', 'Cream & Brown', 'Young Adult', 144, 3, 6),
(35140, 'M', '2024-12-14', 'Skittles Jr', '200', 'Grey & white', 'Adult', 132, 2, 1),
(35141, 'F', '2024-12-14', '', '100', 'Black', 'Puppy', 182, 1, 5),
(35145, 'M/N', '2024-12-15', 'Boston', '200', 'Yellow', 'Adult', 92, 1, 1),
(35146, 'M/N', '2024-12-15', 'Sausage', '200', 'White', 'Adult', 111, 1, 1),
(35147, 'F', '2024-12-15', 'La Fouine', '200', 'Golden', 'Adult', 105, 2, 1),
(35148, 'F', '2024-12-15', 'Lainey (New name)', '100', 'Tan w/ black', 'Young Adult', 109, 2, 6),
(35149, 'F/S', '2024-12-17', 'Guin (was Rue)', '200', 'Black', 'Adult', 103, 1, 1),
(35150, 'F/S', '2024-12-18', 'Haku', '200', 'White', 'Adult', 99, 1, 1),
(35151, 'M/N', '2024-12-18', 'Bruno', '200', 'Brown', 'Senior', 143, 1, 1),
(35152, 'F', '2024-12-19', 'Lady', '200', 'Brown & Tan', 'Young Adult', 109, 3, 1),
(35153, 'M/N', '2024-12-19', 'Kane', '200', 'Black w/White', 'Senior', 92, 1, 1),
(35157, 'F', '2024-12-20', 'Sarah', '200', 'Golden w/white', 'Adult', 178, 3, 1),
(35158, 'F', '2024-12-20', 'Miriam', '200', 'Golden w/white', 'Puppy', 178, 3, 1),
(35159, 'M', '2024-12-20', 'Toby', '200', 'Red/Brown w/black', 'Adult', 178, 3, 1),
(35160, 'M/N', '2024-12-20', 'Ramen (new name)', '200', 'Golden w/white on chest', 'Young Adult', 180, 1, 3),
(35168, 'F', '2024-12-25', 'Roxy', '200', 'Black', 'Adult', 96, 1, 1),
(35169, 'F', '2024-12-28', 'Hazel?', '200', 'Grey, brown, & white', 'Adult', 99, 1, 1),
(35172, 'M/N', '2024-12-30', 'Murphy (was Turkey Bacon)', '200', 'White', 'Adult', 162, 3, 3),
(35178, 'M/N', '2024-12-31', 'Yoshi', '200', 'Tan', 'Senior', 111, 1, 1),
(35179, 'F/S', '2024-12-31', 'Kala', '200', 'Grey', 'Senior', 99, 1, 1),
(35181, 'M/N', '2025-01-02', 'Jed Barklet', '200', 'Black, brown & white', 'Adult', 92, 1, 1),
(35186, 'F', '2025-01-11', 'Ping-K', '200', 'Black w/ white', 'Adult', 103, 1, 1),
(35193, 'F', '2025-01-14', 'Teiger', '200', 'Black w/ white', 'Adult', 140, 3, 1);
INSERT INTO `pets` (`animal_id`, `sex`, `date_impounded`, `name`, `kennel_number`, `color`, `age_category`, `breed_id`, `source_id`, `status_id`) VALUES
(35195, 'F', '2025-01-15', 'Winnie', '200', 'Tan & White', 'Young Adult', 103, 2, 1),
(35196, 'M/N', '2025-01-15', 'Hannibal', '100', 'Tan & White', 'Adult', 93, 4, 6),
(35201, 'M/N', '2025-01-20', 'Marty McFly (New name)', '12', 'White', 'Young Adult', 102, 1, 13),
(35204, 'F', '2025-01-22', 'MJ', '200', 'White w/brown', 'Adult', 117, 3, 1),
(35207, 'F', '2025-01-22', 'NuiNui', '400', 'Beige & Brown', 'Adult', 113, 1, 2),
(35208, 'F', '2025-01-22', 'Munchie', '200', 'White', 'Adult', 130, 1, 1),
(35209, 'F/S', '2025-01-22', 'Winnie', '400', 'Golden', 'Adult', 92, 2, 2),
(35211, 'F/S', '2025-01-22', 'Lola', '100', 'Red', 'Adult', 93, 3, 5),
(35212, 'M/N', '2025-01-23', 'Bronx (new name)', '10', 'White & Brown', 'Adult', 93, 2, 7),
(35214, 'M/N', '2025-01-25', 'Mick (New Name)', '100', 'Brown & Tan', 'Senior', 109, 2, 5),
(35215, 'F', '2025-01-26', 'Xena', '200', 'Golden & White', 'Senior', 95, 2, 1),
(35217, 'F', '2025-01-27', 'Chanel', '200', 'Black w/white on chest', 'Adult', 92, 1, 1),
(35218, 'M', '2025-01-28', 'Chawii', '400', 'White', 'Adult', 116, 2, 2),
(35219, 'F', '2025-01-28', 'Twiti', '400', 'White', 'Adult', 116, 2, 2),
(35223, 'M/N', '2025-02-05', '', '100', 'White, Brown & BLack', 'Adult', 185, 2, 9),
(35224, 'F/S', '2025-02-06', 'Piper', '200', 'Grey & white', 'Adult', 99, 1, 1),
(35229, 'M', '2025-02-07', 'E.T. (aka Alf)', '5', 'Black w/white on chest', 'Puppy', 129, 3, 8),
(35230, 'F', '2025-02-07', 'Ewok', '9', 'Black', 'Puppy', 129, 3, 8),
(35231, 'M', '2025-02-07', 'Noah (aka Alf & ET)', '7', 'Black w/white on chest', 'Puppy', 129, 3, 8),
(35232, 'M', '2025-02-08', 'Benny', '200', 'Grey', 'Adult', 162, 1, 1),
(35233, 'M/N', '2025-02-10', 'Rally', '400', 'White', 'Adult', 104, 2, 2),
(35243, 'M', '2025-02-14', '', '100', 'White', 'Young Adult', 117, 2, 5),
(35244, 'M', '2025-02-20', 'Diego', '200', 'Grey w/White', 'Puppy', 93, 3, 1),
(35245, 'M', '2025-02-20', 'Egypt (Temp)', '200', 'Brown/White', 'Puppy', 93, 3, 1),
(35246, 'M', '2025-02-20', 'Buju', '200', 'Grey/Orange Brindle', 'Puppy', 93, 3, 1),
(35247, 'M', '2025-02-20', 'Whisky', '200', 'Tan w/grey & white', 'Puppy', 93, 3, 1),
(35250, 'M/N', '2025-02-25', 'IceCapp/Edward', '400', 'Golden', 'Adult', 108, 1, 2),
(35255, 'M', '2025-02-28', 'Shadow', '100', 'Black & Brown', 'Adult', 128, 3, 9),
(35258, 'M', '2025-03-01', '(Polar Magic) King Asterion', '200', 'White', 'Adult', 135, 3, 1),
(35259, 'F', '2025-03-01', 'Urolochka', '200', 'White', 'Puppy', 135, 3, 1),
(35260, 'F/S', '2025-03-01', 'Arabella', '400', 'White', 'Adult', 135, 3, 2),
(35261, 'M', '2025-03-01', 'Max', '200', 'White', 'Adult', 135, 3, 1),
(35262, 'M/N', '2025-03-01', '', '200', 'White w/ brown', 'Adult', 118, 1, 1),
(35263, 'F', '2025-03-02', 'Stella', '200', 'White', 'Adult', 105, 2, 1),
(35264, 'F', '2025-03-02', 'Bella', '200', 'Black', 'Puppy', 93, 3, 1),
(35265, 'M', '2025-03-03', 'Zeus', '200', 'Tan & White', 'Adult', 123, 3, 1),
(35270, 'F', '2025-03-06', 'Luna', '400', 'Black & brown', 'Adult', 128, 1, 2),
(35272, 'M', '2025-03-06', 'Charlie Brown', '43', 'Brown & White', 'Adult', 93, 4, 4),
(35273, 'F/S', '2025-03-06', 'Tia', '200', 'Black & tan', 'Senior', 134, 2, 1),
(35280, 'F', '2025-03-10', 'Abby', '200', 'Red', 'Senior', 119, 1, 1),
(35281, 'M', '2025-03-11', 'Oscar', '200', 'Black', 'Senior', 96, 3, 1),
(35282, 'M', '2025-03-11', 'Sailor (new name)', '6', 'Tan & White', 'Puppy', 140, 2, 7),
(35286, 'F', '2025-03-12', 'Ella? (New name is Winnie)', '21', 'Tan, Brown & Grey', 'Adult', 132, 1, 10),
(35287, 'F', '2025-03-13', 'Hashbrown? Bella?', '25', 'Grey', 'Adult', 93, 9, 9),
(35288, 'M', '2025-03-13', 'Jackson', '27', 'Grey', 'Adult', 93, 9, 7),
(35289, 'M', '2024-12-04', 'ChummyWhiskers', NULL, 'Black & White', 'Adult', 182, 1, 7),
(35290, 'F', '2024-12-11', 'FluffyDummee', NULL, 'Orange', 'Adult', 183, 2, 13),
(35291, 'M', '2024-12-16', 'CrummyPaws', NULL, 'Gray', 'Adult', 182, 6, 8),
(35292, 'F', '2024-12-20', 'GrummyToes', NULL, 'Brown Tabby', 'Adult', 183, 4, 10),
(35293, 'F', '2025-01-05', 'Snummy', NULL, 'White', 'Adult', 182, 5, 7),
(35294, 'M', '2025-01-11', 'TummyHunter', NULL, 'Calico', 'Adult', 183, 7, 5),
(35295, 'F', '2025-01-20', 'BummyMeow', NULL, 'Black', 'Adult', 182, 8, 14),
(35296, 'M', '2025-01-29', 'ZummyCat', NULL, 'Gray & White', 'Adult', 183, 26, 7),
(35297, 'F', '2025-02-07', 'DrummyWhiskers', NULL, 'Tortoiseshell', 'Adult', 182, 27, 10),
(35298, 'M', '2025-02-14', 'YummyTrouble', NULL, 'Orange Tabby', 'Adult', 183, 28, 7),
(35299, 'F', '2025-02-20', 'Snuggle', NULL, 'Gray', 'Adult', 182, 3, 5),
(35300, 'M', '2025-02-26', 'RummyZooms', NULL, 'Black & White', 'Adult', 183, 2, 14),
(35301, 'F', '2025-03-02', 'Lommo', NULL, 'Calico', 'Adult', 182, 1, 7),
(35302, 'M', '2025-03-04', 'Plumby', NULL, 'White', 'Adult', 183, 6, 8),
(35303, 'F', '2025-03-07', 'JummyTail', NULL, 'Brown Tabby', 'Adult', 182, 4, 13),
(35304, 'M', '2025-03-09', 'Ninja', NULL, 'Gray', 'Adult', 183, 5, 7),
(35305, 'F', '2025-03-13', 'Wummy', NULL, 'Orange', 'Adult', 182, 7, 10),
(35306, 'M', '2025-03-16', 'Flip', NULL, 'Black', 'Adult', 183, 8, 8),
(35307, 'F', '2025-03-18', 'Spark', NULL, 'Tortoiseshell', 'Adult', 182, 26, 13),
(35308, 'M', '2025-03-20', 'Gloom', NULL, 'White & Gray', 'Adult', 183, 27, 8);

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preferences`
--

INSERT INTO `preferences` (`id`, `user_id`, `type_id`) VALUES
(12, 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `source_id` int(11) NOT NULL,
  `source_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`source_id`, `source_name`) VALUES
(2, 'BROUGHT-IN'),
(6, 'COMPLAINT'),
(1, 'HOLDING STRAY'),
(9, 'MEDICAL'),
(8, 'OTHER'),
(7, 'OWNER-SURRENDERED'),
(26, 'POLICE-DAY'),
(27, 'POLICE-EMERGENCY'),
(28, 'POLICE-NIGHT'),
(4, 'SEIZED'),
(5, 'SPCA'),
(3, 'VPD IMPOUND');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`status_id`, `status_name`) VALUES
(7, 'Adoptable'),
(14, 'Adoption Assessment'),
(13, 'Adoption Pending'),
(6, 'Behavior'),
(12, 'Court Ordered'),
(16, 'Escaped'),
(9, 'Health'),
(8, 'Hold'),
(10, 'Impound'),
(11, 'Owner Request - Signed Over'),
(17, 'Passed Away'),
(1, 'Redeemed'),
(15, 'Released (Wildlife)'),
(2, 'Ride Home Free'),
(4, 'Seized'),
(3, 'Sold'),
(5, 'Transferred');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `role`) VALUES
(1, 'ABC', '123@gmail.com', '$2y$10$529qrKFenEUf5tDDKudZOe21gBTALBUzzGZvdd9d9YPLtljO5Gt.6', '2025-03-24 23:52:03', 'user'),
(2, 'ABCD', '1234@gmail.com', '$2y$10$yQO.1OwNUczNtoxedqVrWuEmAE/SpBt46399bzvGotL.erkWpkEES', '2025-03-25 00:21:22', 'user'),
(3, 'supercool', 'super@gmail.com', '$2y$10$e3rFS//aPd4yGV1JduyDmu0/ql.GfoW4NV3SLQfrF2gbJmDuvGgFO', '2025-03-27 16:48:18', 'user'),
(4, 'yea13', 'yea13@gmail.com', '$2y$10$nN4tgeaOkC8VtJaStCLMQedXZyz7FkDLJtY20Tz0wiRd6KJ1s2Lga', '2025-04-02 07:03:10', 'user'),
(5, 'yea15', 'yea15@gmail.com', '$2y$10$BcRd7Kt3cEMiqSw5YyPi7eCBwipYX2e.EmMBpnjdBQ3.YLfmKZd8y', '2025-04-02 08:21:57', 'user'),
(6, 'yea16', 'yea16@gmail.com', '$2y$10$iItE6K.VxtPtcuDD/iKkCOfsRjrz.HF2PsIVmNd2WtatuXg0ZSk4W', '2025-04-02 08:25:01', 'user'),
(7, 'Ad', 'admin@a.com', '$2y$10$bt46b472IPiX0lIPlA0jPOb9mM5mmW8OyGyxdDBygO9a5o8JuJcYK', '2025-04-04 22:29:23', 'admin'),
(8, 'Jimmy', 'jim@j.com', '$2y$10$8K1V6N1GwRyyMyC9fAHc3.2LS8GOH0m3kEBqwES5cdAmEnxrDTb.u', '2025-04-06 22:29:27', 'user'),
(9, 'superr12', 'super@s.com', '$2y$10$9uHYzLofxhVaQIaAjqkqnOPz52Vjsu4DAkKH4hb9IxSFCmOCWMVdK', '2025-04-08 01:12:04', 'user'),
(10, 'sup1', 'sup1@gmail.com', '$2y$10$SWmiDMSOpy0vW.aMKZbrv.sqpJUdlQMXbbvCzgv2aMo7zINl1pJM6', '2025-04-09 02:27:09', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animaltype`
--
ALTER TABLE `animaltype`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_pet` (`user_id`,`pet_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`breed_id`),
  ADD UNIQUE KEY `breed_name` (`breed_name`),
  ADD KEY `fk_breeds_type` (`type_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`animal_id`),
  ADD KEY `fk_breed` (`breed_id`),
  ADD KEY `fk_source` (`source_id`),
  ADD KEY `fk_status` (`status_id`);

--
-- Indexes for table `preferences`
--
ALTER TABLE `preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`source_id`),
  ADD UNIQUE KEY `source_name` (`source_name`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animaltype`
--
ALTER TABLE `animaltype`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `breed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `preferences`
--
ALTER TABLE `preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `source_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`animal_id`) ON DELETE CASCADE;

--
-- Constraints for table `breeds`
--
ALTER TABLE `breeds`
  ADD CONSTRAINT `fk_breeds_type` FOREIGN KEY (`type_id`) REFERENCES `animaltype` (`type_id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`animal_id`) ON DELETE CASCADE;

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `fk_breed` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`breed_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_source` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`) ON DELETE SET NULL;

--
-- Constraints for table `preferences`
--
ALTER TABLE `preferences`
  ADD CONSTRAINT `preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `preferences_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `animaltype` (`type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
