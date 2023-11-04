/*Queries that provide answers to the questions from all projects.*/

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
SELECT * FROM animals;

COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT backup;
UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT backup;

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;


