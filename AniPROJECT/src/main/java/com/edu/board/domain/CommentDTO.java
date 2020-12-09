package com.edu.board.domain;

import java.util.Date;


public class CommentDTO {
	
	private		int			cno;		//댓글 일련번호
	private		int			bno;		//댓글이 달릴 게시글의 일련번호
	private		String		content;	//댓글의 내용
	private		String		writer;		//댓글 작성자
	private		Date		reg_date;	//댓글 작성 일시
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "CommentDTO [cno=" + cno + ", bno=" + bno + ", content=" + content + ", writer=" + writer + ", reg_date="
				+ reg_date + "]";
	}
	
	
}
