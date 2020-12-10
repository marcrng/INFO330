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
INSERT INTO Animal_breed (Family, Species)
VALUES ('Elephantidae', 'Loxodonta africana'),
       ('Ursidae', 'Ailuropoda melanoleuca'),
       ('Ursidae', 'Ursus maritimus'),
       ('Felidae', 'Panthera pardus'),
       ('Felidae', 'Panthero leo'),
       ('Phoenicopteridae', 'Phoenicopterus ruber'),
       ('Rhinocerotidae', 'Ceratotherium simum'),
       ('Spheniscidae', 'Eudyptes moseleyi'),
       ('Spheniscidae', 'Aptenodytes forsteri'),
       ('Felidae', 'Panthera tigris tigris'),
       ('Varanidae', 'Varanus komodoensis'),
       ('Boidae', 'Eunectes murinus')

INSERT INTO Animals (Animal_name, Animal_breed_id, Class_type, DOB, Diet, Alive,
                     Cause_of_death, Origin, Date_of_acquirement, Date_of_departure, Endangered)
                     -- update with autopopulated id's, fill in missing values
VALUES ('African Elephant', 1111, 'Mammal',),
       ('Giant Panda Bear', 2222, 'Mammal',),
       ('Polar Bear', 3333, 'Mammal',),
       ('Leopard', 4444, 'Mammal',),
       ('Lion', 5555, 'Mammal',),
       ('American Flamingo', 6666, 'Bird',),
       ('White Rhino', 7777, 'Mammal',),
       ('Northern Rockhopper Penguin', 8888, 'Bird',),
       ('Emperor Penguin', 9999, 'Bird',),
       ('Bengal Tiger', 1010, 'Mammal',),
       ('Komodo Dragon', 1212, 'Reptile',),
       ('Green Anaconda', 1313, 'Reptile',)

INSERT INTO Related_animal (Related_animal_id, Animal_id) -- do we need this?
VALUES ()

INSERT INTO Zoo (Number_of_exhibits, Country, [State], City) -- need to clarify the max number of exhibits
VALUES (6, 'United States', 'Washington', 'Ballard'),
       (7, 'United States', 'California', 'San Diego'),
       (4, 'United States', 'Texas', 'Austin'),
       (3, 'United States', 'Florida', 'Tallahassee'),
       (6, 'United States', 'New York', 'New York')

INSERT INTO Employees ([Name], Job, E_start_date, E_end_date) -- need to clarify what zoo these employees work for. Maybe we consider that we have 5 zoos and like 50 employees, 10 employees per zoo
VALUES ('John', 'Janitor', 2011 - 10 - 01, 2020 - 03 - 15),
       ('Jane', 'Ticket Collector', 2013 - 9 - 11, 2018 - 03 - 07),
       ('Julia', 'Trainer', 2016 - 02 - 01, 2019 - 5 - 04),
       ('Ellie', 'Trainer', 2019 - 08 - 01, 2020 - 03 - 15),
       ('Luke', 'Assistant Trainer', 2009 - 04 - 01, 2013 - 03 - 17),
       ('Marc', 'Janitor', 2015 - 09 - 30, 2015 - 10 - 30),
       ('Chandler', 'Janitor', 2018 - 08 - 27, 2020 - 03 - 15),
       ('Ben', 'Trainer', 2011 - 10 - 01, 2020 - 03 - 15),
       ('Morgan', 'Ticket Collector', 2014 - 06 - 01, 2020 - 03 - 15),
       ('Cami', 'Trainer', 2011 - 10 - 01, 2020 - 03 - 15)

INSERT INTO Tickets ([Date], Type_of_ticket, Cost, Customer_Fname, Customer_Lname,
                     Exhibits_visited) -- need to clarify what we will do for exhibits_visited, need to clairfy what zoo each ticket is for?
VALUES (02020 - 01 - 01, 'Season Pass', 400, 'Justin', 'Bieber',
        'African Elephants, Giant Panada Bears, American Flamingos, Polar Bears'),
       (02020 - 01 - 03, 'Season Pass', 400, 'Dave', 'Chapelle', 'White Rhinos, Bengal Tigers, American Flamingos'),
       (02020 - 02 - 10, 'Day Pass', 50, 'Joe', 'Rogan',
        'African Elephants, White Rhinos, Lions, Tigers, Emperor Penguins'),
       (02020 - 02 - 11, 'Season Pass', 400, 'Kevin', 'Hart', 'Nothern Rockhopper Penguins'),
       (02020 - 03 - 03, 'Day Pass', 50, 'Michelle', 'Obama', 'Emperor Penguins, Komodo Dragons, Green Anaconda')

INSERT INTO Exhibit (Exhibit_name, [Location], [Hours], Zoo_id, Animal_id, Employee_id, Temperature,
                     Size, Ticket_id, Capacity,
                     Cost) -- size in yards? meters? what does cost mean? if theres only one employee id and ticket id that means only one employee can work in the exhibit and one visitor can visit the exhibit?
VALUES ('Elephant Village', 'South Lawn', 8, 8111, 1001, 03, NULL, 001, 45, 2000) -- update with autopopulated id's

INSERT INTO Nutrients (Diet_type, Food_category, Animal_id, Amount) -- need to clarify what we will do for animal_id and amount
VALUES ('Herbivore', 'Plants', 1001, 20), -- update with autopopulated id's
       ('Omnivore', 'Plants and Meat', 1002, 5),
       ('Omnivore', 'Plants and Meat', 1003, 3),
       ('Carnivore', 'Meat', 1004, 10),
       ('Carnivore', 'Meat', 1005, 3),
       ('Herbivore', 'Plants', 1006, 7),
       ('Herbivore', 'Plants', 1007, 15),
       ('Carnivore', 'Fish', 1008, 12),
       ('Carnivore', 'Fish', 1009, 13),
       ('Carnivore', 'Meat', 1010, 23),
       ('Carnivore', 'Meat', 1012, 25),
       ('Carnivore', 'Meat', 1013, 25)


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