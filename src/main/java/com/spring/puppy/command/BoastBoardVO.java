package com.spring.puppy.command;

import java.sql.Timestamp;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/* 
 CREATE TABLE boastreply(
    rno NUMBER(10, 0), --댓글번호 (PK)
    bbno NUMBER(10, 0), --글번호 (FK)
    reply VARCHAR2(1000), -- 내용
    reply_id VARCHAR2(50), --글쓴이
    reply_pw VARCHAR2(50), --비밀번호
    reply_date DATE DEFAULT SYSDATE, --등록일
    update_date DATE DEFAULT NULL
);

CREATE SEQUENCE boastreply_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;
    
create table boastboard(
    bbno NUMBER(8,0) PRIMARY KEY,
    title varchar2(300) not null,
    writer varchar2(50),
    content varchar2(2000) not null,
    regdate DATE DEFAULT SYSDATE,
    updatedate DATE DEFAULT NULL,
    view_cnt NUMBER(5,0),
    like_cnt NUMBER(5,0),
    uploadPath varchar2(300),
    fileRealName varchar2(50),
    photoSize varchar2(300),
    fileLoca varchar2(50),
    fileExtension varchar2(300)
);
    
CREATE SEQUENCE boastboard_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 1000
    NOCYCLE
    NOCACHE;

ALTER TABLE boastreply 
ADD CONSTRAINT boastreply_pk PRIMARY KEY(rno);

ALTER TABLE boastreply
ADD CONSTRAINT boastreply_fk FOREIGN KEY(bbno)
REFERENCES boastboard(bbno);

create table boastfile(
    bbno NUMBER(8,0) PRIMARY KEY,
    uploadPath varchar2(300),
    fileRealName varchar2(500),
    fileLoca varchar2(50),
    fileExtension varchar2(300)
    );

CREATE TABLE user_like(
    id VARCHAR2(50),
    bbno NUMBER(8,0)
);

SELECT boastboard_seq.CURRVAL FROM dual; 
  
 */

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BoastBoardVO {
	
	private int bbno;
    private String title;
    private String writer;
    private String content;
    private Timestamp regdate;
    private Timestamp updatedate;
    private int view_cnt;
    private int like_cnt;
    private String uploadPath;
    private String fileRealName;
    private long photoSize;
    private String fileLoca;
    private String fileExtension;
    private boolean isNewMark;

}
