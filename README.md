# 📚 PostgreSQL Bookstore SQL Project

## 📌 Project Overview

This project demonstrates practical **SQL and PostgreSQL skills** by analyzing a bookstore database using three separate CSV datasets:

* 👥 **Customers.csv** — Customer information
* 📚 **Books.csv** — Book details, pricing, genre, and inventory
* 🛒 **Orders.csv** — Customer orders and transactions

The datasets are imported into PostgreSQL and connected using **primary and foreign keys**. SQL queries are then used to answer business-related questions about customers, books, sales, revenue, and inventory.

---

## 🗂️ Dataset Structure

### 👥 Customers.csv

Contains customer information such as:

* Customer ID
* Name
* Email
* Phone
* City
* Country

### 📚 Books.csv

Contains book information including:

* Book ID
* Title
* Author
* Genre
* Published Year
* Price
* Stock

### 🛒 Orders.csv

Contains transaction information including:

* Order ID
* Customer ID
* Book ID
* Order Date
* Quantity
* Total Amount

### 🔗 Table Relationships

```text
Customers
    │
    │ Customer_ID
    ▼
 Orders
    │
    │ Book_ID
    ▼
  Books
```

---

## 🛠️ Tools & Technologies

* PostgreSQL
* pgAdmin 4
* SQL
* CSV

---

## 🧠 SQL Concepts Used

* `SELECT`, `WHERE`, `DISTINCT`
* `ORDER BY`, `LIMIT`
* `SUM()`, `AVG()`, `COUNT()`
* `GROUP BY`, `HAVING`
* `INNER JOIN`, `LEFT JOIN`
* `DENSE_RANK()`
* Window Functions
* `COALESCE()`
* Subqueries
* Primary Keys & Foreign Keys

---

## 📊 Business Questions

The project contains **20 SQL queries** covering:

### 📚 Book Analysis

* Find books by genre
* Analyze book prices
* Identify low-stock books
* Find top Fantasy books

### 👥 Customer Analysis

* Find customers by country
* Identify repeat customers
* Analyze customer spending
* Find high-value customers

### 🛒 Sales & Inventory Analysis

* Calculate total revenue
* Analyze orders
* Find frequently ordered books
* Calculate books sold by genre
* Analyze sales by author
* Calculate remaining inventory

---

## 📁 Project Files

```text
postgresql-bookstore-sql-project/
│
├── README.md
├── Queries.sql
├── Customers.csv
├── Books.csv
└── Orders.csv
```

| File            | Description                             |
| --------------- | --------------------------------------- |
| `Queries.sql`   | Table creation and SQL analysis queries |
| `Customers.csv` | Customer dataset                        |
| `Books.csv`     | Book and inventory dataset              |
| `Orders.csv`    | Order and transaction dataset           |

---

## 🚀 How to Run

1. Create a PostgreSQL database.
2. Create the required tables using `Queries.sql`.
3. Import `Customers.csv`, `Books.csv`, and `Orders.csv` into their respective tables.
4. Run the SQL queries in pgAdmin 4.
5. Explore the results and business insights.

---

## 🎯 Objective

The objective of this project is to demonstrate how **raw CSV data can be imported into a relational database and analyzed using PostgreSQL to answer real-world business questions.**

This project helped strengthen my practical understanding of **SQL, database relationships, joins, aggregations, and analytical functions.**

---

## 👨‍💻 Author

**Ronak**
Aspiring Data Analyst

**Skills:** SQL • PostgreSQL • Excel • Power BI • Tableau • Python
