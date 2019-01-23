package dao;

import java.util.HashMap;
import java.util.List;

import model.Board;

public interface BoardDao {

	public int insertBoard(Board board);
	
	public int updateBoard(Board board);
	
	public int deleteBoard(int num);
	
	public Board selectOne(int num);	
	
	//params : �ѱ� ���ڵ��� ������ ��ȸ�� ���ڵ��� ����
	public List<Board> selectBoardPage(HashMap<String, Object> params);	
	
	//params : ����, ����, �ѱ� ���ڵ��� ����, ��ȸ�� ���ڵ��� ����
	public List<Board> selectSearchTitleContent(HashMap<String, Object> params);	
	
	//�۾��� ��ȸ, �ѱ� ���ڵ� �� ����, ��ȸ�� ���ڵ��� ����
	public List<Board> selectSearchName(HashMap<String, Object> params);	
	
	//params : ������, ������, �ѱ� ���ڵ��� ����, ��ȸ�� ���ڵ��� ����
	public List<Board> selectSearchPeriod(HashMap<String, Object> params);	
	
	//�Խù� ���ڵ� ���� ��ȸ
	public int getCount(HashMap<String, Object> params);
	
	}

