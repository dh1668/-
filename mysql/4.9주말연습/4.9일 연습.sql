select 1+1;

-- 대소문자 구분x
use employees;

show tables;

-- 상대경로! employ밑에 정보들을 보여주는것
select * from departments;
select * from dept_emp;
select * from dept_manager;

-- count() 내장함수
select count(*) from employees; -- employees 테이블안에 있는 내장함수
select count(*) from salaries; -- salaries 테이블안에 있는 내장함수

desc titles; -- 행하고 열 정보들 나옴

-- 절대경로 : database.table  => 스키마명.테이블명
select *from employees.titles;

select * from sakila.actor; -- use 안쓰고도 호출할수잇는 키워드

desc sakila.city;

-- p.188 칼럼선택
desc employees;
select emp_no, first_name, last_name
from employees;

desc dept_manager;
select dept_no , emp_no from dept_manager;


-- 다른 데이터 베이스 보기
show tables from sakila;
desc sakila.actor;
select first_name, last_name from sakila.actor;

-- 실습 : 현재 imployees 디비상태에서,
-- sakila의 ciry, custmer_list 조회하기
show tables from sakila;
desc sakila.city;
show tables from sakila; -- 마우스안누르고 sakila 테이블목록들 호출
desc sakila.customer_list;  -- 마우스안누르고 sakila 테이블안의 칼럼명을 호출해서 안의정보들 확인하기


-- 실습:
-- 새 접속 세션을 열고
-- 1. use 사용지 않은 상태에서 show database 로 확인
-- 2. sakila db의 테이블 확인
-- 3. 절대 경로 방식으로 sakila db의 film, film_actor, actor 테이블 조회
-- 4. 절대경로 방식으로 world 의 테이블 row를 count

-- show databases;
-- show tables from sakila;

show databases ; -- 스키마정보들 나옴
show tables from sakila; -- 사킬라테이블안의  테이블명 다나옴
desc sakila.film; -- sakila테이블안의 film안 칼럼안에 데이터들 나옴
select title, description from sakila.film; 

show tables from world; -- wolrd 스키마의 테이블명들 호출
select count(*) from world.city; -- 내장함수를 쓴것 => world 스키마안의 city 테이블안에 목록의 수를 보여달라 
select count(*) from world.country;

-- p.194 테이블생성
-- 데이터 삽입

drop database if exists sqldb; -- 너가 쓴 문법은 맞는데 sqldb 라는 정보가 없어서 지우지 못해라는 뜻은 노란색으로 뜨는거임  
create database sqldb;
use sqldb;


create table usertbl(
-- 칼럼명 데이터형식 (크기)
 userid 	char(8) not null primary key,
 name 		varchar(10) not null,			-- var최대값 10 이거 그전은 데이터 아낄수있는 장점있음. 하지만 11이상못함
 birthyear  int not null,
 addr 		char(2),
 mobile1	char(3),
 mobile2	char(8),
 height		smallint, -- 16비트 짜리 작은 정수타입
 mdate		date
)
;
show tables;

