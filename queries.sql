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

-- UPDATE animals
-- SET weight_kg = weight_kg * -1
-- WHERE weight_kg < 0;
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

-- SELECT * FROM animals ORDER BY id ASC;
-- SELECT a.name
-- FROM animals a
-- JOIN owners o ON a.owner_id = o.id
-- WHERE o.full_name = 'Melody Pond';

-- SELECT a.name
-- FROM animals a
-- JOIN species s ON a.species_id = s.id
-- WHERE s.name = 'Pokemon';

-- SELECT o.full_name, COALESCE(a.name, 'No animals') AS animal_name
-- FROM owners o
-- LEFT JOIN animals a ON o.id = a.owner_id;

-- SELECT s.name AS species_name, COUNT(a.id) AS animal_count
-- FROM species s
-- LEFT JOIN animals a ON s.id = a.species_id
-- GROUP BY s.name;

-- SELECT a.name
-- FROM animals a
-- JOIN species s ON a.species_id = s.id
-- JOIN owners o ON a.owner_id = o.id
-- WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';

-- SELECT a.name
-- FROM animals a
-- JOIN owners o ON a.owner_id = o.id
-- WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts IS NULL;

-- SELECT o.full_name, COUNT(a.id) AS animal_count
-- FROM owners o
-- LEFT JOIN animals a ON o.id = a.owner_id
-- GROUP BY o.full_name
-- ORDER BY animal_count DESC
-- LIMIT 1;

-- SELECT a.name AS last_animal_seen
-- FROM visits AS v
-- JOIN animals AS a ON v.animal_id = a.id
-- WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher')
-- ORDER BY v.date_of_visit DESC;

-- SELECT COUNT(DISTINCT v.animal_id) AS number_of_animals_seen
-- FROM visits AS v
-- WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

-- SELECT v.name AS vet_name, COALESCE(s.specialties, 'No Specialization') AS specialization
-- FROM vets AS v
-- LEFT JOIN (
--     SELECT vet_id, STRING_AGG(sp.name, ', ') AS specialties
--     FROM specializations AS s
--     JOIN species AS sp ON s.species_id = sp.id
--     GROUP BY s.vet_id
-- ) AS s ON v.id = s.vet_id;

-- SELECT a.name AS animal_name
-- FROM animals AS a
-- JOIN visits AS v ON a.id = v.animal_id
-- WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
--   AND v.date_of_visit >= '2020-04-01' 
--   AND v.date_of_visit <= '2020-08-30';

-- SELECT a.name AS animal_name, COUNT(*) AS visit_count
-- FROM animals AS a
-- JOIN visits AS v ON a.id = v.animal_id
-- GROUP BY a.name
-- ORDER BY visit_count DESC
-- LIMIT 1;

-- SELECT a.name AS first_visited_animal, MIN(v.date_of_visit) AS first_visit_date
-- FROM visits AS v
-- JOIN animals AS a ON v.animal_id = a.id
-- WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
-- GROUP BY a.name
-- ORDER BY first_visit_date
-- LIMIT 1;

-- SELECT a.name AS animal_name, v.date_of_visit, vet.name AS vet_name
-- FROM visits AS v
-- JOIN animals AS a ON v.animal_id = a.id
-- JOIN vets AS vet ON v.vet_id = vet.id
-- ORDER BY v.date_of_visit DESC
-- LIMIT 1;

-- SELECT COUNT(*) AS visits_with_non_specialized_vet
-- FROM visits AS v
-- JOIN animals AS a ON v.animal_id = a.id
-- JOIN vets AS vet ON v.vet_id = vet.id
-- LEFT JOIN specializations AS s ON vet.id = s.vet_id AND a.species_id = s.species_id
-- WHERE s.vet_id IS NULL;
SELECT sp.name AS recommended_specialty, COUNT(*) AS visit_count
FROM specializations AS s
JOIN (
    SELECT v.vet_id, a.species_id
    FROM visits AS v
    JOIN animals AS a ON v.animal_id = a.id
    WHERE v.vet_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
) AS MaisyVisits ON s.vet_id = MaisyVisits.vet_id AND s.species_id = MaisyVisits.species_id
JOIN species AS sp ON s.species_id = sp.id
GROUP BY sp.name
ORDER BY visit_count DESC
LIMIT 1;





