with x as (
    select visited_on,
            sum(amount) amount
    from Customer
    group by visited_on
    )

select visited_on,
    sum(amount) over (order by visited_on rows 6 preceding) amount,
    round(avg(amount) over (order by visited_on rows 6 preceding),2) average_amount
    
from x
ORDER BY visited_on
limit 1000000 offset 6