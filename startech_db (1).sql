-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : sam. 22 nov. 2025 à 00:26
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `startech_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int UNSIGNED NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `prenom`, `nom`, `email`, `password_hash`, `created_at`) VALUES
(1, 'Admin', 'Principal', 'admin@votresite.com', 'le_hash_copie', '2025-11-12 17:01:50');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `description`) VALUES
(1, 'PC & Systèmes', NULL),
(2, 'Composants', NULL),
(3, 'Périphériques', NULL),
(4, 'Logiciels', NULL),
(5, 'Réseaux & Câblage', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `statut` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'client',
  `telephone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ville` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code_postal` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `entreprise` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_role` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'client',
  `fournisseur_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `email`, `password_hash`, `statut`, `telephone`, `adresse`, `ville`, `code_postal`, `date_creation`, `entreprise`, `user_role`, `fournisseur_id`) VALUES
(1, 'ZIDELMAL', 'Tassadit', 'zidelmaltassadit2019@gmail.com', '$2y$10$EFSlRzdQoO8XBirI/kczW.KXe7AeMQykmd1pZOq3ibINGSJ9n/vA.', 'client', '', NULL, NULL, NULL, '2025-11-12 17:52:21', NULL, 'client', NULL),
(2, 'Zdlm', 'Leila', 'zdlmleila@gmail.com', '$2y$10$u30tGXF8mhOT6UntWYvC2.xi2C67tuzwFigC2nlEW2DLlObHGwNbu', 'admin', NULL, NULL, NULL, NULL, '2025-11-18 15:38:21', NULL, 'admin', NULL),
(3, 'deh', 'mouad', 'dehichimouad@gmail.com', '$2y$10$AtbAtjEyH2.BXNhUFP1.L.GDKJGUOOChQgOPOUjbSRavxbIq1Ls8K', 'client', NULL, NULL, NULL, NULL, '2025-11-20 15:15:50', NULL, 'client', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int NOT NULL,
  `utilisateur_id` int DEFAULT NULL,
  `date_commande` datetime DEFAULT CURRENT_TIMESTAMP,
  `statut` varchar(20) NOT NULL DEFAULT 'en_attente',
  `date_mise_a_jour` datetime DEFAULT NULL,
  `montant_total` decimal(10,2) NOT NULL,
  `frais_livraison` decimal(10,2) DEFAULT '0.00',
  `adresse_livraison` text,
  `points_utilises` int DEFAULT '0',
  `statut_facturation` enum('non_facture','facture_generee') DEFAULT 'non_facture',
  `total_ttc` decimal(10,2) NOT NULL DEFAULT '0.00',
  `client_id` int DEFAULT NULL,
  `total_ht` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `utilisateur_id`, `date_commande`, `statut`, `date_mise_a_jour`, `montant_total`, `frais_livraison`, `adresse_livraison`, `points_utilises`, `statut_facturation`, `total_ttc`, `client_id`, `total_ht`) VALUES
(1, 1, '2025-11-11 15:21:23', 'en_attente', NULL, 1250.99, 0.00, '1 Rue de Paris, 75001 Paris', 0, 'non_facture', 0.00, NULL, 0.00),
(2, 2, '2025-11-06 15:21:23', 'en_attente', '2025-11-11 15:25:22', 49.99, 0.00, '22 Avenue des Champs, 13008 Marseille', 0, 'non_facture', 0.00, NULL, 0.00);

-- --------------------------------------------------------

--
-- Structure de la table `commandes_achat`
--

