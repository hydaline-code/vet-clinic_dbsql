

/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered IS true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Update table

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
---
ROLLBACK;
SELECT species FROM animals;
---
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT species FROM animals;
COMMIT;
---
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
---
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT my_savepoint;
SELECT * FROM animals;
---
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
---
ROLLBACK TO SAVEPOINT my_savepoint;
SELECT * FROM animals;
---
UPDATE animals SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;
---

--Write queries
SELECT COUNT(*) FROM animals;
---
SELECT COUNT(*) FROM animals
WHERE escape_attempts = 0;
---
SELECT AVG(weight_kg) FROM animals;
---
SELECT neutered, MAX(escape_attempts) FROM animals
GROUP BY(neutered);
---
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals
GROUP BY(species);
---
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY(species);


SELECT animals.name, animals.owners_id, owners.full_name, owners.id 
FROM animals INNER JOIN owners ON animals.owners_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT animals.name, animals.species_id, species.name, species.id 
FROM animals INNER JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM owners
LEFT JOIN animals ON owners.id = animals.owners_id;

SELECT species.name, COUNT(animals.name) from animals 
JOIN species ON animals.species_id = species.id 
GROUP BY species.name;

SELECT owners.full_name, animals.name, species.name FROM animals
LEFT JOIN owners ON animals.owners_id = owners.id
LEFT JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' 
AND species.name = 'Digimon';

SELECT owners.full_name, animals.name, animals.escape_attempts FROM animals
LEFT JOIN owners ON animals.owners_id = owners.id
WHERE owners.full_name = 'Dean Winchester' 
AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.name) FROM animals
LEFT JOIN owners ON animals.owners_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(animals.name) DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit, vets.name FROM animals 
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id 
WHERE visits.vets_id = (SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher')
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(DISTINCT animals.name), vets.name FROM animals 
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id 
WHERE visits.vets_id = (SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
GROUP BY vets.name;

SELECT vets.name, species.name FROM vets 
JOIN specializations ON vets.id = specializations.vets_id 
JOIN species ON specializations.species_id = species.id;

SELECT animals.name FROM animals 
JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vets_id 
WHERE vets.id =(SELECT id FROM vets WHERE name = 'Stephanie Mendez')
AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT name, COUNT(animals_id) FROM animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY name
ORDER BY COUNT(animals_id) DESC LIMIT 1;

SELECT animals.name, visits.date_of_visit, vets.name FROM animals 
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id 
WHERE visits.vets_id = (SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
ORDER BY visits.date_of_visit LIMIT 1;

SELECT animals.name, visits.date_of_visit, vets.name FROM animals 
JOIN visits ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id 
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT vets.name, COUNT(date_of_visit) FROM vets 
JOIN specializations ON vets.id = specializations.vets_id
JOIN visits ON vets.id = visits.vets_id
JOIN species ON specializations.species_id = species.id
WHERE species.name = 'Pokemon'
GROUP BY vets.name;

SELECT species.name, COUNT(visits.animals_id) FROM visits JOIN vets ON visits.vets_id = vets.id FULL JOIN animals
ON visits.animals_id = animals.id JOIN species  ON species.id = animals.species_id WHERE vets.id = 2
GROUP BY species.name;
