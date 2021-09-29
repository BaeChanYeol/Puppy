package com.spring.puppy.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * create table basket(
    jno NUMBER(8,0) PRIMARY KEY,
    writer varchar2(50),
    pno NUMBER(8,0) not null,
    pname varchar2(50) not null,
    price NUMBER(8,0) not null,
    amount NUMBER(8,0) not null
);
CREATE SEQUENCE basket_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;*/
@Getter
@Setter
@ToString
public class CartVO {
	private int jno; 
	private String writer;
	private int pno;
	private String pname;
	private int price;
	private int amount;
	private String opt;
	
}
