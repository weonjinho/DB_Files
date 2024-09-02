-- 1. ���̺� ����� - ���� ������ �����ؼ� ���̺��� �����ϼ���
create table users(
    no int primary key,
    name varchar2(10),
    addr varchar2(10),
    point number,
    grade varchar2(1),
    jumin varchar2(8)
);



-- 2. ���̺� Ʃ�� ���� - ���� �����������ؼ� Ʃ���� �����ϼ���.
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
--3. ����Ǯ��
--���κ��� ���� ������ Ǯ��, ������ ������ ���� ���纸��
--������ ������ ��ŭ ����� �ۼ��Ͽ� ���κ��� �����մϴ�.

--��ǥ����  
--�˻��� : ����Ŭ where ����
--1. ��� ������� �̸��� ������ ��������� �˻��Ͻÿ�.  
select name as �̸�, point as ����, substr(jumin,1,6) as �������
  from users;

--2. 80�� �̻��� ����� �̸��� �ּ�, ������ �˻��Ͻÿ�.
select name as �̸�, addr as �ּ�, point as ����
from users
where point>=80;

--3. �̸��� kim���� ���۵Ǵ� ����� �̸��� �ּҿ� ������ �˻��Ͻÿ�.
select name as �̸�, addr as wnth
from users
where name like 'kim%';

--4. ���� �������� +10���� ������ ������ ����Ͻÿ�.
--   ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.
select point+10 as "������ ����"
from users;

--5. 1�г��� ������ +1���� �÷��� ����ϼ���. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select point+1 as "����� ����"
from users
where grade=1;

--6. B����� ȹ���� ����� �̸�, �ּ�, ������ ����ϼ��� (B��� 80�� �̻� 90�� �̸��Դϴ�)
select name as �̸�, addr as �ּ�, point as ����
  from users
 where point between 80 and 90;

--7. ���� ��� �� NULL�� ���� �Է����� ���� ���Դϴ�.
--   �ּҸ� �Է����� ���� �л��� �̸���, �ּ�, �г�, ����, �ֹι�ȣ�� ����ϼ���
select name as �̸�, addr as �ּ�, grade as �г�, point as ����, jumin as �ֹι�ȣ
  from users
 where addr is null;

--8. 4�г��� ������ 10%�� �ø� ������ ����ϼ���.
--   (��, ���������ʹ� �ݿ����� �ʴ´�)
select point+(point*0.1) as "�ø� ����"
  from users
 where grade=4;


--9. ������ ���� �л����� ����ϼ���.  ��ȣ, �̸�, �ּ�, ����Ʈ
select no as ��ȣ, name as �̸�, addr as �ּ�, point as ����Ʈ
  from users
 order by point asc;
-- �⺻�� : asc;



--10. �г��� ������������ �����Ͻÿ�, �� �г��� ���� �� ��� ����Ʈ�� ���� ����� ���� ��µ˴ϴ�.
--     ����� ��ȣ, �̸�, �г�, ����Ʈ 
select *
  from users
 order by grade asc, point desc;


  
--11. ������ �������� -10�� ������ ��� 80�� �̻��� ����� �̸��� ����, ������ ��� ������ ����ϼ���.?
select name as �̸�, point as ����, point-10 as "������ ���"
  from users
 where (point-10)>=80;
--12. 2�г��� ��� �л��� ����Ͻÿ� . ��� �÷�����
--    �̸� �ּ� �г����� ����Ͻÿ�. ���⼭ �̸��� name�÷�, �ּҴ� addr�÷�, �г��� grade�÷��� �ǹ�
select name as �̸�, addr as �ּ�, grade as �г�
  from users
 where grade=2;


--�߰�����  -- ����Ŭ �Լ��� �˻��� ������
--13. �л��� �� ����Դϱ�? 
select count(name) as "�л� �ο���"
  from users;
--14. 1�г��� �� ����Դϱ�?
select count(name) as "1�г� �ο���"
  from users
 where grade=1;
--15. ��� �л��� �̸��� �г��� ����Ͻÿ�. �� �̸��� ��� �ҹ��ڷθ� ����Ͻÿ�. 
select lower(name) as �̸�, grade as �г�
  from users;
--16. 2�г� �л��� �̸��� �г��� ����Ͻÿ�. ������ ���ؼ� �ּҴ� �ձ��� 2���ڸ� ����Ͻÿ�.
select name as �̸�, grade as �г�, substr(addr,1,2) as �ּ�
  from users
 where grade=2;