create table buytbl(
num int auto_increment not null primary key, -- 내가데이터안써도 123 인덱스(순서) 생김
userid char(8) not null,
prodName char(6) not null,
groupName char(4) ,
price int not null,
amount smallint not null,
foreign key (userid) references usertbl(userid)      -- foreign key(컬럼명) reference(컬럼명) 을써야한다
)
;
/* 외래키를 쓰는 칸에는 레퍼런스를 써야함
위의 예제에서 buytbl 테이블의 userid 는 usertbl 테이블의 userid를 참조하도록 설정됩니다.
따라서 usertbl 테이블의 userid 값이 변경되면, 같은 값의 buytbl 테이블의 userid 값도 같이 변경됩니다.
*/
-- usertbl 데이터 삽입 p.196
insert into usertbl values('LSG', '이승기', 1987, '서울','011','1111111',182,'2008-8-8'); 
insert into usertbl values('KBS', '김범수', 1979, '경남','011','2222222',173,'2012-4-4'); 
insert into usertbl values('KKH', '김경호', 1971, '전남','019','3333333',177,'2007-7-7');
insert into usertbl values('JYP', '조용필', 1950, '경기','011','4444444',166,'2009-4-4');
insert into usertbl values('SSK', '성시경', 1979, '서울',NULL,NULL,186,'2013-12-12');
insert into usertbl values('LJB', '임재범', 1963, '서울','016','6666666',182,'2009-9-9');    
insert into usertbl values('YJS', '윤종신', 1969, '경남',NULL,NULL,170,'2005-5-5');
insert into usertbl values('EJW', '은지원', 1972, '경북','011','8888888',174,'2014-3-3');
insert into usertbl values('JKW', '조관우', 1965, '경기','018','9999999',172,'2010-10-10');
insert into usertbl values('BBK', '바비킴', 1973, '서울','010','0000000',176,'2013-5-5');
insert into buytbl values(NULL, 'KBS', '운동화', NULL,30, 2);
insert into buytbl values(NULL, 'KBS', '노트북', '전자',1000, 1);
insert into buytbl values(NULL, 'JYP', '모니터', '전자',200, 1);     
insert into buytbl values(NULL, 'BBK', '모니터', '전자',200, 5);
insert into buytbl values(NULL, 'KBS', '청바지', '의류',50, 3);
insert into buytbl values(NULL, 'BBK', '메모리', '전자',80, 10);
insert into buytbl values(NULL, 'SSK', '책', '서적',15, 5);
insert into buytbl values(NULL, 'EJW', '책', '서적',15, 2);
insert into buytbl values(NULL, 'EJW', '청바지', '의류',50, 1);
insert into buytbl values(NULL, 'BBK', '운동화', NULL,30, 2);
insert into buytbl values(NULL, 'EJW', '책', '서적',15, 1);
insert into buytbl values(NULL, 'BBK', '운동화', NULL,30, 2);



select*from usertbl;
select*from buytbl;

-- 오후 시작 p.200 where조건절
-- select ... from ... where 조건식[and , or ]

select * 
from usertbl -- 테이블명
where birthyear = 1972
;

select * 
from usertbl 
where birthyear > 1972 -- 1972이라는 숫자보다 큰 년생의 컬럼값들 호출
;

select * 
from usertbl 
where mobile1 = '011'
;

select * 
from usertbl 
where birthyear >= 1972 
;

select * 
from usertbl 
where birthyear <= 1972 -- 1972년이라는 숫자보다 작은 년생들의 칼럼값들 호출
;

select * 
from usertbl 
where birthyear > 1970 or height > 180
;

-- not    : not , != ,  <> 이렇게 쓰면됌
select * 
from usertbl 
where not birthyear > 1970
;

select * 
from usertbl 
where birthyear != 1970
;

select * 
from usertbl 
where birthyear <> 1970  -- 위에거랑 다름
;

-- =, < , > , <= , >= , <> , !=
-- AND , OR , NOT


-- 예 ) 주소가 서울이고 키가 179이하인 사람 .
select * 
from usertbl
where addr = '서울' and height < 179
;

-- Null은    is 를 써야함
select *
from usertbl
where mobile1 is null;

select * from buytbl;


-- buytbl에서 가격이 100이상이고 그룹이름이 전자인거.

select *
from buytbl
where price >= 100 and groupname = '전자'
;

desc buytbl;


-- 예 ) buytbl에서 가격이 10이상이고 그룹이름이 전자아닌거.

select *
from buytbl
where price >= 10 and groupname != '전자'
;

select *
from buytbl
where price >= 10 and not  groupname = '전자'
;

select *
from buytbl
where price >= 10 and groupname <> '전자'
;

-- p.201 between .. and, in
-- 키가 180~183인 사람.
select * from  usertbl
where height <= 183 and height >=180;
-- where height <= 180 and height >=183;

select * from usertbl
where height between 180 and 183;

select * from usertbl
where addr = '경남' or addr = '경북' or addr = '전남';

select * from usertbl
where addr in ('경남', '경북' ,'전남');

