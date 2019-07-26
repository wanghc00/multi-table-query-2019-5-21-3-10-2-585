# 1.查询同时存在1课程和2课程的情况
SELECT * FROM student_course WHERE studentId IN
(SELECT a.id FROM
(SELECT student_course.studentId id FROM student_course WHERE student_course.courseId='1') a
INNER JOIN
(SELECT student_course.studentId id FROM student_course WHERE student_course.courseId='2') b
ON a.id=b.id);

# 2.查询同时存在1课程和2课程的情况
SELECT * FROM student_course WHERE studentId IN
(SELECT a.id FROM
(SELECT student_course.studentId id FROM student_course WHERE student_course.courseId='1') a
INNER JOIN
(SELECT student_course.studentId id FROM student_course WHERE student_course.courseId='2') b
ON a.id=b.id);

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
SELECT student.id,student.name,ave FROM
(SELECT student_course.studentId id, (sum(student_course.score)/count(student_course.courseId)) ave
FROM student_course
GROUP BY student_course.studentId HAVING ave>=60) a ,student
WHERE a.id=student.id;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
SELECT student.* FROM
(SELECT student.id id FROM student
WHERE student.id NOT IN (SELECT student_course.studentId FROM student_course)) s , student
WHERE s.id=student.id;

# 5.查询所有有成绩的SQL
SELECT student.name '姓名',course.name '学科',student_course.score '成绩'
FROM student,course,student_course
WHERE student.id=student_course.studentId AND course.id=student_course.courseId;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * from student  where id in 
(select a.studentId from
(select  student_course.studentId studentId from student_course where courseId='1') a
inner join 
(select  student_course.studentId studentId from student_course where courseId='2') b 
on a.studentId=b.studentId
);

# 7.检索1课程分数小于60，按分数降序排列的学生信息
SELECT student.* 
FROM student ,student_course 
WHERE student_course.courseId='1' AND student_course.score<60 AND student.id = student_course.studentId 
ORDER BY student_course.score;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
SELECT student_course.courseId, SUM(student_course.score)/COUNT(student_course.courseId) ave
FROM student_course
GROUP BY student_course.courseId
ORDER BY ave DESC,student_course.courseId ASC;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
SELECT student.name,student_course.score 
FROM student,student_course 
WHERE student_course.courseId='2' AND student_course.score<60;



