-- Chris Eng
-- PE workbench
-- 11/28/2022

USE my_guitar_shop;

-- Question #1
SELECT product_code, product_name, list_price, discount_percent FROM products
    ORDER BY list_price DESC;

-- Question #2
SELECT concat(last_name, ", ", first_name) AS full_name FROM customers
    WHERE last_name REGEXP '^[M-Z]'
    ORDER BY full_name ASC;

-- Question #3
SELECT product_name, list_price, date_added FROM products
    WHERE list_price BETWEEN 501 AND 1999 ORDER BY date_added DESC;

-- Question #4
SELECT product_name, list_price, discount_percent,
    ROUND((list_price * (discount_percent / 100)), 2) AS discount_amount,
    ROUND((list_price - (SELECT discount_amount)), 2) AS discount_price
        FROM products ORDER BY discount_price DESC LIMIT 5;

-- Question #5
SELECT item_id, item_price, discount_amount, quantity, 
    (item_price * quantity) AS price_total, 
    (discount_amount * quantity) AS discount_total, 
    ((item_price - discount_amount) * quality) AS item_total FROM order_items
        HAVING item_total > 500
        ORDER BY item_total DESC;

-- Question #6
SELECT order_id, order_date, ship_date FROM orders
WHERE ship_date = NULL;

-- Question #7
SELECT NOW() AS today_unformatted DATE_FORMAT(NOW(),"%d-%b-%Y") AS today_unformatted;

-- Question #8
SELECT (list_price) AS price, (0.07) AS tax_rate, (tax_rate * price) AS tax_amount, (tax_amount + price) AS total FROM products;