-- 패턴 매칭.
select * from usertbl
where name like '김%' ;  -- 김으로 시작하는 모든문자 (%가 뒤에있을경우)

select * from usertbl
where name like '%신'; -- 신으로 끝나는 모든문자 ( %가 앞에 있을경우)

select * from usertbl
where name like '%비%'; -- 양쪽에 %있으면 비를 포함한 모든이름 

-- '_' 한글자 
select * from usertbl
where name like '_종신'; 

-- 서브쿼리 : 쿼리안의쿼리.

-- 예) 김경호보다 키가큰사람.
select * from usertbl;
select * from usertbl where height > 177;

select * from usertbl
	where height >
		(select height from usertbl where name = '김경호')
;

select * from usertbl
	where height >
		(select * from usertbl where name = '김경호'); -- 에러이유: 하나의값이 나와야하는데 모두가 나왓기때문이라는거임 

-- p.203 any / all / some

select name, height from usertbl
where height >= (select height from usertbl where addr = '경남'); 
    
-- any
select name, height from usertbl
where height = any(select height from usertbl where addr = '경남'); -- or 같은효과

select name, height from usertbl
where height in (select height from usertbl where addr = '경남');

-- all
select name, height from usertbl
where height >= all(select height from usertbl where addr = '경남');  -- and 같은효과

select name , height from usertbl
order by name; -- 오름차순

select name , height from usertbl
order by name desc; -- 내림차순

select name , height from usertbl
order by birthyear;

select name , height, birthyear from usertbl
order by name, birthyear;

select name , height, birthyear from usertbl
order by name desc, birthyear asc;


-- distinct  : 중복배제

select addr  from usertbl; -- <중복>
select distinct addr  from usertbl; -- <중복배제>

-- 응용 count(column이름)
 select count(*) from usertbl;

-- 중복한 주소 다나옴  
 select count(addr)from usertbl;

 -- 중복하지 않는 주소의 숫자가나옴
 select count(distinct addr) from usertbl;
 
 -- 응용 count : null 인거
 select * from usertbl;
 select count(*) from usertbl; -- 전체 행의수  = 10개
 select count(addr) from usertbl;  -- 주소 수(데이터값 다있기때문에) = 10개
 select count(mobile1) from usertbl; -- 'null 값 배제'해서 10칸중 8개만 나오니 답이 8개
 
 select * from employees.employees
where gender  = 'F'
 limit 30; -- 출력하는 행의 개수 :  limit 숫자 => 1 ~ 30번까지 나옴

 select * from employees.employees
where gender  = 'F'
 limit 0,100; -- gender 'f' 0 ~ 100번째
 
 select * from employees.employees
where gender  = 'F'
 limit 100,200; -- gender 'f' 의 101 ~ 200번째
 
 -- limit star , stop  << 괄호쓰면안됀다.
  select * from employees.employees
 limit 100,200; -- 101 ~ 300
 
 -- 	테이블 복사 create table ... select   
 -- ex) 테이블 복사 create table 복사받을테이블이름 select*from 복사해줄테이블이름 
 create table buytbl12 (select *from buytbl); --  이름 buytbl 12임

show tables;

desc buytbl;
desc buytbl12;  -- ★★★★ key는 복제안됌   
 
 create table buytbl13 (select userid, prodname , price , amount  from buytbl); -- 이름 buytbl 13임
 select * from buytbl13 ; 
 
 -- group by절 : 
 -- 그룹으로 묶어주는 역할
 -- 집계 함수와 함께 사용
    -- 1. 효율적인 데이터 그룹화
    -- 2. 각 사용자 별로 구매한 개수를 합쳐 출력 (↓ 예시)
		select userid * sum(amount) from buytbl group by userid;
-- 읽기 좋게 사용하기위해서

select userid ,amount from buytbl; -- 확인용<의미없는거임>
-- order by 쓴예시
select userid , amount from buytbl order by userid; -- order by 뒤에 오는것을 a~z , 가나다, 123 순서대로해줌
select userid , sum(amount) from buytbl order by userid;

