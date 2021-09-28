package com.spring.puppy.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * create table product(
    pno NUMBER(8,0) PRIMARY KEY,
    pname varchar2(50),
    price NUMBER(8,0) not null,
    cate varchar2(300) not null,
    amount NUMBER(8,0),
    view_cnt NUMBER(5,0),
    opt varchar2(50) null
);

CREATE SEQUENCE product_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;*/
@Getter
@Setter
@ToString
public class ProductVO {
	private int pno;
	private String pname;
	private int price;
	private String cate;
	private int viewCnt;
	private int amount;
	private String opt;
	
}
