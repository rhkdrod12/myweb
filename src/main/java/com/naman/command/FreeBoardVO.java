package com.naman.command;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FreeBoardVO {
	int bno;
	String title;
	String writer;
	String content;
	Timestamp regdate;
	Timestamp alterdate;
	
//  lombok에 의한 자동생성
	
//	public FreeBoardVO() {
//		// TODO Auto-generated constructor stub
//	}
//	
//	public FreeBoardVO(int bno, String title, String writer, String content, Timestamp regdate, Timestamp alterdate) {
//		super();
//		this.bno = bno;
//		this.title = title;
//		this.writer = writer;
//		this.content = content;
//		this.regdate = regdate;
//		this.alterdate = alterdate;
//	}
//
//	public int getbno() {
//		return bno;
//	}
//	public void setbno(int bno) {
//		this.bno = bno;
//	}
//	public String getTitle() {
//		return title;
//	}
//	public void setTitle(String title) {
//		this.title = title;
//	}
//	public String getWriter() {
//		return writer;
//	}
//	public void setWriter(String writer) {
//		this.writer = writer;
//	}
//	public String getContent() {
//		return content;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
//	public Timestamp getRegdate() {
//		return regdate;
//	}
//	public void setRegdate(Timestamp regdate) {
//		this.regdate = regdate;
//	}
//	public Timestamp getAlterdate() {
//		return alterdate;
//	}
//	public void setAlterdate(Timestamp alterdate) {
//		this.alterdate = alterdate;
//	}
//
//
//	@Override
//	public String toString() {
//		return "FreeBoardVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", content=" + content
//				+ ", regdate=" + regdate + ", alterdate=" + alterdate + "]";
//	}
	
	
}