-- group by 쓴예시
select userid , sum(amount) from buytbl group by userid; -- sum() 집계함수를 안쓰고 amount 를 쓰면 userid에서 가장 먼저 나온수를 대표로 한다
select userid , amount from buytbl group by userid;

select amount from buytbl where userid = 'KBS';
select amount from buytbl where userid = 'BBK';

-- alias : sum(amount) 나온자리를 다른이름으로 대체해서 쓸수잇음 , AS 생략해도됨
-- select userid '변경하고싶은이름', sum(amount) AS  '변경하고 싶은이름' from buytbl group by userid;

select userid '아이디', sum(amount) AS  '합계' from buytbl group by userid;   -- AS 안써도됨

select userid '아이디', sum(amount) AS  '합계'
from buytbl
group by userid
-- order by '합계'
order by 1 -- 선택한 위치값으로도 인식함 < =아이디를 순서를 맞출건지 , 합계를 순서를맞출건지 고르는거>
;

-- column index : 1부터 시작...
select userid '아이디', sum(amount)   '합계'
from buytbl
group by userid
-- order by '합계'
order by 2 desc -- desc 를 오더바이 뒤에 붙이면 거꾸로 큰거부터 작은거
;

select name, addr, height , mDate , addr , mobile1, mobile2
from usertbl
-- order by height
order by 3 -- 가나다라마바사 이런순서랑, 123 같은 밑으로 갈수록 커지는 것으로 바뀜
;

-- sum의 총구매액
select * from buytbl;
select userid AS '사용자' , sum(price* amount) AS '총구매액'
	FROM buytbl
    group by userid;
    
-- 예) 제품 그룹별 사용자가 구매한 개수(amount)합산
select groupname , sum(amount) AS '개수'
	FROM buytbl
    group by groupname;
    
-- 예) 제품 그룹별 사용자가 구매한 매출액
-- 예) 사용자가 구매한 제품별 매출액
select groupname , sum(price*amount) '매출액'
	FROM buytbl
    group by groupname;


-- 예) 사용자가 구매한 제품별 수량
-- 예) 제품별 사용자 구매 수량
-- count()사용
select * from buytbl;
select groupname , count(prodname) '수량'
	FROM buytbl
    group by groupname;

use sqldb;
select *from buytbl; -- 테이블 확인용(의미없음)

-- 전체구매자가 구매한 물품의개수
select AVG(amount) AS '평균구매 개수' FROM buytbl;

-- 각 사용자별로 한번 구매시 물건을 평균 몇개 구매했는지 평균을 내보자
select userid, AVG(amount) AS '평균 구매 개수' FROM buytbl GROUP BY userid;

-- 가장 큰 키와 가장 작은키의회원 이름과 키를 출력하는 쿼리를 만들기
select name, MAX(height), Min(height) From usertbl;
-- 위에 것을 group by 를 이용해 고쳐보기
select name, MAX(height), Min(height) From usertbl group by NAME;
-- 위에도 이상한게 나옴 그렇기 때문에 이런경우 ★서브쿼리와 조합을 하는것이 가장 좋다
select name , height
	from usertbl
    where height = (select MAX(height)from usertbl)
		or height = (select Min(height)from usertbl);
-- 딱 원하는대로 나옴

-- 2번째 방법 (하지만 이건 데이터값을 아는경우 사용하는거임)
SELECT NAME, height from usertbl
where height = 166  or height = 186;




-- 이번엔 휴대폰이 있는 사용자의 수 카운트
select count(*) From usertbl;
select count(mobile1) AS '휴대폰이 있는 사용자' from usertbl;  -- 8이나옴


-- 예)  buytbl
-- 가격이 평균가격보다 높은 가격을 가진 제품.

desc buytbl;
select prodname from buytbl
where price >= 143;

desc buytbl;
select prodname from buytbl
where price >= (select avg(price) from buytbl)
;

-- 중복되는걸 빼려면 distinct
desc buytbl;
select distinct prodname from buytbl
where price >= (select avg(price) from buytbl)
;










-- p.215 카운트 : null의미         

