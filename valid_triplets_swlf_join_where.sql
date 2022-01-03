select a.student_name member_A, b.student_name member_B, c.student_name member_C
from SchoolA a, SchoolB b, SchoolC c
where a.student_name not in (b.student_name,c.student_name) and b.student_name!=c.student_name
 and a.student_id not in (b.student_id,c.student_id) and b.student_id!=c.student_id