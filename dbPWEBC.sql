-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Dim 11 Mars 2018 à 21:44
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `pweb17_couderc1`
--

-- --------------------------------------------------------

--
-- Structure de la table `joue`
--

CREATE TABLE `joue` (
  `score` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `idPartie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `joue`
--

INSERT INTO `joue` (`score`, `idUtilisateur`, `idPartie`) VALUES
(6, 1, 1),
(5, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `idLieu` int(11) NOT NULL,
  `lienImg` varchar(100) DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `lattitude` float DEFAULT NULL,
  `pays` varchar(25) NOT NULL,
  `nomLieu` varchar(50) NOT NULL,
  `idPartie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lieu`
--

INSERT INTO `lieu` (`idLieu`, `lienImg`, `longitude`, `lattitude`, `pays`, `nomLieu`, `idPartie`) VALUES
(1, NULL, 2.29429, 48.8581, 'France', 'Tour Eiffel', 1),
(2, NULL, -0.124625, 51.5007, 'Royaume-Uni', 'Big Ben', 1),
(3, NULL, 12.4922, 41.8902, 'Italie', 'Colisee', 1),
(4, NULL, 13.4094, 52.5208, 'Allemagne', 'Fernsehturm', 1),
(5, NULL, 37.6175, 55.752, 'Russie', 'Kremlin', 1),
(6, NULL, 2.17436, 41.4036, 'Espagne', 'Sagrada Familia', 1);

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

CREATE TABLE `partie` (
  `idPartie` int(11) NOT NULL,
  `nomPartie` varchar(25) NOT NULL,
  `difficulte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `partie`
--

INSERT INTO `partie` (`idPartie`, `nomPartie`, `difficulte`) VALUES
(1, 'Europe', 1),
(2, 'Asie', 4);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `username`, `password`) VALUES
(1, 'jcouderc', 'abcd'),
(2, 'pcouderc', 'abcd');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `joue`
--
ALTER TABLE `joue`
  ADD PRIMARY KEY (`idUtilisateur`,`idPartie`),
  ADD KEY `FK_joue_idTest` (`idPartie`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`idLieu`),
  ADD KEY `FK_lieu_idTest` (`idPartie`);

--
-- Index pour la table `partie`
--
ALTER TABLE `partie`
  ADD PRIMARY KEY (`idPartie`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `idLieu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `partie`
--
ALTER TABLE `partie`
  MODIFY `idPartie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `joue`
--
ALTER TABLE `joue`
  ADD CONSTRAINT `FK_joue_idTest` FOREIGN KEY (`idPartie`) REFERENCES `partie` (`idPartie`),
  ADD CONSTRAINT `FK_joue_idUtilisateur` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD CONSTRAINT `FK_lieu_idTest` FOREIGN KEY (`idPartie`) REFERENCES `partie` (`idPartie`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
