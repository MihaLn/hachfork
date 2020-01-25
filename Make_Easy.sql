-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Gen 25, 2020 alle 23:59
-- Versione del server: 10.1.36-MariaDB
-- Versione PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Make_Easy`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `categorie`
--

CREATE TABLE `categorie` (
  `idC` int(11) NOT NULL,
  `codR` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `categorie`
--

INSERT INTO `categorie` (`idC`, `codR`, `nome`) VALUES
(1, 2, 'pasta'),
(2, 5, ''),
(3, 4, ''),
(4, 1, 'pasta'),
(5, 3, 'dessert'),
(6, 6, '');

-- --------------------------------------------------------

--
-- Struttura della tabella `ingredienti`
--

CREATE TABLE `ingredienti` (
  `idI` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `ingredienti`
--

INSERT INTO `ingredienti` (`idI`, `nome`) VALUES
(1, 'vodka'),
(2, 'ginger beer'),
(3, 'ghiaccio'),
(4, 'zucchero'),
(5, 'aperol'),
(6, 'farina'),
(7, 'whisky'),
(8, 'caffe'),
(9, 'panna'),
(10, 'prosecco'),
(11, 'ricotta'),
(12, 'pasta'),
(13, 'uova'),
(14, 'olio'),
(15, 'sale'),
(16, 'pepe'),
(17, 'scorza di limone'),
(18, 'parmigiano reggiano'),
(19, 'basilico'),
(20, 'mezze maniche'),
(21, 'guanciale'),
(22, 'pecorino romano'),
(23, 'pomodorini'),
(24, 'tonno sott\'olio'),
(25, 'cipolla'),
(26, 'caciocavallo'),
(27, 'riso carnaroli'),
(28, 'zafferano'),
(29, 'brodo di carne'),
(30, 'vino bianco'),
(31, 'latte intera');

-- --------------------------------------------------------

--
-- Struttura della tabella `Preferiti`
--

CREATE TABLE `Preferiti` (
  `coutente` int(11) NOT NULL,
  `codRicetta` int(11) NOT NULL,
  `idP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `Ricette`
--

CREATE TABLE `Ricette` (
  `idR` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `codUtente` int(11) NOT NULL,
  `tempo` int(11) NOT NULL,
  `kcal` double NOT NULL,
  `procedimento` text NOT NULL,
  `quantita` text NOT NULL,
  `descrizione` text NOT NULL,
  `tipologia` enum('cibo','bevande','cocktails','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Ricette`
--

INSERT INTO `Ricette` (`idR`, `nome`, `codUtente`, `tempo`, `kcal`, `procedimento`, `quantita`, `descrizione`, `tipologia`) VALUES
(1, 'Pasta con la ricotta', 5, 15, 200, 'butta la pasta', 'burro:200g', 'buono', 'cibo'),
(2, 'carbonara', 5, 25, 2000, 'butta la pasta nell acqua ', 'pasta:300, uova:10', 'molto buona', 'cibo'),
(3, 'profiteroles al cioccolato', 5, 60, 3000, 'bigne', 'burro:20gm,farina00: 300gm,latte intero:200ml,zucchero: 200gm', 'fantastico', 'cibo'),
(4, 'moscow mule', 5, 5, 300, 'vodka nell ginger beer con ghiaccio', 'vodka, ginger beer, ghiaccio\r\n', 'ci sta', 'cocktails'),
(5, 'irish coffee', 5, 10, 500, 'caffe whisky and panna', 'caffe whisky panna zucchero', 'buona ', 'bevande'),
(6, 'spritz', 5, 5, 2089, 'mescolare spritz e prosecco', 'aperol prosecco', 'ci sta', 'cocktails');

-- --------------------------------------------------------

--
-- Struttura della tabella `RicIng`
--

CREATE TABLE `RicIng` (
  `codR` int(11) NOT NULL,
  `codI` int(11) NOT NULL,
  `idRicIng` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `RicIng`
--

INSERT INTO `RicIng` (`codR`, `codI`, `idRicIng`) VALUES
(1, 11, 7),
(1, 12, 8),
(2, 12, 3),
(2, 13, 1),
(2, 21, 2),
(3, 4, 15),
(3, 6, 11),
(3, 9, 13),
(3, 13, 14),
(3, 31, 12),
(4, 1, 10),
(4, 2, 9),
(5, 7, 4),
(5, 8, 5),
(5, 9, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `Utenti`
--

CREATE TABLE `Utenti` (
  `idUtente` int(11) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `cognome` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `Utenti`
--

INSERT INTO `Utenti` (`idUtente`, `nome`, `cognome`, `email`, `password`, `username`) VALUES
(5, 'luigi', 'zheng', 'zheng@gmail.com', 'zheng', 'zheng');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idC`),
  ADD KEY `codR` (`codR`);

--
-- Indici per le tabelle `ingredienti`
--
ALTER TABLE `ingredienti`
  ADD PRIMARY KEY (`idI`);

--
-- Indici per le tabelle `Preferiti`
--
ALTER TABLE `Preferiti`
  ADD PRIMARY KEY (`idP`),
  ADD KEY `coutente` (`coutente`,`codRicetta`),
  ADD KEY `codRicetta` (`codRicetta`);

--
-- Indici per le tabelle `Ricette`
--
ALTER TABLE `Ricette`
  ADD PRIMARY KEY (`idR`),
  ADD KEY `codUtente` (`codUtente`);

--
-- Indici per le tabelle `RicIng`
--
ALTER TABLE `RicIng`
  ADD PRIMARY KEY (`idRicIng`),
  ADD KEY `codR` (`codR`,`codI`),
  ADD KEY `codI` (`codI`);

--
-- Indici per le tabelle `Utenti`
--
ALTER TABLE `Utenti`
  ADD PRIMARY KEY (`idUtente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `ingredienti`
--
ALTER TABLE `ingredienti`
  MODIFY `idI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT per la tabella `Preferiti`
--
ALTER TABLE `Preferiti`
  MODIFY `idP` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `Ricette`
--
ALTER TABLE `Ricette`
  MODIFY `idR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `RicIng`
--
ALTER TABLE `RicIng`
  MODIFY `idRicIng` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `Utenti`
--
ALTER TABLE `Utenti`
  MODIFY `idUtente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`codR`) REFERENCES `Ricette` (`idR`);

--
-- Limiti per la tabella `Preferiti`
--
ALTER TABLE `Preferiti`
  ADD CONSTRAINT `Preferiti_ibfk_1` FOREIGN KEY (`codRicetta`) REFERENCES `Ricette` (`idR`),
  ADD CONSTRAINT `Preferiti_ibfk_2` FOREIGN KEY (`coutente`) REFERENCES `Utenti` (`idUtente`);

--
-- Limiti per la tabella `Ricette`
--
ALTER TABLE `Ricette`
  ADD CONSTRAINT `Ricette_ibfk_1` FOREIGN KEY (`codUtente`) REFERENCES `Utenti` (`idUtente`);

--
-- Limiti per la tabella `RicIng`
--
ALTER TABLE `RicIng`
  ADD CONSTRAINT `RicIng_ibfk_1` FOREIGN KEY (`codR`) REFERENCES `Ricette` (`idR`),
  ADD CONSTRAINT `RicIng_ibfk_2` FOREIGN KEY (`codI`) REFERENCES `ingredienti` (`idI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
