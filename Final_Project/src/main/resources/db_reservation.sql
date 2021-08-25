create table Receiver_Information(
receiver_no number(3) primary key,
receiver_name varchar2(20 char) not null,
receiver_phone char(11 char) not null,
receiver_addr varchar2 (200 char) not null
);

create sequence Receiver_Information_seq;

drop table  Receiver_Information cascade constraint purge;
drop sequence Receiver_Information_seq;


create table Reservation_Product(
product_no number(3) primary key,
product_name varchar2(20 char) not null,
product_price number(5) not null,
product_volume1 char(11 char) not null,
product_volume2 char(11 char) not null,
product_uniqueness char(11 char) not null,
register_date date not null
);
create sequence Reservation_Product_seq;

drop table  Reservation_Product cascade constraint purge;
drop sequence Reservation_Product_seq;

select * from Receiver_Information;
select * from Reservation_Product;
