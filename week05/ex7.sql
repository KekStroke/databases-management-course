SELECT COUNT(*) as num_students
FROM section
WHERE semester='Fall' and year='2022'
GROUP BY sec_id
ORDER BY num_students DESC
LIMIT 1;