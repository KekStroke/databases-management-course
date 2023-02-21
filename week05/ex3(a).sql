(SELECT sec_id, COUNT(*) as num_students
FROM public.takes
GROUP BY sec_id
ORDER BY num_students DESC
LIMIT 1) UNION
(SELECT sec.sec_id, COUNT(*) as num_students
FROM public.takes as takes, public.section as sec
WHERE takes.sec_id = sec.sec_id
GROUP BY sec.sec_id
ORDER BY num_students ASC
LIMIT 1);