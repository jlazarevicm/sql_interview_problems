with champs as (
    select Wimbledon player_id
    from Championships

    union all

    select Fr_open player_id
    from Championships

    union all

    select US_open player_id
    from Championships

    union all

    select Au_open player_id
    from Championships
    )
select c.player_id, p.player_name, count(c.player_id) grand_slams_count
from champs c
join Players p on c.player_id = p.player_id
group by c.player_id, p.player_name