DROP DATABASE IF EXISTS Panier;

CREATE DATABASE panier;

use panier;

CREATE TABLE Users(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    mdp VARCHAR(255) NOT NULL,
    ville VARCHAR(255) NOT NULL,
    code_postal INT(5) NOT NULL,
    rue INT(1) NOT NULL
);

CREATE TABLE Produits (
    id_produit INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    fabricant VARCHAR(255) NOT NULL,
    prix INT NOT NULL,
    image VARCHAR(255) DEFAULT 'unknown_produit.png',
    description TINYTEXT DEFAULT ''
);

CREATE TABLE commandesUsersProduits(
    id_commande INT PRIMARY KEY AUTO_INCREMENT,
    id_produit INT NOT NULL,
    id_user INT NOT NULL,
    status_commande ENUM('pending', 'successfully') DEFAULT 'pending',
    date_commande BIGINT UNSIGNED DEFAULT UNIX_TIMESTAMP(),
    CONSTRAINT `fk_commandesUserProduit_produit` FOREIGN KEY (`id_produit`) REFERENCES Produits (`id_produit`),
    CONSTRAINT `fk_commandesUserProduit_user` FOREIGN KEY(id_user) REFERENCES Users(id_user)    
);

CREATE TABLE Commentaires(
    id_commentaire INT PRIMARY KEY AUTO_INCREMENT,
    commentaire VARCHAR(255) NOT NULL,
    id_produit INT NOT NULL,
    id_user INT NOT NULL,
    date_commentaire BIGINT UNSIGNED DEFAULT UNIX_TIMESTAMP(),
    CONSTRAINT `fk_commentaire_produit` FOREIGN KEY (`id_produit`) REFERENCES Produits (`id_produit`),
    CONSTRAINT `fk_commentaire_user` FOREIGN KEY(id_user) REFERENCES Users(id_user)    
);