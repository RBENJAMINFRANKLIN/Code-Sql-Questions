/* Write your PL/SQL query statement below */
select nvl(max(salary),NULL) AS SecondHighestSalary  from employee where salary not in (select max(salary) from employee);