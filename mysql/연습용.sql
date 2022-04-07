use shopdb; -- *은 뒤에 있는 애들을 다가져오겟네
show tables; -- use로 원하는 스키마 들어가고 쓰면 그 안에 있는 테이블 호출함



use 연습용; -- 연습용 schemas 사용하기위해 호출
show tables;
select * from 고객구매; -- 지정한 테이블명을 쓰면 현상황이 출력된다.    = *는 모든항목을 다가져오겠다. 
select 이름, 제품 from 고객구매; -- from 앞에 column 지정명을 부르면 그것만 나온다. 대신 from 뒤에는 무조건 table명
select * from  고객구매 where 이름='강동훈'; --  테이블 안 내용중 원하는 정보만 빼서 확인

use 연습용;
create table 비트아카데미(
	이름 char(4) not null,
	나이 int,
    대학교 char(6) not null,
    과 char (7)
)
;

use 연습용;
table 비트아카데미;
use 연습용;
show tables;
use 연습용;
select 이름 , 나이 from 비트아카데미;

create table 빅데이터반(
이름 char(4),
나이 int,
대학교 char(7),
과 char(7),
primary key(이름,나이,대학교,과)
)
;

use 연습용;
insert into 빅데이터반
	select 이름,나이,대학교,과
    from 비트아카데미
	;
    
use 연습용;
select * from 빅데이터반;
select *from 빅데이터반;
select 이름,나이,대학교 from 빅데이터반;
select 제품 from 고객구매 where 제품 = '아르띠에';
select *from 빅데이터반 where 나이  = '19' ;



select * from 고객구매 where 제품 = '아르띠에';


create index 제품찾자 on 고객구매(제품);

















