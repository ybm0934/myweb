package yong.board;

import java.sql.Timestamp;

public class BoardDTO {

	private int no; // 글 번호
	private String name; // 작성자
	private String pwd; // 비밀번호
	private String title; // 글 제목
	private String content; // 내용
	private int count; // 조회수
	private Timestamp regdate; // 등록일
	private char del; // 글 삭제 여부
	private int groupno; // 답변형 그룹 번호
	private int step; // 답변형 글 단계
	private int sortno; // 답변형 글 정렬
	private String fileName; // 파일명
	private double fileSize; // 파일 크기
	private int downCount; // 다운로드 횟수

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public char getDel() {
		return del;
	}

	public void setDel(char del) {
		this.del = del;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getSortno() {
		return sortno;
	}

	public void setSortno(int sortno) {
		this.sortno = sortno;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public double getFileSize() {
		return fileSize;
	}

	public void setFileSize(double fileSize) {
		this.fileSize = fileSize;
	}

	public int getDownCount() {
		return downCount;
	}

	public void setDownCount(int downCount) {
		this.downCount = downCount;
	}

	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", name=" + name + ", pwd=" + pwd + ", title=" + title + ", count=" + count
				+ ", regdate=" + regdate + ", del=" + del + ", groupno=" + groupno + ", step=" + step + ", sortno="
				+ sortno + ", fileName=" + fileName + ", fileSize=" + fileSize + ", downCount=" + downCount + "]";
	}

}
