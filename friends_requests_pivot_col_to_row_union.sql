with x as (
    select requester_id id
    from RequestAccepted

    union all

    select accepter_id id
    from RequestAccepted
    )
select id, count(id) num
from x
group by id
order by num desc
limit 1
