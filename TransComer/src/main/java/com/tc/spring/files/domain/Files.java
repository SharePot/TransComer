package com.tc.spring.files.domain;

public class Files {

	private int fileNo;
	private String memberId;
	private String fileName;
	private String filePath;

	public Files() {}

	public Files(int fileNo, String memberId, String fileName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.memberId = memberId;
		this.fileName = fileName;
		this.filePath = filePath;
	}

	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	
}
