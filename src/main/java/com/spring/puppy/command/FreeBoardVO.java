package com.spring.puppy.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 	create table freeboard(
       bno NUMBER(8,0) PRIMARY KEY,
       writer varchar2(50),
       title varchar2(300),  
       content varchar2(2000),
       regdate DATE DEFAULT SYSDATE,
       updatedate DATE DEFAULT NULL,
       viewcnt NUMBER(5,0) DEFAULT 0,
        uploadpath VARCHAR2(300),
        filerealname VARCHAR2(50),
        photosize VARCHAR2(300),
        fileLoca VARCHAR2(50),
        fileExtension VARCHAR2(300)
   );
	CREATE SEQUENCE freeboard_seq
	    start with 1
	    increment by 1
	    maxvalue 5000
	    nocycle
	    nocache;

 */


@Getter
@Setter
@ToString
public class FreeBoardVO {
	
	private int bno;
	private String writer;
	private String title;
	private String content;
	private Timestamp regdate;
	private Timestamp updatedate;
	private int viewCnt;
	private boolean isNewMark;
	private String uploadPath;
    private String fileRealName;
    private long photoSize;
    private String fileLoca;
    private String fileExtension;
	

}
