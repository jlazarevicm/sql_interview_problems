
select name, mail
from Contests c
join Users u on c.gold_medal = u.user_id
group by name, mail
having count(gold_medal) >=3

union

select distinct u.name, u.mail
from Users u, Contests c1, Contests c2, Contests c3
where c1.contest_id = c2.contest_id-1 and c1.contest_id = c3.contest_id -2
and u.user_id in (c1.gold_medal, c1.silver_medal, c1.bronze_medal)
and u.user_id in (c2.gold_medal, c2.silver_medal, c2.bronze_medal)
and u.user_id in (c3.gold_medal, c3.silver_medal, c3.bronze_medal)

