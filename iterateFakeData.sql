DELIMITER //

    CREATE OR REPLACE PROCEDURE iterateFakeData(IN fakeDataArray BLOB)
      BEGIN 
        DECLARE i INT DEFAULT 0;
        DECLARE j INT DEFAULT 0;
        DECLARE rowData BLOB DEFAULT NULL; 
        REPEAT
            SET rowData := JSON_EXTRACT(fakeDataArray, CONCAT('$[', i,']'));
            SET @column0 := JSON_EXTRACT(rowData, CONCAT('$[', 0,']'));
            SET @column1 := JSON_EXTRACT(rowData, CONCAT('$[', 1,']'));
            SET @column2 := JSON_EXTRACT(rowData, CONCAT('$[', 2,']'));
            SET @column3 := JSON_EXTRACT(rowData, CONCAT('$[', 3,']'));
            SET @column4 := JSON_EXTRACT(rowData, CONCAT('$[', 4,']'));
            SET @column5 := JSON_EXTRACT(rowData, CONCAT('$[', 5,']'));
            SELECT @column0, @column1, @column2, @column3, @column4, @column5;
            START TRANSACTION;
            IF (@column5 IS NULL) AND (@column4 IS NULL) AND (@column3 IS NULL) AND (@column2 IS NOT NULL) THEN
                SELECT '3 params';
            ELSEIF (@column5 IS NULL) AND (@column4 IS NULL) AND (@column3 IS NULL) AND (@column2 IS NULL) THEN
                SELECT '2 params';
            ELSE
                 SET @sqlPrepare = CONCAT('CALL ', 'addUser(',CONCAT(@column0, ',', @column1, ',', @column2, ',', @column3, ',', @column4, ',', @column5),');');
                 PREPARE stmt_array_callback FROM @sqlPrepare;
                 EXECUTE stmt_array_callback;
                 DEALLOCATE PREPARE stmt_array_callback;
            END IF;
            COMMIT;
            SET i = i + 1;
        UNTIL i = JSON_LENGTH(fakeDataArray) END REPEAT;
      END //

DELIMITER ;