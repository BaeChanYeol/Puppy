package com.spring.puppy.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * create table productqna(
    pqno number(8,0) primary key,
    pno number(8,0) not null, 
    writer varchar2(50),
    content varchar2(1000),
    regdate date default sysdate
);

CREATE SEQUENCE productqna_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;*/
@Getter
@Setter
@ToString
public class ProductQnaVO {
	private int pqno;
	private int pno;
	private String writer;
	private String content;
	private Timestamp regdate;
}
