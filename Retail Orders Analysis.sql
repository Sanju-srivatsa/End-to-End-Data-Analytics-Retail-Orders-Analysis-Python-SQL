-- USE the database
USE retail_orders;

-- 1. Drop the table if it exists to ensure a clean slate
DROP TABLE IF EXISTS retail_orders;

-- 2. Create the retail_orders table with constraints for data integrity
CREATE TABLE retail_orders (
    order_id INT NOT NULL PRIMARY KEY,               -- Unique identifier for each order
    order_date DATE NOT NULL,                        -- Order date
    ship_mode VARCHAR(255) NOT NULL,                -- Shipping mode
    segment VARCHAR(255) NOT NULL,                  -- Customer segment
    country VARCHAR(255) DEFAULT 'United States',   -- Country (default: US)
    city VARCHAR(255) NOT NULL,                     -- City of delivery
    state VARCHAR(255) NOT NULL,                    -- State of delivery
    postal_code INT,                                 -- Postal code (optional)
    region VARCHAR(255) NOT NULL,                   -- Sales region
    category VARCHAR(255) NOT NULL,                 -- Product category
    sub_category VARCHAR(255) NOT NULL,             -- Product subcategory
    product_id VARCHAR(255) NOT NULL,               -- Product identifier
    quantity INT DEFAULT 1,                         -- Quantity ordered (default: 1)
    discount FLOAT DEFAULT 0,                       -- Discount percentage
    sale_price FLOAT NOT NULL,                      -- Final sale price
    profit FLOAT NOT NULL                           -- Profit made on the sale
);

ALTER TABLE retail_orders ADD UNIQUE (order_id);

-- 3. Add indexes to improve query performance
CREATE INDEX idx_order_date ON retail_orders(order_date);
CREATE INDEX idx_region ON retail_orders(region);
CREATE INDEX idx_category ON retail_orders(category);

-- 4. Select and preview the first 10 rows of the retail_orders table
SELECT * 
FROM retail_orders 
LIMIT 10;

-- ================================================
-- BUSINESS QUERIES FOR DATA ANALYSIS
-- ================================================

-- 1. Top-Performing Products by Revenue
SELECT 
    product_id, 
    SUM(sale_price * quantity) AS total_revenue
FROM 
    retail_orders
GROUP BY 
    product_id
ORDER BY 
    total_revenue DESC
LIMIT 10;

-- 2. Regional Sales Trends
SELECT 
    region, 
    SUM(sale_price * quantity) AS total_sales
FROM 
    retail_orders
GROUP BY 
    region
ORDER BY 
    total_sales DESC;

-- 3. Month-over-Month Sales Growth
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sale_price * quantity) AS total_sales
FROM 
    retail_orders
GROUP BY 
    month
ORDER BY 
    month;

-- 4. High-Growth Subcategories by Profit
SELECT 
    sub_category, 
    SUM(profit) AS total_profit
FROM 
    retail_orders
GROUP BY 
    sub_category
ORDER BY 
    total_profit DESC
LIMIT 10;

-- 5. Discount Impact on Revenue
SELECT 
    discount, 
    SUM(sale_price * quantity) AS total_revenue,
    COUNT(*) AS total_orders
FROM 
    retail_orders
GROUP BY 
    discount
ORDER BY 
    total_revenue DESC;

-- 6. Top 5 Cities by Sales
SELECT 
    city, 
    SUM(sale_price * quantity) AS total_sales
FROM 
    retail_orders
GROUP BY 
    city
ORDER BY 
    total_sales DESC
LIMIT 5;

-- 7. Profitability Analysis by Region
SELECT 
    region, 
    SUM(profit) AS total_profit
FROM 
    retail_orders
GROUP BY 
    region
ORDER BY 
    total_profit DESC;

-- 8. Average Profit Per Product
SELECT 
    product_id, 
    AVG(profit) AS avg_profit
FROM 
    retail_orders
GROUP BY 
    product_id
ORDER BY 
    avg_profit DESC
LIMIT 10;

-- 9. Revenue Contribution by Category
SELECT 
    category, 
    SUM(sale_price * quantity) AS total_revenue
FROM 
    retail_orders
GROUP BY 
    category
ORDER BY 
    total_revenue DESC;

-- 10. Most Frequently Ordered Products
SELECT 
    product_id, 
    COUNT(*) AS order_count
FROM 
    retail_orders
GROUP BY 
    product_id
ORDER BY 
    order_count DESC
LIMIT 10;

-- 11. Total Revenue and Profit Per Month
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sale_price * quantity) AS total_revenue,
    SUM(profit) AS total_profit
FROM 
    retail_orders
GROUP BY 
    month
ORDER BY 
    month;