--17. ��� �л��� ������ ���� �ڸ��� �����Ͻÿ�. - �ݿø� ���� (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
--select substr(point,-2), point
--  from users;
select substr(point/10,3,1),point   -- point/10�� ���� 3��° ���� ���� 1�� �����Ѵ�.
  from users;

--18. ��� �л��� ������ �ݿø��Ͽ� ����Ͻÿ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select round(point,0) as "�ݿø� �� ����"
  from users;
--19. 2�г��� ��� ����Դϱ�?
select count(name) as "2�г� �ο���"
  from users
 where grade=2;

--20. 1�г��� 80�� �̻��� ����Դϱ�?
select count(name) as "1�г��� 80�� �̻��� �ο���"
  from users
 where grade=1 and point>=80;

--21. 3�г��� ����� �����Դϱ�?
select avg(point) as "3�г� ��� ����"
  from users
 where grade=3;

--22. ��ü �л� �� �ְ����� �����Դϱ�?
select max(point) as "��ü �л� �� �ְ���"
  from users;

--23. 2�г� �� ���� ���� ������ ȹ���� ������ �����Դϱ�?
select min(point) as "2�г� �� ���� ���� ����"
  from users
group by grade
having grade=2;



--��Ǫ�� ����
--24. ������ ���ؼ� �ּҸ� ��� ������� �ʰ� ���� �� ���ڸ� ����ϰ� �ڿ� *�� �ϳ� ������.
--   (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)  ?
--   ��)suwon  >> su*
select replace(addr,substr(addr,3),'*')
  from users;

--25. �̸��� �� �տ� *�� �� �ڿ���*�� ������ ����Ѵ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
-- replace( '�÷���or���ڿ�', 'ã������', '��ȯ����');
--select replace(replace(name,substr(name,-1,1),'*'),substr(replace(name,substr(name,-1,1),'*'),1,1),'*') as "*�̸�*" ,name as �̸�
--  from users;
select concat(concat('*',name),'*')
  from users;

--26. ��������� �״�� ������� ����
--    xx �� xx �� xx �� �������� ����Ѵ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�. ������ �����Ѵ�)
--select to_char(substr(jumin,1,6),'""YYYY"�� "MM"�� "DD"��"')
--  from users;
select to_date(substr(jumin,1,6),'YY-MM-DD')
  from users;
select substr(jumin,1,6)
from users;

--27. �̸�, ����Ʈ, �г�, �������, ������ �߰��Ѵ�. ������ ������Ϸ� �Ǵ��ϸ� ������ ���ڰ�1�̸� ��
--    2�̸� ����� ǥ���Ѵ�. 
select
    name as �̸�, point as ����Ʈ, grade as �г�, to_date(substr(jumin,1,6),'yymmdd') as �������,
    case when substr(jumin,-1,1)='1' then '��'
         when substr(jumin,-1,1)='2' then '��'
    end as ����
from users;




--select * from users;
--select name as �̸�, point as ����Ʈ, grade as �г�, substr(jumin,1,6) as �������
--  from users;
--  
--select name as �̸�, point as ����Ʈ, grade as �г�, substr(jumin,1,6) as �������, replace(substr(jumin,-1,1),2,'��') as ����
--  from users
-- where substr(jumin,-1,1) in (1,2);










-- �߰�����
-- 1. ��� ����� �̸��� �ֹι�ȣ�� ����ϰ� ���̸� ����Ͻÿ�.


--2. ��� ����� ������ ����Ͻÿ�.
--   �� �̸��� ����ŷ�Ͻÿ�.
--   ����ŷ ����� ù���ڴ� �״�� �������� *, *�� �� ���� �̸��� ���̺��� �ϳ� ����.
--   ��) abcdef > a*****
-- ���1:
select name,rpad(replace(name,substr(name,2),'*'),length(name),'*')
  from users;
-- ���2:
select rpad(substr(name,1,1),length(name),'*')
from users;




select replace(name,substr(name,2),'*')  -- name�� 2��° �ڸ����� *ǥ��.
from users;
select name,rpad(replace(name,substr(name,2),'*'),length(name),'*') -- rpad(��, �� ���ڱ���, ä�� ����)
  from users;






--3. ��� ����� ������ ����Ͻÿ�.
--    1�г��� �̸��ڿ� *, 2�г��� �̸� �ڿ� %, 3�г��� �̸��ڿ� #, 4�г��� �̸��ڿ� !��
--   �߰��Ͽ� ����Ͻÿ�.
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
    end as �̸�
    ,addr,point,grade,jumin
from users;


--4. ���ڸ� ����Ͻÿ�.
--select name,replace(substr(jumin,-1,1),'1','����') -- replace( ���ڿ�, �ٲܹ��ڿ�, �ٲ乮�ڿ� )
--  from users
--where substr(jumin,-1,1)='1';
select * from users;
select 
    no,name,
    case 
        when substr(jumin,-1,1)='1' then '����'
        when substr(jumin,-1,1)='2' then '����'
    end as ����
    ,addr,point,grade,jumin
from users;


