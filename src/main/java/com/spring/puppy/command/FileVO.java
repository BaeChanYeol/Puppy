package com.spring.puppy.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileVO {
	
	private int bbno;
	private String uploadPath;
	private String fileRealName;
	private String fileLoca;
	private String fileExtension;
	
}
