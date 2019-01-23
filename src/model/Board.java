package model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	
	private int num;
	private String pass;
	private String name;
	private String email;
	private String title;
	private String content;
	private String video;
	private int readCount;
	private Date writedate;
	private String file;
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	

	
	@Override
	public String toString() {
		return "Board [num=" + num + ", pass=" + pass + ", name=" + name + ", email=" + email + ", title=" + title
				+ ", content=" + content + ", video=" + video + ", readCount=" + readCount + ", writedate=" + writedate
				+ ", file=" + file + ", uploadFile=" + uploadFile + "]";
	}
	
	
//	@Override
//	public String toString() {
//		return "Board [num=" + num + ", pass=" + pass + ", name=" + name + ", email=" + email + ", title=" + title
//				+ ", content=" + content + ", readCount=" + readCount + ", writedate=" + writedate + ", file=" + file
//				+ ", uploadFile=" + uploadFile + "]";
//	}

}
