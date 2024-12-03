SELECT 
    co.country_name, 
    COUNT(*) AS customer_count, 
    AVG(i.total_price) AS avg_total_price
FROM 
    country co
JOIN 
    city ci ON co.id = ci.country_id
JOIN 
    customer cu ON ci.id = cu.city_id
JOIN 
    invoice i ON cu.id = i.customer_id
GROUP BY 
    co.country_name
HAVING 
    AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice);
