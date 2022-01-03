# Write your MySQL query statement below
with x as (
    select id,
        company, 
        salary,
        row_number() over (partition by company order by salary) row_num,
        count(1) over (partition by company) c
    from Employee
)
select id, company, salary
from x
where 
    case 
        when c%2 = 1
        then row_num = (c+1)/2
        else (row_num = c/2+1) or (row_num = c/2)
        end;
