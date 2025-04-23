/* Write your PL/SQL query statement below */
select e.name from employee e right join employee e1 on
e.id = e1.managerid
where e.id is not null
group by e.name,e.id
having count(*)>=5
; 