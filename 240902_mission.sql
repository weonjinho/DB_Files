-- 1. 테이블 만들기 - 다음 쿼리를 복사해서 테이블을 생성하세요
create table users(
    no int primary key,
    name varchar2(10),
    addr varchar2(10),
    point number,
    grade varchar2(1),
    jumin varchar2(8)
);



-- 2. 테이블에 튜플 삽입 - 다음 쿼리를복사해서 튜플을 삽입하세요.
insert into users values (1,'kimsu','suwon',99.12,1,'820405-1');
insert into users values (2,'leesu','suwon city',89.00,2,'970805-2');
insert into users values (3,'choihee','seoul',88.21,1,'910204-2');
insert into users values (4,'leesil','suwon',77.62,4,'850405-1');
insert into users values (5,'james','seoul',60.22,1,'871105-1');
insert into users values (6,'parksuji','suwon',90.12,3,'880405-2');
insert into users values (7,'kimrae','yougin',89.96,3,'820105-1');
insert into users values (8,'sangJin','youngin',99.31,3,'990420-2');
insert into users values (9,'Leechan','incheon',79.12,2,'970605-2');
insert into users values (10,'kimmi','incheon',79.92,1,'810505-1');
insert into users values (11,'ryusu','seoul',85.32,4,'861205-2');
insert into users values (12,'Gosu',null,82.13,4,'810715-1');
select * from users;
--3. 문제풀기
--개인별로 먼저 문제를 풀고, 조별로 쿼리의 답을 맞춰보고
--본인이 이해한 만큼 답안을 작성하여 개인별로 제출합니다.

--목표문제  
--검색어 : 오라클 where 조건
--1. 모든 사람들의 이름과 점수와 생년월일을 검색하시오.  
select name as 이름, point as 점수, substr(jumin,1,6) as 생년월일
  from users;

--2. 80점 이상의 사람의 이름과 주소, 점수를 검색하시오.
select name as 이름, addr as 주소, point as 점수
from users
where point>=80;

--3. 이름이 kim으로 시작되는 사람의 이름과 주소와 점수를 검색하시오.
select name as 이름, addr as wnth
from users
where name like 'kim%';

--4. 현재 점수에서 +10으로 보정한 점수를 출력하시오.
--   원본 데이터에 반영되지 않습니다.
select point+10 as "보정한 점수"
from users;

--5. 1학년의 점수를 +1점씩 올려서 출력하세요. (단, 원본 데이터에 반영되지 않습니다.)
select point+1 as "변경된 점수"
from users
where grade=1;

--6. B등급을 획득한 사람의 이름, 주소, 점수를 출력하세요 (B등급 80점 이상 90점 미만입니다)
select name as 이름, addr as 주소, point as 점수
  from users
 where point between 80 and 90;

--7. 쿼리 결과 중 NULL은 실제 입력하지 않은 값입니다.
--   주소를 입력하지 않은 학생의 이름과, 주소, 학년, 점수, 주민번호를 출력하세요
select name as 이름, addr as 주소, grade as 학년, point as 점수, jumin as 주민번호
  from users
 where addr is null;

--8. 4학년의 점수를 10%로 올린 점수를 계산하세요.
--   (단, 원본데이터는 반영되지 않는다)
select point+(point*0.1) as "올린 점수"
  from users
 where grade=4;


--9. 점수가 낮은 학생부터 출력하세요.  번호, 이름, 주소, 포인트
select no as 번호, name as 이름, addr as 주소, point as 포인트
  from users
 order by point asc;
-- 기본값 : asc;



--10. 학년을 오름차순으로 정렬하시오, 단 학년이 동일 할 경우 포인트가 높은 사람이 먼저 출력됩니다.
--     출력은 번호, 이름, 학년, 포인트 
select *
  from users
 order by grade asc, point desc;


  
--11. 현재의 점수에서 -10을 보정한 결과 80점 이상인 사람의 이름과 점수, 보정한 결과 점수를 출력하세요.?
select name as 이름, point as 점수, point-10 as "보정한 결과"
  from users
 where (point-10)>=80;
--12. 2학년의 모든 학생을 출력하시오 . 출력 컬럼명은
--    이름 주소 학년으로 출력하시오. 여기서 이름은 name컬럼, 주소는 addr컬럼, 학년은 grade컬럼을 의미
select name as 이름, addr as 주소, grade as 학년
  from users
 where grade=2;


--추가문제  -- 오라클 함수를 검색해 보세요
--13. 학생은 총 몇명입니까? 
select count(name) as "학생 인원수"
  from users;
--14. 1학년은 총 몇명입니까?
select count(name) as "1학년 인원수"
  from users
 where grade=1;
--15. 모든 학생의 이름과 학년을 출력하시오. 단 이름은 모두 소문자로만 출력하시오. 
select lower(name) as 이름, grade as 학년
  from users;
--16. 2학년 학생의 이름과 학년을 출력하시오. 보안을 위해서 주소는 앞글자 2글자만 출력하시오.
select name as 이름, grade as 학년, substr(addr,1,2) as 주소
  from users
 where grade=2;

