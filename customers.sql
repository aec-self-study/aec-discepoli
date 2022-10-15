SELECT
  cust.id as customer_id
  , cust.name
  , cust.email
  , MIN(ord.created_at) as first_order_at
  , COUNT(DISTINCT ord.id) as num_orders
FROM `analytics-engineers-club.coffee_shop.customers` cust
JOIN `analytics-engineers-club.coffee_shop.orders` ord ON cust.id = ord.customer_id
GROUP BY 1,2,3
ORDER by first_order_at LIMIT 5
