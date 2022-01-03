select row_number() over (order by IF(MOD(id, 2) = 0, id-1, id+1)) id, student
FROM seat