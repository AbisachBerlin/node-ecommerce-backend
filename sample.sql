-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 07, 2020 at 09:03 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `node-ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer` text NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `payment_id` varchar(100) NOT NULL,
  `products` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer`, `customer_id`, `amount`, `payment_id`, `products`) VALUES
(1, 'John Doe', 3, 105.97, 'pi_1H1bTLA7loPG7ytbARvxnrv6', '[{\"product\":{\"id\":2,\"name\":\"Ruby on Rails T-Shirt\",\"slug\":\"ruby-rails-t-shirt\",\"price\":15.5,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/ruby-on-rails.webp\"},\"qty\":2},{\"product\":{\"id\":1,\"name\":\"Angular Heartbeat Hoodie\",\"slug\":\"angular-heartbeat-hoodie\",\"price\":24.99,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/angular-heartbeat-hoodie.webp\"},\"qty\":3}]'),
(2, 'John Doe', 3, 105.97, 'pi_1H1bpxA7loPG7ytbMjK1RfEy', '[{\"product\":{\"id\":2,\"name\":\"Ruby on Rails T-Shirt\",\"slug\":\"ruby-rails-t-shirt\",\"price\":15.5,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/ruby-on-rails.webp\"},\"qty\":2},{\"product\":{\"id\":1,\"name\":\"Angular Heartbeat Hoodie\",\"slug\":\"angular-heartbeat-hoodie\",\"price\":24.99,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/angular-heartbeat-hoodie.webp\"},\"qty\":3}]'),
(3, 'John Doe', 3, 105.97, 'pi_1H1bttA7loPG7ytbgDwDGIQd', '[{\"product\":{\"id\":2,\"name\":\"Ruby on Rails T-Shirt\",\"slug\":\"ruby-rails-t-shirt\",\"price\":15.5,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/ruby-on-rails.webp\"},\"qty\":2},{\"product\":{\"id\":1,\"name\":\"Angular Heartbeat Hoodie\",\"slug\":\"angular-heartbeat-hoodie\",\"price\":24.99,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/angular-heartbeat-hoodie.webp\"},\"qty\":3}]'),
(4, 'John Doe', 3, 105.97, 'pi_1H1bwcA7loPG7ytbRPOycDYu', '[{\"product\":{\"id\":2,\"name\":\"Ruby on Rails T-Shirt\",\"slug\":\"ruby-rails-t-shirt\",\"price\":15.5,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/ruby-on-rails.webp\"},\"qty\":2},{\"product\":{\"id\":1,\"name\":\"Angular Heartbeat Hoodie\",\"slug\":\"angular-heartbeat-hoodie\",\"price\":24.99,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/angular-heartbeat-hoodie.webp\"},\"qty\":3}]'),
(5, 'John Doe', 3, 90.47, 'pi_1H1c6RA7loPG7ytbBUUAjkjZ', '[{\"product\":{\"id\":2,\"name\":\"Ruby on Rails T-Shirt\",\"slug\":\"ruby-rails-t-shirt\",\"price\":15.5,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/ruby-on-rails.webp\"},\"qty\":1},{\"product\":{\"id\":1,\"name\":\"Angular Heartbeat Hoodie\",\"slug\":\"angular-heartbeat-hoodie\",\"price\":24.99,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/angular-heartbeat-hoodie.webp\"},\"qty\":3}]'),
(7, 'John Doe', 3, 49.98, 'pi_1H1chHA7loPG7ytbbgkUig4O', '[{\"product\":{\"id\":1,\"name\":\"Angular Heartbeat Hoodie\",\"slug\":\"angular-heartbeat-hoodie\",\"price\":24.99,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/angular-heartbeat-hoodie.webp\"},\"qty\":2}]'),
(8, 'John Doe', 3, 31, 'pi_1H1xezA7loPG7ytb7iHLg3Vw', '[{\"product\":{\"id\":2,\"name\":\"Ruby on Rails T-Shirt\",\"slug\":\"ruby-rails-t-shirt\",\"price\":15.5,\"description\":\"Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. \",\"image\":\"/public/uploads/ruby-on-rails.webp\"},\"qty\":2}]');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `description`, `image`) VALUES
(1, 'Angular Heartbeat Hoodie', 'angular-heartbeat-hoodie', 24.99, 'Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. ', '/public/uploads/angular-heartbeat-hoodie.webp'),
(2, 'Ruby on Rails T-Shirt', 'ruby-rails-t-shirt', 15.5, 'Lorem ipsum dolor sit amet consectetur adipiscing elit, urna consequat felis vehicula class ultricies mollis dictumst, aenean non a in donec nulla. ', '/public/uploads/ruby-on-rails.webp'),
(3, 'Sudo Coffee T- Shirt', 'sudo-coffee-t-shirt', 12, 'Oeko Tex Certified Inks used in the printing. These are high quality inks - vibrant and durable, and highly crack resistant', '/public/uploads/sudo-coffee-tshirt.webp'),
(13, 'It\'s Not a Bug, It\'s a Feature', 'its-not-dollardollara-b-u-g-its-a-feat-ure-yt65-and-8', 23.55, 'An issue which doesn\'t cause any major glitch and you are not willing to fix it since you don\'t want to mess it up further, a smart programmer will call it a bug.', '/public/uploads/1594146934260-Not_a_bug_a_feature_men_s_tshirt6_large.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', '$2a$08$6LCmRKKb0SLYKRQgc2PtRuWWLR9i/grz31IKZtTgzulQ3FKCbjCxC'),
(3, 'John Doe', 'john@gmail.com', '$2a$08$Y3mN2sgRfyRkWiZy1xeWK.IFqpOmoIKb2JnQds9SSW5os3ZwVNeVK'),
(5, 'Jane Doe', 'jane@gmail.com', '$2a$08$orT7KbhjF3o7IevyI0uM5eX76S5/7IbIl.HR.V.Nr1e2hBiWoll.u');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
