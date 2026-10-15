SELECT courses.title AS course_title
FROM courses
JOIN enrollments ON courses.id = enrollments.course_id
GROUP BY courses.id, courses.title
HAVING COUNT(enrollments.student_id) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM enrollments
        GROUP BY course_id
    )
)
ORDER BY course_title ASC;
