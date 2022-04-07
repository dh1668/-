use tset;
create table TEST1(
	이름 char(4)not null,
    그룹 char(5)NOT NULL,
    성별 char(2)NOT NULL,
    인종 char(3)NOT NULL,
    primary key(이름)
)
;
select * from test1 ;
select 이름,그룹 from test1;
select 이름 from test1 where 이름 ='닝닝';

create table test2(
	이름 char(4)not null,
    그룹 char(5)NOT NULL,
    성별 char(2)NOT NULL,
    인종 char(3)NOT NULL,
    primary key(이름)
);
insert into test2(
	select
    이름,그룹,성별,인종
	from test1
);

select * from test2;