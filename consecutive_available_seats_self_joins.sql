select c1.seat_id
from Cinema c1
left join Cinema c2 on c1.seat_id = c2.seat_id + 1 
left join Cinema c3 on c1.seat_id = c3.seat_id - 1 
where (c1.free = 1 and c2.free = 1) or (c1.free = 1 and c3.free = 1)