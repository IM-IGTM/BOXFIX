create table boxfix_member(
b_id varchar2(20 char) primary key,
b_pw varchar2(20 char) not null,
b_name varchar2(10 char) not null,
b_birth varchar2(200 char) not null,
b_gender char(2 char) not null,
b_mail varchar2(200 char) not null,
b_addr varchar2 (200 char) not null,
b_phone char(11 char) not null
);

select * from boxfix_member;

insert into boxfix_member values('nyanya', '1234', '임시', '970727', '여성', 'sunmki7827@naver.com', '경기도 광주시', '01027686992');
insert into boxfix_member values('admin', 'admin', '관리자', '970727', '여성', 'sunmki7827@naver.com', '경기도 광주시', '01027686992');

drop table boxfix_member cascade constraint purge; 

create table boxfix_company_member(
c_id varchar2(20 char) primary key,
c_pw varchar2(20 char) not null,
c_name varchar2(10 char) not null,
c_mail varchar2(200 char) not null,
c_phone char(11 char) not null,
c_topname varchar2(20 char) not null,
c_comnumber char(20 char)
);

insert into boxfix_company_member values('coffee1234', 'admin', '기업회원', 'sunmki7827@naver.com', '01027686992','커피쇼핑몰','12345678');
select * from boxfix_company_member;

----------------------------------- QandA 연결

create table QandA(
q_no number(4) primary key,
q_title varchar2 (200 char) not null,
q_contents varchar2 (200 char) not null,
q_date date not null,
q_writer varchar2(10 char) not null,
constraint qanda_writerrr
foreign key(q_writer) references boxfix_member(b_id)
on delete cascade
);

drop table QandA cascade constraint purge;
drop sequence QandA_seq;

select * from QandA;

create sequence QandA_seq;


create table QandA_reply(
	qar_no number(5) primary key,
	qar_q_no number(4) not null, 
	qar_q_title varchar2(200 char) not null,
	qar_q_writer varchar2(10 char) not null,
	qar_q_comment varchar2(200 char) not null,
	qar_date date not null,
	
	constraint qna_re
	foreign key(qar_q_no) references QandA(q_no)
	on delete cascade,
	
	constraint qna_writeHehe
	foreign key(qar_q_writer) references boxfix_member(b_id)
	on delete cascade
);

create sequence QandA_reply_seq;

select * from QandA_reply;

drop table QandA_reply cascade constraint purge;
drop sequence QandA_reply_seq;
