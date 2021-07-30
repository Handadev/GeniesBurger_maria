package com.myweb.domain;

import java.util.List;

public class ReviewVO {
	private int rno;
	private int pno;
	private int purno;
	private String email;
	private String title;
	private String rcontent;
	private String rdate;
	private String ruuid;
	private String rsavedir;
	private String rfname;
	private int rftype;
	private List<adCommentVO> clist;

	public int getPurno() {
		return purno;
	}

	public void setPurno(int purno) {
		this.purno = purno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public List<adCommentVO> getClist() {
		return clist;
	}

	public void setClist(List<adCommentVO> clist) {
		this.clist = clist;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getRuuid() {
		return ruuid;
	}

	public void setRuuid(String ruuid) {
		this.ruuid = ruuid;
	}

	public String getRsavedir() {
		return rsavedir;
	}

	public void setRsavedir(String rsavedir) {
		this.rsavedir = rsavedir;
	}

	public String getRfname() {
		return rfname;
	}

	public void setRfname(String rfname) {
		this.rfname = rfname;
	}

	public int getRftype() {
		return rftype;
	}

	public void setRftype(int rftype) {
		this.rftype = rftype;
	}

}
