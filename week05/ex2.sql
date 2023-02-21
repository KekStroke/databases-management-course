SELECT sec_id, COUNT(*) as num_students
FROM public.takes
GROUP BY sec_id
HAVING COUNT(*) = (
	SELECT COUNT(*) as num_students
	FROM public.takes
	GROUP BY sec_id
	ORDER BY num_students DESC
	LIMIT 1);