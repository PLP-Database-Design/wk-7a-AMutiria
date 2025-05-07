-- Question one

SELECT
    OrderID,
    CustomerName,
FROM
    ProductDetail
CROSS JOIN
    (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3) AS numbers
WHERE
    LENGTH(Products) - LENGTH(REPLACE(Products, ',', '')) >= numbers.n - 1;


-- Question two
-- Achieving 2NF

-- Create the Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- Create the OrderItems Table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;