-- p.215 having 절 : 집계에 관련된 조건 때 사용 //강사님꺼 이부분 쓸예정 
use sqldb;
select userid AS '사용자' , sum(price*amount) AS '총구매액'
	from buytbl
    GROUP BY userid ;
    


-- 사용자별 총구매액에서 총구매액이 1000이상인 사용자
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   WHERE SUM(price*amount) > 1000    -- where절에는 집계함수 쓸수 없다.
   GROUP BY userID ;
   
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 1000 ;

-- 사용자가 구매한 노트북의 총구매액이 1000이상인 사용자
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   where groupName = '노트북'
   GROUP BY userID
   HAVING (select SUM(price*amount) from buytbl) > 1000 ;
   
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 500 
   order by SUM(price*amount);

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buytbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 500 
   order by 2;

-- NUM 뺀것 = 합계만 나옴

-- P.220 INSERT문
use sqldb;
create table testtbl1(
	id int,
    username char(3),
    age int
);

desc testtbl1;
-- 여러가지를 만들때 유용
insert into testtbl1 values(2,'홍길동',25);

select * from testtbl1;

-- 컬럼을 명시.
-- 소수의 컬럼을 만들때 유용함
insert into testtbl1(id , username) values(3,'설현');
insert into testtbl1(username , id , age) values('설현',4,20);

insert into testtbl1 values(2,'디비', null);

-- p.221 auto_increment
create table testtbl2(
	id int auto_increment primary key,
    username char(3),
    age int
);
desc testtbl2;

insert into testtbl2 values(null, '지민', 25);
insert into testtbl2 values(null, '지민', 25);
insert into testtbl2 values('만세',19);

select last_insert_id();

-- p.221 alter
alter table testtbl2 auto_increment= 100;
desc testtbl2;

insert into testtbl2 values(null,'지민',25);
select *from testtbl2;

-- p222, p223
-- bulk insert
-- 하나씩 개별 덤프 
insert into testtbl2 values (null , '지민', 25);
insert into testtbl2 values (null , '지민', 25);
insert into testtbl2 values (null , '지민', 25);
insert into testtbl2 values (null , '지민', 25);
insert into testtbl2 values (null , '지민', 25);

-- 대량샘플 덤프할땐 밑에 껄로하는거임
insert into testtbl2 values (null , '지민', 25),
	(null, '주희',20),
    (null, '주희',21);
select * from testtbl2;


-- 테이블만들어서 인서트하는방법
create table testtbl4(id int , fname varchar(50), lname varchar(50));

insert into testtbl4
	select emp_no, first_name, last_name
    from employees.employees;
    select * from testtbl4;

create table testtbl5(
	select emp_no,first_name,last_name
	from employees.employees);
    
select * from testtbl5;



-- delete ,update 
delete from testtbl4;
-- error code 1175 : 다삭제할려고한다고 경고하는거임


use sqldb;
-- 이렇게하면됌
set sql_safe_updates = 0;

delete from testtbl4;
use sqldb;

-- 가격이 평균가격보다 높은 가격을 가진 제품 이름과 평균가격
show tables;
select *from buytbl;

select prodname , price, (select avg(price) from buytbl) AS 평균가격   -- 제품이름 ,가격 ,평균가격 을 항목으로 만든다.
from buytbl 														 -- BUYTBL 이라는 테이블안에서
where price > (select avg(price) from buytbl)						-- 사용할 조건은 가격이 평균가격보다 높은경우
group by price ;													-- 겹치는게 나오니 PRICE로 묶은거임(PRODNAME으로 묶어도됨)
-- 적어둔 조건에 적합한 자료를 buytbl 에서 추출해서 사용하고 위에항목(가격, 제품이름 ,평균가격)을 항목에 나타내되, 겹치는건 하나로 표현해라

use sqldb;
select*from usertbl;
-- count() 사용해라

-- usertbl 에서 mobile1에 있는 null의 개수는?
select count(*)		-- 모든 행의 개수를 표현
from usertbl 		-- usertbl 에서
where mobile1 is null; -- 조건 ? mobile1에 있는 null 값을





