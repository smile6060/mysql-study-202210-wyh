select
	id,
	`name`,
    age
from
	`student_study_mst`
where
	`name` like '%경%'
or	`name` like '김%';

select 
	*
from
	student_study_mst
where
	not age = 25;

select 
	*
from
	student_study_mst
where
	age is null;