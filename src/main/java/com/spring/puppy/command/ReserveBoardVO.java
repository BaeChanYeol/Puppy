package com.spring.puppy.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*create table reserveboard(

    res_no NUMBER(10,0),
    service VARCHAR2(300) NOT NULL,
    chk_in DATE DEFAULT NULL,
    chk_out DATE DEFAULT NULL,
    breed VARCHAR2(300) NOT NULL,
    age NUMBER(4,0),
    writer VARCHAR2(50)
);

CREATE SEQUENCE reserveboard_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;*/
@Getter
@Setter
@ToString
public class ReserveBoardVO {
	
	private int resNo;
	private String service;
	private String chkIn;
	private String chkOut;
	private String breed;
	private int age;
	private String writer;
	
}
