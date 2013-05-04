
EXECUTE UPDATE_DECISION(640,85000,37,4,3);
select * from (select * from applicant_credit order by app_id desc) where rownum <=1;

EXECUTE UPDATE_DECISION(580,17500,19,1,5);
select * from (select * from applicant_credit order by app_id desc) where rownum <=1;

EXECUTE UPDATE_DECISION(699,65000,28,3,3);
select * from (select * from applicant_credit order by app_id desc) where rownum <=1;

EXECUTE UPDATE_DECISION(725,58000,44,5,3);
select * from (select * from applicant_credit order by app_id desc) where rownum <=1;

EXECUTE UPDATE_DECISION(736,62000,49,3,3);
select * from (select * from applicant_credit order by app_id desc) where rownum <=1;
