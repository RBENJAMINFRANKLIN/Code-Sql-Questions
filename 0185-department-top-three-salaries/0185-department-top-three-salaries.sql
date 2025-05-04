# Write your MySQL query statement below
with cte as(
select e.departmentId , e.name as empname, e.salary as Salary, d.name as depname,
dense_rank() over (partition by e.departmentId order by e.salary desc) as sal from employee e join
department d on e.departmentId = d.id
)
select depname as Department , empname as Employee , Salary from cte where sal < 4;

