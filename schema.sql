/* Database schema to keep the structure of entire database. */

-- ALTER TABLE animals
-- ADD  species VARCHAR(255) ;

-- CREATE TABLE owners (
--     id SERIAL PRIMARY KEY,
--     full_name VARCHAR(255),
--     age INTEGER
-- );

-- CREATE TABLE species (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(255)
-- );

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id),
ADD COLUMN owner_id INTEGER REFERENCES owners(id);


