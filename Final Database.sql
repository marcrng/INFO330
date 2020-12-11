-- Create Database

CREATE DATABASE INFO_330_Project_Team13

USE INFO_330_Project_Team13


-- Create tables

CREATE TABLE Animal_type 
(
    Animal_breed_id   INT IDENTITY (1, 1) PRIMARY KEY,
    Family            VARCHAR(50),
    Species           VARCHAR(50),
    Endangered        BIT,
    Diet              VARCHAR(50),
)

CREATE TABLE Zoo
(
    Zoo_id  INT IDENTITY (1, 1) PRIMARY KEY,
    Country VARCHAR(50),
    State   VARCHAR(2),
    City    VARCHAR(50)
)

CREATE TABLE Tickets
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
    Hours        INT, -- a day
    Zoo_id       INT FOREIGN KEY REFERENCES Zoo (Zoo_id),
    Temperature  INT, -- F
    Size         INT, -- sq ft
    Capacity     INT, 
    Exhibit_type_id INT FOREIGN KEY REFERENCES Exhibit_type(Exhibit_type_id)
)

CREATE TABLE Exhibits_visited
(
    Ticket_id INT FOREIGN KEY REFERENCES Tickets (Ticket_id),
    Exhibit_id INT FOREIGN KEY REFERENCES Exhibit (Exhibit_id),
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

CREATE TABLE Employees 
(
    Employee_id  INT IDENTITY (1, 1) PRIMARY KEY,
    Name         VARCHAR(50),
    E_start_date DATE,
    E_end_date   DATE,
    Zoo_id       INT FOREIGN KEY REFERENCES Zoo(Zoo_id)
) 

CREATE Table Jobs
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

CREATE TABLE Exhibit_Type 
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


INSERT INTO Zoo (Country, [State], City) -- DO NOT ADD THIS
VALUES ('United States', 'WA', 'Ballard'),
       ('United States', 'CA', 'San Diego'),
       ('United States', 'TX', 'Austin'),
       ('United States', 'NY', 'New York'),
       ('United States', 'IL', 'Brookfield'),
       ('United States', 'IL', 'Chicago')


INSERT INTO Tickets ([Date], Type_of_ticket, Cost, Customer_Fname, Customer_Lname, Zoo_id) -- DO NOT ADD TO THIS
VALUES ('2020-01-01', 'Season Pass', 400, 'Justin', 'Bieber', 1),
       ('2020-01-01', 'Season Pass', 400, 'Hailey', 'Bieber', 1),
       ('2020-01-03', 'Day Pass', 60, 'Dave', 'Chapelle', 1),
       ('2020-01-03', 'Season Pass', 400, 'Susan', 'Doyle', 1),
       ('2020-02-10', 'Day Pass', 50, 'Joe', 'Rogan', 2),
       ('2020-02-10', 'Day Pass', 50, 'Lee', 'Brice', 2),
       ('2020-02-11', 'Season Pass', 600, 'Kevin', 'Hart', 2),
       ('2020-02-11', 'Season Pass', 600, 'Joy', 'Hart', 2),
       ('2017-03-23', 'Weekend Pass', 80, 'Kendrick', 'Lamar', 3),
       ('2017-03-23', 'Weekend Pass', 80, 'Kendall', 'Lamar', 3),
       ('2018-08-26', 'Day Pass', 50, 'Denzel', 'Curry', 3),
       ('2018-08-26', 'Season Pass', 350, 'Steph', 'Curry', 3),
       ('2015-02-09', 'Weekend Pass', 80, 'Frank', 'Ocean', 4),
       ('2015-02-09', 'Day Pass', 40, 'Billie', 'Ellish', 4),
       ('2011-05-15', 'Season Pass', 400, 'Tobey', 'Maguire', 4),
       ('2011-05-15', 'Day Pass', 40, 'Selena', 'Gomez', 4),
       ('2011-05-15', 'Season Pass', 400, 'Miley', 'Cyrus', 4),
       ('2019-03-18', 'Day Pass', 50, 'Otto', 'Brachear', 5),
       ('2017-11-26', 'Day Pass', 50, 'Michelle', 'Bing', 5),
       ('2018-08-23', 'Day Pass', 50, 'Phoebe', 'Little', 6),
       ('2018-12-23', 'Weekend Pass', 80, 'Jane', 'Doe', 6)


INSERT INTO Exhibit (Exhibit_name, [Location], [Hours], Zoo_id, Temperature,
                     Size, Capacity, Exhibit_type_id)
VALUES ('Elephant Village', 'South Lawn', 8, 1, NULL, 1500, 400, 2),
       ('Polar Palace', 'South Lawn', 8, 1, NULL, 1300, 300, 2),
       ('Pride Rock', 'African Grasslands', 8, 2, NULL, 500, 200, 2),
       ('Leopard Grasslands', 'South Lawn', 8, 2, NULL, 1300, 300, 3),
       ('Flamingo Pond', 'Bird Pool', 9, 3, NULL, 900, 200, 2),
       ('Penguin Palace', 'The Tundra', 8, 4, 30, 500, 200, 3),
       ('Penguin Glacier', 'Antarctic Cave', 6, 5, 30, 500, 200, 3),
       ('Lizard Land', 'Reptile Alley', 8, 5, 92, 200, 200, 1),
       ('Scales', 'South Cave', 8, 6, 90, 80, 200, 1),
       ('Bamboo Forest', 'Mountain Range', 8, 2, NULL, 800, 200, 2),
       ('Mangrove Swamp', 'Forests', 8, 3, NULL, 1000, 250, 2)


INSERT INTO Exhibits_visited (Ticket_id, Exhibit_id)
VALUES (1, 1), (2, 1), (3, 1), (4, 1), (1, 2), (2, 2), -- zoo 1
        (5, 3), (6, 3), (7, 3), (8, 4), (5, 4), (6, 4), (7, 4), -- zoo 2
        (9, 5), (10, 5), (11, 5), (12, 5), -- zoo 3
        (13, 6), (14, 6), (15, 6), (16, 6), (17, 6), -- zoo 4
        (18, 7), (19, 7), (18, 8), (19, 8), -- zoo 5
        (20, 9), (21, 9) -- zoo 6


INSERT INTO Animals (Animal_name, Animal_breed_id, DOB, Alive, Cause_of_death, Origin, Date_of_acquirement, 
                    Date_of_departure, Exhibit_id)
VALUES ('African Elephant', 1, '2003-04-11', 1, NULL, 'Africa', '2005-06-01', NULL, 1),
       ('Giant Panda Bear', 2, '2001-12-09', 0, 'Disease', 'Asia', '2002-02-04', '2012-08-13', 10),
       ('Polar Bear', 3, '2008-06-05', 1, NULL, 'North America', '2010-01-02', NULL, 2),
       ('Leopard', 4, '2019-02-25', 1, NULL, 'Africa', '2019-05-03', NULL, 4),
       ('Lion', 5, '2016-07-12', 1, NULL, 'Africa', '2017-05-23', NULL, 3),
       ('American Flamingo', 6, '2016-10-08', 1, NULL, 'Africa', '2017-07-31', NULL, 5),
       ('White Rhino', 7, '2005-07-03', 0, 'Disease', 'Africa', '2006-01-22', '2008-09-24', 3),
       ('Northern Rockhopper Penguin', 8, '2018-11-11', 1, NULL, 'Antarctica', '2018-12-01', NULL,7 ),
       ('Emperor Penguin', 9, '2020-01-01', 1, NULL, 'Antarctica', '2020-03-10', NULL, 7),
       ('Bengal Tiger', 10, '2014-03-29', 0, 'Undetermined', 'Asia', '2014-04-30', '2020-06-30', 11),
       ('Komodo Dragon', 11, '2002-04-11', 1, NULL, 'Asia', '2002-09-01', NULL, 8),
       ('Green Anaconda', 12, '2008-09-02', 1, NULL, 'South America', '2012-03-28', NULL, 9),
       ('Komodo Dragon', 11, '2009-8-2', 1, NULL, 'Asia', '2011-2-5', NULL, 8),
       ('Northern Rockhopper Penguin', 8, '2013-8-18', 1, NULL, 'Antarctica', '2017-12-8', NULL,7),
       ('African Flamingo', 6, '2010-11-6', 1, NULL, 'Africa', '2011-12-21', NULL, 5),
       ('Leopard', 4, '2016-10-19', 1, NULL, 'Africa', '2019-1-21', NULL, 4),
       ('White Rhino', 7, '2011-1-10', 1, NULL, 'Africa', '2015-8-16', NULL, 1),
       ('African Elephant', 1, '2008-12-21', 1, NULL, 'Africa', '2009-1-1', NULL, 1),
       ('Giant Panda Bear', 2, '1995-4-18', 0, 'Senile', 'Asia', '2020-11-20', '2020-5-20', 10),
       ('Northern Rockhopper Penguin', 8, '2009-4-5', 1, NULL, 'Antarctica', '2014-7-27', NULL, 7),
       ('White Rhino', 7, '2011-8-18', 1, NULL, 'Africa', '2015-1-13', NULL, 3),
       ('African Elephant', 1, '2017-12-16', 1, NULL, 'Africa', '2020-9-14', NULL, 1),
       ('Leopard', 4, '2012-10-26', 1, NULL, 'Africa', '2016-11-3', NULL, 4),
       ('Emporor Penguin', 9, '2014-12-24', 0, 'Janitor Negligence', 'Antarctica', '2015-3-16', '2018-02-19', 7),
       ('Emporor Penguin', 9, '2014-12-7', 0, 'Janitor Negligence', 'Antarctica', '2015-5-7', '2018-02-20', 7),
       ('Polar Bear', 3, '2017-2-18', 1, NULL, 'North America', '2020-6-18', NULL, 2),
       ('Komodo Dragon', 11, '2014-11-24', 1, NULL, 'Asia', '2019-11-12', NULL, 8),
       ('White Rhino', 7, '2017-6-27', 1, NULL, 'Africa', '2020-1-6', NULL, 3)


INSERT INTO Employees ([Name], E_start_date, E_end_date, Zoo_id) -- DO NOT ADD TO THIS
VALUES ('John', '2011-10-01', '2020-03-15', 1),
       ('Jane', '2013-9-11', '2018-03-07', 1),
       ('Julia', '2016-02-01', NULL, 1),
       ('Ellie', '2019-08-01', '2020-03-15', 2),
       ('Luke', '2009-04-01', '2013-03-17', 2),
       ('Marc', '2015-09-30', NULL, 2),
       ('Chandler', '2018-08-27', '2020-03-15', 3),
       ('Ben', '2011-10-01', '2020-03-15', 3),
       ('Morgan', '2014-06-01', NULL, 3),
       ('Cami', '2011-10-01', '2020-03-15', 3),
       ('Sean', '2018-12-03', '2019-2-03', 4),
       ('Five', '2017-07-20', NULL, 4),
       ('Chad', '2018-4-20', NULL, 4),
       ('Otto', '2015-06-13', NULL, 5),
       ('Kane', '2015-09-28', '2015-10-15', 5),
       ('Dylan', '2018-03-23', NULL, 5),
       ('Timothy', '2008-10-22', '2012-06-13', 6),
       ('Alexis', '2011-10-22', NULL, 6),
       ('Jim', '2009-08-03', '2012-07-16', 6)


INSERT INTO Jobs(Employee_id, Job_type) -- DO NOT ADD TO THIS... but we dont need a job_id here, so remove that later
VALUES (1,'Janitor'), (2, 'Ticket Collector'), (3, 'Trainer'), (4, 'Trainer'), (5, 'Assistant Trainer'),
       (6, 'Janitor'), (7, 'Janitor'), (8, 'Trainer'), (9, 'Ticket Collector'), (10, 'Trainer'),
       (11, 'Ticket Collector'), (12, 'Trainer'), (13, 'Assistant Trainer'), (14, 'Trainer'),
       (15, 'Assistant Janitor'), (16, 'Trainer'), (17, 'Trainer'), (18, 'Trainer'), (19, 'Trainer')


INSERT INTO Nutrients (Diet_type, Food_category, Animal_id, Amount)
VALUES ('Herbivore', 'Plants', 2, 20), ('Omnivore', 'Plants and Meat', 3, 5),
       ('Omnivore', 'Plants and Meat', 4, 3), ('Carnivore', 'Meat', 5, 10),
       ('Carnivore', 'Meat', 6, 3), ('Herbivore', 'Plants', 7, 7),
       ('Herbivore', 'Plants', 8, 15), ('Carnivore', 'Fish', 9, 12),
       ('Carnivore', 'Fish', 10, 13), ('Carnivore', 'Meat', 11, 23),
       ('Carnivore', 'Meat', 12, 25), ('Carnivore', 'Meat', 13, 25),
       ('Carnivore', 'Meat', 14, 25), ('Carnivore', 'Fish', 15, 12),
       ('Herbivore', 'Plants', 16, 7), ('Carnivore', 'Meat', 17, 10),
       ('Herbivore', 'Plants', 18, 15), ('Herbivore', 'Plants', 19, 20), 
       ('Omnivore', 'Plants and Meat', 20, 5), ('Carnivore', 'Fish', 21, 12),
       ('Herbivore', 'Plants', 22, 15), ('Herbivore', 'Plants', 23, 20),
       ('Carnivore', 'Meat', 24, 10), ('Carnivore', 'Fish', 25, 13),
       ('Carnivore', 'Fish', 26, 13), ('Omnivore', 'Plants and Meat', 27, 3),
       ('Carnivore', 'Meat', 28, 25), ('Herbivore', 'Plants', 29, 15)


INSERT INTO Exhibit_Type (Type_name)
VALUES ('Indoor'),
       ('Outdoor'),
       ('Combined Indoor and Outdoor')


INSERT INTO Employee_exhibits (Employee_id, Exhibit_id)
VALUES (1, 1), (2, 2), (2, 1), (3, 1), -- zoo 1
        (4, 3), (5, 3), (5, 10), (6, 3), -- zoo 2
        (7, 5), (8, 5), (9, 5), (10, 5), -- zoo 3
        (11, 6), (12, 6), (13, 6), -- zoo 4
        (14, 7), (15, 7), (16, 8), -- zoo 5
        (17, 9), (18, 9), (19, 9) -- zoo 6

-- Create views

-- 1. Are the animals bred from the zoo or from an outside source?
-- 2. What are the causes of animal deaths when they happen?
CREATE VIEW [death_causes] AS 
SELECT DISTINCT A.Cause_of_death
FROM Animals A
WHERE A.Alive = 0 

SELECT *
FROM death_causes


-- 3. How long have the animals been at the zoo?
-- 4. What zoo has the highest ratio of square footage to animals?
-- 5. What zoo has the lowest ratio of zookeepers to animals?
-- 6. What zoos have the most visitors?
CREATE VIEW [zoo_visitors] AS
SELECT T.zoo_id, count(T.Ticket_id) AS num_tix
FROM Tickets T 
GROUP BY T.zoo_id

SELECT *
FROM zoo_visitors

-- 7. What was the average number of customers per day between two dates?
-- 8. How many customers does each exhibit attract on an average day?
-- 9. What is the average amount of deaths per habitat across zoos?
-- 10. How many pounds/kilograms of food is needed on average for each enclosure?
-- 11. How many animals, on average, does each animal share an enclosure with at a specific group?
-- 12. What is the average number of total animals in each enclosure?
-- 13. Which states have the most zoos containing endangered animals?

CREATE VIEW Endangered_count AS

SELECT TOP 3 Z.State, Z.City, COUNT(A.Animal_id) AS Endangered_count
FROM Animals A
JOIN Animal_type T on A.Animal_breed_id = T.Animal_breed_id
JOIN Exhibit E on A.Exhibit_id = E.Exhibit_id
JOIN Zoo Z on E.Zoo_id = Z.Zoo_id
WHERE T.Endangered = 1
GROUP BY Z.State, Z.City
ORDER BY Endangered_count DESC

-- 14. What's the average monthly cost of maintaining an aquarium type of exhibit?
-- 15. What state has the lowest average ticket price for general admission tickets?
-- 16. What zoo has the youngest leopard cub?
CREATE VIEW leo_cub AS

SELECT TOP 1 A.animal_name, A.DOB, Z.Zoo_id, Z.City, Z.[State]
FROM Animals A JOIN Exhibit E ON A.exhibit_id = E.Exhibit_id
               JOIN Zoo Z ON E.Zoo_id = Z.Zoo_id
WHERE A.Animal_name = 'Leopard'
ORDER BY A.DOB DESC

Select *
from leo_cub

-- 17. What animal lives the longest on average in each zoo?
-- 18. Is the animal a plant based eater or a carnivorous animal, or both?

CREATE VIEW Animal_diet AS

SELECT DISTINCT A.Animal_name, T.Diet
FROM Animals A
JOIN Animal_type T on A.Animal_breed_id = T.Animal_breed_id


-- 19. How many employees have been hired for longer than a year grouped by zoo?
CREATE VIEW [Employees_hired_longer_than_year] AS
SELECT COUNT(*) AS Amount_of_Employees
FROM Employees AS E
WHERE DATEDIFF(year, E_start_date, E_end_date) > 1
GROUP BY E.Zoo_id

SELECT *
FROM [Employees_hired_longer_than_year]
-- 20. What is the average temperature for a reptile enclosure?
