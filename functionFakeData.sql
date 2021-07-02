DELIMITER //

    CREATE OR REPLACE FUNCTION fakeDataUser()
      RETURNS BLOB
    BEGIN
        RETURN JSON_ARRAY(
          JSON_ARRAY('John', 'johnDoe@gmail.com', PASSWORD('toto'), 'Nanterre', '92014', '5'),
          JSON_ARRAY('John', 'johnDoe@gmail.com', PASSWORD('toto'), 'Nanterre', '92014', '5'),
          JSON_ARRAY('John', 'johnDoe@gmail.com', PASSWORD('toto'), 'Nanterre', '92014', '5'),
          JSON_ARRAY('John', 'johnDoe@gmail.com', PASSWORD('toto'), 'Nanterre', '92014', '5'),
          JSON_ARRAY('John', 'johnDoe@gmail.com', PASSWORD('toto'), 'Nanterre', '92014', '5'),
          JSON_ARRAY('John', 'johnDoe@gmail.com', PASSWORD('toto'), 'Nanterre', '92014', '5'),
          JSON_ARRAY('John', 'johnDoe@gmail.com', PASSWORD('toto'), 'Nanterre', '92014', '5')
        );
    END //

DELIMITER ;