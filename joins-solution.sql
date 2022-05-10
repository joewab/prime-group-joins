-- Get all customers and their addresses.
SELECT *
FROM customers JOIN addresses ON customers.id = addresses.customer_id;

-- Get all orders and their line items (orders, quantity and product).
SELECT *
FROM orders JOIN line_items ON orders.id = line_items.order_id;

-- Which warehouses have cheetos?
SELECT warehouse.warehouse, products.description, warehouse_product.on_hand
FROM (products JOIN warehouse_product ON products.id = warehouse_product.product_id) 
JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id
WHERE products.description = 'cheetos';


-- Which warehouses have diet pepsi?
SELECT warehouse.warehouse, products.description, warehouse_product.on_hand
FROM (products JOIN warehouse_product ON products.id = warehouse_product.product_id) 
JOIN warehouse ON warehouse.id = warehouse_product.warehouse_id
WHERE products.description = 'diet pepsi';


-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT count (orders.address_id) AS number_of_orders, customers.first_name, customers.last_name
FROM (customers JOIN addresses ON customers.id = addresses.customer_id) LEFT JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.last_name, customers.first_name;


-- How many customers do we have?
SELECT count(customers.id) AS number_of_customers
FROM customers;

-- How many products do we carry?
SELECT count(products.id) AS number_of_products
FROM products;

-- What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand) AS total_pepsi_on_hand
FROM warehouse_product JOIN products ON warehouse_product.product_id = products.id
WHERE products.description = 'diet pepsi';

-- Stretch
-- How much was the total cost for each order?

-- How much has each customer spent in total?

-- How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).

