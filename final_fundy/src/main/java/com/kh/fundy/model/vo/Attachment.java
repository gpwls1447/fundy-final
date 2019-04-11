package com.kh.fundy.model.vo;

	import java.util.Date;

	public class Attachment {
		
		private int noticeNo;
		private String originalFileName;
		private String renamedFileName;
		
		
		public Attachment() {
			// TODO Auto-generated constructor stub
		}


		public Attachment(int noticeNo, String originalFileName, String renamedFileName) {
			super();
			this.noticeNo = noticeNo;
			this.originalFileName = originalFileName;
			this.renamedFileName = renamedFileName;
		}


		public int getNoticeNo() {
			return noticeNo;
		}


		public void setNoticeNo(int noticeNo) {
			this.noticeNo = noticeNo;
		}


		public String getOriginalFileName() {
			return originalFileName;
		}


		public void setOriginalFileName(String originalFileName) {
			this.originalFileName = originalFileName;
		}


		public String getRenamedFileName() {
			return renamedFileName;
		}


		public void setRenamedFileName(String renamedFileName) {
			this.renamedFileName = renamedFileName;
		}


		@Override
		public String toString() {
			return "Attachment [noticeNo=" + noticeNo + ", originalFileName=" + originalFileName + ", renamedFileName="
					+ renamedFileName + "]";
		}
		
		
	
	}


