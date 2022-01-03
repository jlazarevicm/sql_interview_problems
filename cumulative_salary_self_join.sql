with x as (
    select e1.id, 
        e1.month, 
        (ifnull(e1.salary,0) + ifnull(e2.salary,0) + ifnull(e3.salary,0)) Salary,
        rank() over (partition by e1.id order by e1.month desc) r
    from Employee e1
    left join Employee e2 on e1.id = e2.id and e1.month = e2.month+1
    left join Employee e3 on e1.id = e3.id and e1.month = e3.month+2
    order by e1.id asc, e1.month desc
    )
select id, month, Salary
from x
where r > 1