--17. 모든 학생의 점수의 일의 자리는 절삭하시오. - 반올림 없음 (단, 원본 데이터에 반영되지 않습니다.)
--select substr(point,-2), point
--  from users;
select substr(point/10,3,1),point   -- point/10한 값을 3번째 문자 부터 1개 절삭한다.
  from users;

--18. 모든 학생의 점수를 반올림하여 출력하시오. (단, 원본 데이터에 반영되지 않습니다.)
select round(point,0) as "반올림 한 점수"
  from users;
--19. 2학년은 모두 몇명입니까?
select count(name) as "2학년 인원수"
  from users
 where grade=2;

--20. 1학년중 80점 이상은 몇명입니까?
select count(name) as "1학년중 80점 이상인 인원수"
  from users
 where grade=1 and point>=80;

--21. 3학년의 평균은 몇점입니까?
select avg(point) as "3학년 평균 점수"
  from users
 where grade=3;

--22. 전체 학생 중 최고점은 몇점입니까?
select max(point) as "전체 학생 중 최고점"
  from users;

--23. 2학년 중 가장 낮은 점수를 획득한 점수는 몇점입니까?
select min(point) as "2학년 중 가장 낮은 점수"
  from users
group by grade
having grade=2;



--못푸는 문제
--24. 보안을 위해서 주소를 모두 출력하지 않고 앞의 세 글자만 출력하고 뒤에 *를 하나 붙힌다.
--   (단, 원본 데이터에 반영되지 않습니다.)  ?
--   예)suwon  >> su*
select replace(addr,substr(addr,3),'*')
  from users;

--25. 이름의 맨 앞에 *를 맨 뒤에도*를 붙혀서 출력한다. (단, 원본 데이터에 반영되지 않습니다.)
-- replace( '컬럼명or문자열', '찾을문자', '차환문자');
--select replace(replace(name,substr(name,-1,1),'*'),substr(replace(name,substr(name,-1,1),'*'),1,1),'*') as "*이름*" ,name as 이름
--  from users;
select concat(concat('*',name),'*')
  from users;

--26. 생년월일을 그대로 출력하지 말고
--    xx 년 xx 월 xx 일 형식으로 출력한다. (단, 원본 데이터에 반영되지 않습니다. 성별은 무시한다)
--select to_char(substr(jumin,1,6),'""YYYY"년 "MM"월 "DD"일"')
--  from users;
select to_date(substr(jumin,1,6),'YY-MM-DD')
  from users;
select substr(jumin,1,6)
from users;

--27. 이름, 포인트, 학년, 생년월일, 성별을 추가한다. 성별은 생년월일로 판단하며 마지막 숫자가1이면 남
--    2이면 여라고 표시한다. 
select
    name as 이름, point as 포인트, grade as 학년, to_date(substr(jumin,1,6),'yymmdd') as 생년월일,
    case when substr(jumin,-1,1)='1' then '남'
         when substr(jumin,-1,1)='2' then '여'
    end as 성별
from users;




--select * from users;
--select name as 이름, point as 포인트, grade as 학년, substr(jumin,1,6) as 생년월일
--  from users;
--  
--select name as 이름, point as 포인트, grade as 학년, substr(jumin,1,6) as 생년월일, replace(substr(jumin,-1,1),2,'여') as 성별
--  from users
-- where substr(jumin,-1,1) in (1,2);










-- 추가문제
-- 1. 모든 사람의 이름과 주민번호를 출력하고 나이를 출력하시오.


--2. 모든 사람의 정보를 출력하시오.
--   단 이름을 마스킹하시요.
--   마스킹 방법은 첫글자는 그대로 나머지는 *, *는 갯 수는 이름의 길이보다 하나 적다.
--   예) abcdef > a*****
-- 방법1:
select name,rpad(replace(name,substr(name,2),'*'),length(name),'*')
  from users;
-- 방법2:
select rpad(substr(name,1,1),length(name),'*')
from users;




select replace(name,substr(name,2),'*')  -- name에 2번째 자리부터 *표시.
from users;
select name,rpad(replace(name,substr(name,2),'*'),length(name),'*') -- rpad(값, 총 문자길이, 채울 문자)
  from users;






--3. 모든 사람의 정보를 출력하시오.
--    1학년은 이름뒤에 *, 2학년은 이름 뒤에 %, 3학년은 이름뒤에 #, 4학년은 이름뒤에 !를
--   추가하여 출력하시오.
--switch(grade){
--    case '1'
--        return concat(name,'*');
--    case '2'
--        return concat(name,'%');
--    case '3'
--        return concat(name,'#');
--    case '4'
--        return concat(name,'!');
--};

select no,
    case grade
        when '1' then  concat(name,'*')
        when '2' then  concat(name,'%')
        when '3' then  concat(name,'#')
        when '4' then  concat(name,'!')
    end as 이름
    ,addr,point,grade,jumin
from users;


--4. 남자만 출력하시오.
--select name,replace(substr(jumin,-1,1),'1','남자') -- replace( 문자열, 바꿀문자열, 바꿜문자열 )
--  from users
--where substr(jumin,-1,1)='1';
select * from users;
select 
    no,name,
    case 
        when substr(jumin,-1,1)='1' then '남자'
        when substr(jumin,-1,1)='2' then '여자'
    end as 성별
    ,addr,point,grade,jumin
from users;


