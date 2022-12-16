/*
	서브쿼리(하위쿼리)
    select 안에서 select 하는 방법
*/

/*문제: 서울대를 다니는 학생을 찾으세요*/

select
	*
from
	student_mst sm
    left outer join school_mst scm on(scm.school_id = sm.school_id)
where
	scm.school_name like '서울대%';
    
select
	*
from
	student_mst
where
	school_id in (select
					school_id
				from 
					school_mst
				where
					school_name like '서울대%'
				or school_name like '부산대%');

select
	*
from
	student_mst
where
	school_id in(1,2); /*in은 둘중에 하나라도 포함되어있으면 출력*/
    
/*select에 subquery 쓰는거*/
select
	*,
    (select school_name from school_mst as scm where scm.school_id = stm.school_id) as 번호
from
	student_mst stm;

set profiling = 1;
show profiles;

/*총인원을 school_id 옆에 나오도록 만들어라*/
select
	*,
    (select
		count(*)
	from
		student_mst) as 총인원
from
	student_mst;

/*join을 사용해서 위에랑 같은 결과가 나오도록 만들어라*/    
select
	*
from
	student_mst sm
    left outer join (select count(*) as 총원 from student_mst) sc on(1 = 1);
 /*측정해서 빠른걸로 사용하기 밑에 측정방법임*/   
show profiles;