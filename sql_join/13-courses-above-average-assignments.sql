SELECT courses.title
FROM courses
JOIN assignments ON courses.id = assignments.course_id
GROUP BY courses.id, courses.title
HAVING COUNT(assignments.id) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM assignments
        GROUP BY course_id
    )
)
ORDER BY courses.title ASC;
