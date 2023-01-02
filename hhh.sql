select * from WORKER

select * from SCHEDULE

select * from WORKER_INFO
select * from PAYINFO

SELECT COUNT(*) FROM WORKER where worker_no>1

insert into SCHEDULE values (3,2,'2023-01-02T15:30:00','2023-01-02T20:30:00')

	SELECT * 
						FROM WORKER
						where worker_no>1 
						ORDER BY worker_no DESC 
						limit 0 , 2

						
		SELECT 
			a.seq,
	 		a.worker_no, 
		    a.name, 
		    a.selectMon, 
		    a.hourlyPay, 
		    floor(a.totalMin/60) as HH,
		    mod(a.totalMin,60) as MM,
		    tax, 
		    format(a.money, 0) AS salary  
		FROM (
					SELECT * 
						FROM PAYINFO 
						
						ORDER BY seq DESC
						limit 0 , 1) a
						
						
						
			select sum(A.hh) AS totalHour, sum(A.mm) AS totalMin from (
		select worker_no, 
		        
		    TIMESTAMPDIFF(hour,Replace(work_start_date,'T',' '),
		    Replace(work_end_date,'T',' ')) as hh,
		    
		    TIMESTAMPDIFF(minute,Replace(work_start_date,'T',' '),
		    Replace(work_end_date,'T',' ')) as mm
		        
		from SCHEDULE
		
		
		where SUBSTR(work_start_date,6,2) =1
		        AND worker_no = 2
	) A
	group by worker_no

	SELECT COUNT(*) FROM PAYINFO 
	where name like 
                     CONCAT(‘%’, '홍길동', ‘%’) 
                      
                      SELECT COUNT(*) FROM PAYINFO 
<!-- 	where 1=1  -->
					<if test="keyword != null">
                    where name like '%'#{keyword}'%' 
                   </if>
	
create table WORKER(
worker_no int,
worker_id varchar(20) primary key,
pwd varchar(20) not null,
name varchar(20) not null,
phone int not null,
gender int not null,
age int not null,
join_date varchar(20)
);

drop table WORKER;
select * from WORKER;

insert into WORKER values(1,'admin',1234,'사장님',01011112222,0,22,2022-12-28);

create table SCHEDULE(
seq int primary key,
worker_no int,
work_start_date varchar(30) not null,
work_end_date varchar(30) not null
);

create table PAYINFO(
seq int primary key,
worker_no int,
name varchar(20),
selectMon int,
hourlyPay int,
totalMin int,
tax decimal(5,4),
money decimal
);