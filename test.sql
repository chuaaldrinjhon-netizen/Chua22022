-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2026 at 06:25 AM
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
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `report_name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `report_name`, `description`, `type`, `owner`, `status`, `updated_at`) VALUES
(1, 'Monthly Sales', 'Revenue & growth overview', 'Sales', 'Mari', 'Published', '2026-02-03'),
(2, 'Quarterly Finance', 'Profit & loss summary', 'Finance', 'Ken', 'Draft', '2026-01-20'),
(3, 'Ops Daily KPI', 'Availability & SLI', 'Ops', 'Ava', 'Archived', '2025-12-18');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_number` int(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_number`, `lastname`, `firstname`, `phone`, `email`, `address`, `created_at`) VALUES
(3, 240115584, 'Tabayocyoc', 'Leo', '09277085948', 'leotabayocyoc4@gmail.com', 'Bagong Silang', '2026-03-25 02:27:30'),
(4, 240103629, 'Condeno', 'Lalaine', '09786546234', 'lalainecondeno@gmail.com', 'Quezon City', '2026-02-10 00:51:35'),
(5, 240110185, 'Martirez', 'Khalil Jericho', '09784376675', 'khalilkhalil@gmail.com', 'Caloocan City', '2026-02-10 00:51:51'),
(6, 240109595, 'Andaya', 'Edgar Roy', '09876543123', 'edgar@gmail.com', 'Valenzuela City', '2026-02-10 00:52:05'),
(7, 240112023, 'Dela Torre', 'Rance', '09890987656', 'delatorre@gmail.com', 'Quezon City', '2026-02-10 00:52:26'),
(8, 240109148, 'Asuncion', 'Chellord', '09231313141', 'Chellord@gmail.com', 'Quezon City', '2026-02-10 00:54:38'),
(9, 240107139, 'Unahan', 'June Rey', '09432495852', 'unahan@gmail.com', 'Quezon City', '2026-02-10 00:55:18'),
(10, 240109146, 'Calisora', 'Chynna Anne', '09093478324', 'calisora@gmail.com', 'Quezon City', '2026-02-10 00:55:39'),
(11, 240112352, 'Ticano', 'Josh Van Rich', '09858908582', 'ticano@gmail.com', 'Quezon City', '2026-02-10 00:55:59'),
(12, 240113156, 'Quintab', 'John Benedict', '09412049532', 'quintab@gmail.com', 'Quezon City', '2026-02-10 00:56:17'),
(13, 240112408, 'Polea', 'John Patrick', '09432576892', 'polea@gmail.com', 'Quezon City', '2026-02-10 00:56:33'),
(14, 240113349, 'Gomba', 'Arvie', '09084238564', 'arviegomba@gmail.com', 'Quezon City', '2026-02-10 00:56:50'),
(15, 240111317, 'Lotino', 'John Michael', '09994375961', 'lotino@gmail.com', 'Quezon City', '2026-02-10 00:57:10'),
(16, 240104416, 'Padilla', 'Den Russel', '09457328346', 'padilla@gmail.com', 'Quezon City', '2026-02-10 00:57:32'),
(17, 240112249, 'Relos', 'Jerome', '09908932138', 'relos@gmail.com', 'Quezon City', '2026-02-10 00:57:49'),
(18, 240113537, 'Ochavillo', 'Mary Joy', '09875098076', 'ochavillo@gmail.com', 'Caloocan City', '2026-02-10 01:00:29'),
(20, 240111283, 'Cabrillas', 'Arabela Grace', '09869009654', 'ara@gmail.com', 'Quezon City', '2026-02-10 01:03:01'),
(21, 240106263, 'Arroyo', 'Jhodell', '09846312345', 'arroyo@gmail.com', 'Quezon City', '2026-02-10 01:05:11'),
(22, 240111224, 'Balang', 'Jericho', '09895476854', 'balang@gmail.com', 'Quezon City', '2026-02-10 01:08:57'),
(23, 240114305, 'Sasuman', 'Jan', '09876543212', 'sasuman@gmail.com', 'Quezon City', '2026-02-10 01:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'user', 'user', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
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
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
