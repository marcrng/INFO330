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

-- 2. What are the causes of animal deaths when they happen?
SELECT A.Cause_of_death
FROM Animals A
WHERE A.Alive = 0

-- 6. What zoos have the most visitors?
SELECT T.zoo_id, count(T.Ticket_id)
FROM Tickets T 
GROUP BY T.zoo_id

-- 13. Which states have the most zoos containing endangered animals?

WITH endangered AS
    (SELECT *
    FROM Animal_Type T, Animals A, Exhibit E, Zoo Z
    WHERE T.Endangered = 1),

SELECT Z.State, count(Z.zoo_id)
FROM endangered E JOIN Animals A ON E.animal_breed_id = A.Animal_breed_id
    JOIN Exhibit H ON A.Exhibit_ide ON H.Exhibit_id 
    JOIN Zoo Z ON H.zoo_id = Z.zoo_id 
GROUP BY Z.State


-- 19. How many employees have been hired for longer than a year grouped by zoo?
CREATE VIEW [Employees_hired_longer_than_year] AS
SELECT COUNT(*) AS Amount_of_Employees
FROM Employees AS E
WHERE DATEDIFF(year, E_start_date, E_end_date) > 1
GROUP BY E.Zoo_id

SELECT *
FROM [Employees_hired_longer_than_year]
