-- Create Database

CREATE DATABASE INFO_330_Project_Team13

USE INFO_330_Project_Team13

-- Create tables

CREATE TABLE Animal_breed
(
    Animal_breed_id INT IDENTITY (1, 1) PRIMARY KEY,
    Family          VARCHAR(50),
    Species         VARCHAR(50)
)

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


CREATE TABLE Related_animal
(
    Related_animal_id INT IDENTITY (1, 1) PRIMARY KEY,
    Animal_id         INT FOREIGN KEY REFERENCES Animals (Animal_id)
)

CREATE TABLE Zoo
(
    Zoo_id             INT IDENTITY (1, 1) PRIMARY KEY,
    Number_of_exhibits INT,
    Country            VARCHAR(50),
    State              VARCHAR(50),
    City               VARCHAR(50)
)

CREATE TABLE Employees
(
    Employee_id  INT IDENTITY (1, 1) PRIMARY KEY,
    Name         VARCHAR(50),
    Job          VARCHAR(50),
    E_start_date DATE,
    E_end_date   DATE
)

CREATE TABLE Tickets
(
    Ticket_id        INT IDENTITY (1, 1) PRIMARY KEY,
    Date             DATE,
    Type_of_ticket   VARCHAR(50),
    Cost             INT,
    Customer_Fname   VARCHAR(50),
    Customer_Lname   VARCHAR(50),
    Exhibits_visited VARCHAR(100)
)

CREATE TABLE Exhibit
(
    Exhibit_id   INT IDENTITY (1, 1) PRIMARY KEY,
    Exhibit_name VARCHAR(50),
    Location     VARCHAR(50),
    Hours        INT,
    Zoo_id       INT FOREIGN KEY REFERENCES Zoo (Zoo_id),
    Animal_id    INT FOREIGN KEY REFERENCES Animals (Animal_id),
    Employee_id  INT FOREIGN KEY REFERENCES Employees (Employee_id),
    Temperature  INT,
    Size         INT,
    Ticket_id    INT FOREIGN KEY REFERENCES Tickets (Ticket_id),
    Capacity     INT,
    Cost         INT
)

CREATE TABLE Nutrients
(
    Diet_type     VARCHAR(50),
    Food_category VARCHAR(50),
    Animal_id     INT FOREIGN KEY REFERENCES Animals (Animal_id),
    Amount        INT
)
-- Insert values

-- Create views