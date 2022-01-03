WITH temp1 AS(
    SELECT log_id,
    log_id-ROW_NUMBER() OVER(ORDER BY log_id) AS difference
    FROM Logs
)

select min(log_id) as start_id, max(log_id) as end_id
from temp1
group by difference
order by start_id