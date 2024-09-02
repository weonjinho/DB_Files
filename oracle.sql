select * from aaa;
create table abc(
id varchar2(10),
password varchar2(8)
);
-- ctrl + enter Äõ¸® ½ÇÇà
select * from abc;
insert into abc values('kkk','1234');

commit;

alter table abc add aaa varchar2(10);
select * from abc;
commit;

create table xyz(
id varchar2(10)
);

select * from xyx;