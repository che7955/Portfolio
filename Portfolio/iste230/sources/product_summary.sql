SELECT COUNT(*) AS number_of_products,
       Round(MAX(list_price),2) AS most_expensive_product,
       MIN(date_added) AS oldest_product
FROM products;