/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id  INTEGER,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10, 2)
);

ALTER TABLE animals
ADD  species VARCHAR(255) ;

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals
  DROP COLUMN species,
  ADD COLUMN species_id INTEGER REFERENCES species(id),
  ADD COLUMN owner_id INTEGER REFERENCES owners(id);

ALTER TABLE animals
ADD COLUMN id_new SERIAL PRIMARY KEY;

UPDATE animals
SET id_new = DEFAULT;

ALTER TABLE animals
DROP COLUMN id;
ALTER TABLE animals
RENAME COLUMN id_new TO id;

CREATE TABLE animals_temp (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10, 2),
  species_id INTEGER REFERENCES species(id),
  owner_id INTEGER REFERENCES owners(id)
);

DROP TABLE animals;

ALTER TABLE animals_temp RENAME TO animals;

