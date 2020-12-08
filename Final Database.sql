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
    Class_type          VARCHAR(50), -- what are the values for this? consider creating tblAnimal_type or moving to animal_breed
    DOB                 DATE,
    Diet                VARCHAR(50), -- might be able to move value to tblAnimal_type or animal_breed
    Alive               BIT,
    Cause_of_death      VARCHAR(50),
    Origin              VARCHAR(50),
    Date_of_acquirement DATE,
    Date_of_departure   DATE,
    Endangered          INT -- might be able to move value to tblAnimal_type or animal_breed
)


CREATE TABLE Related_animal -- should find more to add here or remove/merge with animal_breed
(
    Related_animal_id INT IDENTITY (1, 1) PRIMARY KEY,
    Animal_id         INT FOREIGN KEY REFERENCES Animals (Animal_id)
)

CREATE TABLE Zoo
(
    Zoo_id             INT IDENTITY (1, 1) PRIMARY KEY,
    Number_of_exhibits INT, -- redundant, can get value from querying tblExhibit(Zoo_id)
    Country            VARCHAR(50),
    State              VARCHAR(50), -- consider turning into VARCHAR(2) and use state abbrev
    City               VARCHAR(50)
)

CREATE TABLE Employees
(
    Employee_id  INT IDENTITY (1, 1) PRIMARY KEY,
    Name         VARCHAR(50),
    Job          VARCHAR(50), -- better to create separate table containing jobs
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

CREATE TABLE Exhibit -- might need to add table/foreign key Exhibit_type for Q14, 20
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
    Cost         INT -- might want to change to monthly_cost or annual_cost
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
/*
1. Are the animals bred from the zoo or from an outside source?
2. What are the causes of animal deaths when they happen?
3. How long have the animals been at the zoo?
4. What zoo has the highest ratio of square footage to animals?
5. What zoo has the lowest ratio of zookeepers to animals?
6. What zoos have the most visitors?
7. What was the average number of customers per day between two dates?
8. How many customers does each exhibit attract on an average day?
9. What is the average amount of deaths per habitat across zoos?
10. How many pounds/kilograms of food is needed on average for each enclosure?
11. How many animals, on average, does each animal share an enclosure with at a specific group?
12. What is the average number of total animals in each enclosure?
13. Which states have the most zoos containing endangered animals?
14. What's the average monthly cost of maintaining an aquarium type of exhibit?
15. What state has the lowest average ticket price for general admission tickets?
16. What zoo has the youngest leopard cub?
17. What animal lives the longest on average in each zoo?
18. Is the animal a plant based eater or a carnivorous animal, or both?
19. How many employees have been hired for longer than a year grouped by zoo?
20. What is the average temperature for a reptile enclosure?
*/