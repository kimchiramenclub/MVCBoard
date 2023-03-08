package model2.mvcboard;

public class MVCBoardDTO {
	private int idx; // 일련번호, 기본키
	private String name; // 작성자 이름
	private String title; // 제목
	private String content; // 내용
	private java.sql.Date postdate; // 작성일, 기본값은 현재 시각
	private String ofile; // 원본 파일명, NULL 허용
	private String sfile; // 저장된 파일명, NULL 허용
	private int downcount; // 다운로드 횟수, 기본값은 0
	private String pass; // 비밀번호
	private int visitcount; // 조회수, 기본값은 0
	
	 // Getters and Setters
    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public java.sql.Date getPostdate() {
        return postdate;
    }

    public void setPostdate(java.sql.Date postdate) {
        this.postdate = postdate;
    }

    public String getOfile() {
        return ofile;
    }

    public void setOfile(String ofile) {
        this.ofile = ofile;
    }

    public String getSfile() {
        return sfile;
    }

    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public int getDowncount() {
        return downcount;
    }

    public void setDowncount(int downcount) {
        this.downcount = downcount;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getVisitcount() {
        return visitcount;
    }

    public void setVisitcount(int visitcount) {
        this.visitcount = visitcount;
    }
}
