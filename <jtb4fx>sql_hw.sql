--1. List all countries in South America
SELECT name FROM country WHERE continent = 'South America';

--2. Find the population of 'Germany'
SELECT population FROM country where name= "Germany";

--3. Retrieve all cities in the country 'Japan';
select name from city where CountryCode='JPN';

--4. Find the 3 most populated countries in the 'Africa' region
SELECT name, population FROM country where continent ='Africa' order by population DESC LIMIT 3;

--5. Retrieve the country and its life expectancy where the population is between 1 and 5 million.
Select Name, LifeExpectancy FROM country WHERE Population BETWEEN 1000000 and 5000000;

--6. List countries with an official language of 'French'
SELECT CountryCode from countrylanguage where Language='French';

--7. Retrieve all album titles by the artist 'AC/DC'
SELECT title from Album where ArtistId=1;

--8. Find the name and email of customers located in 'Brazil'
select FirstName,LastName,Email from Customer where Country='Brazil';

--9. List all playlists in the database
Select name from Playlist;

--10. Find the total number of tracks in the 'Rock' genre
select count(*) from Track where GenreId="1";

--11. List all employees who report to 'Nancy Edwards'
SELECT FirstName,LastName from Employee where ReportsTo="2";

--12. Calculate the total sales per customer by summing the total amount in invoices
select CustomerId, sum(total) as total_sales FROM Invoice group by CustomerId;


Part 2 - a Cafe
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_name, category, price) VALUES
('Espresso', 'Beverage', 3.50),
('Cappuccino', 'Beverage', 4.00),
('Blueberry Muffin', 'Pastry', 2.50),
('Croissant', 'Pastry', 2.00),
('Latte', 'Beverage', 4.50);


INSERT INTO Customers (first_name, last_name, email) VALUES
('Jim', 'Ryan', 'jim.ryan@virginia.edu'),
('Warren', 'Buffet', 'warren.buffet@yahoo.com'),
('Grace', 'Hopper', 'garce.hopper@yahoo.com'),
('David', 'Smith', 'david.smith@gmail.com'),
('Jason', 'Williamson', 'jason.williamson@virginia.edu');


INSERT INTO Orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2024-09-07', 2),
(2, 3, '2024-09-06', 1),
(3, 5, '2024-09-05', 3),
(4, 2, '2024-09-04', 1),
(5, 4, '2024-09-03', 2);

--1. List all products and their prices
SELECT product_name, price FROM Products;

--2. Total quantity for a specific product (espresso)
SELECT SUM(quantity) AS total_quantity FROM Orders WHERE product_id = 1;

--3. Most expensive coffee store item
SELECT * FROM Products ORDER BY price DESC LIMIT 1;
