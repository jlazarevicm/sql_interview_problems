# Write your MySQL query statement below
with x as (
    select d.name Department, 
        e.name Employee, 
        salary Salary,
        rank() over (partition by departmentId order by salary desc) r
    from Employee e 
    join Department d on e.departmentId = d.id
)
select Department, Employee, Salary
from x 
where r = 1