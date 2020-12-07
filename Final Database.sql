-- Create Database

CREATE DATABASE INFO_330_Project_Team13

USE INFO_330_Project_Team13

-- Create tables
CREATE TABLE Animals
(
    Animal_id           INT IDENTITY (1, 1) PRIMARY KEY,
    Animal_name         VARCHAR(50),
    Animal_breed_id     INT FOREIGN KEY REFERENCES Animal_Breed (Animal_Breed_id),
    Class_type          VARCHAR(50),
    DOB                 date,
    Diet                VARCHAR(50),
    Alive               bit,
    Cause_of_death      VARCHAR(50),
    Origin              VARCHAR(50),
    Date_of_acquirement date,
    Date_of_departure   date,
    Endangered          int
)

CREATE TABLE Animal_Breed
(
    Animal_breed_id INT IDENTITY (1, 1) PRIMARY KEY,
    Family          VARCHAR(50),
    Species         VARCHAR(50)
)

CREATE TABLE Related_Animal
(
    Related_animal_id INT IDENTITY (1, 1) PRIMARY KEY,
    Animal_id         INT FOREIGN KEY REFERENCES Animals (Animal_id)
)

-- Insert values

-- Create views