CREATE TABLE `commandes_achat` (
  `id` int NOT NULL,
  `fournisseur_id` int NOT NULL,
  `date_commande` date NOT NULL,
  `date_reception_prevue` date DEFAULT NULL,
  `statut` varchar(20) NOT NULL DEFAULT 'en_cours',
  `date_mise_a_jour` datetime DEFAULT NULL,
  `montant_total` decimal(10,2) DEFAULT '0.00',
  `date_livraison_prevue` date DEFAULT NULL,
  `total_ht` decimal(10,2) NOT NULL DEFAULT '0.00',
  `date_reception_reelle` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commandes_achat`
--

INSERT INTO `commandes_achat` (`id`, `fournisseur_id`, `date_commande`, `date_reception_prevue`, `statut`, `date_mise_a_jour`, `montant_total`, `date_livraison_prevue`, `total_ht`, `date_reception_reelle`, `date_creation`) VALUES
(1, 1, '2025-11-11', NULL, 'annulee', NULL, 0.00, '2025-11-18', 0.00, '2025-11-11 17:36:01', '2025-11-11 23:51:46'),
(2, 1, '2025-11-11', NULL, 'facturée', NULL, 0.00, '2025-11-18', 780.00, NULL, '2025-11-11 23:56:29');

-- --------------------------------------------------------

--
-- Structure de la table `commandes_fournisseur`
--

CREATE TABLE `commandes_fournisseur` (
  `id` int NOT NULL,
  `fournisseur_id` int NOT NULL,
  `date_commande` date NOT NULL,
  `date_livraison_prevue` date DEFAULT NULL,
  `total_ht` decimal(10,2) NOT NULL,
  `total_ttc` decimal(10,2) NOT NULL,
  `statut` enum('en_cours','expediee','partiellement_recue','recue_complete','annulee') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'en_cours',
  `statut_paiement` enum('non_payee','partiellement_payee','payee') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'non_payee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_details`
--

CREATE TABLE `commande_details` (
  `id` int NOT NULL,
  `commande_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int NOT NULL,
  `prix_unitaire_ht` decimal(10,2) NOT NULL,
  `total_ligne_ht` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_fournisseur_details`
--

CREATE TABLE `commande_fournisseur_details` (
  `id` int NOT NULL,
  `commande_fournisseur_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int NOT NULL,
  `quantite_recue` int NOT NULL DEFAULT '0',
  `prix_unitaire_ht` decimal(10,2) NOT NULL,
  `total_ligne_ht` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id` int NOT NULL,
  `commande_id` int DEFAULT NULL,
  `produit_id` int DEFAULT NULL,
  `quantite` int NOT NULL,
  `prix_unitaire_vente` decimal(10,2) NOT NULL,
  `remise_appliquee` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `details_commande_achat`
--

CREATE TABLE `details_commande_achat` (
  `id` int NOT NULL,
  `commande_achat_id` int DEFAULT NULL,
  `produit_id` int DEFAULT NULL,
  `quantite_commandee` int NOT NULL,
  `prix_achat_unitaire` decimal(10,2) NOT NULL,
  `quantite_recue` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

CREATE TABLE `devis` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `date_devis` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date_validite` date DEFAULT NULL,
  `total_ht` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_ttc` decimal(10,2) NOT NULL DEFAULT '0.00',
  `statut` enum('brouillon','envoye','accepte','refuse','converti') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'brouillon'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `devis_details`
--

CREATE TABLE `devis_details` (
  `id` int NOT NULL,
  `devis_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int NOT NULL,
  `prix_unitaire_ht` decimal(10,2) NOT NULL,
  `total_ligne_ht` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

CREATE TABLE `factures` (
  `id` int NOT NULL,
  `commande_id` int NOT NULL,
  `client_id` int NOT NULL,
  `numero_facture` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_facture` date NOT NULL,
  `date_paiement_prevue` date DEFAULT NULL,
  `total_ht` decimal(10,2) NOT NULL,
  `total_tva` decimal(10,2) NOT NULL,
  `total_ttc` decimal(10,2) NOT NULL,
  `montant_paye` decimal(10,2) NOT NULL DEFAULT '0.00',
  `statut_paiement` enum('Impayee','Partielle','Payee') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Impayee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `factures_fournisseur`
--

CREATE TABLE `factures_fournisseur` (
  `id` int NOT NULL,
  `commande_achat_id` int DEFAULT NULL,
  `fournisseur_id` int NOT NULL,
  `reference_facture` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `date_facture` date NOT NULL,
  `date_echeance` date DEFAULT NULL,
  `total_ht` decimal(10,2) NOT NULL,
  `total_ttc` decimal(10,2) NOT NULL,
  `montant_paye` decimal(10,2) NOT NULL DEFAULT '0.00',
  `statut_paiement` enum('en_attente','partiellement_payee','payee','en_retard') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'en_attente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facture_details`
--

CREATE TABLE `facture_details` (
  `id` int NOT NULL,
  `facture_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int NOT NULL,
  `prix_unitaire_ht` decimal(10,2) NOT NULL,
  `total_ligne_ht` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fidelite_transactions`
--

CREATE TABLE `fidelite_transactions` (
  `id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  `commande_id` int DEFAULT NULL,
  `type_transaction` enum('gain','utilisation','ajustement') NOT NULL,
  `points_ajoutes_retires` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_transaction` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id` int NOT NULL,
  `nom_societe` varchar(255) NOT NULL,
  `contact_nom` varchar(100) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `adresse` text,
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `nom` varchar(255) NOT NULL,
  `code_acces` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `nom_societe`, `contact_nom`, `contact_email`, `telephone`, `adresse`, `date_creation`, `nom`, `code_acces`) VALUES
(1, 'TechnoSupply Sarl', 'Mr Karim Benali', 'karimbn@technosupply.com', '+33184256790', '42 rue de l\'Innovation, 75011 Paris', '2025-11-11 15:37:44', '', 'FOURN123');

-- --------------------------------------------------------

--
-- Structure de la table `lignes_commande_achat`
--

CREATE TABLE `lignes_commande_achat` (
  `id` int NOT NULL,
  `commande_achat_id` int NOT NULL,
  `produit_id` int NOT NULL,
  `quantite` int NOT NULL,
  `prix_unitaire_ht` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `lignes_commande_achat`
--

INSERT INTO `lignes_commande_achat` (`id`, `commande_achat_id`, `produit_id`, `quantite`, `prix_unitaire_ht`) VALUES
(1, 2, 1, 1, 780.00);

-- --------------------------------------------------------

--
-- Structure de la table `mouvements_stock`
--

CREATE TABLE `mouvements_stock` (
  `id` int NOT NULL,
  `produit_id` int NOT NULL,
  `type_mouvement` enum('entree','sortie','ajustement','production') NOT NULL,
  `quantite` int NOT NULL,
  `reference_externe` varchar(100) DEFAULT NULL,
  `date_mouvement` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text,
  `prix_achat_moyen` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prix_ht` decimal(10,2) NOT NULL,
  `quantite_stock` int NOT NULL DEFAULT '0',
  `seuil_alerte_stock` int DEFAULT '10',
  `unite_mesure` varchar(20) DEFAULT 'piece',
  `categorie_id` int DEFAULT NULL,
  `fournisseur_principal_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `prix_achat_ht` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prix_vente_ht` decimal(10,2) NOT NULL DEFAULT '0.00',
  `seuil_alerte` int NOT NULL DEFAULT '5',
  `statut` varchar(50) NOT NULL DEFAULT 'actif',
  `image` varchar(255) DEFAULT 'default.png',
  `fournisseur_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix_achat_moyen`, `prix_ht`, `quantite_stock`, `seuil_alerte_stock`, `unite_mesure`, `categorie_id`, `fournisseur_principal_id`, `image_url`, `prix_achat_ht`, `prix_vente_ht`, `seuil_alerte`, `statut`, `image`, `fournisseur_id`) VALUES
(1, 'Ordinateur Portable HP ProBook 450 G10', 'Ordinateur portable professionnel équipé d’un processeur Intel Core i7, 16 Go de RAM et 512 Go SSD. Idéal pour le travail bureautique, la gestion et les déplacements.', 780.00, 950.00, 20, 10, 'piece', 1, 1, NULL, 0.00, 0.00, 5, 'actif', 'default.png', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` enum('admin','client') NOT NULL DEFAULT 'client',
  `points_fidelite` int DEFAULT '0',
  `date_creation` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_role` varchar(20) NOT NULL DEFAULT 'client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `email`, `mot_de_passe`, `role`, `points_fidelite`, `date_creation`, `user_role`) VALUES
(1, 'Tassadit', 'zdlmleila@gmail.com', '$2y$10$PgeD2O/6rTH33JEtv4ljdOoKQHx8AL1IzzysQ0d3lgeTamPpfvcTW', 'admin', 0, '2025-11-11 14:55:17', 'admin'),
(2, 'Mouad Dehichi', 'mouaddehichi@gmail.com', '$2y$10$7HCNQx/eo9H7eZfRUPPATOntjSWiGHY6ROzLUGj/Y1IUUE/a2o4yO', 'admin', 0, '2025-11-11 15:00:29', 'client'),
(3, 'Leila', 'zidelmaltassadit2019@gmail.com', '$2y$10$yfFqcNHnEkk76xY3.sQ3bOhsgqjL8.pUtH6Ab5KXSaHoA4ndfQkFy', 'client', 0, '2025-11-11 23:57:41', 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `fk_commande_client` (`client_id`);

--
-- Index pour la table `commandes_achat`
--
ALTER TABLE `commandes_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`);

--
-- Index pour la table `commandes_fournisseur`
--
ALTER TABLE `commandes_fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`);

--
-- Index pour la table `commande_details`
--
ALTER TABLE `commande_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_id` (`commande_id`);

--
-- Index pour la table `commande_fournisseur_details`
--
ALTER TABLE `commande_fournisseur_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_fournisseur_id` (`commande_fournisseur_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_id` (`commande_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `details_commande_achat`
--
ALTER TABLE `details_commande_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_achat_id` (`commande_achat_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `devis`
--
ALTER TABLE `devis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `devis_details`
--
ALTER TABLE `devis_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `devis_id` (`devis_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_facture` (`numero_facture`),
  ADD KEY `commande_id` (`commande_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `factures_fournisseur`
--
ALTER TABLE `factures_fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_achat_id` (`commande_achat_id`),
  ADD KEY `fournisseur_id` (`fournisseur_id`);

--
-- Index pour la table `facture_details`
--
ALTER TABLE `facture_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facture_id` (`facture_id`);

--
-- Index pour la table `fidelite_transactions`
--
ALTER TABLE `fidelite_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `commande_id` (`commande_id`);

--
-- Index pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_societe` (`nom_societe`),
  ADD UNIQUE KEY `contact_email` (`contact_email`),
  ADD UNIQUE KEY `code_acces` (`code_acces`);

--
-- Index pour la table `lignes_commande_achat`
--
ALTER TABLE `lignes_commande_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_achat_id` (`commande_achat_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `mouvements_stock`
--
ALTER TABLE `mouvements_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `fournisseur_principal_id` (`fournisseur_principal_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commandes_achat`
--
ALTER TABLE `commandes_achat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commandes_fournisseur`
--
ALTER TABLE `commandes_fournisseur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commande_details`
--
ALTER TABLE `commande_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commande_fournisseur_details`
--
ALTER TABLE `commande_fournisseur_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `details_commande_achat`
--
ALTER TABLE `details_commande_achat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `devis`
--
ALTER TABLE `devis`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `devis_details`
--
ALTER TABLE `devis_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `factures`
--
ALTER TABLE `factures`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `factures_fournisseur`
--
ALTER TABLE `factures_fournisseur`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `facture_details`
--
ALTER TABLE `facture_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fidelite_transactions`
--
ALTER TABLE `fidelite_transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `lignes_commande_achat`
--
ALTER TABLE `lignes_commande_achat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `mouvements_stock`
--
ALTER TABLE `mouvements_stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_commande_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `commandes_achat`
--
ALTER TABLE `commandes_achat`
  ADD CONSTRAINT `commandes_achat_ibfk_1` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `commandes_fournisseur`
--
ALTER TABLE `commandes_fournisseur`
  ADD CONSTRAINT `commandes_fournisseur_ibfk_1` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`);

--
-- Contraintes pour la table `commande_details`
--
ALTER TABLE `commande_details`
  ADD CONSTRAINT `commande_details_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commande_fournisseur_details`
--
ALTER TABLE `commande_fournisseur_details`
  ADD CONSTRAINT `commande_fournisseur_details_ibfk_1` FOREIGN KEY (`commande_fournisseur_id`) REFERENCES `commandes_fournisseur` (`id`),
  ADD CONSTRAINT `commande_fournisseur_details_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD CONSTRAINT `details_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `details_commande_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `details_commande_achat`
--
ALTER TABLE `details_commande_achat`
  ADD CONSTRAINT `details_commande_achat_ibfk_1` FOREIGN KEY (`commande_achat_id`) REFERENCES `commandes_achat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `details_commande_achat_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `devis`
--
ALTER TABLE `devis`
  ADD CONSTRAINT `devis_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Contraintes pour la table `devis_details`
--
ALTER TABLE `devis_details`
  ADD CONSTRAINT `devis_details_ibfk_1` FOREIGN KEY (`devis_id`) REFERENCES `devis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `devis_details_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `factures_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `factures_fournisseur`
--
ALTER TABLE `factures_fournisseur`
  ADD CONSTRAINT `factures_fournisseur_ibfk_1` FOREIGN KEY (`commande_achat_id`) REFERENCES `commandes_achat` (`id`),
  ADD CONSTRAINT `factures_fournisseur_ibfk_2` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`);

--
-- Contraintes pour la table `facture_details`
--
ALTER TABLE `facture_details`
  ADD CONSTRAINT `facture_details_ibfk_1` FOREIGN KEY (`facture_id`) REFERENCES `factures` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `fidelite_transactions`
--
ALTER TABLE `fidelite_transactions`
  ADD CONSTRAINT `fidelite_transactions_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fidelite_transactions_ibfk_2` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `lignes_commande_achat`
--
ALTER TABLE `lignes_commande_achat`
  ADD CONSTRAINT `lignes_commande_achat_ibfk_1` FOREIGN KEY (`commande_achat_id`) REFERENCES `commandes_achat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lignes_commande_achat_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `mouvements_stock`
--
ALTER TABLE `mouvements_stock`
  ADD CONSTRAINT `mouvements_stock_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE RESTRICT;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`fournisseur_principal_id`) REFERENCES `fournisseurs` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
