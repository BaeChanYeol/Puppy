package com.spring.puppy.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE users(
    id VARCHAR2(50) PRIMARY KEY,
    pw VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    phone VARCHAR2(50) NOT NULL,
    birth VARCHAR2(50,
    email VARCHAR2(50),
    addrBasic VARCHAR2(300),
    addrDetail VARCHAR2(300),
    addrZipNum VARCHAR2(50),
    regDate DATE DEFAULT sysdate
);
 
 */

@Getter
@Setter
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
}
