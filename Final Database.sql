-- Create Database

CREATE DATABASE INFO_330_Project_Team13

USE INFO_330_Project_Team13

-- Create tables

CREATE TABLE Animal_type -- new, check if more columns required
(
    Animal_breed_id   INT IDENTITY (1, 1) PRIMARY KEY,
    Family            VARCHAR(50),
    Species           VARCHAR(50),
    Endangered        BIT,
    Diet              VARCHAR(50),
    Related_animal_id INT -- delete this 
)

CREATE TABLE Zoo
(
    Zoo_id  INT IDENTITY (1, 1) PRIMARY KEY,
    Country VARCHAR(50),
    State   VARCHAR(2),
    City    VARCHAR(50)
)

CREATE TABLE Tickets -- ADDED ZOO ID BUT DIDNT CREATE A NEW TABLE YET
(
    Ticket_id      INT IDENTITY (1, 1) PRIMARY KEY,
    Date           DATE,
    Type_of_ticket VARCHAR(50),
    Cost           INT,
    Customer_Fname VARCHAR(50),
    Customer_Lname VARCHAR(50),
    Zoo_id INT FOREIGN KEY REFERENCES Zoo(Zoo_id)
)

CREATE TABLE Exhibit
(
    Exhibit_id   INT IDENTITY (1, 1) PRIMARY KEY,
    Exhibit_name VARCHAR(50),
    Location     VARCHAR(50),
    Hours        INT,
    Zoo_id       INT FOREIGN KEY REFERENCES Zoo (Zoo_id),
    Temperature  INT,
    Size         INT,
    Ticket_id    INT FOREIGN KEY REFERENCES Tickets (Ticket_id),
    Capacity     INT,
    Exhibit_type_id INT FOREIGN KEY REFERENCES Exhibit_type(Exhibit_type_id)
)

CREATE TABLE Animals
(
    Animal_id           INT IDENTITY (1, 1) PRIMARY KEY,
    Animal_name         VARCHAR(50),
    Animal_breed_id     INT FOREIGN KEY REFERENCES Animal_type(Animal_Breed_id),
    DOB                 DATE,
    Alive               BIT,
    Cause_of_death      VARCHAR(50),
    Origin              VARCHAR(50),
    Date_of_acquirement DATE,
    Date_of_departure   DATE,
    Exhibit_id          INT FOREIGN KEY REFERENCES Exhibit (Exhibit_id)
)

CREATE TABLE Employees -- ADDED ZOO ID BUT DIDNT CREATE A NEW TABLE YET
(
    Employee_id  INT IDENTITY (1, 1) PRIMARY KEY,
    Name         VARCHAR(50),
    E_start_date DATE,
    E_end_date   DATE,
    Zoo_id       INT FOREIGN KEY REFERENCES Zoo(Zoo_id)
)  -- need to add zoo_id so we know what employees work at each zoo

CREATE Table Jobs -- new
(
    Job_id      INT IDENTITY (1,1) PRIMARY KEY,
    Employee_id INT FOREIGN KEY REFERENCES Employees (Employee_id),
    Job_type    VARCHAR(50)
)

CREATE TABLE Nutrients
(
    Diet_type     VARCHAR(50),
    Food_category VARCHAR(50),
    Animal_id     INT FOREIGN KEY REFERENCES Animals (Animal_id),
    Amount        INT -- lbs per day
)

CREATE TABLE Exhibit_Type -- new
(
   Exhibit_Type_id INT IDENTITY (1, 1) PRIMARY KEY,
   Type_name VARCHAR(50),
)

CREATE TABLE Employee_exhibits
(
    Employee_id INT FOREIGN KEY REFERENCES Employees(Employee_id),
    Exhibit_id INT FOREIGN KEY REFERENCES Exhibit(Exhibit_id)
)

