package com.hoyeon.dto;

import java.sql.Date;

public class BoardDTO {
		private int board_no, board_cateNo, member_no, board_view, board_like, board_hate;
		private String member_name, board_title, board_content, board_file;
		private Date board_date;
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
		public int getBoard_view() {
			return board_view;
		}
		public void setBoard_view(int board_view) {
			this.board_view = board_view;
		}
		public int getBoard_like() {
			return board_like;
		}
		public void setBoard_like(int board_like) {
			this.board_like = board_like;
		}
		public int getBoard_hate() {
			return board_hate;
		}
		public void setBoard_hate(int board_hate) {
			this.board_hate = board_hate;
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
		public Date getBoard_date() {
			return board_date;
		}
		public void setBoard_date(Date board_date) {
			this.board_date = board_date;
		}
		public String getMember_name() {
			return member_name;
		}
		public void setMember_name(String member_name) {
			this.member_name = member_name;
		}
}
