package com.tc.spring.files.domain;

public class Files {

	private int fileNo;
	private String memberId;
	private String fileName;
	private String filePath;
	private int qnaNo;
	private int shareNo;
	private int studyNo;
	private int pReqNo;

	public Files() {}

	public Files(int fileNo, String memberId, String fileName, String filePath, int qnaNo, int shareNo, int studyNo,
			int pReqNo) {
		super();
		this.fileNo = fileNo;
		this.memberId = memberId;
		this.fileName = fileName;
		this.filePath = filePath;
		this.qnaNo = qnaNo;
		this.shareNo = shareNo;
		this.studyNo = studyNo;
		this.pReqNo = pReqNo;
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

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getShareNo() {
		return shareNo;
	}

	public void setShareNo(int shareNo) {
		this.shareNo = shareNo;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public int getpReqNo() {
		return pReqNo;
	}

	public void setpReqNo(int pReqNo) {
		this.pReqNo = pReqNo;
	}

	@Override
	public String toString() {
		return "Files [fileNo=" + fileNo + ", memberId=" + memberId + ", fileName=" + fileName + ", filePath="
				+ filePath + ", qnaNo=" + qnaNo + ", shareNo=" + shareNo + ", studyNo=" + studyNo + ", pReqNo=" + pReqNo
				+ "]";
	}

	
}
