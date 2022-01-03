
with x as (
    select s.employee_id,
        amount,
        department_id,
        DATE_FORMAT(pay_date,'%Y-%m') pay_month
    from Salary s
    join Employee e on s.employee_id = e.employee_id
),
y as (
select distinct
    pay_month,
    department_id,
    avg(amount) over(partition by pay_month, department_id) dep_avg,
    avg(amount) over(partition by pay_month) comp_avg
from x
)
select pay_month,
    department_id,
    (case 
        when dep_avg > comp_avg then 'higher'
        when dep_avg < comp_avg then 'lower'
        else 'same'
    end) comparison 
from y
