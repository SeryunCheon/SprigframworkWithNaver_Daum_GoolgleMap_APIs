package service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import model.Board;

public interface BoardService {

	public int writeBoard(Board board, MultipartFile file);

	public int modifyBoard(Board board);

	public int deleteBoard(int num);

	public Board readBoard(int num);

	public HashMap<String, Object> getBoardListPage(HashMap<String, Object> params, int num);
//	public HashMap<String, Object> getBoardListPage(int num);
	
	public int getStartPage(int num);

	public int getEndPage(int num);
	
	public int getLastPage(HashMap<String, Object> params);
	
	public int getSkip(int num);
	
	public Board getBoard(int num);
	
	//첨부파일 갖다주는 기능 추가
	public File getAttachFile(int num);
	
	
	
	
	
	
	
	
	
	
	
	

}
