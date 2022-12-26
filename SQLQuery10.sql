create table task10(
satus int ,
qty int,
price int,
total int
);

insert into task10 values( 0, 5, 2, 10 )
insert into task10 values(0,-3, 2, -6 )
insert into task10 values(1, 4, 3, 12)
insert into task10 values( 1, -1, 3, -3 )
insert into task10 values(2, 8, 1, 8 )
insert into task10 values(2, -3, 1, -3)


select 
satus,
case  when satus = 0 then sum(qty) 
else max(qty) 
end as qty,
sum(total) as total
from task10 
group by satus;


select 
satus, 
iif (satus=0,sum(qty),max(qty)) as qty,
sum(total) as total
from task10
group by satus;
--new sectioncreate table medaxil1(
medaxil int);
create table mexaric1(
mexaric int);
insert into medaxil1 values(52);
insert into mexaric1 values(0);
insert into medaxil1 values(0);
insert into medaxil1 values(37);
insert into medaxil1 values(3);
insert into mexaric1 values(23);
insert into mexaric1 values(43);
insert into mexaric1 values(3);
select * from medaxil;



Declare @FromDate Date = '2022-10-25',
 @ToDate Date = '2022-10-31'
;With DateCte (Date) As
(
 Select @FromDate Union All
 Select DateAdd(Day, 1, Date)
 From DateCte
 Where Date < @ToDate
)
,r(medaxil,mexaric) as (select m1.medaxil,m2.mexaric
from (select medaxil, ROW_NUMBER() over (order by medaxil) as rn from medaxil1) as m1
full outer join 
(select mexaric, row_number() over (order by mexaric) as rn from mexaric1) as m2

on m1.rn = m2.rn)
select distinct(date),medaxil,mexaric from DateCte,r
where date not in ('2022-10-27','2022-10-28','2022-10-30') 
order by Date
;