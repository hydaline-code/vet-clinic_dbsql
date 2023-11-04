-- /*Queries that provide answers to the questions from all projects.*/

-- BEGIN;
-- UPDATE animals
-- SET species = 'unspecified';
-- SELECT * FROM animals;
-- ROLLBACK;
-- SELECT * FROM animals;
-- BEGIN;
-- UPDATE animals
-- SET species = 'digimon'
-- WHERE name LIKE '%mon';
-- UPDATE animals
-- SET species = 'pokemon'
-- WHERE species IS NULL;
-- SELECT * FROM animals;

-- COMMIT;
-- SELECT * FROM animals;

-- BEGIN;
-- DELETE FROM animals
-- WHERE date_of_birth > '2022-01-01';
-- SAVEPOINT backup;
-- UPDATE animals
-- SET weight_kg = weight_kg * -1;

-- ROLLBACK TO SAVEPOINT backup;

-- SELECT * FROM animals;

-- COMMIT;

-- SELECT * FROM animals;


-- SELECT COUNT(*) AS total_animals
-- FROM animals;

-- SELECT COUNT(*) AS no_escape_count
-- FROM animals
-- WHERE escape_attempts = 0;

-- SELECT AVG(weight_kg) AS average_weight
-- FROM animals;

-- SELECT neutered, MAX(escape_attempts) AS max_escape_attempts
-- FROM animals
-- GROUP BY neutered;

-- SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
-- FROM animals
-- GROUP BY species;
-- SELECT species, AVG(escape_attempts) AS average_escape_attempts
-- FROM animals
-- WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31'
-- GROUP BY species;

-- UPDATE animals
-- SET species_id = (CASE
--     WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
--     ELSE (SELECT id FROM species WHERE name = 'Pokemon')
--     END);
-- Update animals to set owner_id
UPDATE animals
SET owner_id = (
    SELECT owners.id
    FROM owners
    WHERE
        (name = 'Agumon' AND full_name = 'Sam Smith') OR
        (name IN ('Gabumon', 'Pikachu') AND full_name = 'Jennifer Orwell') OR
        (name IN ('Devimon', 'Plantmon') AND full_name = 'Bob') OR
        (name IN ('Charmander', 'Squirtle', 'Blossom') AND full_name = 'Melody Pond') OR
        (name IN ('Angemon', 'Boarmon') AND full_name = 'Dean Winchester')
);
