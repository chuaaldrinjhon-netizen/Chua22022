-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2026 at 03:58 PM
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
-- Database: `dbchua`
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
(3, 240104337, 'Aban', 'Jesren John Turqueza', '09277085948', 'Aban@gmail.com', 'Bagong Silang', '2026-04-08 10:21:14'),
(4, 240113476, 'Agato', 'Gerardo Santos', '09786546234', 'Agato@gmail.com', 'Quezon City', '2026-04-08 10:21:38'),
(5, 240109351, 'Agtas', 'Leorence Daniel Martin', '09784376675', 'Agtas@gmail.com', 'Caloocan City', '2026-04-08 10:22:06'),
(6, 240115766, 'Alva', 'Carl Jobert Avelino', '09876543123', 'Alva@gmail.com', 'Valenzuela City', '2026-04-08 10:23:09'),
(7, 21016794, 'Aquino', 'Aljohn Gorgonia', '09890987656', 'Aquino@gmail.com', 'Quezon City', '2026-04-08 10:23:42'),
(8, 240103541, 'Aranas', 'Carl Lorence Cabañas', '09231313141', 'Aranas@gmail.com', 'Quezon City', '2026-04-08 10:24:16'),
(9, 240103259, 'Arias', 'Justin Luis Echaveria', '09432495852', 'Arias@gmail.com', 'Quezon City', '2026-04-08 10:25:01'),
(10, 240116065, 'Barbarona', ' Jonard Villacapa', '09093478324', 'Barbarona@gmail.com', 'Quezon City', '2026-04-08 10:25:37'),
(11, 240102936, 'Baricaua', 'Blesszel Joy Rodriguez', '09858908582', 'Baricaua@gmail.com', 'Quezon City', '2026-04-08 10:26:06'),
(12, 240110558, 'Bellen', 'Jazper Jake Eroll Carosos', '09412049532', 'Bellen@gmail.com', 'Quezon City', '2026-04-08 10:26:49'),
(13, 240115207, 'Bigas', 'Jerick Jumawan', '09432576892', 'Bigas@gmail.com', 'Quezon City', '2026-04-08 10:27:18'),
(14, 240111179, 'Borja', 'Ace ', '09084238564', 'Borja@gmail.com', 'Quezon City', '2026-04-08 10:27:59'),
(15, 240115097, 'Borres', 'Lorenz James Quinisio', '09994375961', 'Borres@gmail.com', 'Quezon City', '2026-04-08 10:28:35'),
(16, 240113686, 'Casinova', 'Steve John Realubit', '09457328346', 'Casinova@gmail.com', 'Quezon City', '2026-04-08 10:29:02'),
(17, 240117088, 'Cawaling', 'Cyrus Jasper Espineda ', '09908932138', 'Cawaling@gmail.com', 'Quezon City', '2026-04-08 10:29:29'),
(18, 240110186, 'Corbita', 'Wayne Wilson Guillo ', '09875098076', 'Corbita@gmail.com', 'Caloocan City', '2026-04-08 10:29:52'),
(20, 240116136, 'Cruz', 'Ronald Jay Castillo', '09869009654', 'Cruz@gmail.com', 'Quezon City', '2026-04-08 10:30:13'),
(21, 240116633, 'De Vera', 'Michelle Cahilig', '09846312345', 'De Vera@gmail.com', 'Quezon City', '2026-04-08 10:30:48'),
(22, 240114702, 'Deo', 'Aira Marielle Camalla', '09895476854', 'Deo@gmail.com', 'Quezon City', '2026-04-08 10:31:09'),
(23, 240116510, 'Ditol', 'Ma Victoria Astorga', '09876543212', 'Ditol@gmail.com', 'Quezon City', '2026-04-08 10:31:46');

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
(2, 'user', 'user', 'user'),
(3, 'Chua', '123', 'user');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
