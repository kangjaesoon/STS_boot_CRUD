package com.example.Study.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {


	private Long num;
	private Date regDate;
	private String title;
	private String contents;
}

