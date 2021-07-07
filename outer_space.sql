-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL
);

INSERT INTO galaxies
   (name)
VALUES
   ('The Milky Way');

CREATE TABLE planets (
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL,
   orbital_period_in_years FLOAT NOT NULL,
   orbits_around TEXT NOT NULL,
   galaxy_id INTEGER REFERENCES galaxies(id) NOT NULL
);

INSERT INTO planets
(name, orbital_period_in_years, orbits_around, galaxy_id)
VALUES
('Earth', 1.00, 'Sun', 1 ),
('Mars', 1.88, 'Sun', 1),
('Venus', 0.62, 'Sun', 1),
('Neptune', 164.8, 'Sun', 1),
('Proxima Centauri b', 0.03, 'Proxima Centauri', 1),
('Gliese 876 b', 0.23, 'Gliese 876', 1);


CREATE TABLE moons (
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL,
   planets_id INTEGER REFERENCES planets(id) NOT NULL 
);

INSERT INTO moons
   (name, planets_id)
VALUES
   ('The Moon', 1),
   ('Phobos', 2),
   ('Deimos', 2),
   ('Naiad', 4),
   ('Thalassa', 4),
   ('Despina', 4),
   ('Galatea', 4),
   ('Larissa', 4),
   ('S/2004 N 1', 4),
   ('Proteus', 4),
   ('Triton', 4),
   ('Nereid', 4),
   ('Halimede', 4),
   ('Sao', 4),
   ('Laomedeia', 4),
   ('Psamathe', 4),
   ('Neso', 4);