-- 1. Get all customers and their addresses.
SELECT first_name, last_name, street, city, state, zip FROM customers AS c
JOIN addresses AS a ON c.id = a.customer_id;

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT o.id, description, quantity FROM orders AS o
JOIN line_items AS li ON o.id = li.order_id
JOIN products AS p ON li.product_id = p.id;

-- 3. Which warehouses have cheetos?
SELECT p.description, w.warehouse FROM products AS p
JOIN warehouse_product AS wp ON p.id = wp.product_id
JOIN warehouse AS w ON w.id = wp.warehouse_id
WHERE description='cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT p.description, w.warehouse FROM products AS p
JOIN warehouse_product AS wp ON p.id = wp.product_id
JOIN warehouse AS w ON w.id = wp.warehouse_id
WHERE description='diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT first_name, last_name, count(*) FROM customers AS c
JOIN addresses AS a ON c.id = a.customer_id
JOIN orders AS o ON o.address_id = a.id
GROUP BY first_name, last_name;

-- 6. How many customers do we have?
SELECT count(id) FROM customers;

-- 7. How many products do we carry?
SELECT count(id) FROM products;

--  8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM warehouse_product AS wp
JOIN products AS p ON p.id = wp.product_id
WHERE description = 'diet pepsi';

## Stretch
9. How much was the total cost for each order?
10. How much has each customer spent in total?
11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).