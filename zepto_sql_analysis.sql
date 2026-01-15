DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(255),
  name VARCHAR(255) NOT NULL,
  mrp NUMERIC,
  discount_percent NUMERIC,
  available_quantity INTEGER,
  discounted_selling_price NUMERIC,
  weight_in_grams INTEGER,
  out_of_stock BOOLEAN,
  quantity INTEGER
);

SELECT COUNT(*) FROM zepto;

SELECT DISTINCT category
FROM zepto
ORDER BY category;

SELECT out_of_stock , COUNT(*) AS product_count
FROM zepto
GROUP BY out_of_stock;

SELECT 
   name, 
   COUNT(sku_id) AS number_of_skus 
FROM zepto GROUP BY name HAVING COUNT(sku_id) > 1 ORDER BY number_of_skus DESC; 

SELECT * 
FROM zepto 
WHERE mrp = 0 OR discounted_selling_price =0; 

DELETE FROM zepto WHERE mrp = 0; 

UPDATE zepto 
SET mrp= mrp/100.0, 
discounted_selling_price = discounted_selling_price/100.0; 

SELECT DISTINCT 
name, 
mrp, 
discount_percent 
FROM zepto ORDER BY discount_percent DESC LIMIT 10; 

SELECT DISTINCT 
name, 
mrp, 
out_of_stock 
FROM zepto 
WHERE out_of_stock = TRUE AND mrp > 20 ORDER BY mrp DESC; 

SELECT max(mrp) 
FROM zepto 
WHERE out_of_stock = TRUE; 

SELECT category, 
SUM(discounted_selling_price * available_quantity) AS total_revenue
FROM zepto 
GROUP BY category 
ORDER BY total_revenue DESC;  

