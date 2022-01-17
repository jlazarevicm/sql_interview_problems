# Write your MySQL query statement below
WITH RECURSIVE cte AS 
(SELECT 1 AS VALUE 
 UNION ALL 
 SELECT VALUE +1 
 FROM cte 
 WHERE VALUE<(
        select max(customer_id)
        from Customers
    )
 )

select value ids
from cte
left join Customers c on cte.value = c.customer_id
where c.customer_id is null