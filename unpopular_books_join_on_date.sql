select b.book_id, b.name
from Books b 
left join Orders o on b.book_id = o.book_id  and dispatch_date between date_sub('2019-06-23', interval 1 YEAR) and '2019-06-23' 
where 
available_from < date_sub('2019-06-23', interval 1 month) 
group by b.book_id, b.name
having ifnull(sum(quantity),0) < 10