-- Insert values
INSERT INTO Animal_type (Family, Species, Endangered, Diet)
VALUES ('Elephantidae', 'Loxodonta africana', 1, 'Herbivore'),
       ('Ursidae', 'Ailuropoda melanoleuca', 0, 'Omnivore'),
       ('Ursidae', 'Ursus maritimus', 1, 'Omnivore'),
       ('Felidae', 'Panthera pardus', 1, 'Carnivore'),
       ('Felidae', 'Panthero leo', 1, 'Carnivore'),
       ('Phoenicopteridae', 'Phoenicopterus ruber', 1, 'Herbivore'),
       ('Rhinocerotidae', 'Ceratotherium simum', 0, 'Herbivore'),
       ('Spheniscidae', 'Eudyptes moseleyi', 1, 'Carnivore'),
       ('Spheniscidae', 'Aptenodytes forsteri', 1, 'Carnivore'),
       ('Felidae', 'Panthera tigris tigris', 0, 'Carnivore'),
       ('Varanidae', 'Varanus komodoensis', 1, 'Carnivore'),
       ('Boidae', 'Eunectes murinus', 1, 'Carnivore')

INSERT INTO Animals (Animal_name, Animal_breed_id, DOB, Alive, Cause_of_death, Origin, Date_of_acquirement, 
                    Date_of_departure, Exhibit_id) -- update with autopopulated id's, fill in missing values
                    -- need exhbit_id to be populated
VALUES ('African Elephant', 1, 2003-04-11, 1, NULL, 'Africa', 2005-06-01, NULL, ),
       ('Giant Panda Bear', 2, 2001-12-09, 0, 'Disease', 'Asia', 2002-02-04, 2012-08-13, ),
       ('Polar Bear', 3, 2008-06-05, 1, NULL, 'Antarctica', 2010-01-02, NULL, ),
       ('Leopard', 4, 2019-02-25, 1, NULL, 'South America', 2019-05-03, NULL, ),
       ('Lion', 5, 2016-07-12, 1, NULL, 'Africa', 2017-05-23, NULL, ),
       ('American Flamingo', 6, 2016-10-08, 1, NULL, 'Africa', 2017-07-31, NULL, ),
       ('White Rhino', 7, 2005-07-03, 0, 'Disease', 'Africa', 2006-01-22, 2008-09-24, ),
       ('Northern Rockhopper Penguin', 8, 2018-11-11, 1, NULL, 'Antarctica', 2018-12-01, NULL, ),
       ('Emperor Penguin', 9, 2020-01-01, 1, NULL, 'Antarctica', 2020-03-10, NULL, ),
       ('Bengal Tiger', 10, 2014-03-29, 0, 'Undetermined', 'Asia', 2014-04-30, 2020-06-30, ),
       ('Komodo Dragon', 11, 2002-04-11, 1, NULL, 'Asia', 2002-09-01, NULL, ),
       ('Green Anaconda', 12, 2008-09-02, 1, NULL, 'South America', 2012-03-28, NULL, )


INSERT INTO Zoo (Country, [State], City)
VALUES ('United States', 'Washington', 'Ballard'),
       ('United States', 'California', 'San Diego'),
       ('United States', 'Texas', 'Austin'),
       ('United States', 'Florida', 'Tallahassee'),
       ('United States', 'New York', 'New York')

INSERT INTO Employees ([Name], E_start_date, E_end_date) --
VALUES ('John', 2011 - 10 - 01, 2020 - 03 - 15),
       ('Jane', 2013 - 9 - 11, 2018 - 03 - 07),
       ('Julia', 2016 - 02 - 01, 2019 - 5 - 04),
       ('Ellie', 2019 - 08 - 01, 2020 - 03 - 15),
       ('Luke', 2009 - 04 - 01, 2013 - 03 - 17),
       ('Marc', 2015 - 09 - 30, 2015 - 10 - 30),
       ('Chandler', 2018 - 08 - 27, 2020 - 03 - 15),
       ('Ben', 2011 - 10 - 01, 2020 - 03 - 15),
       ('Morgan', 2014 - 06 - 01, 2020 - 03 - 15),
       ('Cami', 2011 - 10 - 01, 2020 - 03 - 15),
       ('Sean', 2018-12-03, 2019-2-03),
       ('Five', 2017-07-20, NULL),
       ('Chad', 2018-4-20, NULL),
       ('Otto', 2015-06-13, NULL),
       ('Kane', 2015-09-28, 2015-10-15),
       ('Dylan', 2018-03-23, NULL),
       ('Timothy', 2008-10-22, 2012-06-13)

