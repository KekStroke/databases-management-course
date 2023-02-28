SELECT orderId, COUNT(*), SUM(price*quantity)
FROM items
INNER JOIN "order-item" ON "order-item".itemid = items.itemid
GROUP BY orderId;