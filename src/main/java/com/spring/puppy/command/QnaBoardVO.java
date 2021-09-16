package com.spring.puppy.command;
/*create table freeboard(
    bno NUMBER(8,0) PRIMARY KEY,
    writer varchar2(50) not null,
    title varchar2(300) not null,  
    content varchar2(2000) not null,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT NULL,
    view_cnt NUMBER(5,0)
);



create table commentboard(
    cno NUMBER(8,0) PRIMARY KEY,
    bno NUMBER(8,0),
    content varchar2(2000) not null,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT NULL
    
);
ALTER TABLE boastboard ADD COLUMN content varchar2(2000) not null;

create table boastboard(
    bbno NUMBER(8,0) PRIMARY KEY,
    title varchar2(300) not null,
    writer varchar2(50) not null,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT NULL,
    view_cnt NUMBER(5,0),
    like_cnt NUMBER(5,0)
    
);

create table qnaboard(
    qno NUMBER(8,0) PRIMARY KEY,
    writer varchar2(50) not null,
    content varchar2(2000) not null,
    answer varchar2(2000) not null,
    regdate DATE DEFAULT SYSDATE
);
 * 
 * CREATE SEQUENCE qnaboard_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
 * */

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaBoardVO {
	private int qno;
	private String writer;
	private String title;
	private String content;
	private String answer;
	private Timestamp regdate;

}