INSERT INTO Jobs(Job_type)
VALUES ('Janitor'), ('Ticket Collector'), ('Trainer'), ('Trainer'), ('Assistant Trainer'),
       ('Janitor'), ('Janitor'), ('Trainer'), ('Ticket Collector'), ('Trainer'),
       ('Ticket Collector'), ('Trainer'), ('Assistant Trainer'), ('Trainer'),
       ('Assistant Janitor'), ('Trainer'), ('Ticket Collector')

INSERT INTO Tickets ([Date], Type_of_ticket, Cost, Customer_Fname, Customer_Lname)
VALUES (2020 - 01 - 01, 'Season Pass', 400, 'Justin', 'Bieber'),
       (2020 - 01 - 03, 'Season Pass', 400, 'Dave', 'Chapelle'),
       (2020 - 02 - 10, 'Day Pass', 50, 'Joe', 'Rogan'),
       (2020 - 02 - 11, 'Season Pass', 400, 'Kevin', 'Hart'),
       (2017-03-23, 'Weekend Pass', 80, 'Kenrick', 'Lamar'),
       (2018-08-26, 'Day Pass', 50, 'Denzel', 'Curry'),
       (2015-02-09, 'Weekend Pass', 80, 'Frank', 'Ocean'),
       (2011-05-15, 'Season Pass', 400, 'Tobey', 'Maguire'),
       (2019-03-18, 'Day Pass', 50, 'Otto', 'Brachear')

INSERT INTO Exhibit (Exhibit_name, [Location], [Hours], Zoo_id, Temperature,
                     Size, Ticket_id, Capacity, Exhibit_id) -- needs rechecking of exhibit id
VALUES ('Elephant Village', 'South Lawn', 8, 1001, NULL, 1500, 001, 400, 1), -- update with autopopulated id's
       ('Polar Palace', 'South Lawn', 8, 1001, NULL, 1300, 001, 300, 2),
       ('Pride Rock', 'African Grasslands', 8, 1002, NULL, 500, 002, 200, 3),
       ('Leopard Grasslands', 'South Lawn', 8, 1001, NULL, 1300, 001, 300, 4),
       ('Flamingo Pond', 'Bird Pool' 9, 1002, NULL, 900, 001, 200, 5),
       ('Penguin Palace', 'The Tundra', 8, 1003, 30, 500, 002, 200, 6),
       ('Penguin Glacier', 'Antarctic Cave', 6, 1004, 30, 500, 001, 200, 7),
       ('Lizard Land', 'Reptile Alley', 8, 1003, 92, 200, 001, 200, 8),
       ('Scales', 'South Cave', 8, 1005, 90, 80, 002, 200, 9)


INSERT INTO Nutrients (Diet_type, Food_category, Amount)
VALUES ('Herbivore', 'Plants', 20), -- update with autopopulated animal_id's
       ('Omnivore', 'Plants and Meat', 5),
       ('Omnivore', 'Plants and Meat', 3),
       ('Carnivore', 'Meat', 10),
       ('Carnivore', 'Meat', 3),
       ('Herbivore', 'Plants', 7),
       ('Herbivore', 'Plants', 15),
       ('Carnivore', 'Fish', 12),
       ('Carnivore', 'Fish', 13),
       ('Carnivore', 'Meat', 23),
       ('Carnivore', 'Meat', 25),
       ('Carnivore', 'Meat', 25)

-- I dont think we need this |||
--                           VVV
INSERT INTO Exhibit_Type (Exhibit_type_id, Exhibit_id) --recheck after clarification of exhibit id
VALUES (01, 1),
       (02, 2),
       (03, 3),
       (03, 4),
       (04, 5),
       (05, 6),
       (05, 7),
       (06, 8),
       (06, 9)


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