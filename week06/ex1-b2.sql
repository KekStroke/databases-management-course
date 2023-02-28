SELECT customers.customerId, SUM(price*quantity)
FROM customers
INNER JOIN orders ON orders.customerid = customers.customerid
INNER JOIN "order-item" ON "order-item".orderid = orders.orderid
INNER JOIN items ON items.itemid = "order-item".itemid
GROUP BY customers.customerid
ORDER BY sum DESC
LIMIT 1;