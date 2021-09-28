package com.spring.puppy.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE users(
    id VARCHAR2(50) PRIMARY KEY,
    pw VARCHAR2(100) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(50) NOT NULL,
    birth VARCHAR2(50),
    email VARCHAR2(50),
    addr_basic VARCHAR2(300),
    addr_detail VARCHAR2(300),
    addr_zipnum VARCHAR2(50),
    regDate DATE DEFAULT sysdate
);
 
 ALTER TABLE users
ADD session_id VARCHAR2(80)
DEFAULT 'none' NOT NULL;

ALTER TABLE users
ADD limit_time DATE;
 
 
 */

@Setter
@Getter
@ToString
public class UserVO {

	private String id;
	private String pw;
	private String name;
	private String birth;
	private String email;
	private String phone;
	private String addrBasic;
	private String addrDetail;
	private String addrZipNum;
	private Timestamp regDate;
	
	private String sessionId;
	private Timestamp limitTime;
	
	private boolean idRemember;
	private boolean autoLogin;
}
