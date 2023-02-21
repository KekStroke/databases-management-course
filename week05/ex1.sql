(SELECT sec_id, COUNT(*) as num_students
FROM public.takes
GROUP BY sec_id
ORDER BY num_students DESC
LIMIT 1) UNION
(SELECT sec_id, COUNT(*) as num_students
FROM public.takes
GROUP BY sec_id
ORDER BY num_students ASC
LIMIT 1);