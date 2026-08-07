
-- CUSTOMER TABLE CREATION:
CREATE TABLE Customers(
		Customer_ID INT PRIMARY KEY,
		Customer_Name VARCHAR(100) NOT NULL,
		Email VARCHAR(100),
		Phone VARCHAR(12),
		City VARCHAR(100),
		Country VARCHAR(100)
)


-- BOOK TABLE CREATION;
CREATE TABLE Books(
		Book_ID INT PRIMARY KEY,
		Title VARCHAR(100) NOT NULL,
		Author VARCHAR(100) NOT NULL,
		Genre VARCHAR(50),
		Published_Year INT,
		Price NUMERIC(10,2),
		Stock INT
)


-- ORDER TABLE CREATION:
CREATE TABLE Orders(
		Order_ID INT PRIMARY KEY,
		Customer_ID INT REFERENCES Customers(Customer_ID),
		Book_ID INT REFERENCES Books(Book_ID),
		Order_Date DATE,
		Quantity INT,
		Total_Amount NUMERIC(10,2)
)


SELECT * FROM ORDERS;
SELECT * FROM Books;
SELECT * FROM Customers;


--QUERIES:
--1. Retrieve all books in the 'Fiction' genre:

SELECT *
		FROM Books
		WHERE genre='Fiction';

--2. Find books published after the year 1950:

SELECT *
		FROM Books
		WHERE published_year>1950 ORDER BY published_year ASC;

--3. List all customers from the Canada:

SELECT *
		FROM Customers
		WHERE country='Canada';

--4. Show orders placed in November 2023:

SELECT * 
		FROM Orders
		WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'
		ORDER BY order_date ASC;

--5. Retrieve the total stock of books available:

SELECT SUM(STOCK) 
		AS Total_Stock_Available
		FROM Books;

--6. Find the details of the most expensive book:

SELECT * 
		FROM Books
		ORDER BY price DESC
		LIMIT 1;

--7. Show all customers who ordered more than 1 quantity of a book:

SELECT *
		FROM Orders
		WHERE quantity>1;

--8. Retreive all orders where the total amount exceeds $20:

SELECT *
		FROM Orders
		WHERE total_amount>20.00;

--9. List all geners available in the books table:

SELECT DISTINCT genre
		FROM Books;

--10. Find the book with the lowest stock:

SELECT *
		FROM Books
		ORDER BY stock ASC
		LIMIT 5;
	
--11. Calculate the total revenue generated from all orders:

SELECT SUM(total_amount) AS Total_Revenue
		FROM Orders;

--12. Retrieve the total number of books sold for each genre:

SELECT * FROM Books;
SELECT * FROM Orders;

SELECT b.genre, SUM(o.quantity) AS Total_Sold
		FROM Books b
		JOIN Orders o
		ON b.book_id=o.book_id
	GROUP BY b.genre;

--13. Find the average price of books in the "Fantasy" genre:

SELECT * FROM Books;

SELECT AVG(price) AS Average_Fantasy_Price
		FROM Books
		WHERE genre='Fantasy';

--14. List customers who have placed at least 2 orders:

SELECT * FROM Orders;
SELECT * FROM Customer;

SELECT o.customer_id, c.customer_name, 
		COUNT(o.order_id) AS Repated_Customers
		FROM Orders o
		JOIN Customers c
		ON o.customer_id=c.customer_id
	GROUP BY o.customer_id, c.customer_name
HAVING COUNT(o.order_id)>=2;

--15. Find the most frequently ordered book:

SELECT o.book_id, b.title,
	COUNT(o.order_id) AS Frequent_orders
		FROM Orders o
		JOIN Books b
		ON b.book_id=o.book_id
	GROUP BY o.book_id, b.title
	ORDER BY Frequent_orders DESC;

--16. Show the top 3 most expensive books of 'Fantasy' genre:

SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY PRICE DESC) AS price_rank
    FROM Books
    WHERE genre = 'Fantasy'
) ranked_books
WHERE price_rank <= 3;

--17. Retrieve the total quantity of books sold by each author:

SELECT * FROM Books;
SELECT * FROM Orders;

SELECT b.author, 
		SUM(o.quantity) AS Total_Quantity
		FROM Books b
		JOIN Orders o
		ON b.book_id=o.book_id
GROUP BY b.author;

--18. List the cities where customers who spent over $30 are located:

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT o.customer_id, c.city,
		COUNT(o.order_id) AS Total_Orders,
		SUM(o.total_amount) AS Total_Spent
		FROM orders o
		JOIN customers c
		ON o.customer_id=c.customer_id
	GROUP BY o.customer_id, c.city
	HAVING SUM(o.total_amount)>30.00
	ORDER BY Total_Spent;

--19. Find the customers who spend the most on orders:

SELECT o.customer_id, c.customer_name,
		SUM(o.total_amount) AS Total_Spent
		FROM orders o
		JOIN customers c
		ON o.customer_id=c.customer_id
	GROUP BY o.customer_id, c.customer_name
	ORDER BY Total_Spent DESC;

--20. Calculate the stock remaining after fulfilling all orders:

SELECT * FROM Books;
SELECT * FROM Orders;

SELECT DISTINCT b.book_id, b.title, b.stock,
				COALESCE(SUM(o.quantity),0) AS order_qunatity,
				b.stock - COALESCE(SUM(o.quantity),0) AS Remaining_stock
				FROM Books b
				LEFT JOIN Orders o
				ON b.book_id=o.book_id
			GROUP BY b.book_id
			ORDER BY b.book_id;
		

