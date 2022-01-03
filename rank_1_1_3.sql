select score, rank() over (order by score desc) "rank"
from Scores