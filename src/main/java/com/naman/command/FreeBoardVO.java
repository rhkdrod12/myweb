package com.naman.command;

import java.sql.Timestamp;

public class FreeBoardVO {
	int num;
	String title;
	String writer;
	String content;
	Timestamp regdate;
	Timestamp alterdate;
	
	public FreeBoardVO() {
		// TODO Auto-generated constructor stub
	}
	
	public FreeBoardVO(int num, String title, String writer, String content, Timestamp regdate, Timestamp alterdate) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.alterdate = alterdate;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getAlterdate() {
		return alterdate;
	}
	public void setAlterdate(Timestamp alterdate) {
		this.alterdate = alterdate;
	}


	@Override
	public String toString() {
		return "FreeBoardVO [num=" + num + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", regdate=" + regdate + ", alterdate=" + alterdate + "]";
	}
	
	
}
