package dao;

import java.util.HashMap;
import java.util.List;

import model.Board;

public interface BoardDao {

	public int insertBoard(Board board);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int num);
	
	public Board selectOne(int num);	
	
	//params : 넘길 레코드의 갯수와 조회할 레코드의 갯수
	public List<Board> selectBoardPage(HashMap<String, Object> params);	
	
	//params : 제목, 내용, 넘길 레코드의 갯수, 조회할 레코드의 갯수
	public List<Board> selectSearchTitleContent(HashMap<String, Object> params);	
	
	//글쓴이 조회, 넘길 레코드 의 갯수, 조회할 레코드의 갯수
	public List<Board> selectSearchName(HashMap<String, Object> params);	
	
	//params : 시작일, 종료일, 넘길 레코드의 갯수, 주회할 레코드의 갯수
	public List<Board> selectSearchPeriod(HashMap<String, Object> params);	
	
	//게시물 레코드 갯수 조회
	public int getCount(HashMap<String, Object> params);
	
	}

