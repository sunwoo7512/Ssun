package com.hoyeon.dto;

public class BoardDTO {
		private int board_no, board_cateNo, member_no, board_views, board_like_cnt, board_hate_cnt;
		private String member_name, board_title, board_content, board_file;
		private String board_date;
		public int getBoard_no() {
			return board_no;
		}
		public void setBoard_no(int board_no) {
			this.board_no = board_no;
		}
		public int getBoard_cateNo() {
			return board_cateNo;
		}
		public void setBoard_cateNo(int board_cateNo) {
			this.board_cateNo = board_cateNo;
		}
		public int getMember_no() {
			return member_no;
		}
		public void setMember_no(int member_no) {
			this.member_no = member_no;
		}
		public int getBoard_views() {
			return board_views;
		}
		public void setBoard_views(int board_views) {
			this.board_views = board_views;
		}
		public int getBoard_like_cnt() {
			return board_like_cnt;
		}
		public void setBoard_like_cnt(int board_like_cnt) {
			this.board_like_cnt = board_like_cnt;
		}
		public int getBoard_hate_cnt() {
			return board_hate_cnt;
		}
		public void setBoard_hate_cnt(int board_hate_cnt) {
			this.board_hate_cnt = board_hate_cnt;
		}
		public String getBoard_title() {
			return board_title;
		}
		public void setBoard_title(String board_title) {
			this.board_title = board_title;
		}
		public String getBoard_content() {
			return board_content;
		}
		public void setBoard_content(String board_content) {
			this.board_content = board_content;
		}
		public String getBoard_file() {
			return board_file;
		}
		public void setBoard_file(String board_file) {
			this.board_file = board_file;
		}
		public String getBoard_date() {
			return board_date;
		}
		public void setBoard_date(String board_date) {
			this.board_date = board_date;
		}
		public String getMember_name() {
			return member_name;
		}
		public void setMember_name(String member_name) {
			this.member_name = member_name;
		}
}
