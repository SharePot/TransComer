package com.tc.spring.files.domain;

public class Files {

	private int fileNo;
	private int memberNo;
	private String fileName;
	private String filePath;
	private String memberId;
	
	public Files() {}

	public Files(int fileNo, int memberNo, String fileName, String filePath, String memberId) {
		super();
		this.fileNo = fileNo;
		this.memberNo = memberNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.memberId = memberId;
	}

	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
