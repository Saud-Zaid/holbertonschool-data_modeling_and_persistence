SELECT courses.title, COUNT(registrations.student_id)
FROM courses
LEFT JOIN registrations ON courses.id = registrations.course_id
GROUP BY courses.id, courses.title
ORDER BY COUNT(registrations.student_id) DESC, courses.title ASC;
