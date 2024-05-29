DELIMITER //

CREATE PROCEDURE InsertRandomPersons()
BEGIN
    DECLARE Counter INT DEFAULT 1;
    DECLARE FirstName VARCHAR(128);
    DECLARE LastName VARCHAR(128);

    CREATE TEMPORARY TABLE FirstNames (Name VARCHAR(128));
    INSERT INTO FirstNames (Name) VALUES ('John'), ('Jane'), ('Michael'), ('Emily'), ('David'), ('Emma'), ('Daniel'), ('Olivia'), ('Matthew'), ('Sophia');

    CREATE TEMPORARY TABLE LastNames (Name VARCHAR(128));
    INSERT INTO LastNames (Name) VALUES ('Smith'), ('Johnson'), ('Williams'), ('Brown'), ('Jones'), ('Garcia'), ('Miller'), ('Davis'), ('Rodriguez'), ('Martinez');

    WHILE Counter <= 10000 DO
        SELECT Name INTO FirstName FROM FirstNames ORDER BY RAND() LIMIT 1;
        SELECT Name INTO LastName FROM LastNames ORDER BY RAND() LIMIT 1;

        INSERT INTO Person (name, last_name) VALUES (FirstName, LastName);

        SET Counter = Counter + 1;
    END WHILE;

    DROP TEMPORARY TABLE IF EXISTS FirstNames;
    DROP TEMPORARY TABLE IF EXISTS LastNames;
END //

DELIMITER ;

CALL InsertRandomPersons();
