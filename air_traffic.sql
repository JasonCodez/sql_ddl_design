-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;



\c air_traffic

CREATE TABLE passengers 
(
    passengerID SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

INSERT INTO passengers
   (first_name, last_name)
VALUES
   ('Jennifer', 'Finch'),
   ('Thadeus', 'Gathercoal'),
   ('Sonja', 'Pauley'),
   ('Waneta', 'Skeleton'),
   ('Berkie', 'Wycliff'),
   ('Alvin', 'Leathes'),
   ('Cory', 'Squibbes');

CREATE TABLE airlines (
    airlineID SERIAL PRIMARY KEY,
    airline_name TEXT NOT NULL
);

INSERT INTO airlines
   (airline_name)
VALUES
   ('United'),
   ('British Airways'),
   ('Delta'),
   ('TUI Fly Belgium'),
   ('Air China'),
   ('American Airlines'),
   ('Avianca Brasil');

CREATE TABLE cities_from (
    city_fromID SERIAL PRIMARY KEY,
    city_name TEXT NOT NULL
);

INSERT INTO cities_from
   (city_name)
VALUES
   ('Washington DC'),
   ('Seattle'),
   ('Tokyo'),
   ('London'),
   ('Los Angeles'),
   ('Las Vegas'),
   ('Mexico City'),
   ('Paris'),
   ('Casablanca'),
   ('Dubai'),
   ('Beijing'),
   ('New York'),
   ('Charlotte'),
   ('Cedar Rapids'),
   ('Chicago'),
   ('New Orleans'),
   ('Sao Paolo'),
   ('Santiago');

CREATE TABLE countries_from (
    country_fromID SERIAL PRIMARY KEY,
    country_name TEXT NOT NULL
);

INSERT INTO countries_from
   (country_name)
VALUES
   ('United States'),
   ('Japan'),
   ('United Kingdom'),
   ('Mexico'),
   ('France'),
   ('Morocco'),
   ('UAE'),
   ('China'),
   ('Brazil'),
   ('Chile');

CREATE TABLE cities_to (
    city_toID SERIAL PRIMARY KEY,
    city_name TEXT NOT NULL
);

INSERT INTO cities_to
   (city_name)
VALUES
   ('Washington DC'),
   ('Seattle'),
   ('Tokyo'),
   ('London'),
   ('Los Angeles'),
   ('Las Vegas'),
   ('Mexico City'),
   ('Paris'),
   ('Casablanca'),
   ('Dubai'),
   ('Beijing'),
   ('New York'),
   ('Charlotte'),
   ('Cedar Rapids'),
   ('Chicago'),
   ('New Orleans'),
   ('Sao Paolo'),
   ('Santiago');

CREATE TABLE countries_to (
    country_toID SERIAL PRIMARY KEY,
    country_name TEXT NOT NULL
);

INSERT INTO countries_to
   (country_name)
VALUES
   ('United States'),
   ('Japan'),
   ('United Kingdom'),
   ('Mexico'),
   ('France'),
   ('Morocco'),
   ('UAE'),
   ('China'),
   ('Brazil'),
   ('Chile');

CREATE TABLE tickets (
    ticketID SERIAL PRIMARY KEY,
    passengerID INTEGER REFERENCES passengers(passengerID) NOT NULL,
    seat TEXT NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    airlineID INTEGER REFERENCES airlines(airlineID) NOT NULL,
    city_fromID INTEGER REFERENCES cities_from(city_fromID) NOT NULL,
    country_fromID INTEGER REFERENCES countries_from(country_fromID) NOT NULL,
    city_toID INTEGER REFERENCES cities_to(city_toID) NOT NULL,
    country_toID INTEGER REFERENCES countries_to(country_toID) NOT NULL
);

INSERT INTO tickets
   (passengerID, seat, departure, arrival, airlineID, city_fromID, country_fromID, city_toID, country_toID)
VALUES
   ('1', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
   ('2', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4, 3),
   ('3', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6, 1),
   ('1', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7, 4),
   ('4', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9, 6),
   ('2', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11, 8),
   ('5', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13, 1),
   ('6', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15, 1),
   ('5', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16, 1),
   ('7', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18, 10);



