show tables;

use shopdb;

show tables;
select * from producttbl;

select * from producttbl;

select * from producttbl;

select memberName, memberAddresss from membertbl;
select *from membertbl;

select me from membertbl;


select * 
from membertbl
where memberName = '당당이'
;


/*mysql 
	여러줄 주석.
*/
-- 한줄 주석
#한줄 주석

select * 
from membertbl 	-- 주석.
;

-- p.70 테이블 생성
create table `my_table`(
	id int not null,
    name varchar(10)
);

drop table  my_table;

/* indextbl1 생성 */
create table indexTbl1 
(first_name varchar(14), 
last_name varchar(16),
 hire_date date, 
 primary key (first_name, last_name));
 
 
insert into indextbl1

	select first_name,last_name, hire_date
    from employees.employees
    LIMIT 500;
    



select * from indextbl1 where first_name = 'mary';