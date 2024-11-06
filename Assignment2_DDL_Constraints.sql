#creating database
CREATE DATABASE Sales;
USE Sales;

#creating table Sales
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(50) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(50) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE
);

-- Adding a Column Named order_quantity to the Orders Table
ALTER TABLE Orders ADD order_quantity INT NOT NULL;
select * from Orders;

-- Renaming the Orders Table to sales_orders
ALTER TABLE Orders RENAME TO sales_orders;

-- Inserting Data into sales_orders
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity) VALUES
   (1, 'Amaya', 'Electronics', 'Smartphone', '1234567890', 2),
   (2, 'Anagha', 'Furniture', 'Chair', '2345678901', 4),
   (3, 'Anusha', 'Electronics', 'Laptop', '3456789012', 1),
   (4, 'Gokul', 'Books', 'Novel', '4567890123', 8),
   (5, 'Akshay', 'Clothing', 'Shirt', '5678901234', 5),
   (6, 'Laya', 'Groceries', 'Orange', '6789012345', 6),
   (7, 'Amal', 'Stationery', 'Pen', '7890123456', 20),
   (8, 'Hari', 'Sports', 'Football', '8901234567', 2),
   (9, 'Thara', 'Beauty', 'Lipstick', '9012345678', 3),
   (10, 'Ravi', 'Toys', 'Car', '0123456789', 4);
   
   select * from sales_orders;
   -- Retrieving Customer_name and Ordered_item from sales_orders
   SELECT Customer_name, Ordered_item FROM sales_orders;
   
   -- Updating data in the sales_orders Table
   UPDATE sales_orders SET Ordered_item = 'Tablet' WHERE Order_Id = 3;
   select * from sales_orders;
   
   DROP TABLE sales_orders;



   



