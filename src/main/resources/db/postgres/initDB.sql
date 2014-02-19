CREATE DATABASE petclinic;


CREATE TABLE IF NOT EXISTS vets (
  id serial PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS specialties (
  id serial PRIMARY KEY,
  name VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS vet_specialties (
  vet_id integer NOT NULL,
  specialty_id integer NOT NULL,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (specialty_id) REFERENCES specialties(id),
  UNIQUE (vet_id,specialty_id)
);


CREATE TABLE IF NOT EXISTS types (
  id serial NOT NULl PRIMARY KEY,
  name VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS owners (
  id serial PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  address VARCHAR(255),
  city VARCHAR(80),
  telephone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS pets (
  id serial PRIMARY KEY,
  name VARCHAR(30),
  birth_date DATE,
  type_id integer NOT NULL,
  owner_id integer NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES owners(id),
  FOREIGN KEY (type_id) REFERENCES types(id)
);

CREATE TABLE IF NOT EXISTS visits (
  id serial PRIMARY KEY,
  pet_id integer NOT NULL,
  visit_date DATE,
  description VARCHAR(255),
  FOREIGN KEY (pet_id) REFERENCES pets(id)
);