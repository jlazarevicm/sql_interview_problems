
with x as (
    select product_id, year first_year, quantity, price, ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY year) r
    from Sales 
)
select product_id, first_year, quantity, price
from x 
where r= 1
