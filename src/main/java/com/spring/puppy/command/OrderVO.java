package com.spring.puppy.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * create table orderboard(
    ono NUMBER(8,0) PRIMARY KEY,
    writer varchar2(50),
    pno NUMBER(8,0) not null,
    addr varchar2(500),
    regdate DATE DEFAULT SYSDATE,
    amount NUMBER(8,0) not null
);

CREATE SEQUENCE order_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;*/
@Getter
@Setter
@ToString
public class OrderVO {
	
	private int ono;
	private String writer;
	private int pno;
	private String addr;
	private Timestamp regdate;
	private int amount;
}
