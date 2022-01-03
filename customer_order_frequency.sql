with x as (
    select c.customer_id, 
        name, 
        date_format(order_date, '%Y-%m'), 
        sum(quantity*price) as qp, 
        count(c.customer_id) over (partition by c.customer_id) c
    from orders o
    join customers c on o.customer_id = c.customer_id
    join product p on o.product_id = p.product_id
    where order_date between '2020-06-01' and '2020-07-31'
    group by c.customer_id, name, date_format(order_date, '%Y-%m')
    having qp >= 100 
)
select distinct customer_id, name
from x 
where c > 1
