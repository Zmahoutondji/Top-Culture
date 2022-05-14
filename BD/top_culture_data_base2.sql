-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 24, 2021 at 08:35 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `top_culture_data_base`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

CREATE TABLE `administrateur` (
                                  `idUtilisateur` int(11) NOT NULL,
                                  `pseudo` varchar(30) NOT NULL,
                                  `mot_de_passe` varchar(100) NOT NULL,
                                  `date_creation` date NOT NULL,
                                  `niveau` int(11) NOT NULL,
                                  `description` text NOT NULL,
                                  `photo_de_profil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `avis`
--

CREATE TABLE `avis` (
                        `idAvis` int(11) NOT NULL,
                        `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `avis`
--


-- --------------------------------------------------------

--
-- Table structure for table `avisoeuvre`
--

CREATE TABLE `avisoeuvre` (
                              `idAvis` int(11) NOT NULL,
                              `note` int(11) NOT NULL,
                              `critique` text NOT NULL,
                              `dateEnvoi` date DEFAULT NULL,
                              `titreAvis` text NOT NULL,
                              `idOeuvre` int(11) NOT NULL,
                              `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `avisoeuvre`
--



-- --------------------------------------------------------

--
-- Table structure for table `avistop`
--

CREATE TABLE `avistop` (
                           `idAvis` int(11) NOT NULL,
                           `critique` text NOT NULL,
                           `dateEnvoi` date DEFAULT NULL,
                           `idTop` int(11) NOT NULL,
                           `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `avistop`
--



-- --------------------------------------------------------

--
-- Table structure for table `composer`
--

CREATE TABLE `composer` (
                            `idTop_composer` int(11) NOT NULL,
                            `idOeuvre_composer` int(11) NOT NULL,
                            `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `composer`
--



-- --------------------------------------------------------

--
-- Table structure for table `oeuvre`
--

CREATE TABLE `oeuvre` (
                          `idOeuvre` int(11) NOT NULL,
                          `libelle` varchar(70) NOT NULL,
                          `image` varchar(100) NOT NULL,
                          `note` double DEFAULT NULL,
                          `idTheme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oeuvre`
--

INSERT INTO `oeuvre` (`idOeuvre`, `libelle`, `image`, `note`, `idTheme`) VALUES
/*
(2, 'le Seigneur des Anneaux : Le retour du Roi', 'Ressources\\Oeuvres\\Film\\Le_Seigneur_des_Anneaux_Le_Retour_du_Roi.jpg', 10, 1),
(3, 'Batman Begins', 'Ressources\\Oeuvres\\Film\\Batman_Begins.jpg', NULL, 1),
(4, 'Star Wars : La Menace Fantôme', 'Ressources\\Oeuvres\\Film\\Star_Wars_La_Menace_Fantome.jpg', 8, 1),
(5, 'Star Wars : L Attaque des Clones', 'Ressources\\Oeuvres\\Film\\Star_Wars_LAttaque_des_Clones.jpg', 5, 1),
(6, 'Star Wars : La Revanche des Sith', 'Ressources\\Oeuvres\\Film\\Star_Wars_La_Revanche_des_Sith.jpg', NULL, 1),
(7, 'Star Wars : Un Nouvel Espoir', 'Ressources\\Oeuvres\\Film\\Star_Wars_Un_nouvel_espoir.jpg', NULL, 1),
(8, 'Star Wars : L\'Empire Contre Attaque', 'Ressources\\Oeuvres\\Film\\Star_Wars_LEmpire_Contre_Attaque.jpg', NULL, 1),
(9, 'Retour Vers Le Futur', 'Ressources\\Oeuvres\\Film\\Retour_vers_le_futur.jpg', NULL, 1),
(10, 'Harry Potter à l école des Sorciers', 'Ressources\\Oeuvres\\Film\\Harry_potter_à_lécole_des_sorciers.jpg', NULL, 1),
(11, 'Mad Max : Fury Road', 'Ressources\\Oeuvres\\Film\\Mad_Max_Fury_Road.jpg', NULL, 1),
(12, 'Inception', 'Ressources\\Oeuvres\\Film\\Inception.jpg', NULL, 1),
(13, 'Interstellar', 'Ressources\\Oeuvres\\Film\\Interstellar.jpg', NULL, 1),
(14, 'Shutter Island', 'Ressources\\Oeuvres\\Film\\Shutter_island.jpg', NULL, 1),
(15, 'Batman The Dark Knight', 'Ressources\\Oeuvres\\Film\\Batman_The_Dark_Knight.jpg', NULL, 1),
(16, 'Batman The Dark Knight Rises', 'Ressources\\Oeuvres\\Film\\Batman_The_Dark_Knight_Rises.jpg', NULL, 1),
(17, 'Les Indestructibles', 'Ressources\\Oeuvres\\Film\\Les_Indestructibles.jpg', NULL, 1),
(18, 'The Martian', 'Ressources\\Oeuvres\\Film\\The_Martian.jpg', NULL, 1),
(19, 'Gravity', 'Ressources\\Oeuvres\\Film\\Gravity.jpg', NULL, 1),
(20, 'Logan', 'Ressources\\Oeuvres\\Film\\Logan.jpg', NULL, 1),
(21, 'Avengers : Infinity War', 'Ressources\\Oeuvres\\Film\\Avengers_Infinity_War.jpg', NULL, 1),
(22, 'Avengers : End Game', 'Ressources\\Oeuvres\\Film\\Avengers_End_Game.jpg', NULL, 1),
(23, 'Avengers', 'Ressources\\Oeuvres\\Film\\Avengers.jpg', NULL, 1),
(24, 'Avengers : L Ère d\'Ultron', 'Ressources\\Oeuvres\\Film\\Avengers_Lere_dUltron.jpg', NULL, 1),
(25, 'Gone Girl', 'Ressources\\Oeuvres\\Film\\Gone_Girl.jpg', NULL, 1),
(26, 'Premier Contact', 'Ressources\\Oeuvres\\Film\\Premier_Contact.jpg', NULL, 1),
(27, 'Ad Astra', 'Ressources\\Oeuvres\\Film\\Ad_Astra.jpg', NULL, 1),
(28, 'The Help', 'Ressources\\Oeuvres\\Film\\The_Help.jpg', NULL, 1),
(29, 'Mario 64', 'Ressources\\Oeuvres\\Jeux\\Mario_64.jpg', 9, 3),
(30, 'The Legend of Zelda : Breath of the Wild', 'Ressources\\Oeuvres\\Jeux\\The_Legend_of_Zelda_Breath_of_the_Wild.jpg', NULL, 3),
(31, 'Grand Theft Auto V', 'Ressources\\Oeuvres\\Jeux\\Grand_Theft_Auto_V.jpg', 8, 3),
(32, 'Dark Souls', 'Ressources\\Oeuvres\\Jeux\\\r\nDark_Souls.jpg', 9, 3),
(33, 'Bloodborne', 'Ressources\\Oeuvres\\Jeux\\\r\nBloodborne.jpg', 10, 3),
(34, 'ARK Survival Evolved', 'Ressources\\Oeuvres\\Jeux\\\r\nARK_Survival_Evolved.png', 8, 3),
(35, 'Red Dead Redemption II', 'Ressources\\Oeuvres\\Jeux\\\r\nRed_Dead_Redemption_II.png', NULL, 3),
(36, 'God of War', 'Ressources\\Oeuvres\\Jeux\\God_of_War.png', NULL, 3),
(37, 'The Witcher 3 Wild Hunt', 'Ressources\\Oeuvres\\Jeux\\The_Witcher_3_Wild_Hunt.png', NULL, 3),
(38, 'World of Warcraft', 'Ressources\\Oeuvres\\Jeux\\World_of_Warcraft.jpg', NULL, 3),
(39, 'League of Legends', 'Ressources\\Oeuvres\\Jeux\\League_of_Legends.jpg', 3, 3),
(40, 'Counter Strike : Global Offensive', 'Ressources\\Oeuvres\\Jeux\\Counter_Strike_Global_Offensive.png', NULL, 3),
(41, 'Call of Duty : Modern Warfare 2', 'Ressources\\Oeuvres\\Jeux\\Call_of_Duty_Modern_Warfare_2.png', 9, 3),
(42, 'The Last of Us', 'Ressources\\Oeuvres\\Jeux\\The_Last_of_Us.jpg', NULL, 3),
(43, 'NieR Automata', 'Ressources\\Oeuvres\\Jeux\\Nie_R_Automata.jpg', 9, 3),
(44, 'Dragon Age Inquisition', 'Ressources\\Oeuvres\\Jeux\\Dragon_Age_Inquisition.png', NULL, 3),
(45, 'FIFA 15', 'Ressources\\Oeuvres\\Jeux\\FIFA_15.jpg', 8, 3),
(46, 'Pro Evolution Soccer 6', 'Ressources\\Oeuvres\\Jeux\\Pro_Evolution_Soccer_6.jpg', NULL, 3),
(47, 'Dragon Ball Z : Budokai Tenkaichi 3', 'Ressources\\Oeuvres\\Jeux\\Dragon_Ball_Z_Budokai_Tenkaichi_3.jpg', NULL, 3),
(48, 'Rayman 3 : Hoodlum Havoc', 'Ressources\\Oeuvres\\Jeux\\Rayman_3_Hoodlum_Havoc.jpg', NULL, 3),
(49, 'Professeur Layton et la Boite de Pandore', 'Ressources\\Oeuvres\\Jeux\\Professeur_Layton_et_la_Boite_de_Pandore.jpg', NULL, 3),
(50, 'Sonic Mania', 'Ressources\\Oeuvres\\Jeux\\Sonic_Mania.png', 6, 3),
(51, 'Final Fantasy VII', 'Ressources\\Oeuvres\\Jeux\\Final_Fantasy_VII.png', 7.3333, 3),
(52, 'Metal Gear Solid', 'Ressources\\Oeuvres\\Jeux\\Metal_Gear_Solid.png', NULL, 3), */

(53, 'Assasination Classroom', 'Ressources\\Oeuvres\\Anime\\assasination_classroom.jpg', NULL, 2),
(54, 'L Attaque Des Titans', 'Ressources\\Oeuvres\\Anime\\attaque_on_titans.jpg', 9, 2),
(55, 'Black Clover', 'Ressources\\Oeuvres\\Anime\\black_clover.jpg', NULL, 2),
(56, 'Bleach', 'Ressources\\Oeuvres\\Anime\\Bleach.jpg', NULL, 2),
(57, 'Code Geass', 'Ressources\\Oeuvres\\Anime\\code_geass.jpg', NULL, 2),
(58, 'Death Note', 'Ressources\\Oeuvres\\Anime\\Death_Note.jpg', NULL, 2),
(59, 'Demon Slayer', 'Ressources\\Oeuvres\\Anime\\demon_slayer.jpg\r\n', NULL, 2),
(60, 'Dr Stone', 'Ressources\\Oeuvres\\Anime\\Dr_stone.jpg', NULL, 2),
(61, 'Dragon Ball Z', 'Ressources\\Oeuvres\\Anime\\dragon_ball_z.jpg', 7.6667, 2),
(62, 'Fire Force', 'Ressources\\Oeuvres\\Anime\\fire_force.jpg', NULL, 2),
(63, 'Full Metal Alchemist', 'Ressources\\Oeuvres\\Anime\\Full_Metal.jpg', NULL, 2),
(64, 'Gintama', 'Ressources\\Oeuvres\\Anime\\Gintama.jpg', NULL, 2),
(65, 'GTO', 'Ressources\\Oeuvres\\Anime\\gto.jpg', NULL, 2),
(66, 'Haikyu!!', 'Ressources\\Oeuvres\\Anime\\Haikyu.jpg', NULL, 2),
(67, 'Hunter X Hunter', 'Ressources\\Oeuvres\\Anime\\HXH.jpg', NULL, 2),
(68, 'Jojo\'s Bizarre Adventure', 'Ressources\\Oeuvres\\Anime\\jojo.jpg', NULL, 2),
(69, 'Kuroko\'s Basket', 'Ressources\\Oeuvres\\Anime\\kuroko.jpg', NULL, 2),
(70, 'Your Lie in April', 'Ressources\\Oeuvres\\Anime\\lie_inApril.jpg', NULL, 2),
(71, 'My Hero Academia', 'Ressources\\Oeuvres\\Anime\\mha.jpg', NULL, 2),
(72, 'Naruto', 'Ressources\\Oeuvres\\Anime\\naruto.jpg', NULL, 2),
(73, 'One Piece', 'Ressources\\Oeuvres\\Anime\\one_piece.jpg', 8, 2),
(74, 'Tokyo Ghoul', 'Ressources\\Oeuvres\\Anime\\tokyo_ghoul.jpg', NULL, 2),
(100, 'Re Zero', 'Ressources\\Oeuvres\\Anime\\re_zero.jpg', 1, 2),
(101, 'One Punch Man', 'Ressources\\Oeuvres\\Anime\\one_punch.jpg', NULL, 2);


-- --------------------------------------------------------

--
-- Table structure for table `signalement`
--

CREATE TABLE `signalement` (
                               `idSignalement` int(11) NOT NULL,
                               `typeSignalement` varchar(200) NOT NULL,
                               `message` text NOT NULL,
                               `dateSignal` date DEFAULT NULL,
                               `idUtilSignal` int(11) DEFAULT NULL,
                               `idUtilisateur` int(11) NOT NULL,
                               `idOeuvre` int(11) DEFAULT NULL,
                               `idTop` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `signalement`
--

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `idTheme` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`idTheme`, `nom`) VALUES
/*(1, 'Film'), */
(2, 'Anime');
/*(3, 'JeuxVideo'),
(4, 'Série'),
(5, 'Cuisine'),
(6, 'Football'); */

-- --------------------------------------------------------

--
-- Table structure for table `top`
--

CREATE TABLE `top` (
  `idTop` int(11) NOT NULL,
  `nomTop` varchar(50) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `idTheme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `top`
--

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `pseudo` varchar(30) NOT NULL,
  `mot_de_passe` varchar(200) NOT NULL,
  `date_creation` date NOT NULL,
  `niveau` int(11) NOT NULL DEFAULT '1',
  `description` text,
  `photo_de_profil` varchar(50) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `pseudo`, `mot_de_passe`, `date_creation`, `niveau`, `description`, `photo_de_profil`, `admin`) VALUES


-- --------------------------------------------------------

--
-- Table structure for table `utilisateursimple`
--

CREATE TABLE `utilisateursimple` (
                                     `idUtilisateur` int(11) NOT NULL,
                                     `pseudo` varchar(30) NOT NULL,
                                     `mot_de_passe` varchar(100) NOT NULL,
                                     `date_creation` date NOT NULL,
                                     `niveau` int(11) NOT NULL,
                                     `description` text NOT NULL,
                                     `photo_de_profil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrateur`
--
ALTER TABLE `administrateur`
    ADD PRIMARY KEY (`idUtilisateur`);

--
-- Indexes for table `avis`
--
ALTER TABLE `avis`
    ADD PRIMARY KEY (`idAvis`),
  ADD KEY `Avis_Utilisateur_FK` (`idUtilisateur`);

--
-- Indexes for table `avisoeuvre`
--
ALTER TABLE `avisoeuvre`
    ADD PRIMARY KEY (`idAvis`),
  ADD KEY `AvisOeuvre_Oeuvre0_FK` (`idOeuvre`),
  ADD KEY `AvisOeuvre_Utilisateur1_FK` (`idUtilisateur`);

--
-- Indexes for table `avistop`
--
ALTER TABLE `avistop`
    ADD PRIMARY KEY (`idAvis`),
  ADD KEY `AvisTop_Top0_FK` (`idTop`),
  ADD KEY `AvisTop_Utilisateur1_FK` (`idUtilisateur`);

--
-- Indexes for table `composer`
--
ALTER TABLE `composer`
    ADD PRIMARY KEY (`idTop_composer`,`idOeuvre_composer`),
  ADD KEY `composer_Oeuvre0_FK` (`idOeuvre_composer`);

--
-- Indexes for table `oeuvre`
--
ALTER TABLE `oeuvre`
    ADD PRIMARY KEY (`idOeuvre`),
  ADD KEY `Oeuvre_Theme_FK` (`idTheme`);

--
-- Indexes for table `signalement`
--
ALTER TABLE `signalement`
    ADD PRIMARY KEY (`idSignalement`),
  ADD KEY `Signalement_Utilisateur_FK` (`idUtilisateur`),
  ADD KEY `idOeuvre` (`idOeuvre`),
  ADD KEY `idTop` (`idTop`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
    ADD PRIMARY KEY (`idTheme`);

--
-- Indexes for table `top`
--
ALTER TABLE `top`
    ADD PRIMARY KEY (`idTop`),
  ADD KEY `Top_Utilisateur_FK` (`idUtilisateur`),
  ADD KEY `Top_Theme0_FK` (`idTheme`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
    ADD PRIMARY KEY (`idUtilisateur`);

--
-- Indexes for table `utilisateursimple`
--
ALTER TABLE `utilisateursimple`
    ADD PRIMARY KEY (`idUtilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `avis`
--
ALTER TABLE `avis`
    MODIFY `idAvis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `oeuvre`
--
ALTER TABLE `oeuvre`
    MODIFY `idOeuvre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `signalement`
--
ALTER TABLE `signalement`
    MODIFY `idSignalement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
    MODIFY `idTheme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `top`
--
ALTER TABLE `top`
    MODIFY `idTop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
    MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrateur`
--
ALTER TABLE `administrateur`
    ADD CONSTRAINT `Administrateur_Utilisateur_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Constraints for table `avis`
--
ALTER TABLE `avis`
    ADD CONSTRAINT `Avis_Utilisateur_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Constraints for table `avisoeuvre`
--
ALTER TABLE `avisoeuvre`
    ADD CONSTRAINT `AvisOeuvre_Avis_FK` FOREIGN KEY (`idAvis`) REFERENCES `avis` (`idAvis`),
  ADD CONSTRAINT `AvisOeuvre_Oeuvre0_FK` FOREIGN KEY (`idOeuvre`) REFERENCES `oeuvre` (`idOeuvre`),
  ADD CONSTRAINT `AvisOeuvre_Utilisateur1_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Constraints for table `avistop`
--
ALTER TABLE `avistop`
    ADD CONSTRAINT `AvisTop_Avis_FK` FOREIGN KEY (`idAvis`) REFERENCES `avis` (`idAvis`),
  ADD CONSTRAINT `AvisTop_Top0_FK` FOREIGN KEY (`idTop`) REFERENCES `top` (`idTop`),
  ADD CONSTRAINT `AvisTop_Utilisateur1_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Constraints for table `composer`
--
ALTER TABLE `composer`
    ADD CONSTRAINT `composer_Oeuvre0_FK` FOREIGN KEY (`idOeuvre_composer`) REFERENCES `oeuvre` (`idOeuvre`),
  ADD CONSTRAINT `composer_Top_FK` FOREIGN KEY (`idTop_composer`) REFERENCES `top` (`idTop`);

--
-- Constraints for table `oeuvre`
--
ALTER TABLE `oeuvre`
    ADD CONSTRAINT `Oeuvre_Theme_FK` FOREIGN KEY (`idTheme`) REFERENCES `theme` (`idTheme`);

--
-- Constraints for table `signalement`
--
ALTER TABLE `signalement`
    ADD CONSTRAINT `Signalement_Utilisateur_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Constraints for table `top`
--
ALTER TABLE `top`
    ADD CONSTRAINT `Top_Theme0_FK` FOREIGN KEY (`idTheme`) REFERENCES `theme` (`idTheme`),
  ADD CONSTRAINT `Top_Utilisateur_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Constraints for table `utilisateursimple`
--
ALTER TABLE `utilisateursimple`
    ADD CONSTRAINT `UtilisateurSimple_Utilisateur_FK` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
