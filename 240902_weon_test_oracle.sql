
create table hm(
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate
);

insert into hm values(1,'홍길동',45,'서울시', default);
insert into hm values(2,'일지매',50,'수원', default);
insert into hm values(3,'이지매',43,'서울', default);
-- select 절의 의미와 순서를 기억하라.

select * from hm;
select no, name from hm;
select count(*) from hm;

-- 문제1 : 모든 사람의 이름과 점수만 출력하시오.
select name as 이름, point
from hm;

-- 문제2 : 점수가 50점 이하인 사람의 이름과 점수를 출력하시오.
select name, point
from hm
where point < 50;

-- 문제3 : 점수가 50점 이하인 사람은 모두 몇명인가요?
select count(*)
from hm
where point<50;

-- 문제4 : 홍길동의 점수는 몇점 인가요?
select point
from hm
where name='홀길동';

-- 문제5 : 일지내의 모든 정보를 출력하세요.
select *
from hm
where name='일지매';
commit;

-- 한줄 삭제 : alt + shift + d

-- 정의 & 실행순서 ****
-- 코드 작성할때 실행 순서대로 체운다.
-- select : 3
-- from : 1
-- where : 2
-- order by : 4

-- 모든 회원을 출력하되, 가입 순서대로 출력하시오.

-- 문제:
-- 1. 모든 학생의 이름과 포인트를 출력합니다.
-- 포인트는 현재 포인트에서 10점 올려서 출력.
select name as 이름, point+10 as 포인트
from hm;

-- 2. 모든 학생의 이름과 포인트를 출력, 출력은 이름 현재 포인트 가산포인트
--  이름은 학생의 이름, 현재 포인트는 저장된 포인트 가산포인트는 +10점 올린 포인트.
select name as 이름, point as 현재포인트, point+10 as 가산포인트
  from hm;

commit;

-- 원본 데이터를 변경하는 명령어 update.
select * from hm;
update hm set point = 100, name = '김티처'; -- 조건이 없으면 모든 컬럼에 적용된다.
delete from hm; -- 릴레이션 속 모든 튜플이 삭제된다. (튜플 삭제 쿼리)
update hm set point = 100, name = '김티처' where name='홍길동';
-- where 절 : 튜플을 선정하기위한 조건.
delete from hm where name='홍길동'; -- 조건에 맞는 튜플만 삭제된다.

select * from hm;


select concat('이름','님') 이름 
from dual;

select * 
from hm
where point>20
order by point desc;

select sysdate from dual;

-------------------------------------------------------------
-- 오전 연습문제 : 
-- hm 테이블에서 작업하시오
-- 1. 이름뒤에 님을 붙에서 출력하시오, 모든 사람의 이름과 포인트를 출력합니다.
select concat(name,' 님') as 이름, point as 포인트
from hm;

-- 2. 모든 사람의 이름과 포인트와 동록일을 출력합니다.
-- 이때 가입순서에 따라 출력합니다. 가장 나중에 가입한 사람이 제일 먼저 출력. 가입날짜는 indate
select name as 이름, point as 포인트, indate as 등록일
from hm
order by indate desc; -- 최근 글부터 정렬 : desc;

-- 3. 포인트가 50이상인 사람의 이름과 정보를 출력합니다.
-- 정보는 no, 이름, 포인트가 합쳐진 문자열이다.
select name as 이름, concat(no,concat(name,point)) as 정보
from hm
where point>=50;

-- 4. 기준포인트는 60이다. 모든 회원이 기준포인트를 맞추기 위해서 부족한 포인트를 출력하시오... 출력은 이름, 현재 포인트, 부족한 포인트
select name as 이름, point as "현재 포인트", (60-point) as "부족한 포인트"
from hm
where point<60;













