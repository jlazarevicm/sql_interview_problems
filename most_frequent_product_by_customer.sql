with x as (
    select distinct
        o.customer_id, 
        o.product_id, 
        p.product_name, 
        count(1) over (partition by o.customer_id, o.product_id) as c
    from orders o 
    join products p on o.product_id = p.product_id
    ),
y as (
select customer_id,
    product_id,
    product_name,
    rank() over (partition by customer_id order by c desc) r
from x)
select customer_id, product_id, product_name
from y 
where r = 1
