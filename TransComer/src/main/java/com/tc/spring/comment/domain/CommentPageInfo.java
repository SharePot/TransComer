package com.tc.spring.comment.domain;

public class CommentPageInfo {
	
	private int commentCurrentPage;
	private int commentListCount;
	private int commentPageLimit;
	private int commentMaxPage;
	private int commentStartPage;
	private int commentEndPage;
	private int commentBoardLimit;
	
	public CommentPageInfo() {}

	public CommentPageInfo(int commentCurrentPage, int commentListCount, int commentPageLimit, int commentMaxPage,
			int commentStartPage, int commentEndPage, int commentBoardLimit) {
		super();
		this.commentCurrentPage = commentCurrentPage;
		this.commentListCount = commentListCount;
		this.commentPageLimit = commentPageLimit;
		this.commentMaxPage = commentMaxPage;
		this.commentStartPage = commentStartPage;
		this.commentEndPage = commentEndPage;
		this.commentBoardLimit = commentBoardLimit;
	}

	/**
	 * @return the commentCurrentPage
	 */
	public int getCommentCurrentPage() {
		return commentCurrentPage;
	}

	/**
	 * @param commentCurrentPage the commentCurrentPage to set
	 */
	public void setCommentCurrentPage(int commentCurrentPage) {
		this.commentCurrentPage = commentCurrentPage;
	}

	/**
	 * @return the commentListCount
	 */
	public int getCommentListCount() {
		return commentListCount;
	}

	/**
	 * @param commentListCount the commentListCount to set
	 */
	public void setCommentListCount(int commentListCount) {
		this.commentListCount = commentListCount;
	}

	/**
	 * @return the commentPageLimit
	 */
	public int getCommentPageLimit() {
		return commentPageLimit;
	}

	/**
	 * @param commentPageLimit the commentPageLimit to set
	 */
	public void setCommentPageLimit(int commentPageLimit) {
		this.commentPageLimit = commentPageLimit;
	}

	/**
	 * @return the commentMaxPage
	 */
	public int getCommentMaxPage() {
		return commentMaxPage;
	}

	/**
	 * @param commentMaxPage the commentMaxPage to set
	 */
	public void setCommentMaxPage(int commentMaxPage) {
		this.commentMaxPage = commentMaxPage;
	}

	/**
	 * @return the commentStartPage
	 */
	public int getCommentStartPage() {
		return commentStartPage;
	}

	/**
	 * @param commentStartPage the commentStartPage to set
	 */
	public void setCommentStartPage(int commentStartPage) {
		this.commentStartPage = commentStartPage;
	}

	/**
	 * @return the commentEndPage
	 */
	public int getCommentEndPage() {
		return commentEndPage;
	}

	/**
	 * @param commentEndPage the commentEndPage to set
	 */
	public void setCommentEndPage(int commentEndPage) {
		this.commentEndPage = commentEndPage;
	}

	/**
	 * @return the commentBoardLimit
	 */
	public int getCommentBoardLimit() {
		return commentBoardLimit;
	}

	/**
	 * @param commentBoardLimit the commentBoardLimit to set
	 */
	public void setCommentBoardLimit(int commentBoardLimit) {
		this.commentBoardLimit = commentBoardLimit;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CommentPageInfo [commentCurrentPage=" + commentCurrentPage + ", commentListCount=" + commentListCount
				+ ", commentPageLimit=" + commentPageLimit + ", commentMaxPage=" + commentMaxPage
				+ ", commentStartPage=" + commentStartPage + ", commentEndPage=" + commentEndPage
				+ ", commentBoardLimit=" + commentBoardLimit + "]";
	}
	
	

}
