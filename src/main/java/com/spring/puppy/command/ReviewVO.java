package com.spring.puppy.command;
/*
 * create table reviewboard(
    revno number(8,0) primary key,
    pno number(8,0) not null, 
    writer varchar2(50),
    content varchar2(1000),
    review_date date default sysdate
);

CREATE SEQUENCE reviewboard_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;*/

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class ReviewVO {
	private int revno;
	private int pno;
	private String writer;
	private String content;
	private Timestamp reviewDate;
	

}
