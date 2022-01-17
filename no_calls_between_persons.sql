
select 
    case when from_id > to_id then to_id else from_id end person1,
    case when to_id  > from_id then to_id else from_id end person2,
    count(1) call_count,
    sum(duration) total_duration
from Calls
group by person1, person2