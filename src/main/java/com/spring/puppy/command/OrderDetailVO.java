package com.spring.puppy.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * create table orderDetail(
    odno NUMBER(8,0) PRIMARY KEY,
    ono NUMBER(8,0),
    pno NUMBER(8,0) not null,
    amount NUMBER(8,0) not null,
    pname varchar2(50) not null,
    price NUMBER(8,0) not null
);

CREATE SEQUENCE orderDetail_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
*/

@Getter
@Setter
@ToString
public class OrderDetailVO {
	private int odno;
	private int ono;
	private int pno;
	private int amount;
	private String pname;
	private int price;
}
