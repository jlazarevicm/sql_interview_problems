with x as (
    select d.name Department , e.name Employee , e.salary Salary, dense_rank() over (partition by e.departmentId order by e.salary desc) r
    from Employee e, Department d
    where e.departmentId = d.id
)
select Department, Employee, Salary
from x
where r <= 3
