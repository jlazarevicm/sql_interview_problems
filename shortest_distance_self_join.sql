with cte as (
    select x,
    rank() over (order by x) r
    from Point
),
y as (
    select abs(c1.x - c2.x) a
    from cte c1
    join cte c2 on c1.r = c2.r + 1
    )
select min(a) shortest
from y