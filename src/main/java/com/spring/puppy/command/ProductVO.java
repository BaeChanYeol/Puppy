package com.spring.puppy.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 create table product(
    pno NUMBER(8,0) PRIMARY KEY,
    pname varchar2(50) not null,
    price NUMBER(8,0) not null,
    cate varchar2(300) not null,
    amount NUMBER(8,0),
    zzim NUMBER(5,0), 
    opt varchar2(50),
    type varchar2(30)
);

insert into product(pno, pname, price, cate, opt)
values(1, '애견 칫솔', 5400 ,'위생', '노란색/초록색/파란색');
    

insert into product(pno, pname, price, cate, opt)
values(2,'배변 패드', 6900 ,'위생', '소형/중형/대형');

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
	private String type;
	private String pname;
	private int price;
	private String cate;
	private int zzim;
	private int amount;
	private String opt;
	private String uploadPath;
    private String fileRealName;
    private long photoSize;
    private String fileLoca;
    private String fileExtension;
	
}
