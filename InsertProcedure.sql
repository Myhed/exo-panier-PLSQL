DROP PROCEDURE IF EXISTS addProduit;
DROP PROCEDURE IF EXISTS addUser;
DROP PROCEDURE IF EXISTS addPanier;

use panier;

DELIMITER //
    CREATE PROCEDURE addProduit(
        IN nom VARCHAR(255),
        IN fabricant VARCHAR(255),
        IN prix INT
    )
      BEGIN
        START TRANSACTION;
         INSERT INTO Produits(`nom`,`fabricant`,`prix`) 
         VALUES(nom, fabricant, prix);
        COMMIT;
      END //
     CREATE PROCEDURE addUser(
         IN prenom VARCHAR(255),
         IN email VARCHAR(255),
         IN mdp VARCHAR(255),
         IN ville VARCHAR(255), 
         IN code_postal INT(5),
         IN rue INT(1)
     )
       BEGIN
        START TRANSACTION;
         INSERT INTO Users(`prenom`,`email`,`mdp`,`ville`,`code_postal`, `rue`)
         VALUES(prenom, email, mdp, ville, code_postal, rue);
        COMMIT;
       END //

     CREATE PROCEDURE addPanier(
         IN id_produit INT,
         IN id_user INT
     )
        BEGIN
         START TRANSACTION;
          INSERT INTO commandesUserProduits(`id_produit`,`id_user`)
          VALUES(id_produit, id_user);
         COMMIT;
        END //

DELIMITER ;