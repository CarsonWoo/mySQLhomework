# 3-1把peoples表中school不是GDUFS的人全部找出来？(包括school为NULL的人) 写出MySQL语句
select name from peoples where school is NULL or school != 'GDUFS';
# 3-2查找计算机系每次考试学生的平均成绩(最终显示学生姓名，考试名称，平均分)
select name,avg(grade) from student
join exam on exam.student_ID = student.ID
where dept_name = 'computer'
group by name;
# 3-3查找女学霸（考试平均分达到８０或以上的女生的姓名、分数）
select name,avg(grade) from student
join exam on exam.student_ID = student.ID
where sex = 'f'
group by name
having avg(grade) >= 80;
# 3-4找出人数最少的院系以及其年度预算
-- select dept_name,budget from department
select dept_name,count(dept_name) from student
join department on department.dept_name = student.dept_name
where count(student.dept_name) = min(department.dept_name)
group by dept_name;
# 3-5计算机系改名了，改成comp.sci
update department set dept_name = 'comp.sci' where dept_name = 'computer';
# 3-6修改每个系的年度预算，给该系的每个学生发２０００元奖金。（修改每个系的年度预算为　原预算＋该戏人数×２０００）
select dept_name,count(dept_name) from student group by dept_name;
select sum(dept_name) from student group by dept_name;
update department set budget = budget + 3 * 2000 where dept_name = 'biology';
update department set budget = budget + 8 * 2000 where dept_name = 'comp.sci';
update department set budget = budget + 2 * 2000 where dept_name = 'math';
update department set budget = budget + 3 * 2000 where dept_name = 'new';
update department set budget = budget = 4 * 2000 where dept_name = 'physics';
# 3-7向department中插入一条数据，dept_name属性的值为avg_budget,building为空，年度预算为所有院系的预算平均值
select sum(budget)/5 from department;
insert into department(dept_name, building, budget)values('avg_budget', NULL, 22200.000000);
# 3-8 删除计算机中考试成绩平均分低于７０的学生