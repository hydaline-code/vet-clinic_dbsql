-- /* Populate database with sample data. */

--  INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
--  VALUES 
--   ('Charmander', '2020-02-08', 0, 'no', -11.0),
--   ('Plantmon', '2021-11-15', 2, 'yes', -5.7),
--   ('Squirtle', '1993-04-02', 3, 'no', -12.13),
--   ('Angemon', '2005-06-12', 1, 'yes', -45.0),
--   ('Boarmon', '2005-06-07', 7, 'yes', 20.4),
--   ('Blossom', '1998-10-13', 3, 'yes', 17.0),
--   ('Ditto', '2022-05-14', 4, 'yes', 22.0);

-- INSERT INTO owners (full_name, age) VALUES
-- ('Sam Smith', 34),
-- ('Jennifer Orwell', 19),
-- ('Bob', 45),
-- ('Melody Pond', 77),
-- ('Dean Winchester', 14),
-- ('Jodie Whittaker', 38);

-- INSERT INTO species (name) VALUES
-- ('Pokemon'),
-- ('Digimon');

-- INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
--  VALUES 
--    ('Agumon', '2020-02-03', 0, true, 10.23),
--   ('Gabumon', '2018-11-15', 2, true, 8),
--   ('Pikachu', '2021-01-07', 1, false, 15.04),
--   ('Devimon', '2017-05-12', 5, true, 11);
-- INSERT INTO animals_temp (name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id)
-- SELECT name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id
-- FROM animals;
-- UPDATE animals
-- SET species_id = (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1)
-- WHERE name LIKE '%mon';

-- UPDATE animals
-- SET species_id = (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1)
-- WHERE name NOT LIKE '%mon';

-- UPDATE animals
-- SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
-- WHERE name = 'Agumon';

-- UPDATE animals
-- SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
-- WHERE name IN ('Gabumon', 'Pikachu');

-- UPDATE animals
-- SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
-- WHERE name IN ('Devimon', 'Plantmon');

-- UPDATE animals
-- SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
-- WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

-- UPDATE animals
-- SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
-- WHERE name IN ('Angemon', 'Boarmon');

-- -- Insert data for Vet William Tatcher
-- INSERT INTO vets (name, age, date_of_graduation)
-- VALUES ('William Tatcher', 45, '2000-04-23');

-- INSERT INTO vets (name, age, date_of_graduation)
-- VALUES ('Maisy Smith', 26, '2019-01-17');

-- INSERT INTO vets (name, age, date_of_graduation)
-- VALUES ('Stephanie Mendez', 64, '1981-05-04');

-- INSERT INTO vets (name, age, date_of_graduation)
-- VALUES ('Jack Harkness', 38, '2008-06-08');

-- Insert specializations for Vet William Tatcher

-- Insert specializations for Vet William Tatcher
-- INSERT INTO specializations (vet_id, species_id)
-- VALUES (
--     (SELECT id FROM vets WHERE name = 'William Tatcher'),
--     (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1)
-- );

-- -- Insert specializations for Vet Stephanie Mendez
-- INSERT INTO specializations (vet_id, species_id)
-- VALUES (
--     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
--     (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1)
-- );
-- INSERT INTO specializations (vet_id, species_id)
-- VALUES (
--     (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
--     (SELECT id FROM species WHERE name = 'Pokemon' LIMIT 1)
-- );

-- -- Insert specializations for Vet Jack Harkness
-- INSERT INTO specializations (vet_id, species_id)
-- VALUES (
--     (SELECT id FROM vets WHERE name = 'Jack Harkness'),
--     (SELECT id FROM species WHERE name = 'Digimon' LIMIT 1)
-- );

-- Insert data for visits
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES
    ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
    ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
    ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
    ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
    ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
    ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
    ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
    ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
