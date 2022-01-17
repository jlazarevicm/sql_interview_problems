with x as (
    select machine_id, 
        process_id, 
        min(case when activity_type = 'end' then timestamp end) end,
        min(case when activity_type = 'start' then timestamp end) start
    from Activity
    group by machine_id, 
        process_id
    )
select machine_id,
    round(avg(end-start),3) processing_time
from x
group by machine_id