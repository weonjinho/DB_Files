
create table hm(
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate
);

insert into hm values(1,'ȫ�浿',45,'�����', default);
insert into hm values(2,'������',50,'����', default);
insert into hm values(3,'������',43,'����', default);
-- select ���� �ǹ̿� ������ ����϶�.

select * from hm;
select no, name from hm;
select count(*) from hm;

-- ����1 : ��� ����� �̸��� ������ ����Ͻÿ�.
select name as �̸�, point
from hm;

-- ����2 : ������ 50�� ������ ����� �̸��� ������ ����Ͻÿ�.
select name, point
from hm
where point < 50;

-- ����3 : ������ 50�� ������ ����� ��� ����ΰ���?
select count(*)
from hm
where point<50;

-- ����4 : ȫ�浿�� ������ ���� �ΰ���?
select point
from hm
where name='Ȧ�浿';

-- ����5 : �������� ��� ������ ����ϼ���.
select *
from hm
where name='������';
commit;

-- ���� ���� : alt + shift + d

-- ���� & ������� ****
-- �ڵ� �ۼ��Ҷ� ���� ������� ü���.
-- select : 3
-- from : 1
-- where : 2
-- order by : 4

-- ��� ȸ���� ����ϵ�, ���� ������� ����Ͻÿ�.

-- ����:
-- 1. ��� �л��� �̸��� ����Ʈ�� ����մϴ�.
-- ����Ʈ�� ���� ����Ʈ���� 10�� �÷��� ���.
select name as �̸�, point+10 as ����Ʈ
from hm;

-- 2. ��� �л��� �̸��� ����Ʈ�� ���, ����� �̸� ���� ����Ʈ ��������Ʈ
--  �̸��� �л��� �̸�, ���� ����Ʈ�� ����� ����Ʈ ��������Ʈ�� +10�� �ø� ����Ʈ.
select name as �̸�, point as ��������Ʈ, point+10 as ��������Ʈ
  from hm;

commit;

-- ���� �����͸� �����ϴ� ��ɾ� update.
select * from hm;
update hm set point = 100, name = '��Ƽó'; -- ������ ������ ��� �÷��� ����ȴ�.
delete from hm; -- �����̼� �� ��� Ʃ���� �����ȴ�. (Ʃ�� ���� ����)
update hm set point = 100, name = '��Ƽó' where name='ȫ�浿';
-- where �� : Ʃ���� �����ϱ����� ����.
delete from hm where name='ȫ�浿'; -- ���ǿ� �´� Ʃ�ø� �����ȴ�.

select * from hm;


select concat('�̸�','��') �̸� 
from dual;

select * 
from hm
where point>20
order by point desc;

select sysdate from dual;

-------------------------------------------------------------
-- ���� �������� : 
-- hm ���̺��� �۾��Ͻÿ�
-- 1. �̸��ڿ� ���� �ٿ��� ����Ͻÿ�, ��� ����� �̸��� ����Ʈ�� ����մϴ�.
select concat(name,' ��') as �̸�, point as ����Ʈ
from hm;

-- 2. ��� ����� �̸��� ����Ʈ�� �������� ����մϴ�.
-- �̶� ���Լ����� ���� ����մϴ�. ���� ���߿� ������ ����� ���� ���� ���. ���Գ�¥�� indate
select name as �̸�, point as ����Ʈ, indate as �����
from hm
order by indate desc; -- �ֱ� �ۺ��� ���� : desc;

-- 3. ����Ʈ�� 50�̻��� ����� �̸��� ������ ����մϴ�.
-- ������ no, �̸�, ����Ʈ�� ������ ���ڿ��̴�.
select name as �̸�, concat(no,concat(name,point)) as ����
from hm
where point>=50;

-- 4. ��������Ʈ�� 60�̴�. ��� ȸ���� ��������Ʈ�� ���߱� ���ؼ� ������ ����Ʈ�� ����Ͻÿ�... ����� �̸�, ���� ����Ʈ, ������ ����Ʈ
select name as �̸�, point as "���� ����Ʈ", (60-point) as "������ ����Ʈ"
from hm
where point<60;













