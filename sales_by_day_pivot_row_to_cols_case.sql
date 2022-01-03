select i.item_category Category,
        sum(case when dayname(order_date) = 'Monday' then quantity else 0 end) Monday, 
        sum(case when dayname(order_date) = 'Tuesday' then quantity else 0 end) Tuesday,
        sum(case when dayname(order_date) = 'Wednesday' then quantity else 0 end) Wednesday, 
        sum(case when dayname(order_date) = 'Thursday' then quantity else 0 end) Thursday,
        sum(case when dayname(order_date) = 'Friday' then quantity else 0 end) Friday,
        sum(case when dayname(order_date) = 'Saturday' then quantity else 0 end) Saturday,
        sum(case when dayname(order_date) = 'Sunday' then quantity else 0 end) Sunday
from orders o
right join items i on o.item_id = i.item_id
group by i.item_category
order by Category