create table shop_person(
sp_no number(4) primary key,
sp_category varchar2(30 char) not null,
sp_name varchar2(30 char) not null

);

create sequence shop_person_seq;

select *from shop_person;

drop table shop_person cascade constraint purge;
drop sequence shop_person_seq;

----------------------------------------------------
create table shop_office(
sp_no number(4) primary key,
sp_category varchar2(30 char) not null,
sp_name varchar2(30 char) not null


);
create sequence shop_office_seq;
select *from shop_office;


drop table shop_office cascade constraint purge;
drop sequence shop_office_seq;

select * from history23;


