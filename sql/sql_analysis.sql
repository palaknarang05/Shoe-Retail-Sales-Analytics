USE shoe_retail_analytics;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Products (
    product_id VARCHAR(20) PRIMARY KEY,
    brand VARCHAR(100),
    sole_type VARCHAR(100),
    size INT,
    color VARCHAR(50),
    reorder_level INT
);

CREATE TABLE Suppliers (
    supplier_id VARCHAR(20) PRIMARY KEY,
    supplier_name VARCHAR(150),
    supplier_city VARCHAR(100)
);

CREATE TABLE Purchases (
    purchase_id VARCHAR(20) PRIMARY KEY,
    purchase_date DATE,
    supplier_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity_purchased INT,
    purchase_cost_per_unit DECIMAL(10,2),
    total_purchase_cost DECIMAL(12,2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Sales (
    sale_id VARCHAR(20) PRIMARY KEY,
    sale_date DATE,
    product_id VARCHAR(20),
    customer_type VARCHAR(50),
    quantity_sold INT,
    selling_price_per_unit DECIMAL(10,2),
    discount_amount DECIMAL(12,2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
SHOW TABLES;
SELECT COUNT(*) AS product_count
FROM shoe_retail_analytics.Products;

SELECT COUNT(*) AS supplier_count
FROM shoe_retail_analytics.Suppliers;

SELECT COUNT(*) AS purchase_count
FROM shoe_retail_analytics.Purchases;


SELECT 'Products' AS table_name, COUNT(*) AS total_rows
FROM shoe_retail_analytics.Products
UNION ALL
SELECT 'Suppliers', COUNT(*)
FROM shoe_retail_analytics.Suppliers
UNION ALL
SELECT 'Purchases', COUNT(*)
FROM shoe_retail_analytics.Purchases
UNION ALL
SELECT 'Sales', COUNT(*)
FROM shoe_retail_analytics.Sales;



USE shoe_retail_analytics;

SELECT
    SUM(quantity_sold) AS total_units_sold,
    ROUND(SUM(quantity_sold * selling_price_per_unit), 2) AS gross_sales,
    ROUND(SUM(discount_amount), 2) AS total_discounts,
    ROUND(
        SUM(quantity_sold * selling_price_per_unit)
        - SUM(discount_amount), 2
    ) AS net_revenue
FROM Sales;



SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS sales_month,
    SUM(quantity_sold) AS units_sold,
    ROUND(
        SUM(quantity_sold * selling_price_per_unit)
        - SUM(discount_amount), 2
    ) AS net_revenue
FROM Sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY sales_month;



SELECT
    p.brand,
    SUM(s.quantity_sold) AS units_sold,
    ROUND(
        SUM(s.quantity_sold * s.selling_price_per_unit)
        - SUM(s.discount_amount), 2
    ) AS net_revenue,
    ROUND(
        SUM(s.discount_amount), 2
    ) AS total_discounts
FROM Sales s
JOIN Products p
    ON s.product_id = p.product_id
GROUP BY p.brand
ORDER BY net_revenue DESC;



SELECT
    p.sole_type,
    SUM(s.quantity_sold) AS units_sold,
    ROUND(
        SUM(s.quantity_sold * s.selling_price_per_unit)
        - SUM(s.discount_amount), 2
    ) AS net_revenue
FROM Sales s
JOIN Products p
    ON s.product_id = p.product_id
GROUP BY p.sole_type
ORDER BY net_revenue DESC;


SELECT
    SUM(quantity_purchased) AS units_purchased,
    ROUND(SUM(total_purchase_cost), 2) AS total_purchase_expenditure,
    ROUND(
        SUM(total_purchase_cost)
        / NULLIF(SUM(quantity_purchased), 0), 2
    ) AS average_purchase_cost_per_unit
FROM Purchases;